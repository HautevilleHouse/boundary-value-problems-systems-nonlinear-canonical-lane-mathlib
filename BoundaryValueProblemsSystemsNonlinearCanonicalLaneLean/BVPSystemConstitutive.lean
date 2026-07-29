import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean

structure ConstitutiveRelation where
  internalForces : Type u
  boundaryFlux : Type v
  jumpCondition : Prop
  thermomechanicalCoupling : Prop
  jumpConditionTerm : jumpCondition
  thermomechanicalCouplingTerm : thermomechanicalCoupling

structure ConstitutiveRelationEvidence (C : ConstitutiveRelation) where
  jumpConditionClosed : C.jumpCondition
  thermomechanicalCouplingClosed : C.thermomechanicalCoupling

def ConstitutiveRelationClosed (C : ConstitutiveRelation) : Prop :=
  C.jumpCondition ∧ C.thermomechanicalCoupling

theorem constitutive_relation_closed_from_evidence
    (C : ConstitutiveRelation) (E : ConstitutiveRelationEvidence C) :
    ConstitutiveRelationClosed C := by
  exact And.intro E.jumpConditionClosed E.thermomechanicalCouplingClosed

end BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean
end HautevilleHouse
