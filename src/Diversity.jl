VERSION >= v"0.4.0-dev+6641" && __precompile__()

module Diversity
if (VERSION < v"0.4-")
  using Docile
end
using Compat

"$(@compat readstring(joinpath(dirname(@__FILE__), "../doc/diversity.md")))"
Diversity

include("Collection.jl")
export Collection, Ecosystem
export Subcommunities, Onecommunity
export Unique, Species, Taxonomy, GeneralSimilarity

include("EffectiveNumbers.jl")
export qD, qDZ

include("GeneralisedDiversities.jl")
export diversity
export subcommunityalphabar, subcommunityalpha, supercommunityA, supercommunityAbar
export subcommunitybetabar, subcommunitybeta, supercommunityB, supercommunityBbar
export subcommunityrhobar, subcommunityrho, supercommunityR, supercommunityRbar
export subcommunitygammabar, subcommunitygamma, supercommunityG, supercommunityGbar
export Dᾱ, Dα, Dβ̄, Dβ, Dρ̄, Dρ, Dγ̄, Dγ
export DĀ, DA, DB̄, DB, DR̄, DR, DḠ, DG
## Deprecate ecosystem-related names
@deprecate(ecosystemA, supercommunityA)
@deprecate(ecosystemAbar, supercommunityAbar)
@deprecate(ecosystemB, supercommunityB)
@deprecate(ecosystemBbar, supercommunityBbar)
@deprecate(ecosystemR, supercommunityR)
@deprecate(ecosystemRbar, supercommunityRbar)
@deprecate(ecosystemG, supercommunityG)
@deprecate(ecosystemGbar, supercommunityGbar)

## Deprecate anything related to ϵ as it has been replaced by ρ̄
@deprecate(subcommunityepsilon, Dρ̄)
@deprecate(Dϵ, Dρ̄)
@deprecate(ecosystemE, supercommunityRbar)
@deprecate(supercommunityE, supercommunityRbar)
@deprecate(DE, supercommunityRbar)

include("CommunityContributions.jl")
# export contributions

"$(@compat readstring(joinpath(dirname(@__FILE__), "../doc/ecology.md")))"
module Ecology
if (VERSION < v"0.4-")
  using Docile
end
using Compat

include("Ecology.jl")
export generalisedrichness, richness
export generalisedshannon, shannon
export generalisedsimpson, simpson
export generalisedjaccard, jaccard

end # sub-module Ecology

"$(@compat readstring(joinpath(dirname(@__FILE__), "../doc/jost.md")))"
module Jost
if (VERSION < v"0.4-")
  using Docile
end
using Compat

include("Jost.jl")
export jostbeta, jostβ, jostalpha, jostα

end # sub-module Jost

"$(@compat readstring(joinpath(dirname(@__FILE__), "../doc/hill.md")))"
module Hill
if (VERSION < v"0.4-")
  using Docile
end
using Compat

include("Hill.jl")
export hillnumber

end # sub-module Hill

## Make sure that Lexicon is loading so inline REPL documentation works
VERSION < v"0.4-" && using Lexicon

end # module
