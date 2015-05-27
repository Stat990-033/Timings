using JSON,Showoff,Compat

immutable Lmer
    deviance::Float64
    theta::Vector{Float64}
    time::Vector{Float64}
    feval::Int
end

function Lmer(dd::Dict)
    th = get(dd,"theta",[NaN])
    isa(th,Real) && (th = convert(Vector{Float64},[th]))
    Lmer(get(dd,"deviance",NaN),th,get(dd,"time",[NaN]),get(dd,"feval",-1))
end

immutable Lmm
    deviance::Float64
    time::Float64
    hasgrad::Bool
    theta::Vector{Float64}
end

Lmm(dd::Dict) = Lmm(get(dd,"deviance",NaN),get(dd,"time",NaN),true,get(dd,"theta",[NaN]))

immutable Timing
    dsname::ASCIIString
    formula::ASCIIString
    lmer::Lmer
    lmm::Lmm
    lmmng::Lmm
end

function gettimings(fnm)
    js = JSON.parsefile(fnm)
    ret = Timing[]
    for k in keys(js)
        for mm in js[k]
            lmer = Lmer(haskey(mm,"lmer") ? mm["lmer"] : Dict{ASCIIString,Any}())
            lmm = Lmm(haskey(mm,"lmm") ? mm["lmm"] : Dict{ASCIIString,Any}())
            lmmng = Lmm(haskey(mm,"lmmng") ? mm["lmmng"] : Dict{ASCIIString,Any}())            
            push!(ret,Timing(k,get(mm,"formula",""),lmer,lmm,lmmng))
        end
    end
    ret
end

function rtalign(v::Vector)
    ll = maximum(length,v) + 1
    [lpad(r,ll) for r in v]
end

immutable Devs
    dsnames::Vector{ASCIIString}
    formulae::Vector{ASCIIString}
    devs::Matrix{Float64}
end

function Devs(tv::Vector{Timing})
    n = length(tv)
    mm = zeros(4,n)
    dsn = @compat sizehint!(ASCIIString[],n)
    forms = @compat sizehint!(ASCIIString[],n)
    for j in 1:n
        tt = tv[j]
        push!(dsn,tt.dsname)
        push!(forms,tt.formula)
        mm[1,j] = d1 = tt.lmer.deviance
        mm[2,j] = d2 = tt.lmm.deviance
        mm[3,j] = dd = d1 - d2
        mm[4,j] = dd/abs(d1)
    end
    Devs(dsn,forms,mm')
end

sp3(x) = @sprintf("%.3f",x)

function Base.show(io::IO,dd::Devs)
    dsns = rtalign([split(nm,':')[end] for nm in dd.dsnames])
    v1 = rtalign(map(sp3,dd.devs[:,1]))
    v2 = rtalign(map(sp3,dd.devs[:,2]))
    v3 = rtalign(map(sp3,dd.devs[:,3]))    
    for i in 1:length(dsns)
        write(io,dsns[i])
        write(io,v1[i])
        write(io,v2[i])
        write(io,v3[i])        
        write(io,' ')
        write(io,dd.formulae[i])
        println(io)
    end
end

immutable Elapsed
    dsnmaes::Vector{ASCIIString}
    formulae::Vector{ASCIIString}
    elapsed::Matrix{Float64}
end

function Elapsed(tv::Vector{Timing})
    n = length(tv)
    mm = zeros(4,n)
    dsn = sizehint!(ASCIIString[],n)
    forms = sizehint!(ASCIIString[],n)
    for j in 1:n
        tt = tv[j]
        push!(dsn,tt.dsname)
        push!(forms,tt.formula)
        mm[1,j] = t1 = tt.lmer.time[3]
        mm[2,j] = t2 = tt.lmm.time
        mm[3,j] = t1 - t2
        mm[4,j] = log(t1) - log(t2)
    end
    Elapsed(dsn,forms,mm')
end
