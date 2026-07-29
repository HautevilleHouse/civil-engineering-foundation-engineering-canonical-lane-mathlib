import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringFoundationEngineeringCanonicalLaneLean

structure SlopeStabilityPackage where
  cohesion : ℝ
  soilUnitWeight : ℝ
  slopeHeight : ℝ
  slopeAngle : ℝ
  frictionAngle : ℝ
  factorOfSafety : ℝ

structure SlopeStabilityEvidence (S : SlopeStabilityPackage) where
  factorOfSafetyComputed : S.factorOfSafety = (S.cohesion + (S.soilUnitWeight * S.slopeHeight * Real.cos S.slopeAngle) * Real.tan S.frictionAngle) / (S.soilUnitWeight * S.slopeHeight * Real.sin S.slopeAngle)
  factorOfSafetyAcceptable : S.factorOfSafety > 1.5

def SlopeStabilityClosed (S : SlopeStabilityPackage) : Prop :=
  S.factorOfSafety > 1.5

theorem slope_stability_closed_from_evidence (S : SlopeStabilityPackage)
    (E : SlopeStabilityEvidence S) : SlopeStabilityClosed S := by
  exact E.factorOfSafetyAcceptable

end CivilEngineeringFoundationEngineeringCanonicalLaneLean
end HautevilleHouse
