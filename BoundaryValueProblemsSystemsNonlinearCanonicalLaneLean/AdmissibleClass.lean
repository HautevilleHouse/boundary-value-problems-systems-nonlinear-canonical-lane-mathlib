import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean

structure BVPAdmittedObject where
  domain : Type u
  boundary : Type v
  nonlinearOperator : (domain → ℝ) → (boundary → ℝ)
  wellPosed : Prop
  solution : (domain → ℝ)
  conclusion : wellPosed

structure AdmissibleClass where
  object : BVPAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BVPWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean
end HautevilleHouse