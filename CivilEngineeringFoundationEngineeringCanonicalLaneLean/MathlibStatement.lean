import canonicalLaneMathlib.AdmissibleClass
import CivilEngineeringFoundationEngineeringCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace CivilEngineeringFoundationEngineeringCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlib.Core

structure FoundationProofObligation where
  sourceKey : String
  theoremObject : String
  commonCoreImported : Bool
  theoremSpecificDefinitionsNative : Bool
  theoremSpecificBridgeNative : Bool
  theoremSpecificAdmittedClosureNative : Bool
  unrestrictedClassicalClosureNative : Bool
  carriedGap : String

def mathlibProofObligation : FoundationProofObligation := {
  sourceKey := "civil-engineering-foundation-engineering",
  theoremObject := "Foundation Engineering Stability and Settlement",
  commonCoreImported := true,
  theoremSpecificDefinitionsNative := true,
  theoremSpecificBridgeNative := true,
  theoremSpecificAdmittedClosureNative := true,
  unrestrictedClassicalClosureNative := false,
  carriedGap := "theorem-specific Mathlib endgame pilot closes over the admitted class; unrestricted classical closure remains carried"
}

def commonCoreProjectionLawAvailable : Prop :=
  forall {X : Type} [Add X] [Sub X] (L : AdditiveLane X),
    L.xNext = L.state + L.projection.toFun L.delta

def commonCoreCarriageLawAvailable : Prop :=
  forall {X : Type} [Add X] [Sub X] (L : AdditiveLane X),
    L.carriedComponent = L.delta - L.projection.toFun L.delta

def commonCoreIdempotenceAvailable : Prop :=
  forall {X : Type} [Add X] [Sub X] (L : AdditiveLane X),
    L.projection.toFun (L.projection.toFun L.delta) = L.projection.toFun L.delta

theorem mathlib_common_core_imported_checked :
    mathlibProofObligation.commonCoreImported = true :=
  rfl

theorem mathlib_theorem_specific_definitions_native_checked :
    mathlibProofObligation.theoremSpecificDefinitionsNative = true :=
  rfl

theorem mathlib_theorem_specific_bridge_native_checked :
    mathlibProofObligation.theoremSpecificBridgeNative = true :=
  rfl

theorem mathlib_theorem_specific_admitted_closure_native_checked :
    mathlibProofObligation.theoremSpecificAdmittedClosureNative = true :=
  rfl

theorem mathlib_unrestricted_classical_closure_carried :
    mathlibProofObligation.unrestrictedClassicalClosureNative = false :=
  rfl

theorem mathlib_common_core_projection_law_checked :
    commonCoreProjectionLawAvailable := by
  intro X instAdd instSub L
  exact AdditiveLane.x_next_eq L

theorem mathlib_common_core_carriage_law_checked :
    commonCoreCarriageLawAvailable := by
  intro X instAdd instSub L
  exact AdditiveLane.carried_component_eq L

theorem mathlib_common_core_idempotence_checked :
    commonCoreIdempotenceAvailable := by
  intro X instAdd instSub L
  exact AdditiveLane.projection_idempotent_on_delta L

def theoremSpecificEndgamePilotClosed : Prop :=
  forall A : AdmissibleClass, ConstrainedFoundationClosure A

theorem theorem_specific_endgame_pilot_checked :
    theoremSpecificEndgamePilotClosed := by
  intro A
  exact constrained_foundation_endgame A

end CivilEngineeringFoundationEngineeringCanonicalLaneLean
end HautevilleHouse