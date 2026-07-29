import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringFoundationEngineeringCanonicalLaneLean

structure PileLoadCapacityPackage where
  pileType : String
  pileLength : ℝ
  pileDiameter : ℝ
  skinFriction : ℝ
  endBearing : ℝ
  factorOfSafety : ℝ
  allowableLoad : ℝ

structure PileLoadCapacityEvidence (P : PileLoadCapacityPackage) where
  allowableLoadComputed : P.allowableLoad = (P.skinFriction + P.endBearing) / P.factorOfSafety
  allowableLoadPositive : P.allowableLoad > 0

def PileLoadCapacityClosed (P : PileLoadCapacityPackage) : Prop :=
  P.allowableLoad > 0

theorem pile_load_capacity_closed_from_evidence (P : PileLoadCapacityPackage)
    (E : PileLoadCapacityEvidence P) : PileLoadCapacityClosed P := by
  exact E.allowableLoadPositive

end CivilEngineeringFoundationEngineeringCanonicalLaneLean
end HautevilleHouse
