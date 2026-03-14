#import "template.typ": cheatsheet

#show: cheatsheet.with(
  title: "FMM - Mathematical Methods for Physics",
  lang: "en",
  columns: 4,
)
#set page(numbering: none)

#let section_rule = line(length: 100%, stroke: 0.5pt + gray.lighten(50%))

== 1. Fundamental PDEs
#section_rule
- *Laplace Eq:* $nabla^2 u = 0$ (Steady state / Equilibrium)
- *Heat Eq:* $(dif u) / (dif t) = k nabla^2 u$ (Diffusion). Decay: $e^(-k lambda t)$.
- *Wave Eq:* $(dif^2 u) / (dif t^2) = c^2 nabla^2 u$ (Oscillation). Sols: $cos(omega t), sin(omega t)$.
- *Helmholtz Eq:* $nabla^2 psi + k^2 psi = 0$. From Wave Eq: $u(bold(r), t) = psi(bold(r)) e^(-i omega t)$.
- *Poisson Eq:* $nabla^2 u = f(bold(r))$ (Inhomogeneous Laplace)

== 2. Separation of Variables (SOV)
#section_rule
*Context:* Linear homogeneous PDE + homogeneous BCs.
1. Assume $u(bold(r), t) = X(bold(r))T(t)$. Yields $N$ ODEs and $N-1$ constants.
2. Substitute & Separate: $((dif T) / (dif t)) / (k T) = (nabla^2 X) / (X) = -lambda$.
3. Solve Spatial BVP: $nabla^2 X + lambda X = 0$ with given BCs.
4. Solve Temporal ODE: $(dif T) / (dif t) + lambda k T = 0 arrow.double T(t) = C e^(-lambda k t)$.
5. Sum Modes: $u(bold(r), t) = sum c_n X_n (bold(r)) T_n (t)$.
6. Apply IC: $u(bold(r), 0) = f(bold(r))$ using Fourier orthogonality.

== 3. Non-Homogeneous Problems
#section_rule
- *Splitting Trick:* If multiple non-homo BCs, split $u = u_1 + u_2 + dots$ where each $u_i$ has only ONE non-homo BC. Sum results.
- *Time-Independent BCs:* $u(x,t) = v(x,t) + u_E (x)$, where $u_E$ is the equilibrium solution ($(dif u_E) / (dif t) = 0$).
- *Time-Dependent BCs:* $u(x,t) = v(x,t) + r(x,t)$, where $r(x,t)$ is a simple reference function (e.g., $A + (x) / (L) (B-A)$) matching the BCs.
- *Inhomogeneous PDE ($L[u] = Q$):* Use *eigenfunction expansion*:
  $u(x,t) = sum a_n (t) phi.alt_n (x)$. Sub into PDE to get ODEs for $a_n (t)$.

== 4. Fourier Series & Orthogonality
#section_rule
$f(x) approx sum c_n phi.alt_n (x) arrow.double c_n = (chevron.l f | phi.alt_n chevron.r) / (chevron.l phi.alt_n | phi.alt_n chevron.r) = (integral_V f phi.alt_n sigma dif V) / (integral_V phi.alt_n^2 sigma dif V)$
- *Double Series ($x in [0,L], y in [0,H]$):*
  $f(x,y) approx sum_(n,m) A_(n,m) phi.alt_n psi_m arrow.double A_(n,m) = (chevron.l f | phi.alt_n psi_m chevron.r) / (chevron.l phi.alt_n psi_m | phi.alt_n psi_m chevron.r) = (integral integral f phi.alt_n psi_m sigma dif x dif y) / (integral integral phi.alt_n^2 psi_m^2 sigma dif x dif y)$
- *The Trick (Ensuring $n=m$):* To isolate $c_m$ in $f = sum c_n phi.alt_n$:
  1. Take inner product with $phi.alt_m$: $chevron.l f | phi.alt_m chevron.r = chevron.l sum c_n phi.alt_n | phi.alt_m chevron.r$
  2. Use linearity: $chevron.l f | phi.alt_m chevron.r = sum c_n chevron.l phi.alt_n | phi.alt_m chevron.r$
  3. Orthogonality: $chevron.l phi.alt_n | phi.alt_m chevron.r = 0$ for $n eq.not m arrow$ only $c_m chevron.l phi.alt_m | phi.alt_m chevron.r$ survives.

== 5. Sturm-Liouville (SL) Theory & Operators
#section_rule
*L-Operator:* $L[u] = nabla dot (p nabla u) - q u = -lambda sigma u$.
- $L$ is *Self-Adjoint* if $integral_V (u L[v] - v L[u]) dif V = 0$.
- *Regular 1D Form:* $-(dif) / (dif x) (p (dif phi.alt) / (dif x)) + q phi.alt = lambda sigma phi.alt$. $p, q, sigma$ real/cont., $p, sigma > 0$.
- *Rayleigh Quotient (Multi-D):*
  #v(2pt)
  $
    lambda = (-integral_S p phi.alt nabla phi.alt dot bold(n) dif S + integral_V [p |nabla phi.alt|^2 + q phi.alt^2] dif V) / (integral_V phi.alt^2 sigma dif V)
  $
  #v(2pt)
- *1D Case ($x in [a,b]$):*
  #v(2pt)
  $
    lambda = ([-p phi.alt (dif phi.alt) / (dif x)]_a^b + integral_a^b [p ((dif phi.alt) / (dif x))^2 + q phi.alt^2] dif x) / (integral_a^b phi.alt^2 sigma dif x)
  $
  #v(2pt)

== 6. Green's Functions (Constructing $G$)
#section_rule
*Definition:* $L[G(bold(r), bold(r)_0)] = delta(bold(r) - bold(r)_0)$ with homogeneous BCs.
- *Direct Method (1D):*
  1. *Homogeneous:* Solve $L[phi.alt] = 0$.
  2. *BCs:* $u_1$ satisfies Left BC, $u_2$ satisfies Right BC.
  3. *Form:* $G(x, x_0) = cases(C u_1(x) u_2(x_0) & x < x_0, C u_1(x_0) u_2(x) & x > x_0)$
  4. *Jump:* $C = (-1) / (p(x_0) W(u_1, u_2)(x_0))$, where $W = u_1 (dif u_2) / (dif x) - (dif u_1) / (dif x) u_2$.
- *Eigenfunction Expansion:*
  $G(bold(r), bold(r)_0) = sum_n (phi.alt_n (bold(r)) phi.alt_n (bold(r)_0)) / (lambda_n N_n)$, where $N_n = integral phi.alt_n^2 sigma dif V$.
- *Inhomogeneous BCs:* If $u(a)=alpha, u(b)=beta$:
  $u = integral G f + [-p alpha (dif G) / (dif x_0)]_(x_0=a) + [p beta (dif G) / (dif x_0)]_(x_0=b)$.

== 7. Standard ODE Solutions
#section_rule
#set text(size: 4.5pt)
#table(
  columns: (0.5fr, 1fr, 1.5fr, 0.8fr),
  inset: 2pt,
  fill: (x, y) => if y == 0 { gray.lighten(80%) },
  [*Geom*], [*Equation Form*], [*General Solutions*], [*Regularity*],
  [Rect. $x$],
  [$(dif^2 phi.alt) / (dif x^2) + lambda phi.alt = 0$],
  [$lambda > 0: A cos(sqrt(lambda) x) + B sin(sqrt(lambda) x)$\ $lambda = 0: A x + B$\ $lambda < 0: A cosh + B sinh$],
  [$lambda = ((n pi) / (L))^2$ (Dir.)],

  [Cyl. $r$],
  [$r^2 (dif^2 f) / (dif r^2) + r (dif f) / (dif r) + (lambda r^2 - m^2)f = 0$],
  [$lambda > 0: A J_m + B Y_m$\ $lambda = 0: A r^m + B r^(-m)$ ($m=0: ln r$)\ $lambda < 0: A I_m + B K_m$],
  [If $0 in V$: no $Y_m, K_m, ln, r^(-m)$],

  [Sph. $rho$],
  [$(dif) / (dif rho) (rho^2 (dif f) / (dif rho)) + (lambda rho^2 - n(n+1))f = 0$],
  [$lambda > 0: A j_n + B y_n$\ $lambda = 0: A rho^n + B rho^(-(n+1))$],
  [If $0 in V$: no $y_n, rho^(-(n+1))$],

  [Sph. $theta$],
  [$(dif) / (dif x) ((1-x^2) (dif g) / (dif x)) + (lambda - dots)g = 0$],
  [$lambda = n(n+1)$\ $g = A P_n^m (cos theta) + B Q_n^m (cos theta)$],
  [If $0, pi in V$: discard $Q_n^m$],
)
#set text(size: 5pt)

== 8. Practical Tips & Tricks
#section_rule
- *Regularity:* If $|u(0)| < infinity$, discard singular solutions ($Y_m, K_m, Q_n^m, ln r, r^(-n)$).
- *Late Time:* Only the mode with the *smallest* $lambda > 0$ survives.
- *Equilibrium:* Set $(dif u) / (dif t) = 0$ (Heat) or $(dif^2 u) / (dif t^2) = 0$ (Wave) $arrow$ solve $nabla^2 u = f$.
- *Fredholm:* $L[u]=f$ has sol iff $integral f phi.alt_h sigma = 0$ for zero-modes $phi.alt_h$.

== 9. Shortcuts & Universal Solving Steps
#section_rule
- *Coord. Change:* (Cauchy-Euler) $x^2 (dif^2 phi.alt) / (dif x^2) + x (dif phi.alt) / (dif x) + lambda phi.alt = 0 arrow (dif) / (dif x) (x (dif phi.alt) / (dif x)) + (lambda) / (x) phi.alt = 0$. Sub $x = e^z arrow (dif^2 phi.alt) / (dif z^2) + lambda phi.alt(z) = 0$.
- *Eigenvalues ($lambda$):* Check $lambda=0$ (e.g. Neumann BCs). Check $lambda<0$ (e.g. $((dif u) / (dif x))(L)=+h u(L)$).
- *Bessel Zeros:* $z_(m,k) approx (k + (m) / (2) - (1) / (4)) pi$. Small $x: J_m(x) approx (((x) / (2))^m) / (m!)$.
- *Logic for Basis:* $u(0)=0 arrow sin/sinh$; $((dif u) / (dif x))(0)=0 arrow cos/cosh$. $u(L)=0 arrow sin(sqrt(lambda)(L-x))$.
- *Fourier-Bessel ($J_m$):* $f(r) approx sum A_k J_m(z_(m,k) r/a) arrow A_k = ((2) / (a^2 J_(m+1)^2 (z_(m,k)))) integral_0^a f(r) J_m(z_(m,k) (r) / (a)) r dif r$.
- *Orthogonality:* $integral_0^L sin^2((n pi x) / (L)) = (L) / (2)$. $integral_0^pi sin^2(n x) = (pi) / (2)$. $integral_0^pi cos^2(n x) = (pi) / (2)$ (if $n=0$: $pi$).
- *Sanity Checks:* 1. Units. 2. Symmetry. 3. BC Match. 4. Equilibrium.

== 10. Quick Eigenvalue Table ($(dif^2 phi.alt) / (dif x^2) + lambda phi.alt = 0$)
#section_rule
#table(
  columns: (1fr, 1.2fr, 1.5fr),
  inset: 2pt,
  [*BCs ($x=0, L$)*],
  [*Eigenvalues ($lambda_n$)*],
  [*Eigenfunctions ($phi.alt_n$)*],

  [Dirichlet (0, 0)],
  [$((n pi) / (L))^2$],
  [$sin((n pi x) / (L)) quad (n=1,2,...)$],

  [Neumann (0, 0)],
  [$((n pi) / (L))^2$],
  [$cos((n pi x) / (L)) quad (n=0,1,...)$],

  [Mixed (Dir, Neu)],
  [$(((n + (1) / (2)) pi) / (L))^2$],
  [$sin(((n + (1) / (2)) pi x) / (L))$],

  [Mixed (Neu, Dir)],
  [$(((n + (1) / (2)) pi) / (L))^2$],
  [$cos(((n + (1) / (2)) pi x) / (L))$],

  [Periodic],
  [$((2 n pi) / (L))^2$],
  [$1, cos((2 n pi x) / (L)), sin((2 n pi x) / (L))$],
)

== 11. Coordinate Systems ($nabla^2 u$)
#section_rule
- *Cylindrical ($r, theta, z$):*
  $nabla^2 u = ((1) / (r)) (dif) / (dif r) (r (dif u) / (dif r)) + ((1) / (r^2)) (dif^2 u) / (dif theta^2) + (dif^2 u) / (dif z^2)$
- *Spherical ($rho, theta, phi.alt$):* ($theta$=polar, $phi.alt$=azimuthal)
  $nabla^2 u = ((1) / (rho^2)) (dif) / (dif rho) (rho^2 (dif u) / (dif rho)) + ((1) / (rho^2 sin theta)) (dif) / (dif theta) (sin theta (dif u) / (dif theta)) + ((1) / (rho^2 sin^2 theta)) (dif^2 u) / (dif phi.alt^2)$
  - *Radial only:* $nabla^2 u = (((dif^2) / (dif rho^2)) (rho u)) / (rho)$

== 12. Special Function Identities
#section_rule
- *Bessel:* $(dif) / (dif x) (x^n J_n(x)) = x^n J_(n-1)(x)$ and $(dif) / (dif x) (x^(-n) J_n(x)) = -x^(-n) J_(n+1)(x)$
  - $integral x J_0(x) dif x = x J_1(x)$
- *Legendre:* $P_n(1)=1, P_n(-1)=(-1)^n, P_0=1, P_1=x, P_2 = (1) / (2) (3x^2-1)$
  - *Orthogonality:* $integral_(-1)^1 P_n (x) P_m (x) dif x = (2) / (2n+1) delta_(n,m)$

== 13. Mathematical Toolkit
#section_rule
- *Trig:* $sin A cos B = (1) / (2) [sin(A+B) + sin(A-B)]$
  - $sin^2 x = (1 - cos 2x) / (2)$, $cos^2 x = (1 + cos 2x) / (2)$
- *Common Integrals:*
  - $integral_0^L x sin((n pi x) / (L)) dif x = ((-1)^(n+1) L^2) / (n pi)$
  - $integral_0^L x cos((n pi x) / (L)) dif x = (L^2) / (n^2 pi^2) ((-1)^n - 1)$
  - $integral x^2 sin x dif x = 2x sin x - (x^2-2) cos x$

== 14. Numerical "Must-Haves"
#section_rule
- *Bessel Zeros ($J_m(z_(m,k))=0$):*
  - $J_0: z approx 2.405, 5.520, 8.654$
  - $J_1: z approx 3.832, 7.016, 10.173$
- *Values:* $J_0(0)=1, J_n(0)=0$ for $n>0$.
- *Stirling:* $n! approx sqrt(2 pi n) ((n) / (e))^n$.

== 15. Strategy: Inhomogeneous PDEs
#section_rule
*Goal:* Solve $L[u] = f(bold(r), t)$ with BC $u(S) = g(S)$.
1. *Homogenize BCs:* Find a simple $w(bold(r))$ that satisfies the BCs. Let $v = u - w$.
2. *New PDE:* $v$ satisfies $L[v] = f - L[w]$ with *homogeneous* BCs.
3. *Expand:* Let $v = sum a_n(t) phi.alt_n (bold(r))$, where $phi.alt_n$ are eigenfunctions of the *spatial* part.
4. *ODE:* Plug into PDE $\to (dif a_n) / (dif t) + k lambda_n a_n(t) = f_n(t)$ (for Heat). Solve via Integrating Factor.

#pagebreak()

== Worked Examples (Step-by-Step)
#section_rule

=== Example 1: Fourier Series & Fredholm
*Question:* (a) Cos series for $x^2$ on $[0,1]$, (b) Sine series continuity, (c) Fredholm Alt for $(dif^2 u) / (dif x^2) + 4u = cos x, ((dif u) / (dif x))(0)=((dif u) / (dif x))(pi)=0$.
*Steps:*
1. Cos series: $f(x)=x^2$ even, $L=1$. $a_0 = integral_0^1 x^2 dif x = (1) / (3)$. $a_n = 2 integral_0^1 x^2 cos(n pi x) dif x$.
2. Sine series: Requires *odd* extension to be continuous $arrow f(0)=f(L)=0$.
3. Fredholm: Zero-mode $phi.alt_h = cos(2x)$. Sol exists if $integral_0^pi (cos x) cos(2x) dif x = 0$.
*Result:* (a) $a_n = (4(-1)^n) / (n^2 pi^2)$. (c) Integral is $0 arrow$ solution exists.

=== Example 2: 2D Heat Rectangle
*Question:* Solve $(dif u) / (dif t) = k nabla^2 u$ on $[0,L] times [0,H]$ with $u_x(0)=u_x(L)=0$ and $u(0)=u(H)=0$.
*Steps:*
1. $u = X(x)Y(y)T(t) arrow ((dif^2 X) / (dif x^2)) / (X) + ((dif^2 Y) / (dif y^2)) / (Y) = ((dif T) / (dif t)) / (k T) = -lambda$.
2. BCs $X$: $((dif X) / (dif x))(0)=((dif X) / (dif x))(L)=0 arrow X_n = cos((n pi x) / (L)), lambda_x = ((n pi) / (L))^2$.
3. BCs $Y$: $Y(0)=Y(H)=0 arrow Y_m = sin((m pi y) / (H)), lambda_y = ((m pi) / (H))^2$.
4. $T(t) = e^(-k(lambda_x + lambda_y) t)$. Dominant mode is $n=0, m=1$.
*Result:* $u_(n,m) = cos((n pi x) / (L)) sin((m pi y) / (H)) e^(-k lambda_(n,m) t)$.

=== Example 3: Cauchy-Euler Sturm-Liouville
*Question:* Solve $x^2 (dif^2 phi.alt) / (dif x^2) + x (dif phi.alt) / (dif x) + lambda phi.alt = 0$ on $[1, b]$ with $phi.alt(1)=phi.alt(b)=0$.
*Steps:*
1. SL-Form: $(dif) / (dif x) (x (dif phi.alt) / (dif x)) + (lambda) / (x) phi.alt = 0$. $p=x, sigma= (1) / (x)$.
2. Sub $x = e^z arrow z = ln x$. Yields $(dif^2 phi.alt) / (dif z^2) + lambda phi.alt = 0$.
3. $phi.alt(0)=0 arrow phi.alt(z) = B sin(sqrt(lambda) z)$.
4. $phi.alt(ln b)=0 arrow sqrt(lambda) ln b = n pi$.
*Result:* $phi.alt_n (x) = sin((n pi ln x) / (ln b))$, $lambda_n = ((n pi) / (ln b))^2$.

=== Example 4: Damped Wave (Friction)
*Question:* Solve $rho (dif^2 u) / (dif t^2) = T_0 (dif^2 u) / (dif x^2) + beta (dif u) / (dif t)$ with $u(0)=u(L)=0$.
*Steps:*
1. SOV: $u=X(x)T(t) arrow X_n = sin((n pi x) / (L)), lambda_n = ((n pi) / (L))^2$.
2. Temporal: $(dif^2 T) / (dif t^2) - (beta) / (rho) (dif T) / (dif t) + ((lambda_n T_0) / (rho)) T = 0$.
3. Solve $r^2 - (beta) / (rho) r + omega_0^2 = 0$.
*Result:* $u$ decays as $e^( (beta t) / (2 rho) )$. Underdamped for large $n$ (oscillates).

=== Example 5: Quarter Disk Membrane
*Question:* Find frequencies for $(dif^2 u) / (dif t^2) = c^2 nabla^2 u$ on $0 < theta < (pi) / (2), 0 < r < b, u=0$ on boundaries.
*Steps:*
1. Angular: $Theta(0)=Theta((pi) / (2))=0 arrow Theta_m = sin(2 m theta), mu = (2m)^2$.
2. Radial: $r^2 (dif^2 R) / (dif r^2) + r (dif R) / (dif r) + (lambda r^2 - (2m)^2)R = 0 arrow R = J_(2m)(sqrt(lambda) r)$.
3. BC: $R(b)=0 arrow sqrt(lambda) b = z_(2m,k) arrow omega = (c z_(2m,k)) / (b)$.
*Result:* $omega_(m,k) = (c z_(2m,k)) / (b)$. Fundamental is $m=1, k=1$.

=== Example 6: Poisson Eq (Inhomogeneity)
*Question:* Solve $nabla^2 u = f(x,y)$ on rectangle with $u(x,H)=g(x)$ and others zero.
*Steps:*
1. Split $u = u_("bulk") + u_("bound")$. $nabla^2 u_b = f$ (BCs 0) and $nabla^2 u_s = 0$ ($u_s(H)=g$).
2. Bulk: $u_b = sum A_(n,m) sin((n pi x) / (L)) sin((m pi y) / (H))$ where $A_(n,m) = (-f_(n,m)) / (lambda_(n,m))$.
3. Bound: $u_s = sum B_n sin((n pi x) / (L)) sinh((n pi y) / (L))$ where $B_n = (g_n) / (sinh((n pi H) / (L)))$.
*Result:* $u = u_("bulk") + u_("boundary")$.

=== Example 7: Inhomog. Heat & Avg Temp
*Question:* Solve $(dif u) / (dif t) = kappa (dif^2 u) / (dif x^2) + Q(x,t)$ with $u(0)=T_1, u(L)=T_2$.
*Steps:*
1. Shift: $v = u - [T_1 + ((T_2-T_1)x) / (L)]$. New PDE: $(dif v) / (dif t) = kappa (dif^2 v) / (dif x^2) + Q$.
2. Expand: $v = sum a_n (t) sin((n pi x) / (L)) arrow (dif a_n) / (dif t) + kappa lambda_n a_n = q_n(t)$.
3. Avg Temp: $(dif T_("avg")) / (dif t) = ((kappa) / (L)) [(dif u) / (dif x)]_0^L + ((1) / (L)) integral_0^L Q dif x$.
*Result:* $u = w(x) + sum a_n(t) sin((n pi x) / (L))$.

=== Example 8: Thick Spherical Shell
*Question:* Solve $nabla^2 u = 0$ for $a <= rho <= b$ with $u(a)=0, u(b)=V_0$.
*Steps:*
1. Radial: $(dif) / (dif rho) (rho^2 (dif u) / (dif rho)) = 0 arrow u(rho) = A - (B) / (rho)$.
2. BCs: $u(a) = A - (B) / (a) = 0$ and $u(b) = A - (B) / (b) = V_0$.
3. Solve: $A = (B) / (a) arrow B((1) / (a) - (1) / (b)) = V_0$.
*Result:* $u(rho) = V_0 ((b) / (b-a)) (1 - (a) / (rho))$.

=== Example 9: Wave Eq Resonance
*Question:* Solve $(dif^2 u) / (dif t^2) = c^2 (dif^2 u) / (dif x^2)$ with $u(0,t)=0, u(L,t)=sin(omega t)$.
*Steps:*
1. Ref: $w = ((x) / (L)) sin(omega t)$. $v = u - w arrow (dif^2 v) / (dif t^2) - c^2 (dif^2 v) / (dif x^2) = ((x) / (L)) omega^2 sin(omega t)$.
2. Expand: $v = sum a_n(t) sin((n pi x) / (L)) arrow (dif^2 a_n) / (dif t^2) + omega_n^2 a_n = q_n sin(omega t)$.
3. Resonance: If $omega = omega_n = (n pi c) / (L)$, $a_n(t)$ grows linearly with $t$.
*Result:* $u$ blows up if driving $omega$ matches an eigenfrequency $omega_n$.

=== Example 10: Stability & Robin BC
*Question:* Check stability of $(dif u) / (dif t) = kappa (dif^2 u) / (dif x^2)$ with $u(0)=0, ((dif u) / (dif x))(L) = -h u(L)$.
*Steps:*
1. $X = sin(sqrt(lambda) x)$. BC: $sqrt(lambda) cos(sqrt(lambda) L) = -h sin(sqrt(lambda) L)$.
2. $tan(sqrt(lambda) L) = (-sqrt(lambda)) / (h)$. Let $z = sqrt(lambda) L, tan z = (-z) / (h L)$.
3. Instability ($lambda < 0$): Occurs if slope of $tan z$ at 0 is less than slope of $(-z) / (h L)$.
*Result:* Unstable if $1 < (-1) / (h L) arrow h < (-1) / (L)$.

=== Example 11: Mixed BCs (1D Wave)
*Question:* Solve $(dif^2 u) / (dif t^2) = c^2 (dif^2 u) / (dif x^2)$ with $u(0) - ((dif u) / (dif x))(0) = 0, ((dif u) / (dif x))(L) = 0$.
*Steps:*
1. $X = A cos(sqrt(lambda) x) + B sin(sqrt(lambda) x)$.
2. BC1: $X(0) - ((dif X) / (dif x))(0) = A - sqrt(lambda) B = 0 arrow A = sqrt(lambda) B$.
3. BC2: $((dif X) / (dif x))(L) = -A sqrt(lambda) sin(sqrt(lambda) L) + B sqrt(lambda) cos(sqrt(lambda) L) = 0$.
4. Combine: $sqrt(lambda) B [sqrt(lambda) sin(sqrt(lambda) L) - cos(sqrt(lambda) L)] = 0$.
*Result:* $tan(sqrt(lambda) L) = (1) / (sqrt(lambda))$.

=== Example 12: Heat Eq in Disk (Radial)
*Question:* Solve $(dif u) / (dif t) = kappa nabla^2 u$ on $r <= a$ with $u(a,t)=0, u(r,0)=f(r)$.
*Steps:*
1. SOV: $u = R(r)T(t) arrow r^2 (dif^2 R) / (dif r^2) + r (dif R) / (dif r) + lambda r^2 R = 0 arrow R = J_0(sqrt(lambda) r)$.
2. BC: $R(a)=0 arrow sqrt(lambda) a = z_(0,k) arrow lambda_k = ((z_(0,k)) / (a))^2$.
3. IC: $u = sum A_k J_0((z_(0,k) r) / (a)) e^(-kappa lambda_k t)$.
*Result:* $u(r,t) = sum A_k J_0((z_(0,k) r) / (a)) e^(-kappa ((z_(0,k)) / (a))^2 t)$.

=== Example 13: Mixed Heat Rod
*Question:* Solve Heat Eq with one end fixed at 0 and the other insulated.
*Steps:*
1. Set $u = X(x)T(t)$. $X(0)=0 arrow X = sin(sqrt(lambda) x)$.
2. Insulated at $x=L arrow ((dif X) / (dif x))(L)=0 arrow cos(sqrt(lambda) L)=0$.
3. Solve for $lambda arrow sqrt(lambda) L = (n + (1) / (2)) pi$.
*Result:* $u_(n) = sin(((n + (1) / (2)) pi x) / (L)) e^(-kappa lambda_n t)$.
