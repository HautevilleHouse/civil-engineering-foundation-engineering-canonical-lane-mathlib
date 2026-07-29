import CivilEngineeringFoundationEngineeringCanonicalLaneLean.BearingCapacityEvidence

namespace HautevilleHouse
namespace CivilEngineeringFoundationEngineeringCanonicalLaneLean

structure SettlementPackage (B : BearingCapacityPackage) where
  appliedLoad : Float
  settlementImmediate : Float
  settlementConsolidation : Float
  totalSettlement : Float
  allowableSettlement : Float

structure SettlementEvidence {B : BearingCapacityPackage}
    (S : SettlementPackage B) where
  immediateCalculated : S.settlementImmediate ≥ 0
  consolidationCalculated : S.settlementConsolidation ≥ 0
  totalWithinAllowable : S.totalSettlement ≤ S.allowableSettlement

def SettlementClosed {B : BearingCapacityPackage}
    (S : SettlementPackage B) : Prop :=
  S.settlementImmediate ≥ 0 ∧ S.settlementConsolidation ≥ 0 ∧
  S.totalSettlement ≤ S.allowableSettlement

theorem settlement_closed_from_evidence {B : BearingCapacityPackage}
    (S : SettlementPackage B) (E : SettlementEvidence S) :
    SettlementClosed S := by
  exact And.intro E.immediateCalculated (And.intro E.consolidationCalculated E.totalWithinAllowable)

end CivilEngineeringFoundationEngineeringCanonicalLaneLean
end HautevilleHouse