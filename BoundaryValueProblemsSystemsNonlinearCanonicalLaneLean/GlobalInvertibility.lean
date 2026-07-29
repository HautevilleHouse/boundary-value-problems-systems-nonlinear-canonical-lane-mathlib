import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean

structure GlobalInvertibilityPackage (V : Type u) [NormedAddCommGroup V] where
  operator : V → V
  monotoneOperator : MonotoneOperator V
  surjectivity : Prop
  injectivity : Prop
  solutionContinuity : Prop

def GlobalInvertibilityClosed (P : GlobalInvertibilityPackage V) : Prop :=
  MonotoneOperatorClosed P.monotoneOperator ∧
  P.surjectivity ∧ P.injectivity ∧ P.solutionContinuity

end BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean
end HautevilleHouse