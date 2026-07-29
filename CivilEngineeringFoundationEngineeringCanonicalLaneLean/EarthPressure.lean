import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringFoundationEngineeringCanonicalLaneLean

structure EarthPressurePackage where
  soilUnitWeight : ℝ
  wallHeight : ℝ
  frictionAngle : ℝ
  activeCoefficient : ℝ
  passiveCoefficient : ℝ
  activeForce : ℝ
  passiveForce : ℝ

structure EarthPressureEvidence (E : EarthPressurePackage) where
  activeCoefficientComputed : E.activeCoefficient = (1 - Real.sin E.frictionAngle) / (1 + Real.sin E.frictionAngle)
  passiveCoefficientComputed : E.passiveCoefficient = (1 + Real.sin E.frictionAngle) / (1 - Real.sin E.frictionAngle)
  activeForceComputed : E.activeForce = 0.5 * E.soilUnitWeight * E.wallHeight^2 * E.activeCoefficient
  passiveForceComputed : E.passiveForce = 0.5 * E.soilUnitWeight * E.wallHeight^2 * E.passiveCoefficient

def EarthPressureClosed (E : EarthPressurePackage) : Prop :=
  E.activeForce > 0 ∧ E.passiveForce > 0 ∧ E.activeForce < E.passiveForce

theorem earth_pressure_closed_from_evidence (E : EarthPressurePackage)
    (Ep : EarthPressureEvidence E) : EarthPressureClosed E := by
  have ha : E.activeForce > 0 := by
    rw [Ep.activeForceComputed]
    have : 0.5 * E.soilUnitWeight * E.wallHeight^2 * E.activeCoefficient > 0 := by
      positivity
    exact this
  have hp : E.passiveForce > 0 := by
    rw [Ep.passiveForceComputed]
    positivity
  have ha_lp : E.activeForce < E.passiveForce := by
    rw [Ep.activeForceComputed, Ep.passiveForceComputed]
    have : E.activeCoefficient < E.passiveCoefficient := by
      rw [Ep.activeCoefficientComputed, Ep.passiveCoefficientComputed]
      have hpos : 0 < E.frictionAngle ∧ E.frictionAngle < π/2 := by
        exact ⟨by positivity, by nlinarith [Real.pi_pos]⟩
      have hsin : 0 < Real.sin E.frictionAngle ∧ Real.sin E.frictionAngle < 1 := by
        have h1 : 0 < E.frictionAngle := hpos.1
        have h2 : E.frictionAngle < π/2 := hpos.2
        have hsinpos : 0 < Real.sin E.frictionAngle := Real.sin_pos_of_pos_of_lt_pi h1 (by nlinarith)
        have hsinsmall : Real.sin E.frictionAngle < 1 := Real.sin_lt_one (by nlinarith)
        exact ⟨hsinpos, hsinsmall⟩
      nlinarith [hsin.1, hsin.2]
    nlinarith
  exact And.intro ha (And.intro hp ha_lp)

end CivilEngineeringFoundationEngineeringCanonicalLaneLean
end HautevilleHouse