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
- *Heat Eq:* $partial_t u = k nabla^2 u$ (Diffusion). Decay: $e^(-k lambda t)$.
- *Wave Eq:* $partial_t^2 u = c^2 nabla^2 u$ (Oscillation). Sols: $cos(omega t), sin(omega t)$.
- *Helmholtz Eq:* $nabla^2 psi + k^2 psi = 0$. From Wave Eq: $u(bold(r), t) = psi(bold(r)) e^(-i omega t)$.
- *Poisson Eq:* $nabla^2 u = f(bold(r))$ (Inhomogeneous Laplace)

== 2. Separation of Variables (SOV)
#section_rule
*Context:* Linear homogeneous PDE + homogeneous BCs.
1. Assume $u(bold(r), t) = X(bold(r))T(t)$. Yields $N$ ODEs and $N-1$ constants.
2. Substitute & Separate: $T' / (k T) = (nabla^2 X) / X = -lambda$.
3. Solve Spatial BVP: $nabla^2 X + lambda X = 0$ with given BCs.
4. Solve Temporal ODE: $T' + lambda k T = 0 arrow.double T(t) = C e^(-lambda k t)$.
5. Sum Modes: $u(bold(r), t) = sum c_n X_n (bold(r)) T_n (t)$.
6. Apply IC: $u(bold(r), 0) = f(bold(r))$ using Fourier orthogonality.

== 3. Non-Homogeneous Problems
#section_rule
- *Splitting Trick:* If multiple non-homo BCs, split $u = u_1 + u_2 + dots$ where each $u_i$ has only ONE non-homo BC. Sum results.
- *Time-Independent BCs:* $u(x,t) = v(x,t) + u_E (x)$, where $u_E$ is the equilibrium solution ($partial_t u_E = 0$).
- *Time-Dependent BCs:* $u(x,t) = v(x,t) + r(x,t)$, where $r(x,t)$ is a simple reference function (e.g., $A + x/L(B-A)$) matching the BCs.
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
- *Regular 1D Form:* $-(p phi.alt')' + q phi.alt = lambda sigma phi.alt$. $p, q, sigma$ real/cont., $p, sigma > 0$.
- *Rayleigh Quotient (Multi-D):*
  #v(2pt)
  $
    lambda = (-integral_S p phi.alt nabla phi.alt dot bold(n) dif S + integral_V [p |nabla phi.alt|^2 + q phi.alt^2] dif V) / (integral_V phi.alt^2 sigma dif V)
  $
  #v(2pt)
- *1D Case ($x in [a,b]$):*
  #v(2pt)
  $
    lambda = ([-p phi.alt phi.alt']_a^b + integral_a^b [p (phi.alt')^2 + q phi.alt^2] dif x) / (integral_a^b phi.alt^2 sigma dif x)
  $
  #v(2pt)

== 6. Green's Functions (Constructing $G$)
#section_rule
*Definition:* $L[G(bold(r), bold(r)_0)] = delta(bold(r) - bold(r)_0)$ with homogeneous BCs.
- *Direct Method (1D):*
  1. *Homogeneous:* Solve $L[phi.alt] = 0$.
  2. *BCs:* $u_1$ satisfies Left BC, $u_2$ satisfies Right BC.
  3. *Form:* $G(x, x_0) = cases(C u_1(x) u_2(x_0) & x < x_0, C u_1(x_0) u_2(x) & x > x_0)$
  4. *Jump:* $C = -1 / (p(x_0) W(u_1, u_2)(x_0))$, where $W = u_1 u_2' - u_1' u_2$.
- *Eigenfunction Expansion:*
  $G(bold(r), bold(r)_0) = sum_n (phi.alt_n (bold(r)) phi.alt_n (bold(r)_0)) / (lambda_n N_n)$, where $N_n = integral phi.alt_n^2 sigma dif V$.
- *Inhomogeneous BCs:* If $u(a)=alpha, u(b)=beta$:
  $u = integral G f + [-p alpha partial_(x_0) G]_(x_0=a) + [p beta partial_(x_0) G]_(x_0=b)$.

== 7. Standard ODE Solutions
#section_rule
#set text(size: 4.5pt)
#table(
  columns: (0.5fr, 1fr, 1.5fr, 0.8fr),
  inset: 2pt,
  fill: (x, y) => if y == 0 { gray.lighten(80%) },
  [*Geom*], [*Equation Form*], [*General Solutions*], [*Regularity*],
  [Rect. $x$],
  [$phi.alt'' + lambda phi.alt = 0$],
  [$lambda > 0: A cos(sqrt(lambda) x) + B sin(sqrt(lambda) x)$\ $lambda = 0: A x + B$\ $lambda < 0: A cosh + B sinh$],
  [$lambda = (n pi / L)^2$ (Dir.)],

  [Cyl. $r$],
  [$r^2 f'' + r f' + (lambda r^2 - m^2)f = 0$],
  [$lambda > 0: A J_m + B Y_m$\ $lambda = 0: A r^m + B r^(-m)$ ($m=0: ln r$)\ $lambda < 0: A I_m + B K_m$],
  [If $0 in V$: no $Y_m, K_m, ln, r^(-m)$],

  [Sph. $rho$],
  [$(rho^2 f')' + (lambda rho^2 - n(n+1))f = 0$],
  [$lambda > 0: A j_n + B y_n$\ $lambda = 0: A rho^n + B rho^(-(n+1))$],
  [If $0 in V$: no $y_n, rho^(-(n+1))$],

  [Sph. $theta$],
  [$((1-x^2)g')' + (lambda - dots)g = 0$],
  [$lambda = n(n+1)$\ $g = A P_n^m (cos theta) + B Q_n^m (cos theta)$],
  [If $0, pi in V$: discard $Q_n^m$],
)
#set text(size: 5pt)

== 8. Practical Tips & Tricks
#section_rule
- *Regularity:* If $|u(0)| < infinity$, discard singular solutions ($Y_m, K_m, Q_n^m, ln r, r^(-n)$).
- *Late Time:* Only the mode with the *smallest* $lambda > 0$ survives.
- *Equilibrium:* Set $partial_t u = 0$ (Heat) or $partial_t^2 u = 0$ (Wave) $arrow$ solve $nabla^2 u = f$.
- *Fredholm:* $L[u]=f$ has sol iff $integral f phi.alt_h sigma = 0$ for zero-modes $phi.alt_h$.

== 9. Shortcuts & Universal Solving Steps
#section_rule
- *Coord. Change:* (Cauchy-Euler) $x^2 phi.alt'' + x phi.alt' + lambda phi.alt = 0 arrow (x phi.alt')' + (lambda/x) phi.alt = 0$. Sub $x = e^z arrow phi.alt''(z) + lambda phi.alt(z) = 0$.
- *Eigenvalues ($lambda$):* Check $lambda=0$ (e.g. Neumann BCs). Check $lambda<0$ (e.g. $u'(L)=+h u(L)$).
- *Bessel Zeros:* $z_(m,k) approx (k + m/2 - 1/4) pi$. Small $x: J_m(x) approx (x/2)^m / m!$.
- *Logic for Basis:* $u(0)=0 arrow sin/sinh$; $u'(0)=0 arrow cos/cosh$. $u(L)=0 arrow sin(sqrt(lambda)(L-x))$.
- *Fourier-Bessel ($J_m$):* $f(r) approx sum A_k J_m(z_(m,k) r/a) arrow A_k = (2/ (a^2 J_(m+1)^2 (z_(m,k)))) integral_0^a f(r) J_m(z_(m,k) r/a) r dif r$.
- *Orthogonality:* $integral_0^L sin^2(n pi x / L) = L/2$. $integral_0^pi sin^2(n x) = pi/2$. $integral_0^pi cos^2(n x) = pi/2$ (if $n=0$: $pi$).
- *Sanity Checks:* 1. Units. 2. Symmetry. 3. BC Match. 4. Equilibrium.

== 10. Quick Eigenvalue Table ($phi.alt'' + lambda phi.alt = 0$)
#section_rule
#table(
  columns: (1fr, 1.2fr, 1.5fr),
  inset: 2pt,
  [*BCs ($x=0, L$)*],
  [*Eigenvalues ($lambda_n$)*],
  [*Eigenfunctions ($phi.alt_n$)*],

  [Dirichlet (0, 0)], [$(n pi / L)^2$], [$sin(n pi x / L) quad (n=1,2,...)$],
  [Neumann (0, 0)], [$(n pi / L)^2$], [$cos(n pi x / L) quad (n=0,1,...)$],
  [Mixed (Dir, Neu)], [$((n+1/2) pi / L)^2$], [$sin((n+1/2) pi x / L)$],
  [Mixed (Neu, Dir)], [$((n+1/2) pi / L)^2$], [$cos((n+1/2) pi x / L)$],
  [Periodic], [$(2 n pi / L)^2$], [$1, cos(2 n pi x / L), sin(2 n pi x / L)$],
)

== 11. Coordinate Systems ($nabla^2 u$)
#section_rule
- *Cylindrical ($r, theta, z$):*
  $nabla^2 u = 1/r partial_r (r partial_r u) + 1/r^2 partial_theta^2 u + partial_z^2 u$
- *Spherical ($rho, theta, phi.alt$):* ($theta$=polar, $phi.alt$=azimuthal)
  $nabla^2 u = 1/rho^2 partial_rho (rho^2 partial_rho u) + 1/(rho^2 sin theta) partial_theta (sin theta partial_theta u) + 1/(rho^2 sin^2 theta) partial_phi.alt^2 u$
  - *Radial only:* $nabla^2 u = (rho u)'' / rho$

== 12. Special Function Identities
#section_rule
- *Bessel:* $d / (d x) [x^n J_n(x)] = x^n J_(n-1)(x)$ and $d / (d x) [x^(-n) J_n(x)] = -x^(-n) J_(n+1)(x)$
  - $integral x J_0(x) dif x = x J_1(x)$
- *Legendre:* $P_n(1)=1, P_n(-1)=(-1)^n, P_0=1, P_1=x, P_2=1/2(3x^2-1)$
  - *Orthogonality:* $integral_(-1)^1 P_n (x) P_m (x) dif x = 2 / (2n+1) delta_(n,m)$

== 13. Mathematical Toolkit
#section_rule
- *Trig:* $sin A cos B = 1/2 [sin(A+B) + sin(A-B)]$
  - $sin^2 x = (1-cos 2x)/2$, $cos^2 x = (1+cos 2x)/2$
- *Common Integrals:*
  - $integral_0^L x sin(n pi x / L) dif x = (-1)^(n+1) L^2 / (n pi)$
  - $integral_0^L x cos(n pi x / L) dif x = L^2 / (n^2 pi^2) ((-1)^n - 1)$
  - $integral x^2 sin x dif x = 2x sin x - (x^2-2) cos x$

== 14. Numerical "Must-Haves"
#section_rule
- *Bessel Zeros ($J_m(z_(m,k))=0$):*
  - $J_0: z approx 2.405, 5.520, 8.654$
  - $J_1: z approx 3.832, 7.016, 10.173$
- *Values:* $J_0(0)=1, J_n(0)=0$ for $n>0$.
- *Stirling:* $n! approx sqrt(2 pi n) (n/e)^n$.

== 15. Strategy: Inhomogeneous PDEs
#section_rule
*Goal:* Solve $L[u] = f(bold(r), t)$ with BC $u(S) = g(S)$.
1. *Homogenize BCs:* Find a simple $w(bold(r))$ that satisfies the BCs. Let $v = u - w$.
2. *New PDE:* $v$ satisfies $L[v] = f - L[w]$ with *homogeneous* BCs.
3. *Expand:* Let $v = sum a_n(t) phi.alt_n (bold(r))$, where $phi.alt_n$ are eigenfunctions of the *spatial* part.
4. *ODE:* Plug into PDE $\to a_n'(t) + k lambda_n a_n(t) = f_n(t)$ (for Heat). Solve via Integrating Factor.

#pagebreak()

== Worked Examples (Step-by-Step)
#section_rule

=== Example 1: Conceptual & Shorties
*(a) Cosine series $x^2$ on $[0,1]$:* 1. $f(x)=x^2$ is even $arrow$ only cosines. 2. Period $P=2$, half-period $L=1$. 3. $a_0 = (1/1) integral_0^1 x^2 dif x = 1/3$. 4. $a_n = (2/1) integral_0^1 x^2 cos(n pi x) dif x = (4(-1)^n) / (n^2 pi^2)$. 5. Extension is continuous because $f(0)=0$ and $f(1)=1$ match periodic copies.
*(b) Sine series continuity:* $f(x) approx sum b_n sin(n pi x / L)$. Requires *odd* periodic extension to be continuous $arrow f(0)=f(L)=0$ must hold.
*(c) Fredholm Alt:* $u'' + 4u = cos x, u'(0)=u'(pi)=0$. 1. $u_h = A cos(2x) + B sin(2x)$. 2. BCs: $u'(0)=2B=0 arrow B=0, u'(pi)=-2A sin(2 pi)=0 arrow$ True for all $A$. 3. Zero-mode $phi.alt_h = cos(2x)$. 4. Sol exists if $integral_0^pi cos x cos(2x) dif x = 0$. Since $cos x cos(2x) = 1/2 (cos 3x + cos x)$, integral over $[0, pi]$ is 0.

=== Example 2: 2D Heat Rectangle (Diffusion)
$partial_t u = k nabla^2 u$ on $[0,L] times [0,H]$. BCs: $u_x(0,t)=u_x(L,t)=0$; $u(x,0,t)=u(x,H,t)=0$.
1. *SOV:* $u = X(x)Y(y)T(t) arrow T'/(k T) = X''/X + Y''/Y = -lambda$.
2. *Spatial:* $X'' + lambda_x X = 0, Y'' + lambda_y Y = 0$ where $lambda = lambda_x + lambda_y$.
3. *BCs X:* $X'(0)=X'(L)=0 arrow X_n = cos(n pi x / L), lambda_n = (n pi / L)^2, n in (0,1,...)$.
4. *BCs Y:* $Y(0)=Y(H)=0 arrow Y_m = sin(m pi y / H), lambda_m = (m pi / H)^2, m in (1,2,...)$.
5. *Temporal:* $T' = -k(lambda_n + lambda_m) T arrow T = e^(-k lambda_(n,m) t)$.
6. *Dominant:* Smallest $lambda > 0$ is $n=0, m=1 arrow lambda_(0,1) = (pi/H)^2$. $u approx A_(0,1) sin(pi y / H) e^(-k(pi/H)^2 t)$.

=== Example 3: Cauchy-Euler Sturm-Liouville
$x^2 phi.alt'' + x phi.alt' + lambda phi.alt = 0$ on $[1, b]$ with $phi.alt(1)=phi.alt(b)=0$.
1. *SL-Form:* Divide by $x arrow (x phi.alt')' + (lambda/x) phi.alt = 0$. $p=x, q=0, sigma=1/x$.
2. *Positivity:* Dirichlet BCs $arrow lambda > 0$ via Rayleigh quotient.
3. *Sub:* Let $x=e^z arrow z=ln x$. $(x 1/x dif/dif z) 1/x dif/dif z + lambda/x phi.alt = 0 arrow dif^2/dif z^2 phi.alt + lambda phi.alt = 0$.
4. *Solve:* $phi.alt(z) = A cos(sqrt(lambda) z) + B sin(sqrt(lambda) z)$. $phi.alt(0)=0 arrow A=0$. $phi.alt(ln b)=0 arrow sqrt(lambda) ln b = n pi$.
5. *Result:* $phi.alt_n (x) = sin((n pi ln x) / ln b)$, $lambda_n = (n pi / ln b)^2, n=1,2,...$

=== Example 4: Damped Wave (Friction)
$rho partial_t^2 u = T_0 partial_x^2 u + beta partial_t u$ ($beta < 0$ friction). $u(0)=u(L)=0$.
1. *SOV:* $u=X(x)T(t) arrow rho T'' / T - beta T' / T = T_0 X'' / X = -lambda T_0$.
2. *Spatial:* $X'' + lambda X = 0, X(0)=X(L)=0 arrow X_n = sin(n pi x / L), lambda_n = (n pi / L)^2$.
3. *Temporal:* $T'' - (beta/rho) T' + (lambda_n T_0 / rho) T = 0$. Let $c=beta/rho, omega_0^2 = lambda_n T_0 / rho$.
4. *Roots:* $r = (c/2) plus.minus sqrt((c/2)^2 - omega_0^2)$.
  - *Overdamped:* $(c/2)^2 > omega_0^2$ (Small $n$) $arrow$ Two real decay roots $r_1, r_2 < 0$. $T = A e^(r_1 t) + B e^(r_2 t)$.
  - *Underdamped:* $(c/2)^2 < omega_0^2$ (Large $n$) $arrow$ Complex roots $r = c/2 plus.minus i omega_d$. $T = e^(c/2 t) (A cos(omega_d t) + B sin(omega_d t))$.

=== Example 5: Quarter Disk Membrane (Wave Eq)
$partial_t^2 u = c^2 nabla^2 u$ on $0 < theta < pi / 2, 0 < r < b$. $u=0$ on all boundaries.
1. *Theta:* $Theta'' + mu Theta = 0, Theta(0)=Theta(pi/2)=0 arrow Theta_m = sin(2 m theta), mu = (2m)^2$.
2. *Radial:* $r^2 R'' + r R' + (lambda r^2 - (2m)^2)R = 0$. Regularity $arrow R(r) = J_(2m)(sqrt(lambda) r)$.
3. *BC:* $R(b)=0 arrow sqrt(lambda) b = z_(2m,k) arrow lambda_(m,k) = (z_(2m,k) / b)^2$.
4. *Freqs:* $omega_(m,k) = c sqrt(lambda) = c z_(2m,k) / b$. Fundamental is $m=1, k=1 arrow omega_(1,1) = c z_(2,1) / b$.

=== Example 6: Poisson Eq (Inhomogeneity)
$nabla^2 u = f(x,y)$ on $[0,L] times [0,H]$, $u(x,H)=g(x)$, others zero.
1. *Split:* $u = u_("bulk") + u_("boundary")$ where $nabla^2 u_b = f$ (BCs 0) and $nabla^2 u_s = 0$ ($u_s(x,H)=g(x)$).
2. *Bulk:* Use 0-BC eigenfunctions $phi.alt_(n,m) = sin(n pi x / L) sin(m pi y / H), lambda_(n,m) = (n pi / L)^2 + (m pi / H)^2$.
  - $u_b = sum sum A_(n,m) phi.alt_(n,m)$. Substitute into PDE $arrow -lambda_(n,m) A_(n,m) = f_(n,m)$.
  - $A_(n,m) = (f_(n,m)) / (-lambda_(n,m))$ where $f_(n,m) = (chevron.l f | phi.alt_(n,m) chevron.r) / (chevron.l phi.alt_(n,m) | phi.alt_(n,m) chevron.r)$.
3. *Surface:* $X_n = sin(n pi x / L)$. $Y'' - (n pi / L)^2 Y = 0 arrow Y_n = sinh(n pi y / L)$ (since $Y(0)=0$).
  - $u_s = sum B_n sin(n pi x / L) sinh(n pi y / L)$. Match $u_s(x,H) = g(x) arrow B_n sinh(n pi H / L) = g_n$.
  - $B_n = g_n / sinh(n pi H / L)$ where $g_n$ is Fourier Sine coefficient of $g(x)$.

=== Example 7: Inhomog. Heat & Avg Temp
$partial_t u = kappa partial_x^2 u + Q(x,t)$ with $u(0,t)=T_1, u(L,t)=T_2$.
1. *Ref:* $w(x) = T_1 + (T_2 - T_1) x/L$ to satisfy BCs. Let $v = u - w$.
2. *PDE for v:* $partial_t v = kappa partial_x^2 v + Q(x,t)$ with $v(0)=v(L)=0$.
3. *Expansion:* $v = sum a_n(t) sin(n pi x / L)$. Expand source $Q(x,t) = sum q_n(t) sin(n pi x / L)$.
4. *ODE:* $a_n'(t) + kappa (n pi / L)^2 a_n(t) = q_n(t)$. Solve: $a_n(t) = a_n(0)e^(-kappa lambda_n t) + integral_0^t e^(-kappa lambda_n (t-tau)) q_n(tau) dif tau$.
5. *Avg Temp:* $T_("avg")(t) = (1/L) integral_0^L u(x,t) dif x$. Use $dif / dif t T_("avg") = (kappa/L) [u_x]_0^L + (1/L) integral_0^L Q dif x$.

=== Example 8: Thick Spherical Shell (Laplace)
$nabla^2 u = 0$ on $a <= rho <= b$. BCs: $u(rho=a)=0, u(rho=b)=V_0$ (symmetric).
1. *Equation:* Symmetric $arrow u(rho)$ only. $1/rho^2 dif/dif rho (rho^2 u') = 0 arrow rho^2 u' = B$.
2. *General:* $u' = B/rho^2 arrow u(rho) = A - B/rho$.
3. *Match:* $u(a) = A - B/a = 0 arrow A = B/a$.
  - $u(b) = B/a - B/b = V_0 arrow B(b-a)/(a b) = V_0 arrow B = V_0 (a b)/(b-a)$.
4. *Result:* $u(rho) = V_0 (a b)/(b-a) (1/a - 1/rho) = V_0 (b/(b-a)) (1 - a/rho)$.


=== Example 9: Wave Eq Resonance
$u_(t,t) = c^2 u_(x,x)$ with $u(0,t)=0, u(L,t)=sin(omega t)$.
1. *Ref:* $w(x,t) = (x/L) sin(omega t)$. Let $v = u - w$.
2. *PDE for v:* $v_(t,t) - c^2 v_(x,x) = -(w_(t,t) - c^2 w_(x,x)) = (x/L) omega^2 sin(omega t)$.
3. *Expansion:* $v = sum a_n(t) sin(n pi x / L) arrow a_n'' + omega_n^2 a_n = q_n sin(omega t)$, where $omega_n = n pi c / L$.
4. *Resonance:* If $omega = omega_n$, particular solution $a_n(t)$ grows as $t cos(omega_n t)$. Amplitude $\to infinity$.

=== Example 10: Stability & Robin BC (Heat)
$u_t = kappa u_(x,x)$ with $u(0,t)=0, u_x(L,t) = -h u(L,t)$.
1. *SOV:* $X(x) = sin(sqrt(lambda) x), T(t) = e^(-kappa lambda t)$.
2. *BC:* $sqrt(lambda) cos(sqrt(lambda) L) = -h sin(sqrt(lambda) L) arrow tan(sqrt(lambda) L) = -sqrt(lambda)/h$.
3. *Roots:* Let $z = sqrt(lambda) L$. $tan z = -z / (h L)$.
4. *Instability:* $lambda < 0$ exists if slope of $tan z$ at origin $(1)$ is less than slope of $-z/(h L)$.
  - $1 < -1/(h L) arrow h L < -1 arrow h < -1/L$.
  - If $h < -1/L$, then $T(t) = e^(kappa gamma^2 t)$ (Unstable).

=== Example 11: Mixed BCs (1D Wave)
$u_(t,t) = c^2 u_(x,x)$ with $u(0) - u_x(0) = 0, u_x(L) = 0$.
1. *SOV:* $X(x) = A cos(sqrt(lambda) x) + B sin(sqrt(lambda) x)$.
2. *BC1:* $X(0) - X'(0) = A - sqrt(lambda) B = 0 arrow A = sqrt(lambda) B$.
3. *BC2:* $X'(L) = -A sqrt(lambda) sin(sqrt(lambda) L) + B sqrt(lambda) cos(sqrt(lambda) L) = 0$.
4. *Combine:* Substitute $A$ into BC2 $arrow sqrt(lambda) B [sqrt(lambda) sin(sqrt(lambda) L) - cos(sqrt(lambda) L)] = 0$.
5. *Result:* $tan(sqrt(lambda) L) = 1/sqrt(lambda)$. For large $lambda$, $tan z approx 0 arrow sqrt(lambda) L approx n pi$.

=== Example 12: Heat Eq in Disk (Radial)
$u_t = kappa nabla^2 u$ on $0 <= r <= a$. $u(a,t)=0$. $u(r, theta, 0) = f(r)$.
1. *SOV:* $u=R(r)T(t)$. $r^2 R'' + r R' + lambda r^2 R = 0$ (Bessel $m=0$).
2. *Radial:* $R(r) = A J_0(sqrt(lambda) r) + B Y_0(sqrt(lambda) r)$. Regularity $arrow B=0$.
3. *BC:* $R(a)=0 arrow J_0(sqrt(lambda) a) = 0 arrow sqrt(lambda)_k a = z_(0,k) arrow lambda_k = (z_(0,k) / a)^2$.
4. *Dominant:* Smallest zero $z_(0,1) approx 2.405$. $u approx A_1 J_0(z_(0,1) r / a) e^(-kappa(z_(0,1)/a)^2 t)$.

=== Example 13: Mixed Heat Rod (1D)
$u_t = kappa u_(x,x)$ on $0 <= x <= L$. BCs: $u(0,t)=0, u_x(L,t)=0$.
1. *SOV:* $X(x) = sin(sqrt(lambda) x)$. $T(t) = e^(-kappa lambda t)$.
2. *BC:* $X'(L) = sqrt(lambda) cos(sqrt(lambda) L) = 0 arrow sqrt(lambda) L = (n + 1/2) pi$.
3. *Freqs:* $lambda_n = ((n+1/2) pi / L)^2$.
4. *Dominant:* $n=0 arrow lambda_0 = (pi / (2 L))^2$. $u approx A_0 sin(pi x / (2 L)) e^(-kappa (pi/(2 L))^2 t)$.
