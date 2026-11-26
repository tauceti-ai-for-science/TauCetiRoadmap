# Roadmap: matrices over valuation rings and elementary inputs

**Summary.** This roadmap states the elementary results of general mathematics that the route of the shorter formal
proof of the Riemann hypothesis for Dirichlet L-functions uses and that no roadmap of the library states in the form
used. They are results of linear algebra over valuation rings, of matrix analysis, of non-archimedean analysis in one
variable, of polynomial algebra and of analytic number theory. None of them mentions a unitary group, a theta function
or an automorphic form, and each is stated here once, as a numbered target, so that the roadmaps of the family can cite
it by section number.

The headline theorems are these. (1) *Hermite and Smith forms* (1.2, 1.3). Call a commutative ring `A` with a subring
`R` a valuation pair if any two elements of `A` are `R`-multiples of one element obtained by patching them along an
idempotent of `R`; a valuation domain with itself or with its fraction field, and the integral finite adeles of a number
field in its finite adeles, are valuation pairs. Over a valuation pair, a matrix over `A` with at least as many rows as
columns is an invertible matrix over `R` times a square matrix placed in chosen rows, which can be taken block
triangular, and a square matrix over `A` is a product of an invertible matrix over `R`, a diagonal matrix and an
invertible matrix over `R`. Over a valuation domain the diagonal entries can be taken in a divisibility chain. (2) *Minors
and lengths* (2.1). For a matrix `M` with `k` columns over a discrete valuation ring `O` and `a ≠ 0`, the length of the
kernel of `M` on `(O/a)^k` is the least valuation of a `k × k` minor of the matrix made of the rows of `M` and of
`a·1`. (3) *Jacobi's identity* (3.2). Let `R` be a compact open subring of a locally compact ring `A` with involution,
stable under the involution, with `(A, R)` a valuation pair. For a unimodular hermitian form over `R`, an integral
matrix `F` and a primitive matrix `n` of complementary rank whose columns are orthogonal to those of `F`, the orthogonal
complement of the columns of `n` is the span of the columns of `F` over `A`, and the Gram determinants of `F` and of `n`
have the same generalised index up to the square of the index of the lattice spanned by `F` in its saturation. (4) *The
Cauchy–Schwarz inequality for determinants* (4.1): `|det(a_i^* G b_k)|² ≤ det(a_i^* G a_k)·det(b_i^* G b_k)` for a
positive semidefinite hermitian matrix `G`. (5) *The Gauss valuation* (5.1): over the integers of an algebraically
closed non-archimedean field, finitely many polynomials attain their Gauss valuations of a radius at one common point
of that radius, and the Gauss valuation of a polynomial is given by its Gauss valuation of radius `0` and the valuations
of its integral roots. (6) *The exponential of a power series* (6.1, 6.2): `exp(G + G′) = exp(G)·exp(G′)` for series
without constant term in several variables over a `ℚ`-algebra, and over a `p`-adic field an element `c` with
`v(c) ≥ 1/(p − 1)` that divides the coefficients of `G` below a degree divides those of `exp(G) − 1` below that degree.
(7) *The combinatorial Nullstellensatz with multiplicity and weights* (7.1). (8) *Quadratic twists without zeros in a
box* (8.1, 8.2): for `β > 1/2`, a height `H` and a class modulo `N` whose primes are `≡ 7 (mod 8)`, the primes `d ≤ X` of
the class for which some `L(s, ξ·(·/d))`, `ξ` modulo `N`, vanishes in `Re s ≥ β`, `|Im s| ≤ H` number `O(X^{1−δ})` for
some `δ > 0`, and so some prime of the class has no such zero.

The roadmap feeds the roadmaps of the family ShortGRH: OneSidedPrimeSumBoundsAndAdmissibleData takes the Smith form
(colengths), the determinant inequalities (covolumes) and the choice of the prime `d` (the one-sided criterion);
CompositeThetaLiftsAndShortForms takes the Hermite and Smith forms and the Nullstellensatz (elementary divisors of the
edge Hecke operator); RemainingAndMainTermsOfSecondMoments takes Jacobi's identity (Siegel's lemma, the lattice of a
link); SelmerBoundsForAnticyclotomicTwists takes the lengths by minors and the Gauss valuation (one system of
equations for all twists, roots of unity); DivisibilityOfThetaDerivatives takes the exponential of a series (the normal
form of a theta function). It builds on Mathlib and on Tau Ceti only: the Smith normal form over a discrete valuation
ring and the description of invariant factors by minors, Fischer's and Hadamard's inequalities, the Gauss norm of a
polynomial and its multiplicativity, lengths of modules, and Dirichlet L-functions. It needs no roadmap of the family.

The eight layers are independent of each other, except that Layer 2 uses the Smith form of Layer 1 and Layer 3 uses
Layer 1 throughout. Layer 1 defines valuation pairs and proves the Hermite and Smith forms. Layer 2 computes the length
of the kernel of a matrix modulo an element of a discrete valuation ring. Layer 3 defines the generalised index and
proves Jacobi's identity. Layer 4 proves the Cauchy–Schwarz inequality for determinants and records the forms of
Hadamard's and Fischer's inequalities for a positive semidefinite form. Layer 5 is the Gauss valuation. Layer 6 is the
exponential of a power series. Layer 7 is the Nullstellensatz with multiplicity. Layer 8 is the zero-density count for
quadratic twists and the choice of a prime.

## Conventions and notation

**Labels.** Every section that states something carries, under its heading, `*Origin:*` (one of `published:`,
`adapted from`, `particular to this proof:`, `this roadmap's own formulation:`, `definitions and conventions`) and
`*Method of the formal proof:*`, how [ShortProof] proves it. After the statement, `*Needs:*` names what the statement
rests on, and the last line names where [ShortProof] proves it, as `[ShortProof], path (declarations)`, with the path
relative to its directory `src/`. Where a section states more than [ShortProof] proves, its last sentence says which
case [ShortProof] proves. A section of another roadmap is cited by number, `<Roadmap> §k.n`.

**Rings and matrices.** Rings are commutative with `1`. Index sets of matrices are finite unless a section says
otherwise. For a ring `A` with a subring `R`, a matrix or a vector over `A` is *integral* if its entries lie in `R`;
`R^σ ⊂ A^σ` is the module of integral vectors; `GL_n(R) ⊂ GL_n(A)` is the group of invertible matrices that are
integral together with their inverses. A matrix `X` over `A` with rows `π` and columns `σ` is *left invertible* if
`LX = 1` for some matrix `L` over `A`, and *primitive* (for `R`) if `X` is integral and `LX = 1` for some integral `L`.
For a map `wt : k → ℕ`, a `k × k` matrix `D` is *block triangular for `wt`* if `D_{ij} = 0` whenever `wt(j) < wt(i)`
(Mathlib `Matrix.BlockTriangular`). `diag(d)` is the diagonal matrix with entries `d`, `(X | Y)` the matrix with the
columns of `X` followed by those of `Y`, and `1` an identity matrix.

**Involutions.** When `A` carries an involution `x ↦ x̄` (a ring automorphism of order at most two; Mathlib
`StarRing`), `X^*` is the conjugate transpose of a matrix `X` (Mathlib `Matrix.conjTranspose`), and a square matrix `J`
is *hermitian* if `J^* = J`. A hermitian matrix `J` over `A` is *unimodular* (for `R`) if `J ∈ GL_n(R)`.

**Valuations.** For a discrete valuation ring `O`, `v` is its normalised valuation with values in `ℕ ∪ {∞}` (Mathlib
`IsDiscreteValuationRing.addVal`), and lengths are lengths of `O`-modules (Mathlib `Module.length`), with values in
`ℕ ∪ {∞}`. The length of `O/(z)` is `v(z)` (Mathlib `Ring.ord_eq_addVal`). In Layers 5 and 6 a non-archimedean field
`K` has an absolute value `|·|`, its ring of integers `𝒪 = {x : |x| ≤ 1}`, and an additive valuation
`v = −log_b|·|` for a fixed base `b > 1`, with `v(0) = ∞`; for `K = ℚ̄_ℓ` or `ℂ_p` the base is the residue
characteristic, so that `v(ℓ) = 1` or `v(p) = 1`.

**Power series.** `exp` is the exponential series `Σ_j T^j/j!` over a `ℚ`-algebra (Mathlib `PowerSeries.exp`). For a
power series `G` in several variables without constant term, `exp(G)` is the series obtained by substituting `G` for
`T` (Mathlib `PowerSeries.subst`). The degree of a monomial is its total degree.

**Characters.** For a prime `d`, `(·/d)` is the Legendre symbol, a Dirichlet character modulo `d` (Mathlib
`quadraticChar (ZMod d)` with values cast to `ℂ`). For a Dirichlet character `ξ` modulo `N`, `ξ·(·/d)` is the product of
the two characters at the level `N·d` (Mathlib `DirichletCharacter.changeLevel`), and `L(s, χ)` is Mathlib's
`DirichletCharacter.LFunction`.

## Layer 1: Hermite and Smith forms over valuation pairs

### 1.1 Valuation pairs

*Origin:* definitions and conventions.

*Method of the formal proof:* for a valuation subring of a field, one of two elements is a multiple of the other, and
the idempotent is `0` or `1`. For the finite adeles, the idempotent is `1` at the places where the first element has
the smaller absolute value and `0` at the others.

Let `A` be a ring and `R ⊂ A` a subring. The pair `(A, R)` is a *valuation pair* if for all `a, b ∈ A` there is an
idempotent `e ∈ R` such that `a` and `b` both lie in `R·((1 − e)a + eb)`. Prove:

- (a) for a valuation subring `O` of a field `F` (Mathlib `ValuationSubring`), `(F, O)` is a valuation pair; for a
  valuation domain `O` (Mathlib `ValuationRing`), `(O, O)` is a valuation pair;
- (b) if `(A, R)` is a valuation pair, so is `(R, R)`;
- (c) for a number field `E` with finite adeles `𝔸_f` (Mathlib `IsDedekindDomain.FiniteAdeleRing`) and their subring `Ô`
  of integral elements, `(𝔸_f, Ô)` is a valuation pair;
- (d) in a valuation pair, among finitely many elements `a_1, …, a_m` of `A` (`m ≥ 1`) there are idempotents
  `e_1, …, e_m ∈ R`, pairwise orthogonal with sum `1`, such that every `a_i` lies in `R·Σ_j e_j a_j`.

*Needs:* none.

*Checks.* The pair `(ℤ, ℤ)` is not a valuation pair: the only idempotents are `0` and `1`, and neither of `2`, `3`
divides the other. For a product `O₁ × O₂` of two valuation domains, the pair of the product with itself is a
valuation pair although the product is not a valuation ring, and the idempotent of `((ϖ₁, 1), (1, ϖ₂))`, for nonunits
`ϖ_i ≠ 0`, is neither `0` nor `1`.

[ShortProof], `Lib/General/LinearAlgebra/IntegralLattices.lean` (`New.IsValuationPair`,
`New.isValuationPair_valuationSubring`, `New.IsValuationPair.top`), `Lib/General/LinearAlgebra/HermiteForm.lean`
(`New.isValuationPair_top`), `Lib/Adelic/Adeles/IdeleModulus.lean` (`New.isValuationPair_Ô`). Item (d) is this roadmap's
own formulation of the step of [ShortProof] that finds a pivot (`New.IsValuationPair.exists_pivot_dvd` in
`Lib/General/LinearAlgebra/IntegralLattices.lean`, for the entries of a matrix).

### 1.2 The Hermite form over a valuation pair

*Origin:* adapted from the Hermite normal form of a matrix over a principal ideal domain (Newman (1972), Chapter II):
here over a valuation pair, with entries in the larger ring and row operations over the subring, in a weak form
without normalised pivots and without uniqueness, and with a block triangular shape for a given weight.

*Method of the formal proof:* a row operation in `GL_n(R)` on two rows makes one entry of a column zero: by the
definition of a valuation pair the two entries are `R`-multiples of their patch along an idempotent, and the operation
is built from transvections cut along that idempotent. Clearing the columns in the order of the
weight, with the pivot of the column `j` in the row `ι(j)`, gives (a); (b) is (a) for the transpose; in (c) a left
inverse makes the square matrix of (a) invertible.

Let `(A, R)` be a valuation pair, `n` and `k` finite sets, `ι : k → n` injective and `wt : k → ℕ`.

- (a) *Hermite form.* For every `n × k` matrix `y` over `A` there are `U ∈ GL_n(R)` and a `k × k` matrix `D` over `A`,
  block triangular for `wt`, such that `y = U_ι·D`, where `U_ι` is the `n × k` matrix whose column `j` is the column
  `ι(j)` of `U`. Equivalently, the row `ι(j)` of `U⁻¹y` is the row `j` of `D` for every `j ∈ k`, and the rows of `U⁻¹y`
  outside the image of `ι` vanish.
- (b) *Transposed form.* For every `k × n` matrix `M` over `A` there is `V ∈ GL_n(R)` such that the columns of `MV`
  outside the image of `ι` vanish.
- (c) *Primitive form of a left invertible matrix.* If the `n × k` matrix `X` over `A` is left invertible, there is
  `b ∈ GL_k(A)`, block triangular for `wt`, such that `Xb` is primitive.

*Needs:* 1.1.

*Checks.* For `k = n`, `ι = id` and `wt` constant, (a) holds with `U = 1` and `D = y`. For `k = n`, `ι = id` and `wt`
injective, `D` is upper triangular for the order of `wt`. For `A = R = O` a valuation domain, `n = {1, 2}`, `k = {1}`,
`ι(1) = 1` and `y = (y₁, y₂)ᵀ`, (a) says that the ideal `(y₁, y₂)` is principal, generated by `D`.

[ShortProof], `Lib/General/LinearAlgebra/HermiteForm.lean` (`New.IsValuationPair.hermite`,
`New.IsValuationPair.exists_mul_clear_cols`, `New.IsValuationPair.exists_isPrimitiveMatrix_mul`)

### 1.3 The Smith form over a valuation domain and over a valuation pair

*Origin:* published: Kaplansky (1949), valuation rings are elementary divisor rings, for (a); adapted from it for (b):
here for a valuation pair, with entries in the larger ring and without a divisibility chain.

*Method of the formal proof:* elimination by induction on the size. Among the entries of the matrix, the patch along
orthogonal idempotents (1.1 (d)) divides all of them over `R`; row and column operations in `GL_n(R)` bring it to one
place, clear its row and its column, and leave a smaller block. Over a valuation domain the pivot is an entry that
divides all the others, the smaller block is a multiple of it, and the chain follows.

- (a) *Valuation domains.* Let `O` be a valuation domain and `M` an `n × n` matrix over `O`, `n ∈ ℕ`. There are `n × n`
  matrices `L`, `Q` over `O` with unit determinants and `s_1, …, s_n ∈ O` with `s_1 | s_2 | ⋯ | s_n` such that
  `L·M·Q = diag(s)`. Zero entries are allowed, and come last.
- (b) *Valuation pairs.* Let `(A, R)` be a valuation pair and `y` a square matrix over `A` with rows and columns
  indexed by a finite set `n`. There are `κ, κ′ ∈ GL_n(R)` and `d ∈ A^n` with `y = κ·diag(d)·κ′`.

*Needs:* 1.1.

*Relation to the library.* Tau Ceti `Matrix.exists_smith_normal_form_of_isDiscreteValuationRing` is (a) for a discrete
valuation ring, and Tau Ceti `Matrix.exists_mul_mul_eq_diagonal` is (a) without the chain for a principal ideal
domain; the valuation rings of the family (the rings `𝒪_ι` of OneSidedPrimeSumBoundsAndAdmissibleData §1.1) are not
discrete and not noetherian. The description of the products `s_1 ⋯ s_j` of (a) as greatest common divisors of the
`j × j` minors, and of their valuations as least valuations of minors, is Tau Ceti
`Matrix.prod_dvd_det_submatrix_of_mul_mul_eq_diagonal`, `Matrix.dvd_prod_of_mul_mul_eq_diagonal` and
`Matrix.exists_valuation_det_submatrix_eq_prefixSum_of_mul_mul_eq_diagonal`, which hold over every commutative ring once
a form as in (a) is given. ClassicalArithmeticCompletion §3.23 states the Smith form over a principal ideal domain.
AInfCohomology §AI.1.3 (*Finitely presented modules over a valuation ring and their Fitting ideals*) and
HodgeTateAndCanonicalSubgroups §0.24 state the consequence for finitely presented modules, not the matrix form.

*Checks.* For `O` a field, (a) is the rank normal form, with `s_i ∈ {1, 0}` after scaling. For a discrete valuation
ring with uniformizer `ϖ` and the matrix with rows `(ϖ, 1)` and `(0, ϖ)`, the chain of (a) is `(1, ϖ²)` up to units, not
`(ϖ, ϖ)`: the entries have greatest common divisor `1`. In (b) for the pair `(F, O)` of a field and a valuation subring,
the entries of `d` need not lie in `O`, and no divisibility among them is claimed.

[ShortProof], `Lib/General/LinearAlgebra/IntegralLattices.lean` (`New.IsValuationPair.smith_normal_form`). [ShortProof]
proves (b); its case `A = R = O` is (a) without the chain.

## Layer 2: Minors and lengths over a discrete valuation ring

### 2.1 The length of the kernel of a matrix modulo an element

*Origin:* adapted from the theory of Fitting invariants (Northcott (1976), Chapter 3) and the theorem on elementary
divisors over a discrete valuation ring: here for the kernel on `(O/a)^k` of a matrix with any number of rows, with the
least valuation attained by a maximal minor.

*Method of the formal proof:* a vector of the kernel is a linear map to `O/a` from the quotient `Q` of `O^k` by the
rows of `M` and of `a·1`, by its values at the standard basis. The module `Q` is finitely generated and killed by `a`, so
it is a product of modules `O/(d_i)` with `d_i | a`, and `Hom(Q, O/a)` has the length of `Q`. The rows span a free
module of rank `k`; by the Smith form its quotient has length the valuation of the determinant of a basis, every maximal
minor of the rows is a multiple of that determinant by multilinearity, and the minor of a basis chosen among the rows
attains it.

Let `O` be a discrete valuation ring, `k` a finite set, `r` a set (finite or not), `M` a matrix over `O` with rows `r`
and columns `k`, and `a ∈ O`, `a ≠ 0`. Let `M_a` be the matrix with rows `r ⊔ k` and columns `k` made of the rows of
`M` followed by those of `a·1`. A *maximal minor* of `M_a` is `det((M_a)_{f(i), j})_{i, j ∈ k}` for a map
`f : k → r ⊔ k`; a map that is not injective gives the minor `0`. Prove:

- (a) the quotient of `O^k` by the span of the rows of `M_a` has finite length, equal to the least value of `v` on the
  maximal minors of `M_a`;
- (b) the kernel `{w ∈ (O/a)^k : Σ_j M_{ij}w_j = 0 for every i ∈ r}` has the same length;
- (c) for a ring `Λ`, a ring homomorphism `ev : Λ → O`, a matrix `M` over `Λ` with rows `r` and columns `k`, and
  `a ∈ Λ` with `ev(a) ≠ 0`: the length of the kernel of `ev(M)` on `(O/ev(a))^k` is the least value of `v(ev(P))`, `P`
  running over the maximal minors of `M_a` over `Λ`.

*Needs:* 1.3 (a) for a discrete valuation ring, which is Tau Ceti
`Matrix.exists_smith_normal_form_of_isDiscreteValuationRing`; Mathlib `Ring.ord_eq_addVal` (the length of `O/(z)`).

*Relation to the library.* Tau Ceti `Matrix.length_quotient_range_mulVecLin_eq_ord_det` is the length of the cokernel
of a square matrix. AInfCohomology §AI.1.3 and HodgeTateAndCanonicalSubgroups §0.24 state the zeroth Fitting ideal of
a finitely presented torsion module over a valuation ring; (a) is the case of the module presented by `M_a`, with the
minimum attained, and (b) and (c) are not stated there.

*Checks.* For `r = ∅` the only minors are `a^{#k}` and `0`, and both lengths are `#k·v(a)`. For `k = {1}` and
`M = (m_i)_{i ∈ r}`, the kernel is the set of `w ∈ O/a` killed by every `m_i`, of length `min(v(a), min_i v(m_i))`.
The element `a` of the rows `a·1` and the modulus of the kernel must be the same: for `r = ∅` the kernel on `(O/a′)^k`
has length `#k·v(a′)`, while the nonzero maximal minors of `a·1` have valuation `#k·v(a)`.

[ShortProof], `Lib/General/Algebra/SharpMinors.lean` (`New.Selmer.maximalMinors`, `New.Selmer.matrixKernel`,
`New.Selmer.isLeast_length_quotient_rowLattice`, `New.Selmer.length_matrixKernel_eq_length_linearMap`,
`New.Selmer.length_linearMap_quotSpan`, `New.Selmer.isLeast_length_matrixKernel`)

## Layer 3: Jacobi's identity over a compact open subring

*Setting of Layer 3.* `A` is a topological ring that is locally compact, Hausdorff and second countable, with an
involution `x ↦ x̄`, and `R ⊂ A` is a subring that is open and compact, with `R̄ = R`, such that `(A, R)` is a
valuation pair. The example is `(𝔸_f, Ô)` for a CM field `E` with complex conjugation.

### 3.1 The generalised index

*Origin:* definitions and conventions; (b) to (f) are the classical relation between the modulus of an automorphism of
a locally compact group and indices of compact open subgroups (Weil (1974), Chapter I, §2).

*Method of the formal proof:* multiplication by a unit `u` carries Haar measure to a multiple of itself, and the measure
of a compact open subgroup `L` is compared with that of `uL` through `L ∩ uL`, which gives (b) and (c). A matrix of
`GL_n(R)` preserves `R^n`, so its determinant, a unit of `R`, has index `1`. For (e), write `g` in Smith form (1.3 (b)):
both sides are multiplicative, trivial on `GL_n(R)` and equal on diagonal matrices. The involution permutes the
subgroups `uR`, which gives (g).

Let `A` be a locally compact, Hausdorff, second countable topological ring. For `a ∈ A`, the *generalised index* `[a]`
is `0` if `a` is not a unit, and otherwise the inverse of the factor by which multiplication by `a` scales a Haar
measure of the additive group of `A` (Mathlib `MeasureTheory.distribHaarChar`). Prove:

- (a) `[ab] = [a][b]`, `[1] = 1`, and `[a] > 0` exactly when `a` is a unit;
- (b) for a compact open additive subgroup `L ⊂ A` and a unit `u`, `[u] = [L : uL ∩ L]/[uL : uL ∩ L]`;
- (c) for a compact open subring `R ⊂ A` and `a ∈ R` a unit of `A`, `[a] = #(R/aR)`; in particular `[a] ≥ 1`;
- (d) for a compact open subring `R` and `V ∈ GL_n(R)`, `[det V] = 1`;
- (e) if `A` has a compact open subring `R` with `(A, R)` a valuation pair, then every `g ∈ GL_n(A)` scales a Haar
  measure of `A^n` by the factor by which `det g` scales a Haar measure of `A`, that is by `[det g]⁻¹`;
- (f) in the setting of (e), for `g ∈ GL_n(A)` and the lattice `L = g·R^n` spanned by the columns of `g`,
  `[det g] = [R^n : L ∩ R^n]/[L : L ∩ R^n]`, and `[det g] = [R^n : L]` if `g` is integral;
- (g) in the setting of Layer 3, `[ā] = [a]`, and `[det(X^* H X)] = [det H]·[det X]²` for square matrices `H`, `X`.

*Needs:* 1.3 (b), for (e) and (f).

*Checks.* For `A = ℚ_ℓ` and `a = ℓ^m`, `m ∈ ℤ`, `[a] = ℓ^m`. For `(𝔸_f, Ô)` of a number field `E` and `a ∈ E^×`,
`[a] = |N_{E/ℚ}(a)|`.

[ShortProof], `Lib/General/Measure/HaarModulus.lean` (`New.genIndex`, `New.genIndex_eq_relIndex_div`,
`New.genIndex_eq_card`, `New.one_le_genIndex`, `New.genIndex_det_eq_one`, `New.inv_distribHaarChar_GL_eq_genIndex_det`,
`New.submoduleIndex_colLattice_div`, `New.submoduleIndex_colLattice_intVectors`, `New.genIndex_star`),
`Lib/General/NumberTheory/LatticeCovolumes.lean` (`New.genIndex_det_conj`)

### 3.2 Jacobi's identity for a lattice and its orthogonal complement

*Origin:* adapted from Jacobi's identity between complementary minors of a matrix and of its inverse, in the form of
the equality of the discriminants of a primitive sublattice of a unimodular lattice and of its orthogonal complement
(Bombieri and Vaaler (1983), for the heights of a subspace and of its orthogonal complement): here over a compact open
subring of a ring with involution, for a sublattice that need not be saturated, and with an added block and a unit.

*Method of the formal proof:* a left inverse `r` of `F` and the matrix `Q = J⁻¹r^*` complete `n` to a square matrix
`(Q | n)` with the inverse of block rows `F^*J` and `l − lQF^*J`, where `ln = 1`; applying the adjoint for `J` to a
vector orthogonal to `n` gives (a). For (b), saturate `F` to a primitive `Fa` (1.2 (c)), so that `(Q | n)` is in
`GL_π(R)`, and compute the determinant of one hermitian matrix twice: in the basis `(Q | n)`, where it is block
triangular, and by `det(1 + XY) = det(1 + YX)`; the indices of the two computations are compared by 3.1 (d), (f), (g).

In the setting of Layer 3, let `π`, `σ`, `τ`, `ρ` be finite sets with `#π = #σ + #τ`, `J` a unimodular hermitian
`π × π` matrix, `F` an integral `π × σ` matrix and `n` a primitive `π × τ` matrix with `F^*Jn = 0`. Let `p` be a
`π × ρ` matrix over `A` and `c` a unit of `A`, and let `N` be the square matrix on `σ ⊔ ρ`

`N = (F | p)^*·J·(F | p) + diag(0_σ, c·1_ρ)`.

Suppose that `F` is left invertible over `A`, or that `det N` is a unit of `A`. Put `L_F = {y ∈ A^σ : Fy ∈ R^π}`, an
`R`-module that contains `R^σ`, and let `[L_F : R^σ]` be the index of additive groups, read as `0` if it is infinite.
Prove:

- (a) every `u ∈ A^π` with `n^*Ju = 0` is `Fv` for some `v ∈ A^σ`;
- (b) `[det(n^*·(J + c⁻¹·J p p^* J)·n)]·[L_F : R^σ]²·[c]^{#ρ} = [det N]`;
- (c) in particular, for `ρ = ∅`: if `F` is left invertible or `det(F^*JF)` is a unit, then
  `[det(n^*Jn)]·[L_F : R^σ]² = [det(F^*JF)]`; and if moreover `F` is primitive, `[det(n^*Jn)] = [det(F^*JF)]`;
- (d) if `det N` is a unit of `A`, then `F` is left invertible over `A`.

*Needs:* 1.2 (c), 3.1.

*Relation to the library.* RiemannHypothesisForDirichletLFunctions/HermitianFormsAndLattices §4.0a (b) states the duality
of projection and intersection for lattices over a Dedekind domain, and its §4.0b the indices of lattices over a discrete
valuation ring; DiophantineApproximationAndTranscendence §2.5 concerns heights of subspaces at each place. None states
the identity over a compact open subring, for a lattice that is not saturated, or with the block `p`.

*Checks.* For `A = ℚ_ℓ`, `R = ℤ_ℓ` with the trivial involution, `π = {1, 2}`, `J = 1`, `F = (ℓ, 0)ᵀ`, `n = (0, 1)ᵀ` and
`ρ = ∅`: `L_F = ℓ⁻¹ℤ_ℓ`, `[L_F : R] = ℓ`, `[det(F^*F)] = [ℓ²] = ℓ²` and `[det(n^*n)] = 1`, in agreement with (c); without
the square of the index the identity fails. With the block `p = 0` and any unit `c`, (b) reduces to (c): both sides
acquire the factor `[c]^{#ρ}`. With `F = (1, 1)ᵀ` and `n = (1, −1)ᵀ` over `ℤ_2`, both are primitive and both Gram
determinants are `2`.

[ShortProof], `Lib/General/NumberTheory/LatticeCovolumes.lean` (`New.Filling.jacobi_perp_discriminant`,
`New.exists_mulVec_eq_of_orthogonal`, `New.genIndex_det_orthogonal_mul_submoduleIndex_sq`,
`New.hasLeftInv_of_genIndex_det_ne_zero`, `New.exists_preimageLattice_eq_colLattice`). [ShortProof] proves the statement
for a class of pairs `(A, R)` that have, besides the properties of the setting of Layer 3, further properties of
`(𝔸_f, Ô)` for a CM field with a primitive root of unity of order `5040` that its proof of this statement does not use.

## Layer 4: Determinant inequalities for positive semidefinite matrices

### 4.1 The Cauchy–Schwarz inequality for determinants

*Origin:* published: Horn and Johnson (2013), §7.8, for Hadamard's and Fischer's inequalities; the inequality (a) is the
Cauchy–Schwarz inequality in an exterior power, by the Cauchy–Binet formula.

*Method of the formal proof:* for (a), if `Q` is singular a vector killed by `Q` is killed by the whole block matrix, so
`det X = 0`; otherwise the Schur complement `P − XQ⁻¹X^*` is positive semidefinite, so `det(XQ⁻¹X^*) ≤ det P` by the
monotonicity of the determinant. [ShortProof] obtains that monotonicity, and Fischer's inequality, from the inequality
of Ostrowski and Taussky `|det H| ≤ 2^n·|det Θ|` for `0 ≤ H ≤ Θ + Θ^*`. For (b), the matrix of the products of a family
for a positive semidefinite form is positive semidefinite, and the matrix of the products of two families is the upper
right block of that of the concatenated family.

Let `𝕜` be `ℝ` or `ℂ`. Prove:

- (a) if the block matrix with rows `(P, X)` and `(X^*, Q)`, with `P`, `X`, `Q` all `n × n` over `𝕜`, is positive
  semidefinite, then `|det X|² ≤ det P·det Q`;
- (b) for families `u, w : ι → E` of the same finite size in an inner product space `E` over `𝕜`,
  `|det(⟨u_i, w_k⟩)_{i,k}|² ≤ det(⟨u_i, u_k⟩)·det(⟨w_i, w_k⟩)`;
- (c) *the forms for a positive semidefinite matrix.* Let `G` be a positive semidefinite hermitian `I × I` matrix over
  `𝕜`, and for families `a = (a_i)_{i ∈ S}`, `b = (b_k)_{k ∈ T}` of vectors of `𝕜^I` let `G(a, b)` be the `S × T` matrix
  `(a_i^* G b_k)`. Then `G(a, a)` is positive semidefinite; `det G(a, a) ≤ ∏_i a_i^* G a_i` (Hadamard);
  `det G(a ⊔ b, a ⊔ b) ≤ det G(a, a)·det G(b, b)` for the concatenated family (Fischer); and, for `S = T`,
  `|det G(a, b)|² ≤ det G(a, a)·det G(b, b)`.

*Needs:* Tau Ceti `Matrix.PosSemidef.det_fromBlocks_le` (Fischer's inequality for a positive semidefinite block
matrix), `Matrix.det_gram_le_prod_norm_sq` (Hadamard's inequality for Gram determinants),
`Matrix.PosSemidef.schur_complement₁₁` and `Matrix.PosSemidef.det_le_det`; Mathlib `Matrix.gram`,
`Matrix.posSemidef_gram`.

*Relation to the library.* Fischer's and Hadamard's inequalities are in Tau Ceti and are cited, not stated again; the
first two inequalities of (c) are their translations to a form `G`. EigenvalueAndSingularValueInequalities records
Hadamard's, Fischer's and Koteljanskii's determinant inequalities as Tau Ceti material and states a compression bound
for determinants (§2.3), exterior powers over the reals (§2.4) and Oppenheim's inequality (§6.1); none of these is (a).

*Checks.* For `n = 1`, (a) is `|x|² ≤ pq` for a positive semidefinite `2 × 2` matrix, and (b) is the Cauchy–Schwarz
inequality. In (b) with `w = u` there is equality. For `u` linearly dependent both sides of (b) vanish. The inequality
`|det X| ≤ det P·det Q` without the square is false (scale the matrix by `1/2`).

[ShortProof], `Lib/General/LinearAlgebra/HermitianMatrices.lean` (`New.norm_det_sq_le_of_posSemidef`),
`Lib/General/LinearAlgebra/GramDeterminant.lean` (`New.formGram`, `New.posSemidef_formGram`,
`New.norm_det_formGram_le`, `New.norm_det_pairing_sq_le`), `Lib/General/LinearAlgebra/MinorProducts.lean`
(`New.fischer_det_inequality`, `New.hadamard_det_inequality`). [ShortProof] proves the case `𝕜 = ℂ`, with (b) in the
form (c).

## Layer 5: The Gauss valuation of a polynomial

### 5.1 Values at points, generic points and roots

*Origin:* published: Bosch, Güntzer and Remmert (1984), §5.1, for the Gauss norm, its multiplicativity (Gauss's lemma)
and its equality with the supremum norm on a disc over an algebraically closed field; here written additively, at a
radius, for polynomials with integral coefficients.

*Method of the formal proof:* the bound (a) is the ultrametric inequality term by term. For (b), substitute `Y = πY′`
with `v(π) = ρ`, which turns the radius `ρ` into the radius `0`; a polynomial of Gauss valuation `0` at radius `0`
has a nonzero reduction over the residue field, which is infinite, so one residue class avoids the zeros of finitely
many reductions. Additivity on products follows by evaluating at a point generic for `f`, `g` and `fg`. For (d), factor
out the integral roots; the cofactor has no integral root, so its valuation at every integral point is its Gauss
valuation of radius `0`.

Let `K` be an algebraically closed field with a nontrivial non-archimedean absolute value, `𝒪` its ring of integers and
`v = −log_b|·|`. For a real `ρ ≥ 0` and `g = Σ_i y_i Y^i ∈ 𝒪[Y]`, the *Gauss valuation of radius `ρ`* is
`v_ρ(g) = min_i (v(y_i) + ρ·i)`, with `v_ρ(0) = ∞`; it is `−log_b` of Mathlib's `Polynomial.gaussNorm` of `g` for the
absolute value of `K` at the radius `b^{−ρ}`. Prove:

- (a) `v(g(y)) ≥ v_ρ(g)` for every `y ∈ 𝒪` with `v(y) ≥ ρ`; `v_ρ(g) ≤ v_{ρ′}(g)` for `ρ ≤ ρ′`; and `v_ρ(g) ≤ ρ·i` if
  the coefficient `y_i` is a unit;
- (b) *generic points.* If `ρ ∈ v(K^×)`, then for every finite family `g_1, …, g_m ∈ 𝒪[Y]` there is `y ∈ 𝒪` with
  `v(y) ≥ ρ` and `v(g_i(y)) = v_ρ(g_i)` for every `i`;
- (c) `v_ρ(fg) = v_ρ(f) + v_ρ(g)`, and `v_ρ(Y − α) = min(v(α), ρ)` for `α ∈ 𝒪`;
- (d) *roots.* For `g ∈ 𝒪[Y]`, with the sums over the roots `α` of `g` in `𝒪`, counted with multiplicity:
  `v_ρ(g) = v_0(g) + Σ_α min(v(α), ρ)`, and `v(g(y)) = v_0(g) + Σ_α v(y − α)` for every `y ∈ 𝒪`.

*Needs:* Mathlib `Polynomial.gaussNorm`, `Polynomial.gaussNorm_mul` (multiplicativity for a non-archimedean absolute
value, which is the first half of (c)); Tau Ceti `Polynomial.gaussNorm_X_sub_C` (the second half of (c)) and
`Polynomial.gaussNorm_multiset_prod`.

*Relation to the library.* The multiplicativity of the Gauss norm of a polynomial is in Mathlib and the Gauss norm of a
linear factor in Tau Ceti; (c) is recorded for the additive notation and is not a new target. Tau Ceti
`PowerSeries.norm_evalAt_le_gaussNorm` is the bound of (a) for power series. RestrictedPowerSeries §1.1 states the
Gauss norm of restricted series, and its §2.4 the maximum principle at unit radii: the Gauss norm of one restricted
series over a complete field is attained at a point with coordinates in a complete extension. NewtonPolygons §2.2
states Gauss norms as supporting values of the Newton polygon. Item (b), one point of `K` itself for finitely many
polynomials, at a radius of the value group and without completeness, and item (d) are not stated there.

*Checks.* For `g = Y − α` with `v(α) > ρ`, `v_ρ(g) = ρ`, and a point with `v(y) > ρ` has `v(g(y)) > ρ`: the point of (b)
has `v(y) = ρ` in this case. If `ρ ∉ v(K^×)`, (b) fails for `g = Y`: every `y` with `v(y) ≥ ρ` has `v(y) > ρ = v_ρ(Y)`.
Over a field whose residue field is finite with `q` elements, (b) fails at `ρ = 0` for `g = Y^q − Y`. In (d) for
`g = ℓY − 1` over `ℤ̄_ℓ` there is no integral root, `v_0(g) = 0`, and `v(g(y)) = 0` at every integral `y`.

[ShortProof], `Lib/General/NumberTheory/GaussValuation.lean` (`New.Selmer.gaussVal`, `New.Selmer.gaussVal_le_eval`,
`New.Selmer.gaussVal_mono`, `New.Selmer.gaussVal_le_of_isUnit_coeff`, `New.Selmer.exists_forall_ellVal_eval_eq_gaussVal`,
`New.Selmer.gaussVal_mul`, `New.Selmer.gaussVal_X_sub_C`, `New.Selmer.gaussVal_eq_add_sum_roots`,
`New.Selmer.ellVal_eval_eq_add_sum_roots`). [ShortProof] proves the case `K = ℚ̄_ℓ`, an algebraic closure of `ℚ_ℓ`, with
`v(ℓ) = 1` and rational `ρ ≥ 0`.

## Layer 6: The exponential of a power series

### 6.1 The functional equation of the exponential of a series

*Origin:* published: the functional equation of the exponential series, for formal power series in several variables
(Bourbaki, *Algèbre*, Chapitre IV, §4, no. 10).

*Method of the formal proof:* the identity `exp(X_0 + X_1) = exp(X_0)·exp(X_1)` in two variables is the binomial
theorem coefficient by coefficient; substituting `(G, G′)` for `(X_0, X_1)` gives the statement, because substitution
of series without constant term is a continuous ring homomorphism and commutes with composition.

Let `𝔸` be a `ℚ`-algebra, `σ` a set and `G`, `G′` power series over `𝔸` in the variables `σ` without constant term.
Prove:

- (a) `exp(G)` has constant term `1`, and `exp(0) = 1`;
- (b) `exp(G + G′) = exp(G)·exp(G′)`;
- (c) `exp(Σ_{i ∈ t} G_i) = ∏_{i ∈ t} exp(G_i)` for a finite family of series without constant term.

*Needs:* Mathlib `PowerSeries.exp`, `PowerSeries.subst`, `PowerSeries.exp_mul_exp_eq_exp_add` (the case of the series
`aT` and `bT` in one variable).

*Checks.* For `σ = {T}`, `G = aT` and `G′ = bT` this is Mathlib's `PowerSeries.exp_mul_exp_eq_exp_add`. For a series
with constant term the substitution is not defined, and (b) is not claimed.

[ShortProof], `Lib/General/Algebra/IntegralPowerSeries.lean` (`New.expSubst`,
`New.constantCoeff_subst_of_constantCoeff_eq_zero`, `New.expSubst_add`, `New.expSubst_sum`). [ShortProof] proves the
case `𝔸 = ℂ_p`.

### 6.2 Divisibility of `exp(G) − 1`

*Origin:* published: the `p`-adic exponential converges, and preserves the absolute value, on the disc
`v(x) > 1/(p − 1)` (Robert (2000), Chapter 5); here for series, degree by degree, with the closed condition
`v(c) ≥ 1/(p − 1)` and a truncation.

*Method of the formal proof:* the coefficients of `G^j` below the degree `l` are sums of products of `j` coefficients of
`G` below that degree, because `G` has no constant term, so they have valuation at least `j·v(c)`. By Legendre's
formula `v(j!) ≤ (j − 1)/(p − 1)`, so `v(c^j/j!) ≥ v(c)` for `j ≥ 1` when `v(c) ≥ 1/(p − 1)`.

Let `p` be a prime, `K` a field of characteristic `0` with a non-archimedean absolute value with `|p| = p⁻¹`, and
`v = −log_p|·|`. Let `σ` be a set, `G` a power series over `K` in the variables `σ` without constant term, `l ∈ ℕ`, and
`c ∈ K` with `v(c) ≥ 1/(p − 1)`. If every coefficient of `G` of degree less than `l` has valuation at least `v(c)`,
then every coefficient of `exp(G) − 1` of degree less than `l` has valuation at least `v(c)`.

*Needs:* 6.1 (a).

*Relation to the library.* RiemannHypothesisForDirichletLFunctions/TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.1 (c)
states that `exp(B)` has weight `≥ 0` at given radii when `B(0) = 0` and `B` has weight `≥ 1/(p − 1)` there, also for
the coefficients up to a multi-index. At radii `0`, read up to every multi-index of total degree at most `l`, this is
the statement that `exp(G)` is integral in the degrees `≤ l` when the coefficients of `G` in those degrees have
valuation at least `1/(p − 1)`, which is the form that DivisibilityOfThetaDerivatives §2.4 (c) uses and which
[ShortProof] proves as `New.norm_coeff_expSubst_le_one` (`Lib/General/Algebra/SeriesBounds.lean`); it is not stated
again here. The statement of
this section, that `exp(G) − 1` keeps a valuation `v(c) ≥ 1/(p − 1)`, is not a case of §4.1 (c), whose conclusion is
integrality; §4.1 (d) is its converse for `v(c) = 1/(p − 1)`.

*Checks.* For `G = cT` and `l = 2` the coefficient of `T` in `exp(G) − 1` is `c`. For `p = 2`, `c = 2` and `G = 2T`,
`exp(2T) − 1 = 2T + 2T² + (4/3)T³ + ⋯` has all coefficients of valuation at least `1`. For `v(c) < 1/(p − 1)` the
statement fails: with `G = cT`, the coefficient `c^p/p!` of `T^p` has valuation `p·v(c) − 1 < v(c)`.

[ShortProof], `Lib/General/Algebra/SeriesBounds.lean` (`New.norm_coeff_expSubst_sub_one_le`). [ShortProof] proves the
case `K = ℂ_p` in one variable.

## Layer 7: The combinatorial Nullstellensatz with multiplicity

### 7.1 Vanishing to an order at many points forces a costly monomial

*Origin:* adapted from Alon (1999) and from Ball and Serra (2009), the combinatorial Nullstellensatz and its forms with
multiplicity: here with a weight for each variable, and with a set of points that need not be a grid.

*Method of the formal proof:* put `ψ_u = X_u^{κ_u} − g_u`, which vanishes at the points. The products
`X^α·ψ^γ` with `α_u < κ_u` for all `u` and `|γ| < δ` span the polynomials of cost below `δ` modulo the kernel of the map
that takes the jets of order below `δ` at the points, by an induction on the cost that replaces `X_u^{κ_u}` by
`ψ_u + g_u`. They are at most as many as the jets, since there are at least `∏_u κ_u` points, so they are independent
modulo that kernel; a polynomial of cost below `δ` whose jets vanish is therefore zero.

Let `K` be a field, `ι` a finite set, and `κ_u ≥ 1` an integer for each `u ∈ ι`. The *cost* of a monomial `X^α` is
`Σ_u α_u/κ_u`. Let `Z ⊂ K^ι` be a finite set of points with `#Z ≥ ∏_u κ_u`, and suppose that for each `u` there is a
polynomial `g_u ∈ K[X_ι]`, all of whose monomials have cost less than `1`, with `g_u(z) = z_u^{κ_u}` for every `z ∈ Z`.
Let `δ ∈ ℕ` and let `f ∈ K[X_ι]` be nonzero and vanish to order `δ` at every point of `Z`, that is `f ∈ 𝔪_z^δ` for
every `z ∈ Z`, where `𝔪_z` is the ideal of the polynomials that vanish at `z` (Mathlib `MvPolynomial.vanishingIdeal`).
Then `f` has a monomial of cost at least `δ`.

*Needs:* Mathlib `MvPolynomial.vanishingIdeal`, `Finsupp.weight`.

*Relation to the library.* Mathlib `MvPolynomial.combinatorial_nullstellensatz_exists_eval_nonzero` is Alon's theorem
for a grid, at order `1`: a polynomial with a monomial of maximal total degree whose exponents are below the sizes of
the sets `S_u` does not vanish on `∏_u S_u`. It has no multiplicity and no weights, and neither statement contains the
other. For a grid `Z = ∏_u S_u` with `#S_u = κ_u`,
the polynomial `g_u = X_u^{κ_u} − ∏_{s ∈ S_u}(X_u − s)` has degree less than `κ_u` in `X_u` alone, so its monomials cost
less than `1`.

*Checks.* For `ι = {u}`, `κ_u = k`, `Z` a set of `k` points of `K` and `g_u = X^k − ∏_{z ∈ Z}(X − z)`: a nonzero `f`
vanishing to order `δ` at the `k` points has degree at least `kδ`, that is cost at least `δ`, with equality for
`∏_z (X − z)^δ`. With fewer than `∏_u κ_u` points the statement fails: for `ι = {u}`, `κ_u = 2`, `Z = {0}` and
`g_u = 0`, the polynomial `f = X` vanishes to order `1` and has cost `1/2`.

[ShortProof], `Lib/General/Algebra/MultivariatePolynomials.lean` (`New.exists_le_weight_of_mem_vanishingIdeal_pow`)

## Layer 8: Quadratic twists without zeros in a box

### 8.1 Primes with a twist that vanishes in a box are rare

*Origin:* adapted from Jutila (1975) and Heath-Brown (1995), mean values of Dirichlet polynomials and of character sums
over real characters, and the zero-density estimates for quadratic twists that follow from them: here a weak density
bound for the twists of the characters of a fixed modulus by the Legendre symbols of the primes of one class, in a box of
fixed height, proved from the Pólya–Vinogradov inequality alone.

*Method of the formal proof:* for a primitive character `χ ≠ 1` of conductor `q ≤ T²` and parity `j`, let `θ_χ` be its
theta series with the weight `z^j e^{−πz²}` and `J(χ, T)` the integral of `|θ_χ(u)| + |θ_{μχ}(u)|` against `du/u` over
`u ≥ 1/T`. The Mellin transform of `θ_χ` is the completed L-function, and the truncated transform of `θ_{μχ}`
approximates its inverse on `Re s = 2`. A zero in the box forces `J(χ, T) > T^{2δ}` for large `T`, by the three lines
theorem applied to the product of the two transforms. In the mean over `v ≤ T²`, the theta series with coefficients
`α_n·(−v/n°)`, `n°` the odd part of `n`, are small: expand the square, bound the pairs with `(nn′)°` a square trivially
and the others by the Pólya–Vinogradov inequality. For a prime `d ≡ 7 (mod 8)`, `(n/d) = (−d/n°)` by quadratic
reciprocity, so the sum of the `J` over the twists is `≪ T^{2+δ}`, which gives the count with `T² = NX`, after passing
from `ξ` to the primitive character that induces it.

Let `N ≥ 1`, `δ > 0`, `H` real, and let `a` be a class modulo `N` such that every prime `d ≡ a (mod N)` satisfies
`d ≡ 7 (mod 8)` and is prime to `N` (this holds if `8 | N` and `a` is prime to `N` with `a ≡ 7 (mod 8)`). Call a prime
`d ≡ a (mod N)` *bad* if for some Dirichlet character `ξ` modulo `N` the function `L(s, ξ·(·/d))` has a zero `s` with
`Re s ≥ 1/2 + 9δ` and `|Im s| ≤ H`. Then the number of bad primes `d ≤ X` is `O(X^{1−δ/2})` as `X → ∞`, with a constant
that may depend on `N`, `δ`, `H` and `a`.

*Needs:* Mathlib `DirichletCharacter.LFunction` and its functional equation
(`DirichletCharacter.IsPrimitive.completedLFunction_one_sub`), `jacobiSym.quadratic_reciprocity'`,
`Complex.HadamardThreeLines`; Tau Ceti `DirichletCharacter.norm_sum_Icc_le` and
`DirichletCharacter.norm_sum_Icc_changeLevel_le` (the Pólya–Vinogradov inequality for a primitive non-principal
character and for a character induced from one).

*Relation to the library.* AnalyticNumberTheoryPartI §1.7 states a zero-density bound over all primitive characters of
conductor at most `Q`, which gives such a count only for `Re s ≥ β` with `β > 4/5`.
RiemannHypothesisForDirichletLFunctions/QuadraticTwistSelectionOverPrimes §2.7c selects twists without zeros near
`Re s = 1`, in a box whose height grows. AnalyticNumberTheoryPartII §5.29 states Heath-Brown's large sieve for real
characters, the tool of the published zero-density estimates for quadratic twists. The statement here is the weak form
that the family uses, for every `β > 1/2`.

*Checks.* The twists are not principal, since `d` is prime to `N`, so `L(s, ξ·(·/d))` is entire and the count is not
affected by a pole. For `δ ≥ 1/18` the box lies in `Re s ≥ 1`, where no Dirichlet L-function vanishes, and no prime is
bad.

[ShortProof], `Lib/Analytic/QuadraticTwist.lean` (`New.IsPrimeWithTwistZero`, `New.IsBadPrime`,
`New.eventually_rpow_lt_thetaTailIntegral`, `New.sum_sq_thetaSeries_jacobiSym_le`,
`New.exists_card_zero_quadTwist_le`, `New.zero_density_quadTwist`)

### 8.2 A prime of a class with no zero of a twist in a box

*Origin:* adapted from the zero-density estimates of 8.1: a density bound for the exceptional primes of a class, played
against Dirichlet's theorem on primes in arithmetic progressions.

*Method of the formal proof:* a smaller `β` gives a larger box, so one may take `β < 1` and write `β = 1/2 + 9δ`. If
every prime of the class were bad (8.1), the primes of the class up to `X` would number `O(X^{1−δ/2})`, and the sum of
`(log p)/p` over the class would converge by partial summation; it diverges, by Dirichlet's theorem in the form with
`Σ (log p)/p`. The prime number theorem for arithmetic progressions is not needed.

Let `N ≥ 1`, `β > 1/2`, `H` real, and let `a` be an invertible class modulo `N` such that every prime `d ≡ a (mod N)`
satisfies `d ≡ 7 (mod 8)` and is prime to `N`. Then there is a prime `d ≡ a (mod N)` such that `L(s, ξ·(·/d)) ≠ 0` for
every Dirichlet character `ξ` modulo `N` and every `s` with `Re s ≥ β` and `|Im s| ≤ H`.

*Needs:* 8.1; the divergence of the sum of `(log p)/p` over the primes of an invertible class (Mathlib
`ArithmeticFunction.vonMangoldt.not_summable_residueClass_prime_div`).

*Checks.* The class must be invertible: a class that contains no prime satisfies the hypothesis on its primes, and the
conclusion fails for it. The hypothesis holds for `N` a multiple of `8` and `a ≡ 7 (mod 8)` prime
to `N`; this is the case of OneSidedPrimeSumBoundsAndAdmissibleData §0.2, with `N = q₀` and `a = d₀`.

[ShortProof], `Lib/Analytic/QuadraticTwist.lean` (`New.exists_entireL_quadTwist_ne_zero`). [ShortProof] states the
conclusion for the entire function that equals `L(s, χ)` for a non-principal `χ`; the twists are not principal.

## Downstream consumers

- OneSidedPrimeSumBoundsAndAdmissibleData §0.2 (the one-sided criterion) uses 8.2; its §1.1 (colength dividing an
  element) uses 1.3 (a), with Mathlib `Ring.ord_eq_addVal` for the length of `O/(z)`; its §1.3 (twisted lattices, index
  and covolume) uses 4.1 (c).
- CompositeThetaLiftsAndShortForms §1.4 (few forms have only deep translates) uses 7.1; its §1.8 (edge pairings and
  functions on origins) uses 1.2 (a) and 1.3 (a); its §1.14 (elementary divisors of the edge Hecke operator) uses
  1.3 (a).
- RemainingAndMainTermsOfSecondMoments §1.2 (Siegel's lemma) uses 3.2 (c); its §4.2 (orthogonal lifts and the lattice
  of a link) uses 3.2 (a) and (b).
- SelmerBoundsForAnticyclotomicTwists §2.1 (one system of equations) uses 2.1 (c); its §2.4 (Stickelberger systems on a
  line) and §2.6 (roots of unity) use 5.1.
- DivisibilityOfThetaDerivatives §2.2 (the Frobenius congruence) uses 6.2; its §2.4 (couplings and the normal form)
  uses 6.1 (b), and
  RiemannHypothesisForDirichletLFunctions/TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.1 (c) for the integrality of
  `exp`.

## Scope and ownership

### Owned here

- Valuation pairs and the Hermite and Smith forms over them (Layer 1), including the Smith form with a divisibility
  chain over a valuation domain that is not discrete.
- The length of the kernel of a matrix on `(O/a)^k` as a least valuation of maximal minors (Layer 2).
- The generalised index of an element of a locally compact ring with a compact open subring, and Jacobi's identity
  (Layer 3).
- The Cauchy–Schwarz inequality for determinants and the forms of Hadamard's and Fischer's inequalities for a positive
  semidefinite form (Layer 4).
- Generic points for the Gauss valuation and its expression by integral roots (Layer 5).
- The functional equation of the exponential of a series in several variables and the divisibility of `exp(G) − 1`
  (Layer 6).
- The combinatorial Nullstellensatz with multiplicity and weights (Layer 7).
- The density of primes with a quadratic twist that vanishes in a box, and the choice of a prime (Layer 8).

### Not owned here

- The Smith normal form over a discrete valuation ring and over `ℤ`, the Hermite normal form over `ℤ`, invariant
  factors and minors, and Fitting ideals: Tau Ceti (`TauCeti.LinearAlgebra.Matrix.SmithNormalForm`,
  `TauCeti.LinearAlgebra.Matrix.HermiteNormalForm`, `TauCeti.LinearAlgebra.Matrix.InvariantFactor`,
  `TauCeti.RingTheory.FittingIdeal`), ClassicalArithmeticCompletion §3.23 and §3.25.
- Colengths that divide an element, and their calculus: OneSidedPrimeSumBoundsAndAdmissibleData §1.1.
- Lattices over the integral finite adeles, their discriminants and sums over sublattices:
  RemainingAndMainTermsOfSecondMoments §1.1.
- Hadamard's and Fischer's inequalities: Tau Ceti (`Matrix.det_gram_le_prod_norm_sq`,
  `Matrix.PosSemidef.det_fromBlocks_le`), EigenvalueAndSingularValueInequalities.
- The Gauss norm and its multiplicativity: Mathlib (`Polynomial.gaussNorm_mul`), RestrictedPowerSeries; Newton polygons:
  NewtonPolygons.
- Integrality of `exp(B)` and of `log` under a weight `≥ 1/(p − 1)`:
  RiemannHypothesisForDirichletLFunctions/TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.1.
- Zero-density estimates over all characters and the large sieve for real characters: AnalyticNumberTheoryPartI §1.7,
  AnalyticNumberTheoryPartII §5.29; the selection of twists near `Re s = 1`:
  RiemannHypothesisForDirichletLFunctions/QuadraticTwistSelectionOverPrimes.

## Exact supplier contracts

### From Mathlib

`ValuationRing`, `ValuationSubring`, `IsDedekindDomain.FiniteAdeleRing` (1.1); `Matrix.BlockTriangular`,
`Matrix.GeneralLinearGroup` (1.2, 1.3); `IsDiscreteValuationRing.addVal`, `Module.length`, `Ring.ord_eq_addVal` (2.1);
`MeasureTheory.distribHaarChar` (3.1); `Matrix.PosSemidef`, `Matrix.gram`, `Matrix.posSemidef_gram` (4.1);
`Polynomial.gaussNorm`, `Polynomial.gaussNorm_mul` (5.1); `PowerSeries.exp`, `PowerSeries.subst`,
`PowerSeries.exp_mul_exp_eq_exp_add` (6.1); `MvPolynomial.vanishingIdeal`, `Finsupp.weight` (7.1);
`DirichletCharacter.LFunction`, `DirichletCharacter.changeLevel`, `quadraticChar`, `jacobiSym.quadratic_reciprocity'`,
`DirichletCharacter.IsPrimitive.completedLFunction_one_sub`, `Complex.HadamardThreeLines`,
`ArithmeticFunction.vonMangoldt.not_summable_residueClass_prime_div` (8.1, 8.2).

### From Tau Ceti

`Matrix.exists_smith_normal_form_of_isDiscreteValuationRing`, `Matrix.exists_mul_mul_eq_diagonal` and the lemmas of
`TauCeti.LinearAlgebra.Matrix.InvariantFactor` (1.3, 2.1); `Matrix.length_quotient_range_mulVecLin_eq_ord_det` (2.1);
`Matrix.PosSemidef.det_fromBlocks_le`, `Matrix.PosSemidef.det_le_det`, `Matrix.PosSemidef.schur_complement₁₁`,
`Matrix.det_gram_le_prod_norm_sq` (4.1); `Polynomial.gaussNorm_X_sub_C`, `Polynomial.gaussNorm_multiset_prod`,
`PowerSeries.norm_evalAt_le_gaussNorm` (5.1); `DirichletCharacter.norm_sum_Icc_le`,
`DirichletCharacter.norm_sum_Icc_changeLevel_le` (8.1).

### From other roadmaps

RiemannHypothesisForDirichletLFunctions/TaylorBoundsAndDepthsOnHeightTwoFormalGroups §4.1 (c) (integrality of `exp(B)`
for `B` of weight at least `1/(p − 1)`): not used by a target of this roadmap; it is the companion of 6.2 that
DivisibilityOfThetaDerivatives §2.4 (c) uses. No target of this roadmap rests on a section of another roadmap.

## References

- [ShortProof] The shorter Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet
  L-functions, a rewriting by the same method of the formal proof that the family RiemannHypothesisForDirichletLFunctions
  states: the folder `grh` of github.com/lsernau/grh-lean at commit `72fead1`; paths are relative to its directory
  `src/`. Every target of this roadmap is proved in its folder `src/Lib`.
- I. Kaplansky, *Elementary divisors and modules*, Trans. Amer. Math. Soc. 66 (1949), 464–491: 1.3.
- M. Newman, *Integral Matrices*, Academic Press (1972), Chapter II: 1.2.
- D. G. Northcott, *Finite Free Resolutions*, Cambridge University Press (1976), Chapter 3: 2.1.
- A. Weil, *Basic Number Theory*, third edition, Springer (1974), Chapter I, §2: 3.1.
- E. Bombieri and J. Vaaler, *On Siegel's lemma*, Invent. Math. 73 (1983), 11–32: 3.2.
- R. A. Horn and C. R. Johnson, *Matrix Analysis*, second edition, Cambridge University Press (2013), §7.8: 4.1.
- S. Bosch, U. Güntzer and R. Remmert, *Non-Archimedean Analysis*, Springer (1984), §5.1: 5.1.
- N. Bourbaki, *Algèbre*, Chapitres 4 à 7, Masson (1981), Chapitre IV, §4: 6.1.
- A. M. Robert, *A Course in p-adic Analysis*, Springer (2000), Chapter 5: 6.2.
- N. Alon, *Combinatorial Nullstellensatz*, Combin. Probab. Comput. 8 (1999), 7–29; S. Ball and O. Serra, *Punctured
  combinatorial Nullstellensätze*, Combinatorica 29 (2009), 511–522: 7.1.
- M. Jutila, *On mean values of Dirichlet polynomials with real characters*, Acta Arith. 27 (1975), 191–198;
  D. R. Heath-Brown, *A mean value estimate for real character sums*, Acta Arith. 72 (1995), 235–275: 8.1, 8.2.
