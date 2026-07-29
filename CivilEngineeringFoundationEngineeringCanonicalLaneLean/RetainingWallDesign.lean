import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CivilEngineeringFoundationEngineeringCanonicalLaneLean.LateralEarthPressure

namespace HautevilleHouse
namespace CivilEngineeringFoundationEngineeringCanonicalLaneLean

structure RetainingWallDesignPackage {L : LateralEarthPressurePackage}
    (E : LateralEarthPressureEvidence L) where
  wallGeometry : Prop
  stabilityAgainstSliding : Prop
  stabilityAgainstOverturning : Prop
  bearingPressureCheck : Prop
  structuralDesign : Prop

def RetainingWallDesignClosed {L : LateralEarthPressurePackage}
    {E : LateralEarthPressureEvidence L} (R : RetainingWallDesignPackage E) : Prop :=
  R.wallGeometry ∧ R.stabilityAgainstSliding ∧ R.stabilityAgainstOverturning ∧
  R.bearingPressureCheck ∧ R.structuralDesign

structure RetainingWallDesignEvidence {L : LateralEarthPressurePackage}
    {E : LateralEarthPressureEvidence L} (R : RetainingWallDesignPackage E) where
  wallGeometryClosed : R.wallGeometry
  stabilityAgainstSlidingClosed : R.stabilityAgainstSliding
  stabilityAgainstOverturningClosed : R.stabilityAgainstOverturning
  bearingPressureCheckClosed : R.bearingPressureCheck
  structuralDesignClosed : R.structuralDesign

theorem retaining_wall_design_closed_from_evidence
    {L : LateralEarthPressurePackage} {E : LateralEarthPressureEvidence L}
    (R : RetainingWallDesignPackage E) (Ev : RetainingWallDesignEvidence R) :
    RetainingWallDesignClosed R := by
  exact And.intro Ev.wallGeometryClosed
    (And.intro Ev.stabilityAgainstSlidingClosed
      (And.intro Ev.stabilityAgainstOverturningClosed
        (And.intro Ev.bearingPressureCheckClosed Ev.structuralDesignClosed)))

end CivilEngineeringFoundationEngineeringCanonicalLaneLean
end HautevilleHouse
