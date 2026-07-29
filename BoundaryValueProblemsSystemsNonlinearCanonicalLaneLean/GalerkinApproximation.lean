import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean

structure GalerkinApproximationPackage where
  finiteDimensionalSpaces : Type u → Nat → Type v
  projectionOperator : Type u → Type u
  approximateSolution : Nat → Type u
  convergenceRate : Prop
  stabilityEstimate : Prop
  approximationClosed : Prop

def GalerkinApproximationClosed (G : GalerkinApproximationPackage) : Prop :=
  G.convergenceRate ∧ G.stabilityEstimate ∧ G.approximationClosed

structure GalerkinApproximationEvidence (G : GalerkinApproximationPackage) where
  convergenceRateClosed : G.convergenceRate
  stabilityEstimateClosed : G.stabilityEstimate
  approximationClosedClosed : G.approximationClosed

theorem galerkin_approximation_closed_from_evidence (G : GalerkinApproximationPackage) (E : GalerkinApproximationEvidence G) :
    GalerkinApproximationClosed G := by
  exact And.intro E.convergenceRateClosed
    (And.intro E.stabilityEstimateClosed E.approximationClosedClosed)

end BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean
end HautevilleHouse