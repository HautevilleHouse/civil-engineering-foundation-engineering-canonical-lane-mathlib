import HautevilleHouse.CivilEngineeringFoundationEngineeringCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringFoundationEngineeringCanonicalLaneLean

structure BearingCapacityPackage where
  soilType : String
  cohesion : ℝ
  frictionAngle : ℝ
  unitWeight : ℝ
  footingWidth : ℝ
  footingDepth : ℝ
  ultimateBearingCapacity : ℝ
  factorOfSafety : ℝ
  allowableBearingCapacity : ℝ
  terzaghiFactorsAvailable : Prop
  meyerhofFactorsAvailable : Prop
  generalShearFailure : Prop
  localShearFailure : Prop
  punchingShearFailure : Prop

structure BearingCapacityEvidence (B : BearingCapacityPackage) where
  terzaghiFactorsClosed : B.terzaghiFactorsAvailable
  meyerhofFactorsClosed : B.meyerhofFactorsAvailable
  ultimateCapacityCalculated : Prop
  allowableCapacityCalculated : Prop
  failureModesConsidered : Prop

def BearingCapacityClosed (B : BearingCapacityPackage) : Prop :=
  B.terzaghiFactorsAvailable ∧ B.meyerhofFactorsAvailable ∧
  B.generalShearFailure ∧ B.localShearFailure ∧ B.punchingShearFailure

theorem bearing_capacity_closed_from_evidence
    (B : BearingCapacityPackage) (E : BearingCapacityEvidence B) :
    BearingCapacityClosed B := by
  exact And.intro E.terzaghiFactorsClosed
    (And.intro E.meyerhofFactorsClosed
      (And.intro E.ultimateCapacityCalculated
        (And.intro E.allowableCapacityCalculated E.failureModesConsidered)))

end CivilEngineeringFoundationEngineeringCanonicalLaneLean
end HautevilleHouse