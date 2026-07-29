import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean

def ConstrainedBVPClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_bvp_endgame (A : AdmissibleClass) :
    ConstrainedBVPClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean
end HautevilleHouse