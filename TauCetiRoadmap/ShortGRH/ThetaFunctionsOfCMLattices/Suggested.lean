import Mathlib
import TauCeti.Analysis.SpecialFunctions.Elliptic.Weierstrass.Sigma
import TauCeti.Analysis.SpecialFunctions.Elliptic.Weierstrass.Legendre

/-!
# Theta functions of CM lattices: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
gives suggested forms for the definitions of Layer 1 and for some of the statements, against the
pinned Mathlib and Tau Ceti; it is not an exhaustive checklist.

Stated here:

* 1.1 (a), (b): the constant `s₂`, the sigma function `σ = σ_W · exp (-s₂ z² / 2)` built on Tau
  Ceti's `PeriodPair.weierstrassSigma`, and its factor of automorphy;
* 1.2: normalised pointed lattices and CM lattices;
* 1.3: the functions `θ`, `x`, `y`, with `θ` even, `σ² = x θ²` and the cubic;
* 2.3: the discriminant `a₁⁴ - 64` is a unit at every prime;
* 5.3: the Chowla–Selberg formula with a unit.

The statements on sections, on the ring `𝒪[[y]]` and on the formal parameter are stated in the
README only.
-/

namespace TauCetiRoadmap.ShortGRH.ThetaFunctionsOfCMLattices

open Complex
open scoped ComplexConjugate Real

noncomputable section

/-! ### 1.1 The sigma function of a lattice -/

/-- The area of `ℂ / Λ`. -/
def area (L : PeriodPair) : ℝ := |(conj L.ω₁ * L.ω₂).im|

/-- 1.1 (a): the quasi-periods are `η(l) = s₂ l + (π / A) l̄` for exactly one `s₂`. -/
theorem existsUnique_sigmaConst (L : PeriodPair) :
    ∃! s : ℂ, ∀ l : L.lattice, L.quasiPeriod l = s * l + π / area L * conj (l : ℂ) := by
  sorry

/-- The constant `s₂` of the lattice. -/
def sigmaConst (L : PeriodPair) : ℂ := (existsUnique_sigmaConst L).exists.choose

/-- The sigma function `σ = σ_W · exp (-s₂ z² / 2)`. -/
def sigma (L : PeriodPair) (z : ℂ) : ℂ :=
  L.weierstrassSigma z * cexp (-(sigmaConst L * z ^ 2 / 2))

open Classical in
/-- The sign `ε(l)`: `1` if `l / 2` is a period, `-1` otherwise. -/
def sigmaSign (L : PeriodPair) (l : ℂ) : ℂ := if l / 2 ∈ L.lattice then 1 else -1

/-- The twisted translate of degree `m` of `f` by `u`:
`z ↦ exp (-m π (z ū + |u|² / 2) / A) f (z + u)`. -/
def twistedTranslate (L : PeriodPair) (m : ℕ) (u : ℂ) (f : ℂ → ℂ) (z : ℂ) : ℂ :=
  cexp (-((m : ℂ) * π * (z * conj u + (‖u‖ : ℂ) ^ 2 / 2) / area L)) * f (z + u)

/-- 1.1 (b): the factor of automorphy of `σ` is `ε(l) exp (H(l, z) + H(l, l) / 2)`. -/
theorem sigma_add_coe (L : PeriodPair) (l : L.lattice) (z : ℂ) :
    sigma L (z + l) =
      sigmaSign L l * cexp (π / area L * (conj (l : ℂ) * z + conj (l : ℂ) * l / 2)) * sigma L z := by
  sorry

/-- 1.1 (b): `σ` is odd. -/
theorem sigma_neg (L : PeriodPair) (z : ℂ) : sigma L (-z) = -sigma L z := by
  sorry

/-- 1.1 (b): `σ'(0) = 1`. -/
theorem deriv_sigma_zero (L : PeriodPair) : deriv (sigma L) 0 = 1 := by
  sorry

/-- 1.1 (d): the addition formula. -/
theorem sigma_add_mul_sigma_sub (L : PeriodPair) {u v : ℂ} (hu : u ∉ L.lattice)
    (hv : v ∉ L.lattice) :
    sigma L (u + v) * sigma L (u - v) =
      (L.weierstrassP v - L.weierstrassP u) * (sigma L u ^ 2 * sigma L v ^ 2) := by
  sorry

/-! ### 1.2 Normalised pointed lattices and CM lattices -/

/-- A normalised pointed lattice: a lattice with a point `t` of order two, scaled so that
`℘''(t) = 2`, and a square root `a₁` of `12 ℘(t)`. -/
structure PointedLattice extends PeriodPair where
  /-- The point of order two. -/
  t : ℂ
  /-- A square root of `12 ℘(t)`. -/
  a₁ : ℂ
  two_mul_t_mem : 2 * t ∈ toPeriodPair.lattice
  t_notMem : t ∉ toPeriodPair.lattice
  /-- The scaling: `g₂ = 12 ℘(t)² - 4`, that is `℘''(t) = 2`. -/
  g₂_eq : toPeriodPair.g₂ = 12 * toPeriodPair.weierstrassP t ^ 2 - 4
  a₁_sq : a₁ ^ 2 = 12 * toPeriodPair.weierstrassP t

/-- The number `β_K = (1 + √-d) / 2`. -/
def betaK (d : ℕ) : ℂ := (1 + I * √(d : ℝ)) / 2

/-- A CM lattice for `d`: a normalised pointed lattice stable under `β_K`, hence under the
integers of `ℚ(√-d)` when `d ≡ 3 (mod 4)`, whose point `t` is killed by neither `β_K` nor its
conjugate. The roadmap uses it for a prime `d ≡ 7 (mod 8)`. -/
structure CMLattice (d : ℕ) extends PointedLattice where
  betaK_mul_mem : ∀ x ∈ toPeriodPair.lattice, betaK d * x ∈ toPeriodPair.lattice
  betaK_mul_t_notMem : betaK d * t ∉ toPeriodPair.lattice
  conj_betaK_mul_t_notMem : conj (betaK d) * t ∉ toPeriodPair.lattice

/-- 1.2 (a): the discriminant of the lattice is `a₁⁴ - 64`. -/
theorem PointedLattice.g₂_pow_three_sub (C : PointedLattice) :
    C.g₂ ^ 3 - 27 * C.g₃ ^ 2 = C.a₁ ^ 4 - 64 := by
  sorry

/-! ### 1.3 The functions `θ`, `x`, `y` and the cubic -/

namespace PointedLattice

variable (C : PointedLattice)

/-- The function `θ`: the twisted translate of `σ` by `t`, normalised to `1` at `0`. -/
def theta (z : ℂ) : ℂ :=
  twistedTranslate C.toPeriodPair 1 C.t (sigma C.toPeriodPair) z /
    twistedTranslate C.toPeriodPair 1 C.t (sigma C.toPeriodPair) 0

/-- The function `x(z) = ℘(z + t) - ℘(t)`. -/
def x (z : ℂ) : ℂ := C.weierstrassP (z + C.t) - C.weierstrassP C.t

/-- The function `y(z) = (℘'(z + t) - a₁ x(z)) / 2`. -/
def y (z : ℂ) : ℂ := (C.derivWeierstrassP (z + C.t) - C.a₁ * C.x z) / 2

/-- 1.3 (a): `θ` is even. -/
theorem theta_neg (z : ℂ) : C.theta (-z) = C.theta z := by
  sorry

/-- 1.3 (a): the zeros of `θ` are the points of `-t + Λ`. -/
theorem theta_eq_zero_iff (z : ℂ) : C.theta z = 0 ↔ z + C.t ∈ C.lattice := by
  sorry

/-- 1.3 (b): `σ² = x θ²` off `t + Λ`. -/
theorem sigma_sq (z : ℂ) (hz : z + C.t ∉ C.lattice) :
    sigma C.toPeriodPair z ^ 2 = C.x z * C.theta z ^ 2 := by
  sorry

/-- 1.3 (c): the cubic `y² + a₁ x y = x³ + x`. -/
theorem cubic (z : ℂ) (hz : z + C.t ∉ C.lattice) :
    C.y z ^ 2 + C.a₁ * C.x z * C.y z = C.x z ^ 3 + C.x z := by
  sorry

/-- 1.4 (d): duplication for `θ`. -/
theorem theta_two_mul (z : ℂ) :
    C.theta (2 * z) = C.theta z ^ 4 - sigma C.toPeriodPair z ^ 4 := by
  sorry

end PointedLattice

/-! ### 2.3 and 5.3 -/

/-- 2.3: for a prime `d ≡ 7 (mod 8)` the discriminant `a₁⁴ - 64` of a CM lattice is a unit at
every prime. -/
theorem CMLattice.norm_disc_eq_one {d : ℕ} (hd : d.Prime) (hd8 : d % 8 = 7) (C : CMLattice d)
    (p : ℕ) [Fact p.Prime] (ι : ℂ →+* ℂ_[p]) : ‖ι C.a₁ ^ 4 - 64‖ = 1 := by
  sorry

/-- The quadratic character `χ_K = (· / d)` as a complex Dirichlet character modulo `d`. -/
def chiK (d : ℕ) [Fact d.Prime] : DirichletCharacter ℂ d :=
  (quadraticChar (ZMod d)).ringHomComp (Int.castRingHom ℂ)

/-- 5.3: the Chowla–Selberg formula with a unit. For a CM lattice `C` for a prime
`d ≡ 7 (mod 8)` there is `u`, a unit at every prime, such that for every automorphism `s` of `ℂ`
over `ℚ(√-d)` every CM lattice with the conjugate `a₁` has the area
`π exp (γ - Re (L'/L)(1, χ_K)) 2π / √d` after scaling by `s u`. -/
theorem CMLattice.chowlaSelberg_unit {d : ℕ} [Fact d.Prime] (hd8 : d % 8 = 7) (C : CMLattice d) :
    ∃ u : ℂ, (∀ (p : ℕ) [Fact p.Prime] (ι : ℂ →+* ℂ_[p]), ‖ι u‖ = 1) ∧
      ∀ s : ℂ ≃+* ℂ, s (I * √(d : ℝ)) = I * √(d : ℝ) →
        ∀ C' : CMLattice d, C'.a₁ = s C.a₁ →
          area C'.toPeriodPair * ‖s u‖ ^ 2 =
            π * Real.exp (Real.eulerMascheroniConstant -
              (deriv (chiK d).LFunction 1 / (chiK d).LFunction 1).re) * (2 * π / √(d : ℝ)) := by
  sorry

end

end TauCetiRoadmap.ShortGRH.ThetaFunctionsOfCMLattices
