import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean

structure BVPSystem where
  domain : Type u
  boundary : Type v
  systemDimension : Nat
  systemOrder : Nat
  nonlinearityType : String

def BVPSystemClosed (S : BVPSystem) : Prop :=
  S.domain ≠ Empty ∧ S.boundary ≠ Empty ∧ S.systemDimension > 0

end BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean
end HautevilleHouse