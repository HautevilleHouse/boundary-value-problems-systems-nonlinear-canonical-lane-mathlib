import BoundaryValueProblemsSystemNonlinearCanonicalLaneLean.BVPSystemPackage

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemNonlinearCanonicalLaneLean

structure NonlinearityPackage (S : BVPSystemPackage) where
  nonlinearType : String
  smoothness : Prop
  growthCondition : Prop
  existenceInput : Prop

structure NonlinearityEvidence {S : BVPSystemPackage} (N : NonlinearityPackage S) where
  smoothnessClosed : N.smoothness
  growthConditionClosed : N.growthCondition
  existenceInputClosed : N.existenceInput

def NonlinearityClosed {S : BVPSystemPackage} (N : NonlinearityPackage S) : Prop :=
  N.smoothness ∧ N.growthCondition ∧ N.existenceInput

theorem nonlinearity_closed_from_evidence
    {S : BVPSystemPackage} (N : NonlinearityPackage S) (E : NonlinearityEvidence N) :
    NonlinearityClosed N := by
  exact And.intro E.smoothnessClosed (And.intro E.growthConditionClosed E.existenceInputClosed)

end BoundaryValueProblemsSystemNonlinearCanonicalLaneLean
end HautevilleHouse