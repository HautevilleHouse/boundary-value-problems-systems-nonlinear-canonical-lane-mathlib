import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean

structure FixedPointPackage {G : BVPSystem} (P : NonlinearPDEPackage G) where
  contractionMapping : G.domainType → G.domainType
  fixedPointEquation : Prop
  existenceResult : Prop
  uniquenessResult : Prop
  aPrioriEstimates : Prop

structure FixedPointEvidence {G : BVPSystem} {P : NonlinearPDEPackage G} (F : FixedPointPackage P) where
  fixedPointEquationClosed : F.fixedPointEquation
  existenceResultClosed : F.existenceResult
  uniquenessResultClosed : F.uniquenessResult
  aPrioriEstimatesClosed : F.aPrioriEstimates

def FixedPointClosed {G : BVPSystem} {P : NonlinearPDEPackage G} (F : FixedPointPackage P) : Prop :=
  F.fixedPointEquation ∧ F.existenceResult ∧ F.uniquenessResult ∧ F.aPrioriEstimates

theorem fixed_point_closed_from_evidence {G : BVPSystem} {P : NonlinearPDEPackage G} (F : FixedPointPackage P) (E : FixedPointEvidence F) : FixedPointClosed F :=
  And.intro E.fixedPointEquationClosed (And.intro E.existenceResultClosed (And.intro E.uniquenessResultClosed E.aPrioriEstimatesClosed))

end BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean
end HautevilleHouse