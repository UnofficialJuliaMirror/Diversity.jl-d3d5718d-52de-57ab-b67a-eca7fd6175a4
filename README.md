# Diversity [![Build Status](https://travis-ci.org/richardreeve/Diversity.jl.svg?branch=master)](https://travis-ci.org/richardreeve/Diversity.jl) [![Coverage Status](https://img.shields.io/coveralls/richardreeve/Diversity.jl.svg)](https://coveralls.io/r/richardreeve/Diversity.jl?branch=master) [![Diversity](http://pkg.julialang.org/badges/Diversity_release.svg)](http://pkg.julialang.org/?pkg=Diversity&ver=release)

**Diversity** is a [Julia](http://www.julialang.org) package that provides
functionality for measuring alpha, beta and gamma diversity of
subcommunities and ecosystems. It uses the diversity measures described
in the arXiv paper [arXiv:1404.6520 (q-bio.QM)](http://arxiv.org/abs/1404.6520),
*How to partition diversity*. It also provides a series of other
related and older diversity measures through sub-modules. Currently
these are all ecological diversity measures, but this will be
expanded through interfacing to BioJulia.

This package is still in alpha, and so we do not guarantee its
correctness, although we are aware of no issues with it. Please
[raise an issue](https://github.com/richardreeve/Diversity.jl/issues)
if you find any problems.

## Install

*Diversity* is in `METADATA` and can be installed via `Pkg.add("Diversity")`.

## Usage

Accessing the main functionality in the package is simple:

```julia
using Diversity
...
diversities = Diversity.ᾱ(proportions, [0, 1, 2, Inf], Z)
diversities = beta(proportions, 2, Z)
```

The main package provides basic diversity measures (from
[Hill, 1973](http://www.jstor.org/stable/1934352)), and generalised alpha,
beta and gamma diversity measures at the level of the ecosystem and its
component subcommunities (these are extended from
[Reeve et al, 2014](http://arxiv.org/abs/1404.6520)).
There are also matching normalised and raw, alpha, beta and gamma
diversities at both the subcommunity and ecosystem level. The
functions exist both with unicode names which are not exported (e.g.
Diversity.ᾱ()), and with matching exported ascii names (e.g.
alphabar()). We also provide a general function for extract any
diversity measure for a series of subcommunity relative abundances.
And we can calculate the proportions that subcommunities each
contribute to ecosystem diversity per subcommunity or per individual.

## Other diversity measures

The package also provides sub-modules with other diversity measures:

#### Diversity.Ecology

We also replicate old ecological diversity measures and generalised
versions of them that relate to our general measures of alpha, beta
and gamma diversity at subcommunity and ecosystem measures. The
generalisations of the richness, Shannon and Simpson are the only
standard measures we are aware of whose subcommunity components sum
directly to the corresponding ecosystem measure (although note that
Simpson's index decreases for increased diversity, so small components
are more diverse).

#### Diversity.Hill

[Hill numbers](http://www.jstor.org/stable/1934352) are found in the
.Hill sub-module.

#### Diversity.Jost

Lou Jost's
[diversity](http://dx.doi.org/10.1111/j.2006.0030-1299.14714.x)
[measures](http://www.esajournals.org/doi/abs/10.1890/06-1736.1) are
found in the .Jost sub-module.


