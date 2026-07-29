import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean

structure NonlinearPDEPackage (G : BVPSystem) where
  differentialOperator : Type u
  boundaryOperator : Type v
  nonlinearity : G.domainType → G.domainType
  weakFormulation : Prop
  energyEstimates : Prop
  regularityTheory : Prop

structure NonlinearPDEvidence {G : BVPSystem} (P : NonlinearPDEPackage G) where
  weakFormulationClosed : P.weakFormulation
  energyEstimatesClosed : P.energyEstimates
  regularityTheoryClosed : P.regularityTheory

def NonlinearPDEClosed {G : BVPSystem} (P : NonlinearPDEPackage G) : Prop :=
  P.weakFormulation ∧ P.energyEstimates ∧ P.regularityTheory

theorem nonlinear_pde_closed_from_evidence {G : BVPSystem} (P : NonlinearPDEPackage G) (E : NonlinearPDEvidence P) : NonlinearPDEClosed P :=
  And.intro E.weakFormulationClosed (And.intro E.energyEstimatesClosed E.regularityTheoryClosed)

end BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean
end HautevilleHouse