import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean

structure RegularityAnalysisPackage {G : BVPSystem} (P : NonlinearPDEPackage G) (F : FixedPointPackage P) (A : GalerkinApproximationPackage P) where
  interiorRegularity : Prop
  boundaryRegularity : Prop
  bootstrappingArgument : Prop
  sobolevEmbeddings : Prop

structure RegularityAnalysisEvidence {G : BVPSystem} {P : NonlinearPDEPackage G} {F : FixedPointPackage P} {A : GalerkinApproximationPackage P} (R : RegularityAnalysisPackage P F A) where
  interiorRegularityClosed : R.interiorRegularity
  boundaryRegularityClosed : R.boundaryRegularity
  bootstrappingArgumentClosed : R.bootstrappingArgument
  sobolevEmbeddingsClosed : R.sobolevEmbeddings

def RegularityAnalysisClosed {G : BVPSystem} {P : NonlinearPDEPackage G} {F : FixedPointPackage P} {A : GalerkinApproximationPackage P} (R : RegularityAnalysisPackage P F A) : Prop :=
  R.interiorRegularity ∧ R.boundaryRegularity ∧ R.bootstrappingArgument ∧ R.sobolevEmbeddings

theorem regularity_analysis_closed_from_evidence {G : BVPSystem} {P : NonlinearPDEPackage G} {F : FixedPointPackage P} {A : GalerkinApproximationPackage P} (R : RegularityAnalysisPackage P F A) (E : RegularityAnalysisEvidence R) : RegularityAnalysisClosed R :=
  And.intro E.interiorRegularityClosed (And.intro E.boundaryRegularityClosed (And.intro E.bootstrappingArgumentClosed E.sobolevEmbeddingsClosed))

end BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean
end HautevilleHouse