import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean

structure NonlinearEllipticSystem where
  domain : Type u
  boundary : Type v
  operator : Type w
  coercivity : Prop
  growthCondition : Prop
  coercivityTerm : coercivity
  growthConditionTerm : growthCondition

structure NonlinearEllipticSystemEvidence (N : NonlinearEllipticSystem) where
  coercivityClosed : N.coercivity
  growthConditionClosed : N.growthCondition

def NonlinearEllipticSystemClosed (N : NonlinearEllipticSystem) : Prop :=
  N.coercivity ∧ N.growthCondition

theorem nonlinear_elliptic_system_closed_from_evidence
    (N : NonlinearEllipticSystem) (E : NonlinearEllipticSystemEvidence N) :
    NonlinearEllipticSystemClosed N := by
  exact And.intro E.coercivityClosed E.growthConditionClosed

end BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean
end HautevilleHouse
