import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean

structure TopologicalDegreePackage (E : NonlinearEllipticSystemPackage) where
  degreeDefinition : Type u
  homotopyInvariance : Prop
  solutionExistencePrinciple : Prop
  degreeComputation : Prop
  indexFormula : Prop

structure TopologicalDegreeEvidence {E : NonlinearEllipticSystemPackage}
    (D : TopologicalDegreePackage E) where
  homotopyInvarianceClosed : D.homotopyInvariance
  solutionExistencePrincipleClosed : D.solutionExistencePrinciple
  degreeComputationClosed : D.degreeComputation
  indexFormulaClosed : D.indexFormula

def TopologicalDegreeClosed {E : NonlinearEllipticSystemPackage}
    (D : TopologicalDegreePackage E) : Prop :=
  D.homotopyInvariance ∧ D.solutionExistencePrinciple ∧ D.degreeComputation ∧ D.indexFormula

theorem topological_degree_closed_from_evidence
    {E : NonlinearEllipticSystemPackage} (D : TopologicalDegreePackage E)
    (Ev : TopologicalDegreeEvidence D) : TopologicalDegreeClosed D := by
  exact And.intro Ev.homotopyInvarianceClosed
    (And.intro Ev.solutionExistencePrincipleClosed
      (And.intro Ev.degreeComputationClosed Ev.indexFormulaClosed))

end BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean
end HautevilleHouse