# Roadmap: Weyl modules in standard coordinates

**Summary.** Let `Φ` be a finite set and, for each `τ ∈ Φ`, let `λ_τ` be a dominant weight of a general linear group
`GL_{n_τ}`. The dual Weyl module of the family is the module of polynomials in matrices of variables `x_τ`, one for each
`τ`, that have prescribed degrees in the columns and are invariant under adding a multiple of an earlier column to a later
one. Over every commutative ring it has the basis of the standard bideterminants, the products of minors along
semistandard tableaux. The *Weyl module in standard coordinates* is its dual, with the dual basis: a free module `R^I`,
on which a family of matrices acts by a matrix with entries in `R`, the *Schur matrix*. This roadmap builds the Weyl
modules of a product of general linear groups in these coordinates, as far as the shorter formal proof of the Riemann
hypothesis for Dirichlet L-functions uses them. Everything here is general representation theory of `∏_τ GL_{n_τ}`; no
object of that proof occurs.

The headline statements are these. (1) The Fock pairing `⟨f, g⟩ = f(∂)g(0)` on polynomials over a commutative ring makes
the substitution of the variables by a matrix adjoint to the substitution by its transpose. (2) For rectangular matrices
`z_τ` and a diagram with no column of height strictly between the two sizes, a standard bideterminant of `zy` is a
combination, with coefficients polynomial in `z`, of the standard bideterminants of `y` times a power of the
determinants of `y`; these coefficients form the Schur matrix `S_κ(z)`, which is multiplicative in `z`. (3) Two linear
maps from a Weyl module over a domain to a free module that agree on the evaluation vectors at the matrices with entries
in an infinite set and nonzero determinants are equal. (4) The Weyl module carries an integral symmetric positive
definite form, the Gram form, for which `S_κ(g)` and `S_κ(gᵀ)` are adjoint; over `ℂ` the representation is unitary and
irreducible on the compact group `∏_τ U(n_τ)`, and Schur orthogonality holds for it in an explicit form. (5) A product
of determinants `det(η_{τ,k}Y_τ)` is a finite combination of unitary translates of a product of powers of one minor
(polarisation). (6) For a family of interlacing pairs of weights there is an integer matrix between the Weyl modules,
equivariant for the block subgroup over every field of characteristic `0`, with an explicit bound for its norm, whose
complex multiples are all the equivariant maps. (7) The Weyl module of a weight and that of the dual weight are paired
invariantly by an integer matrix, which is invertible up to a hook product and isometric.

In Tau Ceti the roadmap sits beside IntegralWeylModulesOfGeneralLinearGroups, which owns the polynomial model of one
general linear group, its standard bideterminant basis over an integral domain, the Fischer norm of the highest-weight
vector as a hook product, and integral branching for one interlacing pair; this roadmap cites those and adds the
statements for families, in coordinates. ClassicalGroups supplies the classification of the rational representations of
`GL_n(ℂ)` by highest weights, the Weyl dimension formula and the multiplicity-free branching to `GL_{n−1}`; CompactGroups
supplies Schur orthogonality for an irreducible unitary representation of a compact group. The roadmaps
CompositeThetaLiftsAndShortForms, DeterminantsOfThetaLiftChains, DivisibilityOfThetaDerivatives and
ThetaLiftChainsAndTheSeesawIdentity of this family use the results (see Downstream consumers).

Layer 1 is the Fock pairing. Layer 2 gives the standard basis for a family, the Schur matrices and the evaluation
vectors. Layer 3 gives the Gram form, the restriction to the unitary group with Schur orthogonality, and polarisation.
Layer 4 gives the integral branching matrix of a family and the integral duality.

## Conventions

**Statements of the shorter proof.** `[ShortProof]` is the shorter formal proof (see the
[family index](../README.md)). Each section names where it proves the statement. Where a section states more than that
proof proves, a closing sentence says which case it proves.

**Labels.** Under each section heading, `*Origin:*` says where the statement comes from, in one of the forms
`published:`, `adapted from … : here, …`, `particular to this proof:`, `this roadmap's own formulation:` or
`definitions and conventions`, and `*Method of the formal proof:*` says how [ShortProof] proves it. `*Needs:*` lists the
sections the statement rests on: bare ids for this roadmap, `Name §k.n` for other roadmaps.

**Ranks, diagrams and weights.** `Φ` is a finite set. A family of *ranks* `n = (n_τ)_{τ∈Φ}` is a family of finite
totally ordered sets, the *rows* at `τ`; `|n_τ|` is the number of elements, and the rows are numbered `0, …, |n_τ| − 1`
in their order. A *diagram* `κ` gives, for each `τ` and each height `h ≥ 1`, a number `κ_τ(h) ≥ 0` of columns of height
`h`. For ranks `n`, only the heights `h < |n_τ|` enter the modules below; columns of full height `|n_τ|` are powers of
the determinant. A *weight of rank `n`* is a pair `(κ, e)` of a diagram and a family of integers `e = (e_τ)`. It stands
for the family `λ = (λ_τ)` of dominant weights `λ_τ ∈ ℤ^{|n_τ|}` of `GL_{n_τ}`,

```text
λ_{τ,p} := e_τ + Σ_{p < h < |n_τ|} κ_τ(h)     (0 ≤ p < |n_τ|),
```

so that `κ_τ(h) = λ_{τ,h−1} − λ_{τ,h}` for `1 ≤ h < |n_τ|` and `e_τ = λ_{τ,|n_τ|−1}`; every family of dominant weights
arises from exactly one `(κ, e)` with `κ` restricted to the heights below the ranks. `λ⁰_{τ,p} := λ_{τ,p} − e_τ` is the
partition of IntegralWeylModulesOfGeneralLinearGroups, Conventions; its Young diagram has `κ_τ(h)` columns of height
`h`. `|λ_τ| := Σ_p λ_{τ,p}`, and the number of boxes of `κ` at `τ` is `|κ_τ| := Σ_{h<|n_τ|} h·κ_τ(h)`. The *doubled
Harish-Chandra parameter* of `(κ, e)` at `τ` is the set of the integers `2λ_{τ,p} + |n_τ| − 1 − 2p`, `0 ≤ p < |n_τ|`,
which are pairwise distinct.

**The polynomial model.** For a commutative ring `R` and ranks `n`, let `x = (x_τ)` be a family of matrices of
variables, `x_τ` with rows `n_τ` and columns `0, 1, 2, …`; a polynomial involves finitely many of them. The *dual Weyl
module* `∇_R(n, κ) ⊂ R[x]` is the module of the polynomials that, for every `τ`, are homogeneous of degree `λ⁰_{τ,s}`
in the column `s` of `x_τ` (and of degree `0` in the columns `s ≥ |n_τ| − 1`) and invariant under every substitution
`x_τ ↦ x_τ·(1 + T·e_{st})`, `s < t`, as an identity in `R[x][T]`. For `Φ` a single element this is the module
`∇_R(λ⁰)` of IntegralWeylModulesOfGeneralLinearGroups §0.1 for a matrix with `|n_τ|` rows; in general it is the tensor
product over `τ` of those modules (2.1). For a family `d = (d_τ)` of natural numbers, `∇_R(n, κ; d)` is defined in the
same way with the degree `λ⁰_{τ,s} + d_τ` in each column `s < |n_τ|`; it is the module of the diagram `κ` with `d_τ`
further columns of full height `|n_τ|`. `Det^d := ∏_τ det(x_τ^□)^{d_τ}`, where `x_τ^□` is the square block of `x_τ`
on the columns `0, …, |n_τ| − 1`.

**Standard bideterminants.** `I(n, κ)` is the set of the families `i = (T_τ)_{τ∈Φ}`, `T_τ` a semistandard tableau of
the shape `λ⁰_τ` with entries in `n_τ` (Mathlib's `SemistandardYoungTableau`, rows weakly increasing, columns strictly
increasing; with the rows numbered, Tau Ceti's `TauCeti.BoundedSSYT`). The *standard bideterminant* of `i` is `b_i := ∏_τ B_{T_τ}(x_τ)`, where `B_T` is the bideterminant of
IntegralWeylModulesOfGeneralLinearGroups, Conventions: the product over the columns of the diagram of the minor on the
rows listed in that column and the first columns of `x_τ`. The roadmaps of this family call the elements of `I(n, κ)`
*standard fillings* and the `b_i` *standard products of minors*.

**The Weyl module in standard coordinates.** `V_R(n, κ) := R^{I(n,κ)}`, the module of coordinate vectors. By 2.1 it is
the dual of `∇_R(n, κ)` in the basis dual to `(b_i)`: `ξ` pairs with `f = Σ_i c_i b_i` to `ξ(f) := Σ_i ξ_i c_i`. For a
family `y = (y_τ)` of matrices over `R` (`y_τ` with rows `n_τ` and columns `0, 1, …`), the *evaluation vector* is
`ev_y := (b_i(y))_{i}`, the functional `f ↦ f(y)`. A linear map between Weyl modules is a matrix, and it is *integral*
if its entries are integers. A matrix with entries in `ℤ` is read over any ring.

**The formal proof's coordinates.** [ShortProof] takes for `(b_i)` an unspecified finite set of products of minors that
is a basis of `∇_R(n, κ)` over every commutative ring, not the semistandard one. Two such bases differ by an invertible
integer matrix, so every statement below (integrality of a matrix, a Gram matrix up to integral equivalence, an identity
between linear maps) is the same for both; the statements here use the semistandard basis, which
IntegralWeylModulesOfGeneralLinearGroups §0.1 provides.

**Unitary groups.** `U(n) := ∏_τ U(n_τ)` is the product of the compact unitary groups of the standard Hermitian forms
(Mathlib's `Matrix.unitaryGroup (n τ) ℂ`), with its Haar probability measure. `gᵀ` is the transpose, `gᴴ` the conjugate
transpose and `ḡ` the entrywise conjugate, taken at each `τ`.

## Layer 1: The Fock pairing

### 1.1 The Fock pairing and linear substitutions

*Origin:* published: the pairing `f(∂)g(0)` of polynomials (Fischer (1917); Bargmann (1961)), over a commutative ring.

*Method of the formal proof:* multiplication by a variable is adjoint to the partial derivative, by a computation on
monomials; the chain rule for a linear substitution then gives the adjointness for a matrix by induction on the first
argument.

Let `R` be a commutative ring and `σ` a set of variables.

(a) The *Fock pairing* on `R[x_s : s ∈ σ]` is `⟨f, g⟩ := Σ_α α!·f_α·g_α` (`f = Σ_α f_α x^α`, `α! := ∏_s α_s!`). It is a
symmetric `R`-bilinear form; distinct monomials are orthogonal and `⟨x^α, x^α⟩ = α!`; `⟨x_s·f, g⟩ = ⟨f, ∂g/∂x_s⟩`, so
that `⟨f, g⟩` is the constant term of `f(∂)g`; polynomials homogeneous of different degrees are orthogonal; and
`φ(⟨f, g⟩) = ⟨φ(f), φ(g)⟩` for a ring homomorphism `φ` applied to the coefficients.

(b) Let `σ` and `m` be finite and `z` a matrix over `R` with rows `m` and columns `σ`. Let
`L_z : R[x_s : s ∈ σ] → R[x_t : t ∈ m]` be the homomorphism of `R`-algebras with `L_z(x_s) = Σ_t z_{t,s}·x_t`. Then
`L_1 = id`, `L_{zw} = L_z∘L_w`, and

```text
⟨f, L_z g⟩ = ⟨L_{zᵀ} f, g⟩        for f ∈ R[x_t : t ∈ m], g ∈ R[x_s : s ∈ σ].
```

In the polynomial model: for ranks `n`, `n′` and matrices `z_τ` over `R` with rows `n′_τ` and columns `n_τ`, the
substitution `f(y) ↦ f(zy)`, from polynomials in matrices with rows `n′` to polynomials in matrices with rows `n`, is
adjoint to `f(y) ↦ f(zᵀy)`.

(c) Over `ℂ`, `⟨f̄, f⟩ > 0` for `f ≠ 0` (`f̄` the polynomial with conjugate coefficients), and `(f, g) ↦ ⟨f̄, g⟩` is
the Fischer form of IntegralWeylModulesOfGeneralLinearGroups, Conventions. More generally `⟨f̄, f⟩ > 0` over a
star-ordered domain.

*Needs:* Mathlib `MvPolynomial`, `MvPolynomial.pderiv`, `Matrix`.

[ShortProof], `Lib/GLn/SchurModule/Basic.lean` (`New.fockPairing`, `New.fockPairing_monomial`,
`New.fockPairing_mul_X`, `New.fockPairing_comm`, `New.map_fockPairing`, `New.linSubst`, `New.fockPairing_linSubst`,
`New.fockPairing_rowSubst`, `New.fockPairing_star_self_pos`).

**Checks.**

- One variable: `⟨x², x²⟩ = 2`. Two variables: `⟨x_1x_2, x_1x_2⟩ = 1` and `⟨x_1², x_1x_2⟩ = 0`.
- `m` one element, `σ = {1, 2}`, `z = (a  b)`: `L_z(x_1x_2) = ab·x²` and `L_{zᵀ}(x²) = (a·x_1 + b·x_2)²`, so both sides
  of (b) at `f = x²`, `g = x_1x_2` are `2ab`. The pairing without the factorials would give `ab` on the left and `2ab`
  on the right.

## Layer 2: The standard basis for a family, Schur matrices and evaluation vectors

### 2.1 Standard bideterminants for a family, with powers of determinants

*Origin:* published: the standard basis theorem for products of minors (De Concini, Eisenbud and Procesi (1980); Akin,
Buchsbaum and Weyman (1982)); IntegralWeylModulesOfGeneralLinearGroups §0.1 states it for one general linear group over
an integral domain. Here it is stated for a family, over every commutative ring, and with powers of the determinants.

*Method of the formal proof:* the rows are added one at a time: a semi-invariant has a leading term in the variables of
one row, whose exponent interlaces the weight and whose coefficient is a semi-invariant in the other rows of the lowered
weight; bordering a basis for the other rows gives a family of products of minors with distinct leading terms, which is
independent and spans over every ring. The power of the determinants is a regular element.

Let `R` be a commutative ring, `n` ranks, `κ` a diagram and `d = (d_τ)` natural numbers.

(a) The standard bideterminants `b_i`, `i ∈ I(n, κ)`, form an `R`-basis of `∇_R(n, κ)`. So
`∇_R(n, κ) = ⊗_τ ∇_R(n_τ, κ_τ)`, a ring homomorphism `R → R′` maps the basis of `∇_R(n, κ)` to that of
`∇_{R′}(n, κ)`, and the rank is `∏_τ dim V_{λ_τ}` (ClassicalGroups §5.1).

(b) `Det^d` is not a zero divisor in `R[x]`, and the products `b_i·Det^d`, `i ∈ I(n, κ)`, form an `R`-basis of
`∇_R(n, κ; d)`. In particular they are linearly independent over `R`.

(c) Let `A ⊂ R` be an additive subgroup and `f = Σ_i c_i·b_i·Det^d` with `c_i ∈ R`. If every coefficient of `f` lies in
`A`, then every `c_i` lies in `A`.

*Route.* For `Φ` a single element and `R` an integral domain, (a) is IntegralWeylModulesOfGeneralLinearGroups §0.1.
Linear independence over every commutative ring follows from the leading terms with coefficient `1`; spanning over every
commutative ring by the induction on the rows described above, in which every subtraction has coefficients in `R`. The
family is treated one `τ` at a time, with the polynomials in the other variables as coefficients. Multiplication by
`Det^d` maps `∇_R(n, κ)` into `∇_R(n, κ; d)`; it is onto because an element of `∇_R(n, κ; d)` is, by (a) for the diagram
with the further full columns, a combination of bideterminants each of which contains the factor `Det^d`. (c) follows
from the leading terms.

*Needs:* IntegralWeylModulesOfGeneralLinearGroups §0.1, Conventions; ClassicalGroups §5.1; Mathlib
`SemistandardYoungTableau`, `MvPolynomial`, `Matrix.det`.

[ShortProof], `Lib/GLn/SchurModule/MinorBasis.lean` (`New.GL.exists_isStdMinorFamily`),
`Lib/GLn/SchurModule/SchurMatrix.lean` (`New.linearIndependent_nablaBasis`, `New.range_nablaCombination`,
`New.isRegular_detPow`, `New.nabla_le_span_nablaBasis_mul_detPow`, `New.GL.linearIndependent_nablaBasis_mul_detPow`,
`New.GL.coord_mem_of_coeff_mem`), `Lib/GLn/SchurModule/Basic.lean` (`New.nabla`, `New.nablaFamily`, `New.nablaBasis`,
`New.detPow`, `New.map_nablaBasis`). [ShortProof] proves these for its own basis of products of minors (Conventions),
not for the semistandard one.

**Checks.**

- `Φ` a single element, `|n| = 2`, `κ(1) = 2`: `I` has three elements and the `b_i` are `x_{0,0}²`, `x_{0,0}x_{1,0}`,
  `x_{1,0}²`.
- `|n| = 2`, `κ(1) = 0`, `d = 1`: `∇_R(n, κ; d)` is spanned by `det(x^□) = x_{0,0}x_{1,1} − x_{0,1}x_{1,0}`.
- (c) with `R = ℚ`, `A = ℤ`: a rational combination of standard bideterminants with integer coefficients as a polynomial
  has integer coordinates (the saturation of IntegralWeylModulesOfGeneralLinearGroups §0.1).

### 2.2 Schur matrices and the representation of a weight

*Origin:* published: the matrix of a polynomial representation of a general linear group in the basis of a Schur module
(Green (1980)), extended to rectangular matrices: here for a family, with the power of the determinants that a
rectangular matrix produces.

*Method of the formal proof:* the substitution `f(y) ↦ f(zy)` keeps the weight of a semi-invariant, so the image of a
basis element is a combination of the basis elements times the power of the determinants (2.1 (b)); the coefficients
are unique, which gives multiplicativity and base change.

Let `n`, `n′` be ranks with `|n_τ| ≤ |n′_τ|` for every `τ`, and `κ` a diagram that *fits* `(n, n′)`: `κ_τ(h) = 0` for
`|n_τ| < h < |n′_τ|`. Put `d_τ := κ_τ(|n_τ|)` if `|n_τ| < |n′_τ|` and `d_τ := 0` if `|n_τ| = |n′_τ|`, and
`Det_κ := Det^d` in the variables `y` with rows `n`. Write `b′_{i′}`, `i′ ∈ I(n′, κ)`, and `b_i`, `i ∈ I(n, κ)`, for
the standard bideterminants. Let `z = (z_τ)` be matrices over a commutative ring `R`, `z_τ` with rows `n′_τ` and columns
`n_τ`.

(a) *Definition.* `b′_{i′}(zy)` lies in `∇_R(n, κ; d)`, and the *Schur matrix* `S_κ(z)`, with rows `I(n′, κ)` and
columns `I(n, κ)`, is the unique matrix over `R` with

```text
b′_{i′}(zy) = Σ_{i ∈ I(n,κ)} S_κ(z)_{i′,i} · b_i(y) · Det_κ(y)        for every i′ ∈ I(n′, κ).
```

(b) Its entries are polynomials with integer coefficients in the entries of `z`: `S_κ(φ(z)) = φ(S_κ(z))` for a ring
homomorphism `φ`. The entry `(i′, i)` is the product over `τ` of the entries `(i′_τ, i_τ)` of the Schur matrices of
the single places. `S_κ((t_τ z_τ)_τ) = ∏_τ t_τ^{|κ_τ|}·S_κ(z)` for scalars `t_τ`, with `|κ_τ|` the number of boxes
for the ranks `n′`.

(c) `S_κ(1) = 1`. For square `g = (g_τ)` of sizes `n′`: `S_κ(gz) = S_κ(g)·S_κ(z)`. For square `g` of sizes `n`:
`S_κ(zg) = ∏_τ det(g_τ)^{d_τ}·S_κ(z)·S_κ(g)`.

(d) For diagonal matrices of sizes `n`: `S_κ(diag(t))` is diagonal, with entry `∏_τ ∏_{a∈n_τ} t_{τ,a}^{w_i(τ,a)}` at
`i = (T_τ)`, where `w_i(τ, a)` is the number of entries of `T_τ` equal to `a`. So its trace is the product over `τ` of the
values at `t_τ` of the Schur polynomials of the shapes `λ⁰_τ` (Tau Ceti's `TauCeti.diagramSchurPoly`, the sum over the
semistandard tableaux of their weight monomials).

(e) `Det_κ(y)·S_κ(z)·ev_y = ev_{zy}` for every family `y` over `R` with rows `n`.

(f) *The representation of a weight.* For a weight `(κ, e)` of rank `n`,
`ρ_{κ,e}(g) := ∏_τ det(g_τ)^{e_τ}·S_κ(g)` is a homomorphism from `∏_τ GL_{n_τ}(R)` to the invertible matrices on
`V_R(n, κ)`, compatible with ring homomorphisms. `ρ_{κ,0}(g)ξ` is the functional `f ↦ ξ(f(g·))` on `∇_R(n, κ)`. If
`g` and `g⁻¹` have entries in a subring `A ⊂ R`, so has `ρ_{κ,e}(g)`. Over a topological ring, `S_κ(z)` and
`ρ_{κ,e}(g)` are continuous.

*Needs:* 2.1; Tau Ceti `TauCeti.BoundedSSYT`, `TauCeti.diagramSchurPoly` (for the trace in (d)).

[ShortProof], `Lib/GLn/SchurModule/Basic.lean` (`New.rowSubst`, `New.FitsRanks`, `New.schurDetExp`, `New.schur`,
`New.rowSubst_mem_nabla`), `Lib/GLn/SchurModule/SchurMatrix.lean` (`New.sum_schur_smul_nablaBasis`,
`New.GL.schur_eq_of_expansion`, `New.schur_map`, `New.schur_apply_eq_prod`, `New.schur_smul`, `New.schur_one`,
`New.schur_mul_left`, `New.schur_mul_right`, `New.schur_diagonal`, `New.weyl_character`,
`New.schur_mulVec_weylEval`, `New.weylRep`, `New.continuous_schur`), `Lib/GLn/SchurModule/SchurNorm.lean`
(`New.weylRep_map`, `New.weylRep_entry_mem`). The trace in (d) is there in the form of Weyl's quotient of alternants,
over `ℂ`.

**Checks.**

- `Φ` a single element, `|n′| = |n| = 2`, `κ(1) = 1`: `b_a = x_{a,0}`, and `S_κ(g) = g`.
- `|n′| = 2`, `|n| = 1`, `κ(1) = 1`: the diagram fits, `d = 1`, `I(n, κ)` has one element with `b = 1`, and
  `Det_κ = y_{0,0}`. For the column `z = (z_0, z_1)ᵀ`, `b′_a(zy) = z_a·y_{0,0}`, so `S_κ(z) = z`. With `d = 0` in the
  definition there would be no such matrix.
- `|n′| = 3`, `|n| = 1`, `κ(2) = 1`: the diagram does not fit, and `b′(zy)`, a `2 × 2` minor of a matrix of rank at
  most `1`, is `0`.

### 2.3 Evaluation vectors

*Origin:* published: the points of a general linear group span the dual of the homogeneous polynomials over an infinite
field (Green (1980), the Schur algebra): here as an extensionality statement over a domain, for maps into free modules.

*Method of the formal proof:* a linear form on the free module composed with the difference of the two maps is a
polynomial in the entries of `y`; times the power of the determinants it vanishes at all points with entries in the
infinite set, hence is zero, and the standard bideterminants are independent.

Let `n` be ranks and `κ` a diagram.

(a) For square matrices `y_τ` over a commutative ring `R` with rows `n_τ` and columns `0, …, |n_τ| − 1`:
`ev_y = S_κ(y)·ev_1`, the columns being identified with the rows by their numbering. The vector `v⁺ := ev_1` has the
coordinate `1` at the family of the tableaux whose columns of height `h` list the rows `0, …, h − 1`, and `0` elsewhere.

(b) Let `R` be an integral domain, `M` a free `R`-module, `s ⊂ R` an infinite subset and `d = (d_τ)` natural numbers. If
two `R`-linear maps `L, L′ : V_R(n, κ) → M` satisfy `L(ev_y) = L′(ev_y)` for every family `y` of square matrices with
entries in `s` and `∏_τ det(y_τ)^{d_τ} ≠ 0`, then `L = L′`.

(c) Consequently, over an infinite field `K`, the vectors `ev_y` of (b) span `V_K(n, κ)`, and so do the vectors
`ρ_{κ,e}(g)v⁺`, `g ∈ ∏_τ GL_{n_τ}(K)`.

*Needs:* 2.1, 2.2.

[ShortProof], `Lib/GLn/SchurModule/Basic.lean` (`New.weylEval`), `Lib/GLn/SchurModule/WeylKernel.lean`
(`New.GL.schur_squarePart_mulVec`, `New.GL.ext_weylEval`, `New.GL.ext_schur_weylEval`). It states the second half of
(c) for fields of characteristic `0`.

**Checks.**

- Over a domain that is not a field the vectors of (b) need not span: for `Φ` a single element, `|n| = 2`, `κ(1) = 3`
  and `R = s = ℤ`, the evaluation vectors are `(y_0³, y_0²y_1, y_0y_1², y_1³)`, and `y_0²y_1 − y_0y_1²` is even for all
  integers, so they lie in a sublattice of index at least `2`. The statement (b) still holds there, because `M` is
  torsion-free.
- Freeness is needed: in the same example the two maps `ξ ↦ ξ_1 − ξ_2` and `0` to `M = ℤ/2` agree on every evaluation
  vector.

## Layer 3: The Gram form, the unitary group and polarisation

### 3.1 The Gram matrix and the Gram form

*Origin:* published: the contravariant form on the Weyl module (Jantzen (2003), II.8; Green (1980)), in coordinates:
here as the integer matrix of coefficients of the kernel `v(yᵀx)`, for a family.

*Method of the formal proof:* the kernel is the pairing of the tensors of `x` and `y` in a tensor product of exterior
powers in which the Weyl module embeds integrally, so the Gram matrix is `FᵀF` for the integer matrix `F` of the
embedding, hence symmetric and positive definite; by Schur's lemma for the Schur matrices the form dual to it is
proportional to the Fock pairing, with the Fock norm of the highest-weight vector as factor.

Let `n` be ranks and `κ` a diagram. Let `v_κ := ∏_τ ∏_{1≤h<|n_τ|} Δ_h(x_τ)^{κ_τ(h)}` (`Δ_h` the leading `h × h`
minor), the product of the highest-weight vectors `v_{λ_τ}` of IntegralWeylModulesOfGeneralLinearGroups, Conventions,
and `K(x, y) := v_κ(yᵀx)`, the product of the powers `κ_τ(h)` of the leading `h × h` minors of the matrices `y_τᵀx_τ`.

(a) *The Gram matrix.* There is a unique matrix `G = G(n, κ)` with integer entries, indexed by `I(n, κ)`, such that
`K(x, y) = Σ_{i,j} G_{i,j}·b_i(x)·b_j(y)`. It is symmetric. For `ξ ∈ V_R(n, κ)` put `ξ^ := Σ_i (Gξ)_i·b_i ∈ ∇_R(n, κ)`;
then `(ev_y)^ = K(·, y)` and `ξ^(y) = ev_yᵀ·G·ξ`.

(b) *The hook number.* Let `F` be the integer matrix of the Fock pairings `⟨b_i, b_j⟩` (1.1) and
`H = H(n, κ) := ⟨v_κ, v_κ⟩`. Then `G·F = H·1`. `H` is a positive integer; it is the product over `τ` of the products of
the hook lengths of the diagrams `λ⁰_τ` (IntegralWeylModulesOfGeneralLinearGroups §3.1), and `H ≤ (L^L)³` if
`Σ_τ |κ_τ| ≤ L`. So `⟨ξ^, b_k⟩ = H·ξ_k`, the map `ξ ↦ ξ^` is injective over a domain of characteristic `0` and
bijective over a field of characteristic `0`, and `G` is the Gram matrix, in the dual basis, of the form on `V_ℚ(n, κ)`
dual to the form `H^{−1}·⟨·,·⟩` on `∇_ℚ(n, κ)`, which for `Φ` a single element is the normalised form `⟨·,·⟩_λ` of
IntegralWeylModulesOfGeneralLinearGroups, Conventions. The image of `V_ℤ(n, κ)` under `ξ ↦ ξ^` is the lattice dual to
`∇_ℤ(n, κ)` for that form.

(c) *Positivity.* `G` is positive definite.

(d) *Adjoints.* Over every commutative ring and for square `g` of sizes `n`: `G·S_κ(g) = S_κ(gᵀ)ᵀ·G`. Over a domain of
characteristic `0`, for ranks `n ≤ n′`, a diagram fitting `(n, n′)` and `z` as in 2.2:
`(S_κ(z)ξ)^(x) = (ξ^·Det_κ)(zᵀx)`. Over `ℂ`, for `w`, `z` as in 2.2 and with `G′ := G(n′, κ)`:
`S_κ(w)ᴴ·G′·S_κ(z) = ∏_τ det(w_τᴴ z_τ)^{d_τ}·G·S_κ(wᴴz)`.

(e) *The Gram form.* On `V_ℂ(n, κ)`, `⟨ξ, η⟩ := ξ̄ᵀ·G·η` is a positive definite Hermitian form, conjugate-linear in the
first variable, with norm `‖ξ‖² := ⟨ξ, ξ⟩` (the *Gram norm*). For a weight `(κ, e)` and `g ∈ ∏_τ GL_{n_τ}(ℂ)` the
adjoint of `ρ_{κ,e}(g)` is `ρ_{κ,e}(gᴴ)`. In particular `ρ_{κ,e}(u)` and `ρ_{κ,e}(ū)` are unitary for `u ∈ U(n)`.

(f) *Highest vectors.* For a family `p = (p_τ)` of bijections `p_τ : n_τ → {0, …, |n_τ| − 1}` let `v⁺_p` be the
evaluation vector at the permutation matrices with the entry `1` at `(a, p_τ(a))`. It has integer coordinates,
`⟨v⁺_p, v⁺_p⟩ = 1`, `ρ_{κ,e}(diag(t))v⁺_p = ∏_τ ∏_a t_{τ,a}^{λ_{τ,p_τ(a)}}·v⁺_p`, and for `g ∈ ∏_τ GL_{n_τ}(R)`

```text
(v⁺_p)ᵀ · G · ρ_{κ,e}(g) · v⁺_p = ∏_τ det(g_τ)^{e_τ} · ∏_{1≤h<|n_τ|} m_{τ,h}(g_τ)^{κ_τ(h)},
```

where `m_{τ,h}(g_τ)` is the principal minor of `g_τ` on the rows `a` with `p_τ(a) < h`.

*Route for (b).* For `f ∈ ∇_R(n, κ)` and a family `y` of square matrices, `⟨K(·, y), f⟩ = ⟨v_κ, f(y·)⟩` by 1.1 (b). Monomials of different degrees in the
rows are orthogonal, the only standard bideterminant with the row degrees of `v_κ` is `v_κ` itself, and the coefficient
of `v_κ` in `f(yx) = Σ_i c_i(y)·b_i(x)` is its value at `x = 1`, that is `f(y)` (2.3 (a)). So
`⟨K(·, y), f⟩ = H·f(y)`, which is `G·F = H·1` when `f` runs over the `b_k` and `K` is expanded by (a).

*Needs:* 1.1, 2.1, 2.2, 2.3; IntegralWeylModulesOfGeneralLinearGroups §3.1 (the Fischer norm of a product of leading
minors as a hook product), Conventions (the normalised form).

[ShortProof], `Lib/GLn/SchurModule/Basic.lean` (`New.highestPoly`, `New.weylKernel`, `New.weylGram`, `New.toPoly`,
`New.hookNumber`), `Lib/GLn/SchurModule/WeylKernel.lean` (`New.hookNumber_pos`, `New.hookNumber_le`,
`New.toPoly_weylEval`, `New.GL.eval_toPoly`, `New.fillingMatrix_transpose_mul_self`, `New.weylGram_isSymm`,
`New.weylGramOver_posDef`, `New.weylGramOver_mul_schur`, `New.toPoly_schur`, `New.toPoly_injective`,
`New.range_toPoly`), `Lib/GLn/SchurModule/GramMatrix.lean` (`New.weylGram_mul_fockPairing`,
`New.fockPairing_toPoly_nablaBasis`, `New.weylNormSq`), `Lib/GLn/SchurModule/SchurNorm.lean`
(`New.GL.schur_conjTranspose_weylGram_schur`, `New.gramForm_conjWeylRep`), `Lib/GLn/SchurModule/SchurOrthogonality.lean`
(`New.gramForm`, `New.highestVector`, `New.gramForm_highestVector_self`, `New.weylRep_coeff_eq_prod_weightMinors`).
[ShortProof] defines `H` as the Fock norm of `v_κ` and proves its positivity and the bound; the hook product and the
identification with the normalised form and its dual lattice are this roadmap's, through the cited sections.

**Checks.**

- `Φ` a single element, `|n| = 2`, `κ(1) = 1`: `K = x_{0,0}y_{0,0} + x_{1,0}y_{1,0}`, `G = 1`, `F = 1`, `H = 1`.
- `|n| = 2`, `κ(1) = 2`: `K = (x_{0,0}y_{0,0} + x_{1,0}y_{1,0})²`, so in the basis `x_{0,0}², x_{0,0}x_{1,0}, x_{1,0}²`
  `G = diag(1, 2, 1)` and `F = diag(2, 1, 2)`; `G·F = 2`, the hook product of a row of two boxes. Here `G` is not
  invertible over `ℤ`: the Weyl lattice has index `2` in the dual Weyl lattice.
- In that example `v⁺ = (1, 0, 0)` has norm `1`, and the vector `(0, 1, 0)` has norm `√2`.

### 3.2 Irreducibility and the comparison with the rational Weyl modules

*Origin:* published: Weyl's theorem that the rational irreducible representations of `GL_n(ℂ)` remain irreducible on
`U(n)` (Weyl (1939), Chapter VIII; Goodman and Wallach (2009), Section 2.4), and the theorem of the highest weight; the
comparison of the coordinate model with the rational Weyl modules of the library is this roadmap's own formulation.

*Method of the formal proof:* the unitary group is Zariski dense in the general linear group; a matrix commuting with
all `S_κ(u)`, `u` unitary, then commutes with all `S_κ(g)`, in particular with the diagonal and the triangular ones, so
it preserves the line of `v⁺` and, the translates of `v⁺` spanning (2.3 (c)), is a scalar. With the invariant Gram form
this gives irreducibility.

Let `n` be ranks and `(κ, e)` a weight of rank `n`, with dominant weights `λ_τ`.

(a) *Schur's lemma.* A complex matrix that commutes with `S_κ(u)` for every `u ∈ U(n)` is a scalar.

(b) *Irreducibility.* The representations `u ↦ ρ_{κ,e}(u)` and `u ↦ ρ_{κ,e}(ū)` of `U(n)` on `V_ℂ(n, κ)` are
continuous, unitary for the Gram form and irreducible: the translates of any nonzero vector span. Equivalently, for
nonzero `f ∈ ∇_ℂ(n, κ)` the polynomials `f(uᵀy)`, `u ∈ U(n)`, span `∇_ℂ(n, κ)`.

(c) *Comparison.* For `Φ` a single element, `ρ_{κ,e}` is a rational representation of `GL_n(ℂ)` (Tau Ceti's
`TauCeti.IsRationalRep`), irreducible, with highest weight `λ` and highest-weight vector `v⁺`; so it is isomorphic to
the rational Weyl module `TauCeti.rationalWeylFDRep ℂ n λ` of ClassicalGroups §3.3, and
`dim V_ℂ(n, κ) = TauCeti.weylDimension λ` (ClassicalGroups §5.1). For a family, `ρ_{κ,e}` is the external tensor
product over `τ` of these representations (2.2 (b)), of dimension `∏_τ dim V_{λ_τ}`.

*Route.* For (c): the entries of `ρ_{κ,e}(g)` are polynomials in the entries of `g` and `det(g)^{−1}` (2.2 (b)), and
its character on the diagonal torus is `det^e` times the Schur polynomial of `λ⁰` (2.2 (d)), which is the character of
the rational Weyl module (ClassicalGroups §4.2); rational representations of `GL_n(ℂ)` with the same character on the
torus are equivalent (Tau Ceti's `TauCeti.IsRationalRep.nonempty_equiv_of_forall_character_diagGL_eq`). The
highest-weight vector is read off 3.1 (f). (b) follows for one place from Tau Ceti's
`TauCeti.IsRationalRep.isIrreducible_comp_toUnits_iff`, and for a family because an external tensor product of
irreducible finite-dimensional complex representations is irreducible.

*Needs:* 2.2, 2.3, 3.1; ClassicalGroups §3.3, §4.2, §5.1; Tau Ceti `TauCeti.IsRationalRep`,
`TauCeti.rationalWeylFDRep`, `TauCeti.IsRationalRep.nonempty_equiv_of_forall_character_diagGL_eq`,
`TauCeti.IsRationalRep.isIrreducible_comp_toUnits_iff`,
`TauCeti.Matrix.GeneralLinearGroup.eq_of_mem_rationalFunctions_of_forall_unitary`.

[ShortProof], `Lib/GLn/SchurModule/WeylKernel.lean` (`New.GL.zariski_dense_unitary`,
`New.mem_range_scalar_of_commute_schur`), `Lib/GLn/SchurModule/SchurOrthogonality.lean` (`New.conjWeylRep`,
`New.continuous_conjWeylRep`), `Lib/GLn/SchurModule/Polarisation.lean` (`New.span_conjWeylRep_eq_top`,
`New.mem_span_rowSubst_unitary`). [ShortProof] proves (a) and (b), the latter for `u ↦ ρ_{κ,e}(ū)` and equal ranks
`n_τ` at all `τ`; (c) is not a statement of [ShortProof].

**Checks.**

- `|n| = 2`, `κ(1) = 1`, `e = 0`: the standard representation, `λ = (1, 0)`, dimension `2`.
- `|n| = 2`, `κ = 0`, `e = 1`: `V = R`, `ρ = det`, `λ = (1, 1)`, dimension `1`.

### 3.3 Schur orthogonality on the unitary group

*Origin:* published: Schur's orthogonality relations for an irreducible unitary representation of a compact group
(CompactGroups §4.1; Knapp, Corollary 4.10): here for the representation of a weight in standard coordinates, with a
linear form in place of one of the two coefficients.

*Method of the formal proof:* the mean over the group of `ρ(x)·M·ρ(x⁻¹)`, for the rank one matrix `M` of `c` and
`⟨a, ·⟩`, is an intertwiner, hence a scalar (3.2 (a)), and the scalar is found from the trace.

Let `(κ, e)` be a weight of rank `n` and `ρ` one of the two representations `u ↦ ρ_{κ,e}(u)`, `u ↦ ρ_{κ,e}(ū)` of
`U(n)` on `V := V_ℂ(n, κ)`. For every linear form `f : V → ℂ` and all `a, b, c ∈ V`,

```text
∫_{U(n)} ⟨a, ρ(x⁻¹)b⟩ · f(ρ(x)c) dx = (dim V)⁻¹ · ⟨a, c⟩ · f(b),
```

with the Gram form of 3.1 (e), the Haar measure of total mass `1`, and `dim V = #I(n, κ) = ∏_τ dim V_{λ_τ}`.

*Needs:* 3.1 (e), 3.2 (b); CompactGroups §0.1 (the Haar probability measure), §4.1 (Schur orthogonality for one
irreducible unitary representation).

[ShortProof], `Lib/GLn/SchurModule/SchurOrthogonality.lean` (`New.exists_intertwining_mean`,
`New.schur_orthogonality`). It proves the case `ρ(u) = ρ_{κ,e}(ū)` with equal ranks `n_τ` at all `τ`.

**Checks.**

- `κ = 0`: `V = ℂ`, `ρ = ∏_τ det^{e_τ}`, and both sides are `ā·c·f(b)`.
- With `f = ⟨w, ·⟩` the identity reads `∫ ⟨w, ρ(x)c⟩·conj⟨b, ρ(x)a⟩ dx = (dim V)⁻¹·⟨a, c⟩·⟨w, b⟩`, the form of
  CompactGroups §4.1.

### 3.4 Polarisation of products of determinants

*Origin:* adapted from the classical polarisation of invariants (Weyl (1939)): here, a product of determinants of
`p × p` matrices `η·Y` lies in an irreducible module of the unitary group, so that it is a combination of unitary
translates of one product of powers of minors.

*Method of the formal proof:* the product of the `det(η_{τ,k}Y_τ)`, for `Y_τ` the first `p` columns of the variables,
lies in the dual Weyl module of the diagram with `#ι(τ)` columns of height `p` at `τ`; this module is irreducible under
the unitary group (3.2 (b)), and the product of the powers of one minor is a nonzero element of it.

Let `p < N` be positive integers, `ι(τ)` a finite set for each `τ ∈ Φ`, and `η_{τ,k}` (`τ ∈ Φ`, `k ∈ ι(τ)`) complex
matrices with `p` rows and `N` columns. Let `η₀` be the `p × N` matrix whose rows are `p` distinct standard basis
vectors. There are finitely many families `u = (u_τ)` of unitary `N × N` matrices and complex numbers `c_u` such that,
for every commutative `ℂ`-algebra `S` and all matrices `Y_τ` over `S` with `N` rows and `p` columns,

```text
∏_{τ∈Φ} ∏_{k∈ι(τ)} det(η_{τ,k}·Y_τ) = Σ_u c_u · ∏_{τ∈Φ} det(η₀·u_τᵀ·Y_τ)^{#ι(τ)}.
```

The `u` and the `c_u` depend on `η` and `η₀` only, not on `S` or the `Y_τ`.

*Needs:* 2.1, 3.2 (b).

[ShortProof], `Lib/GLn/SchurModule/GramMatrix.lean` (`New.pairedDetProd`), `Lib/GLn/SchurModule/Polarisation.lean`
(`New.pairedDetProd_mem_nablaFamily`, `New.rowSubst_pairedDetProd_X`, `New.exists_pairedDetProd_eq_sum_unitary`).

**Checks.**

- `p = 1`, `N = 2`, `Φ` and `ι` single elements, `η = (a  b)`, `η₀ = (1  0)`: `det(ηY) = a·Y_0 + b·Y_1`, and
  `det(η₀uᵀY) = u_{0,0}Y_0 + u_{1,0}Y_1`; the first columns of unitary matrices span `ℂ²`.
- `p = 1`, `N = 2`, `#ι = 2`, `η_1 = (1  0)`, `η_2 = (0  1)`: `Y_0Y_1` is a combination of squares of linear forms
  `(u_{0,0}Y_0 + u_{1,0}Y_1)²`; one square does not suffice.

## Layer 4: Integral branching and duality

### 4.1 The integral branching matrix of a family

*Origin:* adapted from the branching from `GL_{N}` to `GL_{N−1}` for interlacing highest weights, with multiplicity one
(Goodman and Wallach (2009), Theorem 8.1.1; Zhelobenko (1973), Chapter X; Molev (2006)), and from the integral
branching of IntegralWeylModulesOfGeneralLinearGroups §1.1 for one pair: here for a family of pairs, as one integer
matrix in standard coordinates, with a norm bound in terms of the number of boxes.

*Method of the formal proof:* the matrix is determined by its value at one point: the transposed map sends the
highest-weight vector of the smaller module to a multiple, by the hook number, of the *branching vector*, the product of
the leading minors with the new row first, to the powers of the columns that lose a box, and with the new row last, to
the powers of the others. Equivariance is an identity between kernels, checked on evaluation vectors (2.3); the norm
bound comes from writing the map through a contraction of tensors; a vector cyclic for the lower triangular matrices
gives multiplicity at most one.

Let `n` be ranks and `N` the ranks with `N_τ = n_τ ⊔ {∗}`, the new row last. For `g ∈ ∏_τ GL_{n_τ}` and scalars
`s = (s_τ)`, `diag(g, s)` is the family of the block matrices `diag(g_τ, s_τ)`. Let `λ = (λ_τ)` be the weight `(κ, e)`
of rank `N` and `σ = (σ_τ)` the weight `(κ₀, e₀)` of rank `n`, *interlacing* at every `τ`:

```text
λ_{τ,p} ≥ σ_{τ,p} ≥ λ_{τ,p+1}        (0 ≤ p < |n_τ|).
```

Put `γ_τ(h) := λ_{τ,h−1} − σ_{τ,h−1}` and `κ′_τ(h) := σ_{τ,h−1} − λ_{τ,h}` for `1 ≤ h ≤ |n_τ|` (of the `κ_τ(h)` columns
of height `h`, `γ_τ(h)` lose a box and `κ′_τ(h)` keep theirs), so that `κ = γ + κ′`,
`κ₀_τ(h) = κ′_τ(h) + γ_τ(h + 1)` for `1 ≤ h < |n_τ|` and `e₀_τ = e_τ + κ′_τ(|n_τ|)`; and put
`m_τ := |λ_τ| − |σ_τ| = e_τ + Σ_h γ_τ(h)`. Then there is a matrix `br` with integer entries, with rows `I(n, κ₀)` and
columns `I(N, κ)`, such that:

(a) *Equivariance.* Over every field `K` of characteristic `0`, for all `g ∈ ∏_τ GL_{n_τ}(K)` and `s ∈ (K^×)^Φ`:
`br·ρ_{κ,e}(diag(g, s)) = ∏_τ s_τ^{m_τ}·ρ_{κ₀,e₀}(g)·br`.

(b) *Norm.* Let `q ≥ 0` be such that `κ′_τ(h) = 0` for all `τ` and all `1 ≤ h < q` (`q ≤ 1` is always allowed), and let
`L` be a natural number with `Σ_τ Σ_{q ≤ h < |n_τ|} h·κ₀_τ(h) ≤ L`. Then `‖br·ξ‖² ≤ ((L^L)³)²·‖ξ‖²` for every
`ξ ∈ V_ℂ(N, κ)`, with the Gram norms of 3.1 (e) and `0⁰ = 1`: the operator norm of `br` is at most `(L^L)³`.

(c) *Multiplicity one.* Every complex matrix `T` with `T·ρ_{κ,e}(diag(u, 1)) = ρ_{κ₀,e₀}(u)·T` for all `u ∈ U(n)` is a
complex multiple of `br`.

(d) `br ≠ 0`.

*Remark.* For `Φ` a single element, `br` is, by (c) and (d), a nonzero rational multiple of the map `br` of
IntegralWeylModulesOfGeneralLinearGroups §1.1 (b) under the identification of `V_ℚ` with the polynomial model
(3.1 (b)), and `m` is the weight of §1.1 (c). The bound (b) and the constant of §1.1 (d), (e) are different bounds for
different normalisations; neither is deduced from the other here.

*Needs:* 2.1, 2.2, 2.3, 3.1, 3.2; ClassicalGroups §6.1 (the restriction of `V_λ` to `GL_{N−1}` contains each `V_σ` with
`σ` interlacing `λ` once), for (d); IntegralWeylModulesOfGeneralLinearGroups §1.1 (for the remark).

[ShortProof], `Lib/GLn/SchurModule/WeylKernel.lean` (`New.GL.blockScalar`), `Lib/GLn/Branching/NormBound.lean`
(`New.GL.branchVector`, `New.GL.weylNormSq_mulVec_le_of_equivariant`), `Lib/GLn/Branching/IntegralMap.lean`
(`New.SpansBranchingMaps`, `New.GL.exists_cyclic_lower_triangular`, `New.GL.exists_int_branching_of_weylKernel`,
`New.GL.spansBranchingMaps_of_equivariant`, `New.exists_branching_matrix`). It states (a), (b) and (c); (d) is not part
of its statement.

**Checks.**

- `Φ` a single element, `|n| = 1`, `λ = (1, 0)`, so `V(N, κ) = R²` with `ρ(g) = g`. For `σ = (0)`: `γ(1) = 1`,
  `κ′(1) = 0`, `m = 1`, `ρ₀ = 1`, and (a) reads `br·diag(g, s) = s·br`, so `br` is a multiple of `(0  1)`. For
  `σ = (1)`: `γ(1) = 0`, `κ′(1) = 1`, `e₀ = 1`, `m = 0`, and `br·diag(g, s) = g·br`, so `br` is a multiple of
  `(1  0)`.
- `λ = (2, 0)`, `σ = (1)`: `m = 1`, and `br` is a multiple of the coordinate of `x_{0,0}x_{1,0}`.
- The exponent `m_τ` is the difference of the sums of the weights, not the number of boxes lost: for `λ = (1, 1)`,
  `σ = (1)`, no box is lost and `m = 1`.

### 4.2 The integral duality of Weyl modules

*Origin:* published: the dual of a Weyl module of `GL_n` through complementary minors (Fulton and Harris (1991),
§15.5; Jacobi's complementary minor identity): here as a unimodular integer matrix in standard coordinates, isometric
for the Gram forms, for a family, and the invariant pairing that it gives.

*Method of the formal proof:* the Hodge star of each column, a signed bijection between the basis tensors of the two
tensor products of exterior powers, maps one Weyl module onto the other by an integer matrix with integer inverse;
Jacobi's identity gives the equivariance on the evaluation vectors, which span (2.3). The pairing is the Gram matrix
times this matrix, and the Fock pairings invert the Gram matrix up to the hook number (3.1 (b)).

Let `n` be ranks and `(κ, e)` a weight of rank `n`, with dominant weights `λ_τ`. The *dual weight* `(κ^∨, e^∨)` is
`κ^∨_τ(h) := κ_τ(|n_τ| − h)` for `1 ≤ h < |n_τ|` and `e^∨_τ := −λ_{τ,0}`; its dominant weights are
`λ^∨_{τ,p} = −λ_{τ,|n_τ|−1−p}`, it is the unique weight whose doubled Harish-Chandra parameter at every `τ` is the
negative of that of `(κ, e)`, and the dual of the dual is `(κ, e)`.

(a) *The dual isometry.* For every family `p` of numberings of the rows (3.1 (f)), with `p^rev` the reversed
numberings, there is a matrix `J` with integer entries, with rows `I(n, κ)` and columns `I(n, κ^∨)`, such that: `J` has
an inverse with integer entries; `Jᵀ·G(n, κ)·J = G(n, κ^∨)`; `J·v⁺_p = v⁺_{p^rev}`, the highest vectors of
`V(n, κ^∨)` and of `V(n, κ)`; and over every field `K` of characteristic `0`

```text
ρ_{κ,e}(g⁻ᵀ)·J = J·ρ_{κ^∨,e^∨}(g)        for all g ∈ ∏_τ GL_{n_τ}(K).
```

(b) *The dual pairing.* Let `J′`, with rows `I(n, κ^∨)` and columns `I(n, κ)`, be a matrix as in (a) for the weight
`(κ^∨, e^∨)`, and `A := G(n, κ^∨)·J′`, an integer matrix. The pairing `β(v′, v) := v′ᵀ·A·v` of `V(n, κ^∨)` with
`V(n, κ)` satisfies:

- `β(ρ_{κ^∨,e^∨}(g)v′, ρ_{κ,e}(g)v) = β(v′, v)` over every field of characteristic `0`;
- there is an integer matrix `C` with `C·A = H(n, κ^∨)·1`, so `β` is perfect over every ring in which the hook number
  `H(n, κ^∨)` is invertible;
- over `ℂ`, `β(u, v) = ⟨conj(J′v), u⟩` for the Gram form of `V_ℂ(n, κ^∨)`, and `‖J′v‖ = ‖v‖`: pairing with `v` is the
  Hermitian product with a vector of the same Gram norm.

*Needs:* 2.2, 2.3, 3.1.

[ShortProof], `Lib/GLn/Dual.lean` (`New.GL.exists_star_matrix`, `New.GL.exists_int_duality_matrix`,
`New.GL.IsDualIsometry`, `New.exists_isDualIsometry`, `New.GL.exists_weylGram_mul_eq_hookNumber_dual_smul`,
`New.IsHCParam.columns_eq_of_neg`, `New.IsHCParam.add_eq_neg_sum_of_neg`, `New.IsDualPairing`,
`New.exists_isDualPairing_of_isHCParam`), `Lib/GLn/SchurModule/SchurOrthogonality.lean` (`New.hcParameter`,
`New.IsHCParam`). It proves (a) as stated and (b) for equal ranks at all `τ`, with `Φ` the set of infinite places of a
CM field and the dual weight given through the negated doubled parameter; its `New.IsDualPairing` has a further clause,
about the functions of algebraic forms on a unitary group, which is not part of this section.

**Checks.**

- `Φ` a single element, `|n| = 2`, `κ(1) = 1`, `e = 0`: `λ = (1, 0)`, `κ^∨(1) = 1`, `e^∨ = −1`, `λ^∨ = (0, −1)`,
  `ρ(g) = g` and `ρ^∨(g) = det(g)^{−1}·g`. With `p` the identity, `J = [[0, −1], [1, 0]]` satisfies
  `g⁻ᵀ·J = J·det(g)^{−1}g` and sends `v⁺ = (1, 0)` to `(0, 1)`. The pairing `β` is, up to sign, the determinant
  `v′_0v_1 − v′_1v_0`, invariant under `(det(g)^{−1}g, g)`.
- The doubled parameters in that example are `{3, −1}` and `{1, −3}`.
- `|n| = 2`, `κ(1) = 2`, `e = 0`: `κ^∨(1) = 2`, `e^∨ = −2`, and `H(n, κ^∨) = 2`: `β` is perfect over `ℤ[1/2]` and not
  over `ℤ`.

## Downstream consumers

- CompositeThetaLiftsAndShortForms §1.5 uses 1.1 (the Fock pairing, with the adjointness (b) over a valuation domain);
  §5.6 uses 2.3 (b) (extensionality on evaluation vectors) with the Weyl modules, the representation and the Gram norm
  of 2.2 (f) and 3.1 (e).
- DivisibilityOfThetaDerivatives §3.4 uses 2.2 (a) (the Schur matrix of rectangular matrices and its expansion) and
  2.1 (b) (the linear independence of the standard bideterminants times `Det_κ`, over the residue field).
- DeterminantsOfThetaLiftChains §3.10 uses 3.4 (polarisation); §5.10 uses 4.1 (a), (b) with `q = 0` (the branching
  matrix of a family and its norm) and 4.2 (b) (the dual pairing of a weight with the weight of the negated doubled
  parameter).
- ThetaLiftChainsAndTheSeesawIdentity §2.2 uses 4.1 (a), (b), (c) (the branching map with its character `∏_τ s_τ^{m_τ}`,
  its norm and multiplicity one); §3.17 uses 3.3 (Schur orthogonality) with 4.1 (c).
- The roadmaps of this family that speak of the Weyl module of a weight `(κ, e)`, its coordinates, its Gram norms and
  its highest vectors use the Conventions, 2.2 (f) and 3.1 (e), (f).

## Scope and ownership

This sub-roadmap of [ShortGRH](../README.md) is independently definitive.

### Owned here

- The Fock pairing on polynomials over a commutative ring and the adjointness of linear substitutions (1.1).
- For a family of general linear groups: the standard bideterminant basis over every commutative ring with powers of the
  determinants (2.1); the Schur matrices of rectangular matrices and the representation of a weight in standard
  coordinates (2.2); evaluation vectors and their extensionality (2.3).
- The Gram matrix, its relation to the Fock pairing and the hook number, the Gram form and the highest vectors (3.1);
  irreducibility on the unitary group and the comparison with the rational Weyl modules (3.2); Schur orthogonality in
  coordinates (3.3); polarisation of products of determinants (3.4).
- The integral branching matrix of a family of interlacing pairs with its norm bound in boxes and multiplicity one
  (4.1); the dual isometry and the dual pairing (4.2).

### Not owned here

- The polynomial model of one general linear group, the standard bideterminant basis over an integral domain with its
  saturation, the Weyl lattice and the sandwich between the two lattices, the Fischer norm of a product of leading
  minors as a hook product, and integral branching for one interlacing pair with the integer `c_Br`:
  IntegralWeylModulesOfGeneralLinearGroups §0.1, §0.3, §1.1, §3.1.
- The classification of the rational representations of `GL_n(ℂ)` by highest weights, the Weyl dimension formula,
  characters and the branching rule: ClassicalGroups §3.3, §4.2, §5.1, §6.1. Weyl and induced modules of reductive
  groups over arbitrary fields and over `ℤ`: ReductiveGroups §10B.
- Haar measure on compact groups, unitarisation and Schur orthogonality in general: CompactGroups §0.1, §1.2, §4.1.
- The oscillator module of a dual pair of general linear Lie algebras on a polynomial ring (Tau Ceti's
  `TauCeti.fockRowHom`, `TauCeti.fockColHom`) is a different structure on the same space; the Fock pairing of 1.1 is not
  defined there.
- The `p`-adic gauge of a vector of a Weyl module, algebraic forms on definite unitary groups with values in Weyl
  modules, and the clause of the dual pairing about their functions belong to the roadmaps of this family on algebraic
  forms; bounds for the operator norm of a Schur matrix in terms of singular values are stated where they are used.

## Exact supplier contracts

### From Mathlib

`MvPolynomial`, `MvPolynomial.pderiv`, `MvPolynomial.aeval`, `Matrix.det`, `Matrix.unitaryGroup`,
`SemistandardYoungTableau`, `YoungDiagram`, `Matrix.PosDef`, `MeasureTheory.Measure.haar`.

### From Tau Ceti

`TauCeti.BoundedSSYT` and `TauCeti.diagramSchurPoly` (semistandard tableaux with entries below a bound and the Schur
polynomial as their generating function; Conventions, 2.2 (d)); `TauCeti.DominantWeight`, `TauCeti.IsRationalRep`,
`TauCeti.rationalWeylFDRep`, `TauCeti.weylDimension` and
`TauCeti.IsRationalRep.nonempty_equiv_of_forall_character_diagGL_eq` (rational representations of `GL_n(ℂ)` with equal
characters on the diagonal torus are equivalent; 3.2 (c)); `TauCeti.IsRationalRep.isIrreducible_comp_toUnits_iff` and
`TauCeti.Matrix.GeneralLinearGroup.eq_of_mem_rationalFunctions_of_forall_unitary` (irreducibility on `U(n)` and the
Zariski density of `U(n)` in `GL_n(ℂ)`, 3.2).

### From IntegralWeylModulesOfGeneralLinearGroups

Conventions: the polynomial model `∇_R(λ)`, bideterminants, the highest-weight vector `v_λ`, the Fischer form and the
normalised form `⟨·,·⟩_λ`. §0.1: the standard bideterminants of a matrix with `N` rows form a basis of `∇_R(ν)` over an
integral domain `R`, with saturation and base change (2.1). §3.1: the Fischer norm of a product of powers of leading
minors is the product of the hook lengths (3.1 (b)). §1.1: integral branching for one interlacing pair (4.1, remark).

### From ClassicalGroups

§3.3: the theorem of the highest weight, `λ ↦ V_λ` (3.2 (c)). §4.2: the character of `V_λ` on the diagonal torus is
`det^{λ_{n−1}}` times the Schur polynomial of `λ⁰` (3.2 (c)). §5.1: `dim V_λ = TauCeti.weylDimension λ` (2.1 (a), 3.2 (c), 3.3). §6.1: the restriction of `V_λ`
to `GL_{n−1}` is the sum of the `V_μ` over the `μ` interlacing `λ`, each once (4.1 (d)).

### From CompactGroups

§0.1: the Haar probability measure of a compact group. §4.1: for an irreducible unitary representation `π` of
dimension `d`, `⟪π_{v₁,w₁}, π_{v₂,w₂}⟫ = d⁻¹·conj⟪v₁, v₂⟫·⟪w₁, w₂⟫` (3.3).

## References

- `[ShortProof]`: the folder `grh` of <https://github.com/lsernau/grh-lean> at commit
  `72fead102f663d5c7a407964a13dc0cf9d977207`; this roadmap covers `src/Lib/GLn`.
- E. Fischer, *Über die Differentiationsprozesse der Algebra*, J. reine angew. Math. 148 (1917), 1–78 (1.1).
- V. Bargmann, *On a Hilbert space of analytic functions and an associated integral transform, Part I*, Comm. Pure Appl.
  Math. 14 (1961), 187–214 (1.1).
- C. De Concini, D. Eisenbud, C. Procesi, *Young diagrams and determinantal varieties*, Invent. Math. 56 (1980),
  129–165 (2.1).
- K. Akin, D. A. Buchsbaum, J. Weyman, *Schur functors and Schur complexes*, Adv. Math. 44 (1982), 207–278 (2.1).
- J. A. Green, *Polynomial representations of `GL_n`*, Lecture Notes in Mathematics 830 (1980) (2.2, 2.3, 3.1).
- J. C. Jantzen, *Representations of algebraic groups*, second edition (2003): II.8, contravariant forms (3.1).
- H. Weyl, *The Classical Groups*, Princeton University Press (1939): Chapter VIII (3.2), polarisation (3.4).
- R. Howe, *Perspectives on invariant theory*, The Schur Lectures (1992), Israel Math. Conf. Proc. 8 (1995) (3.1, 3.4).
- A. W. Knapp, *Lie groups beyond an introduction*, second edition (2002): Corollary 4.10 (3.3).
- R. Goodman, N. Wallach, *Symmetry, Representations, and Invariants*, Graduate Texts in Mathematics 255 (2009):
  Section 2.4 (3.2), Theorem 8.1.1 (4.1).
- D. P. Zhelobenko, *Compact Lie groups and their representations*, Translations of Mathematical Monographs 40 (1973):
  Chapter X (4.1).
- A. Molev, *Gelfand–Tsetlin bases for classical Lie algebras*, Handbook of Algebra 4 (2006), 109–170 (4.1).
- W. Fulton, J. Harris, *Representation Theory: A First Course*, Graduate Texts in Mathematics 129 (1991): §15.5 (4.2).
