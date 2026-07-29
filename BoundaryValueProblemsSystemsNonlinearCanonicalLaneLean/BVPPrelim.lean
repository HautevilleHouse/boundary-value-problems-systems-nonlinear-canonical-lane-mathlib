import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean

structure BVPSystem where
  domainType : Type u
  boundaryType : Type v
  operator : domainType → boundaryType
  nonlinearTerm : domainType → domainType
  sourceTerm : domainType

structure BVPAdmissibleObject where
  system : BVPSystem
  systemWellPosed : Prop
  solutionSmoothness : Prop
  boundaryConditionSatisfied : Prop
  conclusion : systemWellPosed ∧ solutionSmoothness ∧ boundaryConditionSatisfied

def BVPCanonicalWitness (O : BVPAdmissibleObject) : Prop :=
  O.systemWellPosed ∧ O.solutionSmoothness ∧ O.boundaryConditionSatisfied

end BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean
end HautevilleHouse