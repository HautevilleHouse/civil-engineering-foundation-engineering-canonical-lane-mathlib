import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringFoundationEngineeringCanonicalLaneLean

structure FoundationBearingCapacityPackage where
  soilType : String
  footingWidth : Float
  footingDepth : Float
  unitWeightSoil : Float
  cohesion : Float
  frictionAngle : Float
  bearingCapacityFactorNc : Float
  bearingCapacityFactorNq : Float
  bearingCapacityFactorNg : Float
  netUltimateBearingCapacity : Float
  netAllowableBearingCapacity : Float
  factorOfSafety : Float
  bearingCapacityFormulaDerived : Prop
  factorOfSafetyApplied : Prop

structure FoundationBearingCapacityEvidence (P : FoundationBearingCapacityPackage) where
  bearingCapacityFormulaDerivedClosed : P.bearingCapacityFormulaDerived
  factorOfSafetyAppliedClosed : P.factorOfSafetyApplied

def FoundationBearingCapacityClosed (P : FoundationBearingCapacityPackage) : Prop :=
  P.bearingCapacityFormulaDerived ∧ P.factorOfSafetyApplied

theorem foundation_bearing_capacity_closed_from_evidence
    (P : FoundationBearingCapacityPackage) (E : FoundationBearingCapacityEvidence P) :
    FoundationBearingCapacityClosed P := by
  exact And.intro E.bearingCapacityFormulaDerivedClosed E.factorOfSafetyAppliedClosed

end CivilEngineeringFoundationEngineeringCanonicalLaneLean
end HautevilleHouse
