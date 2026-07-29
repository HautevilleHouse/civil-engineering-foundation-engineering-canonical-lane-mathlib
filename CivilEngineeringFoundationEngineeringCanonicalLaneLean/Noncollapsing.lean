import canonicalLaneMathlib.AdmissibleClass
import CivilEngineeringFoundationEngineeringCanonicalLaneLean.SoilBearingCapacity

namespace HautevilleHouse
namespace CivilEngineeringFoundationEngineeringCanonicalLaneLean

structure NoncollapsingPackage {S : SoilBearingCapacityPackage} (bear : S) where
  bearingCapacityExceeded : Prop
  factorOfSafety : Float
  pressureDistributionValid : Prop

structure NoncollapsingEvidence {S : SoilBearingCapacityPackage} {bear : S} (N : NoncollapsingPackage bear) where
  bearingCapacityExceededClosed : N.bearingCapacityExceeded
  factorOfSafetyClosed : N.factorOfSafety = 3.0
  pressureDistributionValidClosed : N.pressureDistributionValid

def NoncollapsingClosed {S : SoilBearingCapacityPackage} {bear : S} (N : NoncollapsingPackage bear) : Prop :=
  N.bearingCapacityExceeded ∧ N.factorOfSafety = 3.0 ∧ N.pressureDistributionValid

theorem noncollapsing_closed_from_evidence
    {S : SoilBearingCapacityPackage} {bear : S}
    (N : NoncollapsingPackage bear) (E : NoncollapsingEvidence N) :
    NoncollapsingClosed N := by
  exact And.intro E.bearingCapacityExceededClosed
    (And.intro E.factorOfSafetyClosed E.pressureDistributionValidClosed)

end CivilEngineeringFoundationEngineeringCanonicalLaneLean
end HautevilleHouse
