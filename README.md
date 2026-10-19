[![CI](https://github.com/gap-packages/agt/workflows/CI/badge.svg?branch=main)](https://github.com/gap-packages/agt/actions?query=workflow%3ACI+branch%3Amain)
[![Code Coverage](https://codecov.io/github/gap-packages/agt/coverage.svg?branch=main&token=)](https://codecov.io/gh/gap-packages/agt)
[![Binder](https://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/gap-packages/agt/master)

# Graph constructors for AGT

This branch is for the inclusion of graph constructors in the AGT package. 
Currently, we have included the package of constructors of Vidali found at

<https://github.com/jaanos/gap-graphs.git>

almost identically, with slight adjustments. Mainly,

- We use the delcaration/implementation structure of GAP4
- To avert a clash of function definition for HammingGraph with grape, 
  we have temporarily renamed our function HammingGraph2
- Similarly, we currently have other graphs defined multiple times, for which we do the same.

This is a work in progress.


# The AGT package for GAP

The AGT package contains a methods used for the determination of  various 
algebraic and regularity properties of graphs, as well as certain substructures 
of graphs. The package also contains a library of strongly regular graphs,
intended to be a useful resource for computational experiments. 
  

## Documentation

Full information and documentation can be found in the manual, available
as PDF `doc/manual.pdf` or as HTML `doc/chap0.html`, or on the package
homepage at

  <https://gap-packages.github.io/agt/>


## Bug reports and feature requests

Please submit bug reports and feature requests via our GitHub issue tracker:

  <https://github.com/gap-packages/agt/issues>


# License

AGT is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.


