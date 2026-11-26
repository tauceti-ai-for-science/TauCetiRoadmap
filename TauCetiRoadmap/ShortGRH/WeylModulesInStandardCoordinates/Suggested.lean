import Mathlib

/-!
# Weyl modules in standard coordinates: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states, against the pinned Mathlib, suggested forms of the targets of the roadmap that are
statable there; it is read as suggested forms, never as an exhaustive checklist.

Stated here: the Fock pairing on polynomials with its adjointness under linear substitutions
(1.1), and the polarisation of a product of determinants (3.4). Both are statements about
`MvPolynomial`, `Matrix.det` and `Matrix.unitaryGroup`.

Not stated here: Layers 2 and 4 and sections 3.1 to 3.3. They are statements about the dual Weyl
module of a family of general linear groups in its polynomial model, its basis of standard
bideterminants and the coordinates that this basis gives. Neither Mathlib nor Tau Ceti has that
module at the pins (Mathlib has `SemistandardYoungTableau`, `MvPolynomial` and `Matrix.det`; Tau
Ceti has the rational Weyl modules `TauCeti.rationalWeylFDRep` over `ℂ`, which carry no integral
basis). The polynomial model of one general linear group and its standard basis are the target
IntegralWeylModulesOfGeneralLinearGroups §0.1, whose `Suggested.lean` prototypes them; the
statements of this roadmap are to be written against the implementation of that target.
-/

namespace TauCetiRoadmap.ShortGRH.WeylModulesInStandardCoordinates

open MvPolynomial Matrix

section FockPairing

variable {σ m R : Type*} [CommSemiring R]

/-- 1.1. The Fock pairing `⟨f, g⟩ = f(∂) g (0) = Σ_α α! f_α g_α` of two polynomials, where `α!` is
the product of the factorials of the exponents. -/
noncomputable def fockPairing (f g : MvPolynomial σ R) : R :=
  ∑ α ∈ f.support, f.coeff α * (α.prod fun _ k ↦ (k.factorial : R)) * g.coeff α

/-- 1.1 (a). The Fock pairing is a bilinear form. -/
theorem exists_bilinForm_fockPairing :
    ∃ B : MvPolynomial σ R →ₗ[R] MvPolynomial σ R →ₗ[R] R, ∀ f g, B f g = fockPairing f g := by
  sorry

/-- 1.1 (a). The Fock pairing is symmetric. -/
theorem fockPairing_comm (f g : MvPolynomial σ R) : fockPairing f g = fockPairing g f := by
  sorry

/-- 1.1 (a). Monomials are orthogonal, and `⟨x^α, x^α⟩ = α!`. -/
theorem fockPairing_monomial_monomial [DecidableEq σ] (α β : σ →₀ ℕ) (a b : R) :
    fockPairing (monomial α a) (monomial β b) =
      if α = β then a * (α.prod fun _ k ↦ (k.factorial : R)) * b else 0 := by
  sorry

/-- 1.1 (a). Multiplication by a variable is adjoint to the partial derivative. -/
theorem fockPairing_X_mul (i : σ) (f g : MvPolynomial σ R) :
    fockPairing (X i * f) g = fockPairing f (pderiv i g) := by
  sorry

/-- 1.1 (a). The Fock pairing commutes with a change of the coefficient ring. -/
theorem map_fockPairing {S : Type*} [CommSemiring S] (φ : R →+* S) (f g : MvPolynomial σ R) :
    φ (fockPairing f g) = fockPairing (map φ f) (map φ g) := by
  sorry

/-- 1.1 (b). The substitution `L_z` of a matrix `z` with rows `m` and columns `σ`: the variable
`x_s` goes to `Σ_t z_{t,s} x_t`. -/
noncomputable def linSubst [Fintype m] (z : Matrix m σ R) :
    MvPolynomial σ R →ₐ[R] MvPolynomial m R :=
  aeval fun s ↦ ∑ t, z t s • X t

/-- 1.1 (b). The substitutions by a matrix and by its transpose are adjoint for the Fock
pairing. -/
theorem fockPairing_linSubst [Fintype m] [Fintype σ] (z : Matrix m σ R)
    (f : MvPolynomial m R) (g : MvPolynomial σ R) :
    fockPairing f (linSubst z g) = fockPairing (linSubst zᵀ f) g := by
  sorry

/-- 1.1 (c). Over `ℂ`, the pairing of the conjugate of a nonzero polynomial with the polynomial
is a positive real number. -/
theorem fockPairing_conj_self_pos {f : MvPolynomial σ ℂ} (hf : f ≠ 0) :
    0 < (fockPairing (map (starRingEnd ℂ) f) f).re ∧
      (fockPairing (map (starRingEnd ℂ) f) f).im = 0 := by
  sorry

end FockPairing

section Polarisation

/-- 3.4. Polarisation of a product of determinants. Let `|p| < |n|`, let `η₀` be the `p × n`
matrix whose row `k` is the standard basis vector at `r k`, for an injective `r`, and let
`η τ k` be complex `p × n` matrices. Then the product of the `det (η τ k * Y τ)` is a finite
combination of the products `∏ τ, det (η₀ * (u τ)ᵀ * Y τ) ^ #(ι τ)` with `u τ` unitary, with
coefficients that depend neither on the `n × p` matrices `Y τ` nor on the commutative `ℂ`-algebra
that holds their entries. -/
theorem exists_prod_det_eq_sum_unitary {Φ n p : Type*} [Fintype Φ] [Fintype n] [DecidableEq n]
    [Fintype p] [DecidableEq p] {ι : Φ → Type*} [∀ τ, Fintype (ι τ)]
    (hp : Fintype.card p < Fintype.card n) {r : p → n} (hr : Function.Injective r)
    (η : ∀ τ, ι τ → Matrix p n ℂ) :
    ∃ c : (Φ → Matrix.unitaryGroup n ℂ) →₀ ℂ,
      ∀ (S : Type*) [CommRing S] [Algebra ℂ S] (Y : Φ → Matrix n p S),
        ∏ τ, ∏ k : ι τ, ((η τ k).map (algebraMap ℂ S) * Y τ).det =
          c.sum fun u a ↦ a • ∏ τ,
            ((((1 : Matrix n n ℂ).submatrix r id * (u τ : Matrix n n ℂ)ᵀ).map (algebraMap ℂ S) *
              Y τ).det) ^ Fintype.card (ι τ) := by
  sorry

end Polarisation

end TauCetiRoadmap.ShortGRH.WeylModulesInStandardCoordinates
