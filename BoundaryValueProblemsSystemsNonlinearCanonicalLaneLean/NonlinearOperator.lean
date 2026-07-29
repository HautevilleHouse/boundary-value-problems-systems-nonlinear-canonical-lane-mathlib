import BoundaryValueSystemsNonlinearCanonicalLaneLean.WeakFormulation

namespace HautevilleHouse
namespace BoundaryValueSystemsNonlinearCanonicalLaneLean

structure NonlinearOperatorPackage {S : SobolevSpacePackage} {W : WeakFormulationPackage S} where
  operatorType : Type u
  monotonicity : Prop
  hemicontinuity : Prop
  coercivityNonlinear : Prop

structure NonlinearOperatorEvidence {S : SobolevSpacePackage} {W : WeakFormulationPackage S}
    (N : NonlinearOperatorPackage S W) where
  monotonicityClosed : N.monotonicity
  hemicontinuityClosed : N.hemicontinuity
  coercivityNonlinearClosed : N.coercivityNonlinear

def NonlinearOperatorClosed {S : SobolevSpacePackage} {W : WeakFormulationPackage S}
    (N : NonlinearOperatorPackage S W) : Prop :=
  N.monotonicity ∧ N.hemicontinuity ∧ N.coercivityNonlinear

theorem nonlinear_operator_closed_from_evidence
    {S : SobolevSpacePackage} {W : WeakFormulationPackage S}
    (N : NonlinearOperatorPackage S W) (E : NonlinearOperatorEvidence N) :
    NonlinearOperatorClosed N := by
  exact And.intro E.monotonicityClosed (And.intro E.hemicontinuityClosed E.coercivityNonlinearClosed)

end BoundaryValueSystemsNonlinearCanonicalLaneLean
end HautevilleHouse