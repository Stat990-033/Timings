# Comparing optimization algorithms

- In `R` can use built-in Nelder-Mead or `BOBYQA` from the `minqa` package.

- Also available in `R` are the optimizers of the form `LN_*` from the
	`nloptr` package.  These require the `nloptwrap` function.

- Also available in `R` is `nlminbwrap` for wrapping `nlminb` from the `stats` package.

- Also available in `R` are the optimizers from the `optimx` package.

- We should time and profile the evaluation of the objective function and lmer itself.

- `InstEval` provides a manageable example of partially crossed random effects.

- `RePsychLing` package examples should be more interesting.

- Results may be suitable for arranging in a table
    + data set name
	+ model formula
	+ number of observations
	+ number of optimization parameters
	+ number of fixed-effects parameters
	+ number of grouping factors and number of levels of each
	+ dimension of random effects for each factor
	+ optimizer used
	+ deviance
	+ user, system and elapsed times

- Desired conclusions are which optimizer is most reliable and
  effective.  If there is not a clear winner, then which is
  preferrable under different circumstances.
