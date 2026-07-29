import HautevilleHouse.CivilEngineeringFoundationEngineeringCanonicalLaneLean.BearingCapacity

namespace HautevilleHouse
namespace CivilEngineeringFoundationEngineeringCanonicalLaneLean

structure SettlementPackage (B : BearingCapacityPackage) where
  immediateSettlement : ℝ
  consolidationSettlement : ℝ
  secondaryCompression : ℝ
  totalSettlement : ℝ
  allowableSettlement : ℝ
  elasticModulus : ℝ
  poissonRatio : ℝ
  compressionIndex : ℝ
  swellIndex : ℝ
  preconsolidationPressure : ℝ

structure SettlementEvidence {B : BearingCapacityPackage}
    (S : SettlementPackage B) where
  immediateSettlementClosed : S.immediateSettlement ≠ 0
  consolidationSettlementClosed : S.consolidationSettlement ≠ 0
  secondaryCompressionClosed : S.secondaryCompression ≠ 0
  totalSettlementBelowAllowable : S.totalSettlement ≤ S.allowableSettlement

def SettlementClosed {B : BearingCapacityPackage}
    (S : SettlementPackage B) : Prop :=
  S.immediateSettlement ≠ 0 ∧ S.consolidationSettlement ≠ 0 ∧
  S.secondaryCompression ≠ 0 ∧ S.totalSettlement ≤ S.allowableSettlement

theorem settlement_closed_from_evidence
    {B : BearingCapacityPackage} (S : SettlementPackage B)
    (E : SettlementEvidence S) : SettlementClosed S := by
  exact And.intro E.immediateSettlementClosed
    (And.intro E.consolidationSettlementClosed
      (And.intro E.secondaryCompressionClosed E.totalSettlementBelowAllowable))

end CivilEngineeringFoundationEngineeringCanonicalLaneLean
end HautevilleHouse