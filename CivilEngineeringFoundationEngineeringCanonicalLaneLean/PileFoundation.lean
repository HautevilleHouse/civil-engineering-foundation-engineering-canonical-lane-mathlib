import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringFoundationEngineeringCanonicalLaneLean

structure PileFoundationPackage where
  pileLength : Float
  pileDiameter : Float
  soilUnitWeight : Float
  cohesion : Float
  frictionAngle : Float
  shaftResistance : Float
  endBearingResistance : Float
  ultimateCapacity : Float
  allowableCapacity : Float
  factorOfSafety : Float
  alphaMethodApplied : Prop
  capacityAdequate : Prop

structure PileFoundationEvidence (P : PileFoundationPackage) where
  alphaMethodAppliedClosed : P.alphaMethodApplied
  capacityAdequateClosed : P.capacityAdequate

def PileFoundationClosed (P : PileFoundationPackage) : Prop :=
  P.alphaMethodApplied ∧ P.capacityAdequate

theorem pile_foundation_closed_from_evidence
    (P : PileFoundationPackage) (E : PileFoundationEvidence P) :
    PileFoundationClosed P := by
  exact And.intro E.alphaMethodAppliedClosed E.capacityAdequateClosed

end CivilEngineeringFoundationEngineeringCanonicalLaneLean
end HautevilleHouse
