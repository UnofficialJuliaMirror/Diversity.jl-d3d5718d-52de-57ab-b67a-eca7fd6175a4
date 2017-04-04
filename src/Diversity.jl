__precompile__()

"""
The main **Diversity** module provides basic numbers-equivalent
diversity measures (described in
[Hill, 1973](http://www.jstor.org/stable/1934352)),
similarity-sensitive diversity measures (generalised from Hill, and
described in
[Leinster and Cobbold, 2012](http://www.esajournals.org/doi/abs/10.1890/10-2402.1)),
and related alpha, beta and gamma diversity measures at the level of
the metacommunity and its component subcommunities (generalised in
turn from Leinster and Cobbold, and described in
[Reeve et al, 2014](http://arxiv.org/abs/1404.6520)). The diversity
functions exist both with unicode names (e.g. ```ᾱ()```), which are
not automatically exported (as we feel they are too short) and with
matching longer ASCII names (e.g. ```NormalisedAlpha()```), which are.
We also provide functions to calculate appropriate
```subcommunityDiversity()``` and ```metacommunityDiversity()```
values for each measure, a general ```diversity()``` function for
extract any diversity measure at a series of scales.
"""
module Diversity

include("Interface.jl")
include("Metacommunity.jl")
export Subcommunities, Onecommunity
export GeneralTypes, UniqueTypes, Species, Taxonomy
export Metacommunity
export getabundance, getweight
export getsimilarity, getordinariness!, getmetaordinariness!
export inddiv, subdiv, metadiv

include("EffectiveNumbers.jl")
export qD, qDZ

include("DiversityMeasure.jl")
export DiversityLevel
export individualDiversity, subcommunityDiversity, metacommunityDiversity

export RawAlpha, NormalisedAlpha
export RawBeta, NormalisedBeta, RawRho, NormalisedRho
export Gamma

## We do not directly export ᾱ, α, β̄, β, ρ̄, ρ, γ̄, γ as they're too short, only via Diversity.ShortNames
module ShortNames
using Diversity

typealias α RawAlpha
typealias ᾱ NormalisedAlpha
typealias β RawBeta
typealias β̄ NormalisedBeta
typealias ρ RawRho
typealias ρ̄ NormalisedRho
typealias γ Gamma

export α, ᾱ, β, β̄, ρ, ρ̄
# γ actually can't be exported like this - it'll always just be Shortnames.γ, so we export Γ instead
typealias Γ Gamma
export Γ

end

export getName, getASCIIName, getFullName

include("GeneralisedDiversities.jl")
export diversity
export normsubalpha, rawsubalpha, normsubbeta, rawsubbeta
export normsubrho, rawsubrho, subgamma
export normmetaalpha, rawmetaalpha, normmetabeta, rawmetabeta
export normmetarho, rawmetarho, metagamma

## Deprecate short names as too ambiguous
@deprecate(Dᾱ, normsubalpha)
@deprecate(Dα, rawsubalpha)
@deprecate(Dβ̄, normsubbeta)
@deprecate(Dβ, rawsubbeta)
@deprecate(Dρ̄, normsubrho)
@deprecate(Dρ, rawsubrho)
@deprecate(Dγ̄, subgamma)
@deprecate(Dγ, subgamma)
@deprecate(DĀ, normmetaalpha)
@deprecate(DA, rawmetaalpha)
@deprecate(DB̄, normmetabeta)
@deprecate(DB, rawmetabeta)
@deprecate(DR̄, normmetarho)
@deprecate(DR, rawmetarho)
@deprecate(DḠ, metagamma)
@deprecate(DG, metagamma)

## Deprecate ecosystem-related names
@deprecate(ecosystemAbar, normmetaalpha)
@deprecate(ecosystemA, rawmetaalpha)
@deprecate(ecosystemBbar, normmetabeta)
@deprecate(ecosystemB, rawmetabeta)
@deprecate(ecosystemRbar, normmetarho)
@deprecate(ecosystemR, rawmetarho)
@deprecate(ecosystemGbar, metagamma)
@deprecate(ecosystemG, metagamma)

## Deprecate all-in-one names, as we divide calculation into type of
## diversity and scale
@deprecate(normsubalpha(pop::AbstractArray, Z, qs),
           normsubalpha(Metacommunity(pop, Z), qs))
@deprecate(rawsubalpha(pop::AbstractArray, Z, qs),
           rawsubalpha(Metacommunity(pop, Z), qs))
@deprecate(normsubbeta(pop::AbstractArray, Z, qs),
           normsubbeta(Metacommunity(pop, Z), qs))
@deprecate(rawsubbeta(pop::AbstractArray, Z, qs),
           rawsubbeta(Metacommunity(pop, Z), qs))
@deprecate(normsubrho(pop::AbstractArray, Z, qs),
           normsubrho(Metacommunity(pop, Z), qs))
@deprecate(rawsubrho(pop::AbstractArray, Z, qs),
           rawsubrho(Metacommunity(pop, Z), qs))
@deprecate(subgamma(pop::AbstractArray, Z, qs),
           subgamma(Metacommunity(pop, Z), qs))
@deprecate(normmetaalpha(pop::AbstractArray, Z, qs),
           normmetaalpha(Metacommunity(pop, Z), qs))
@deprecate(rawmetaalpha(pop::AbstractArray, Z, qs),
           rawmetaalpha(Metacommunity(pop, Z), qs))
@deprecate(normmetabeta(pop::AbstractArray, Z, qs),
           normmetabeta(Metacommunity(pop, Z), qs))
@deprecate(rawmetabeta(pop::AbstractArray, Z, qs),
           rawmetabeta(Metacommunity(pop, Z), qs))
@deprecate(normmetarho(pop::AbstractArray, Z, qs),
           normmetarho(Metacommunity(pop, Z), qs))
@deprecate(rawmetarho(pop::AbstractArray, Z, qs),
           rawmetarho(Metacommunity(pop, Z), qs))
@deprecate(metagamma(pop::AbstractArray, Z, qs),
           metagamma(Metacommunity(pop, Z), qs))

@deprecate(normsubalpha(pop::AbstractArray, qs),
           normsubalpha(Metacommunity(pop), qs))
@deprecate(rawsubalpha(pop::AbstractArray, qs),
           rawsubalpha(Metacommunity(pop), qs))
@deprecate(normsubbeta(pop::AbstractArray, qs),
           normsubbeta(Metacommunity(pop), qs))
@deprecate(rawsubbeta(pop::AbstractArray, qs),
           rawsubbeta(Metacommunity(pop), qs))
@deprecate(normsubrho(pop::AbstractArray, qs),
           normsubrho(Metacommunity(pop), qs))
@deprecate(rawsubrho(pop::AbstractArray, qs),
           rawsubrho(Metacommunity(pop), qs))
@deprecate(subgamma(pop::AbstractArray, qs),
           subgamma(Metacommunity(pop), qs))
@deprecate(normmetaalpha(pop::AbstractArray, qs),
           normmetaalpha(Metacommunity(pop), qs))
@deprecate(rawmetaalpha(pop::AbstractArray, qs),
           rawmetaalpha(Metacommunity(pop), qs))
@deprecate(normmetabeta(pop::AbstractArray, qs),
           normmetabeta(Metacommunity(pop), qs))
@deprecate(rawmetabeta(pop::AbstractArray, qs),
           rawmetabeta(Metacommunity(pop), qs))
@deprecate(normmetarho(pop::AbstractArray, qs),
           normmetarho(Metacommunity(pop), qs))
@deprecate(rawmetarho(pop::AbstractArray, qs),
           rawmetarho(Metacommunity(pop), qs))
@deprecate(metagamma(pop::AbstractArray, qs),
           metagamma(Metacommunity(pop), qs))

## Deprecate anything related to ϵ as it has been replaced by ρ̄
@deprecate(subcommunityepsilon, Dρ̄)
@deprecate(Dϵ, Dρ̄)
@deprecate(ecosystemE, normmetarho)
@deprecate(metacommunityE, normmetarho)
@deprecate(DE, normmetarho)

"""
The **Diversity.Ecology** module replicates old ecological
diversity measures and generalised versions of them that relate to our
general measures of alpha, beta and gamma diversity at subcommunity
and metacommunity levels. The generalisations of the richness, Shannon
and Simpson are the only standard measures we are aware of whose
subcommunity components sum directly to the corresponding ecosystem
measure (although note that Simpson's index decreases for increased
diversity, so small components are more diverse).
"""
module Ecology

include("Ecology.jl")
export generalisedrichness, richness
export generalisedshannon, shannon
export generalisedsimpson, simpson
export generalisedjaccard, jaccard

end # sub-module Ecology

"""
Lou Jost's
[diversity](http://dx.doi.org/10.1111/j.2006.0030-1299.14714.x)
[measures](http://www.esajournals.org/doi/abs/10.1890/06-1736.1) are
found in the **Diversity.Jost** module.
"""
module Jost

include("Jost.jl")
export jostbeta, jostalpha
@deprecate(jostα, jostalpha)
@deprecate(jostβ, jostbeta)

end # sub-module Jost

"""
[Hill numbers](http://www.jstor.org/stable/1934352) are found in the
**Diversity.Hill** package.
"""
module Hill

include("Hill.jl")
export hillnumber

end # sub-module Hill

end # module
