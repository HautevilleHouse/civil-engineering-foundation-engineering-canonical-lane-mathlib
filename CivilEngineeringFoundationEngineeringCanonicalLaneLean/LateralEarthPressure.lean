import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringFoundationEngineeringCanonicalLaneLean

structure LateralEarthPressurePackage where
  wallHeight : Float
  soilUnitWeight : Float
  frictionAngle : Float
  cohesion : Float
  surcharge : Float
  coefficientActive : Float
  coefficientPassive : Float
  totalActiveThrust : Float
  totalPassiveResistance : Float
  wallStabilityFactor : Float
  rankineTheoryApplied : Prop
  wallStabilitySatisfied : Prop

structure LateralEarthPressureEvidence (P : LateralEarthPressurePackage) where
  rankineTheoryAppliedClosed : P.rankineTheoryApplied
  wallStabilitySatisfiedClosed : P.wallStabilitySatisfied

def LateralEarthPressureClosed (P : LateralEarthPressurePackage) : Prop :=
  P.rankineTheoryApplied ∧ P.wallStabilitySatisfied

theorem lateral_earth_pressure_closed_from_evidence
    (P : LateralEarthPressurePackage) (E : LateralEarthPressureEvidence P) :
    LateralEarthPressureClosed P := by
  exact And.intro E.rankineTheoryAppliedClosed E.wallStabilitySatisfiedClosed

end CivilEngineeringFoundationEngineeringCanonicalLaneLean
end HautevilleHouse
