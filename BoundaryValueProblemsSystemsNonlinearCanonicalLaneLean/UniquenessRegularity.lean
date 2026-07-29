import canonicalLaneMathlib.AdmissibleClass
import BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean

structure UniquenessPackage (A : AdmissibleBVP) where
  monotonicityCondition : Prop
  comparisonPrinciple : Prop
  uniquenessProof : Prop
  regularityEstimate : Prop

structure UniquenessEvidence {A : AdmissibleBVP} (U : UniquenessPackage A) where
  monotonicityConditionClosed : U.monotonicityCondition
  comparisonPrincipleClosed : U.comparisonPrinciple
  uniquenessProofClosed : U.uniquenessProof
  regularityEstimateClosed : U.regularityEstimate

def UniquenessClosed {A : AdmissibleBVP} (U : UniquenessPackage A) : Prop :=
  U.monotonicityCondition ∧ U.comparisonPrinciple ∧ U.uniquenessProof ∧ U.regularityEstimate

theorem uniqueness_closed_from_evidence {A : AdmissibleBVP} (U : UniquenessPackage A) (E : UniquenessEvidence U) : UniquenessClosed U :=
  by
    exact And.intro E.monotonicityConditionClosed (And.intro E.comparisonPrincipleClosed (And.intro E.uniquenessProofClosed E.regularityEstimateClosed))

end BoundaryValueProblemsSystemsNonlinearCanonicalLaneLean
end HautevilleHouse
