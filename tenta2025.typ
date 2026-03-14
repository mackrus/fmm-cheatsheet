#import "template.typ": homework
#set page(columns: 4, margin: (x: 0.2cm, y: 0.2cm), flipped: true)
#set document(title: "Mekanik III - Tentamen Mars 2025")
#set page(numbering: "1")
#set text(lang: "sv", size: 5pt)
#set align(center)

// = Lösningsförslag tentamen Mekanik III, mars 2025

=== Exempel 1

*(a)* Beskriv ett system som approximeras av Lagrangianen:
$
  L = 1/2 I_1 (dot(phi)^2 sin^2 theta + dot(theta)^2) + 1/2 I_2 (dot(phi) cos theta + dot(psi))^2 - M g h cos theta
$
där $phi, theta, psi$ är gen. koord. (1p)

*Lösning:* Symmetrisk snurra påverkad av ett yttre kraftmoment orsakat av gravitationen. $phi$, $theta$ och $psi$ beskriver Eulers vinklar.

*(b)* Vad skiljer relativistisk Doppler-effekt från icke-relativistisk? (1p)

*Lösning:* Tidsdilatationen. Ljuset sänds ut från ett kroppsfixt koordinatsystem som rör sig. Under tiden $Delta t'$ rör sig systemet sträckan $v Delta t' =>$ våglängden förskjuts. Lorentztransformation används $=> lambda' = lambda(1 + v/c)$ för den icke-relativistiska. Den extra $gamma$-faktorn tillkommer pga tidsdilatationen.

*(c)* Kopplade svängningar ($q_1, q_2$): Egenfrekvenser $5.3$ och $3.7$ "s"^(-1), egenvektorer $(1,1)$ och $(1,2)$. Ange $q_1(t)$ och $q_2(t)$ med obestämda konstanter. (1p)

*Lösning:* (Notera: enligt ekvationerna matchar andra egenvektorn $(1, -2)$)
$
  q_1(t) & = B_(11)^+ e^(i 5.3 t) + B_(11)^- e^(-i 5.3 t) + B_(12)^+ e^(i 3.7 t) + B_(12)^- e^(-i 3.7 t) \
  q_2(t) & = B_(11)^+ e^(i 5.3 t) + B_(11)^- e^(-i 5.3 t) - 2B_(12)^+ e^(i 3.7 t) - 2B_(12)^- e^(-i 3.7 t)
$

*(d)* Förklara (gärna med bild) hur en gravitationsslunga (gravity assist) fungerar. (1p)

*Lösning:* Solar probes hastighet relativt Venus är densamma före och efter förbiflygningen (rörelsemängdsmomentets bevarande i referenssystemet där Venus är i vila). I inertialsystemet ökar farten hos solar probe (och p.g.a. rörelsemängdens bevarande minskar farten hos Venus något).

*(e)* Feynman observerade en roterande tallrik som "vobblade". Vilket koncept inom stelkroppsmekanik avses? (1p)

*Lösning:* Precession. (Precession hos snurra utan yttre kraftmoment).

=== Exempel 2

Partikel $m$ påverkas av $macron(F) = -b r^3 hat(r)$. Vid $r=a$ är $macron(v) perp macron(r)$ med $v=v_0$.

*(a)* Bestäm $V_("eff")(r)$ och skissa den. Beskriv möjliga banor.

*Lösning:*
Potentialen tas fram via $ V = - integral macron(F) dot d macron(r) = (b r^4)/4 $.
Lagrangianen blir därmed:
$ L = m/2 (dot(r)^2 + r^2 dot(theta)^2) - (b r^4)/4 $
Inget explicit beroende på $theta =>$ rörelsemängdsmomentet bevaras: $l = m r^2 dot(theta)$.
Inget explicit beroende på $t =>$ energin bevaras:
$
  E = m/2 (dot(r)^2 + r^2 dot(theta)^2) + (b r^4)/4 = m/2 dot(r)^2 + l^2/(2 m r^2) + (b r^4)/4 equiv V_("eff")(r)
$
Där $V_("eff")(r)$ är den effektiva potentialen.
Hastigheten i $r$-led blir $dot(r) = sqrt(2/m (E - V_("eff")(r)))$.
$dot(r) = 0$ ger vändpunkterna i banan. Det finns två alternativ:
1. En skärningspunkt (minpunkten för $V_("eff")$) vilket innebär en cirkelbana.
2. Två vändpunkter, där banan oscillerar mellan radierna.

*(b)* Banradien varierar mellan $r_0$ och $2r_0$. Bestäm $r_0$.

*Lösning:*
Partikeln rör sig mellan $r_0$ och $2r_0$. Eftersom energin bevaras måste den effektiva potentialen vara lika i båda vändpunkterna: $V_("eff")(r_0) = V_("eff")(2r_0)$.
$ l^2/(2 m r_0^2) + (b r_0^4)/4 = l^2/(2 m (2r_0)^2) + (b (2r_0)^4)/4 $
Rörelsemängdsmomentet från startvillkoret (vid avstånd $a$ rör sig partikeln vinkelrätt med fart $v_0$):
$ l = m a^2 dot(theta) = m a v_0 $
Insättning ger:
$
  (m^2 a^2 v_0^2)/(2 m r_0^2) + (b r_0^4)/4 = (m^2 a^2 v_0^2)/(8 m r_0^2) + 4 b r_0^4
$
$ (m a^2 v_0^2)/(2 r_0^2) (1 - 1/4) = (2^4 - 1) b/4 r_0^4 $
$ (m a^2 v_0^2)/2 3/4 = 15/4 b r_0^4 dot r_0^2 $
Förenkling ger $r_0^6 = (m a^2 v_0^2)/(10 b)$, och slutligen:
$ r_0 = ((m a^2 v_0^2)/(10 b))^(1/6) $


=== Exempel 3

Roterande cylinder ($M, R, h$) med punktmassa ($m$) på höjd $b$ vid väggen. Origo i botten, $z$-axeln längs rotationsaxeln.

*(a)* Bestäm totala tröghetstensorn $I$ i ett lämpligt koordinatsystem.

*Lösning:*
Välj ett helt kroppsfixt koordinatsystem med origo i motorn (i cylinderns botten). Låt z-axeln $hat(e)_z$ vara rotationsaxeln. Systemet roterar med vinkelhastigheten $omega$. Personens position i detta system är $(R, 0, b)$.
Totala tröghetstensorn $I = I_("cyl") + I_("person")$.
Cylindern antas vara ett tunt skal med basöppning:
$
  I_("cyl") = mat(
    1/2 M R^2 + 1/3 M h^2, 0, 0;
    0, 1/2 M R^2 + 1/3 M h^2, 0;
    0, 0, M R^2
  )
$
För punktmassan (personen):
$
  I_("person") = mat(
    m b^2, 0, -m R b;
    0, m(R^2 + b^2), 0;
    -m R b, 0, m R^2
  )
$
Totalt får vi:
$
  I = mat(
    1/2 M R^2 + 1/3 M h^2 + m b^2, 0, -m R b;
    0, 1/2 M R^2 + 1/3 M h^2 + m(R^2 + b^2), 0;
    -m R b, 0, (M + m) R^2
  )
$

*(b)* Bestäm motorns vridmoment $macron(N)_("motor")$ i ett rumsfixt system.

*Lösning:*
I det kroppsfixa systemet är rörelsemängdsmomentet $macron(L)$:
$
  macron(L) = I macron(omega) = mat(
    I_1, 0, I_(13);
    0, I_2, 0;
    I_(13), 0, I_3
  ) vec(0, 0, omega) = vec(I_(13) omega, 0, I_3 omega) = vec(-m R b omega, 0, (M+m) R^2 omega)
$
Eulers ekvationer ger det erforderliga nettomomentet:
$
  macron(N) = macron(omega) times macron(L) = mat(delim: "|", hat(e)_x, hat(e)_y, hat(e)_z; 0, 0, omega; I_(13) omega, 0, I_3 omega) = hat(e)_y I_(13) omega^2 = -m R b omega^2 hat(e)_y
$
Byt till ett rumsfixt (icke-roterande) koordinatsystem $X, Y, Z$ där motorn sitter. Transformationen är:
$
  hat(e)_x & = cos(omega t) hat(e)_X + sin(omega t) hat(e)_Y  \
  hat(e)_y & = -sin(omega t) hat(e)_X + cos(omega t) hat(e)_Y
$
Då blir nettomomentet:
$ macron(N) = -m R b omega^2 (-sin(omega t) hat(e)_X + cos(omega t) hat(e)_Y) $
Nettomomentet består av motorns moment minus gravitationsmomentet. Gravitationen ger $macron(N)_g = macron(r) times macron(F)_g = (R hat(e)_x + b hat(e)_z) times (-m g hat(e)_z) = m g R hat(e)_y$.
$ macron(N) = macron(N)_("motor") - m g R hat(e)_y $
Vilket ger att:
$
  macron(N)_("motor") & = macron(N) + m g R hat(e)_y \
  & = ( -m R b omega^2 + m g R ) ( -sin(omega t) hat(e)_X + cos(omega t) hat(e)_Y )
$

=== Exempel 4
Stav ($M, L$) hänger i två snören ($b$). Från stavens ändar hänger två massor ($m$) i snören ($a$). Systemet svänger i ett vertikalplan.

*(a)* Ställ upp Lagrangianen $L$ (utan approximationer).

*Lösning:*
Låt $theta$ vara pendelvinkeln för upphängningen (staven translaterar horisontellt i en båge). Låt $phi$ och $psi$ vara pendlingsvinklarna för de två undre massorna.
Kinetisk energi:
$
  T &= 1/2 M b^2 dot(theta)^2 + 1/2 m (b dot(theta) hat(e)_theta + a dot(phi) hat(e)_phi)^2 + 1/2 m (b dot(theta) hat(e)_theta + a dot(psi) hat(e)_psi)^2 \
  &= 1/2 M b^2 dot(theta)^2 + m b^2 dot(theta)^2 + 1/2 m a^2 dot(phi)^2 + 1/2 m a^2 dot(psi)^2 \
  &quad + m a b dot(theta) dot(phi) cos(theta - phi) + m a b dot(theta) dot(psi) cos(theta - psi)
$
Potentiell energi:
$
  V = -M g(b - b cos theta) - m g(a + b - b cos theta - a cos psi) - m g(a + b - b cos theta - a cos phi)
$
Lagrangianen $L = T - V$ blir därmed:
$
  L &= 1/2 (M + 2m) b^2 dot(theta)^2 + 1/2 m a^2 dot(phi)^2 + 1/2 m a^2 dot(psi)^2 + m a b dot(theta) dot(phi) cos(theta - phi) + m a b dot(theta) dot(psi) cos(theta - psi) \
  &quad - M g(b - b cos theta) - m g(a + b - b cos theta - a cos psi) - m g(a + b - b cos theta - a cos phi)
$

*(b)* Bestäm egenfrekvenser för små svängningar om $M=6/5 m$ och $b=3/2 a$. (5p)

*Lösning:*
Små svängningar: approximera $cos(x) approx 1 - x^2/2$, och vi kan försumma andra ordningens termer i argumentet för cosinus i den kinetiska energin ($cos(theta-phi) approx 1$).
Sätt in $M = 6/5 m$ och $b = 3/2 a$.
$
  L &= 72/20 m a^2 dot(theta)^2 + 1/2 m a^2 dot(phi)^2 + 1/2 m a^2 dot(psi)^2 + m a^2 3/2 dot(theta) dot(phi) + m a^2 3/2 dot(theta) dot(psi) \
  &quad - 1/2 (16/5) m g (3/2 a) theta^2 - 1/2 m g a phi^2 - 1/2 m g a psi^2
$
Matrisformulering för rörelseekvationerna ger egenvärdesproblemet $|K - omega^2 M| = 0$:
Inför dimensionslösa variabeln $x = (a omega^2) / g$.
$
  | mat(
    delim: "|",
    48/5 - 72/5 x, -3/2 x, -3/2 x;
    -3/2 x, 1 - x, 0;
    -3/2 x, 0, 1 - x
  ) | = 0
$
Ansatsen för svängningsrörelsen och krav på icke-trivial lösning ger den karakteristiska ekvationen:
$ 9 x^3 - 49 x^2 + 56 x - 16 = 0 $
Rötterna till detta polynom blir:
$ x_1 = 4/9 , quad x_2 = 1 , quad x_3 = 4 $
Egenfrekvenserna är därmed:
$ omega_1^2 = (4 g)/(9 a) , quad omega_2^2 = g/a , quad omega_3^2 = (4 g)/a $

=== Exempel 5

Farkost till Alpha Centauri (4.3 ljusår bort). Resan tar 20 år (jordtid, konstant fart).

*(a)* Hur lång tid tar resan i farkostens vila ($t'$)?

*Lösning:*
Farkostens hastighet relativt jorden: $v = (4.3 c) / 20 = 0.215 c$.
Tiden som går i farkostens referenssystem ges av tidsdilatationen, där klockan i vila i systemet rör sig ($Delta x' = 0$):
$ Delta t' = Delta t sqrt(1 - v^2/c^2) = 20 sqrt(1 - 0.215^2) approx 19.5 "år" $

*(b)* Farkosten sänder 1 signal/månad (i vila). Hur ofta tas de emot på jorden?

*Lösning:*
Signalernas frekvens ges av den relativistiska Doppler-effekten. Farkosten avlägsnar sig från mottagaren (jorden):
$
  nu = nu_0 sqrt((1 - v/c)/(1 + v/c)) = 1 dot sqrt((1 - 0.215)/(1 + 0.215)) approx 0.8 "signaler per månad"
$
1 signal observeras därmed ungefär var $1.25$:e månad på jorden.

*(c)* Totalt antal mottagna signaler tills förbiflygningen ses på jorden? (5p)

*Lösning:*
Farkosten sänder ut signaler under sin egentid, alltså 1 signal per månad under $19.5$ år i sitt referenssystem:
$ "Antal signaler" = 19.5 dot 12 = 234 "signaler" $
Det tar $20$ år för farkosten att nå Alpha Centauri ur jordens perspektiv, men signalen måste även färdas tillbaka $4.3$ ljusår. Total observationstid på jorden innan sista signalen tas emot:
$ t_("tot") = 20 + 4.3 = 24.3 "år" $
Via dopplereffekten under denna tidsrymd tas följande antal signaler emot:
$ nu dot t_("tot") dot 12 = 0.804 dot 24.3 dot 12 approx 234 "signaler" $
Båda sätten konvergerar logiskt nog till samma mängd.

==== Bevarade storheter & Symmetrier
- *Cyklisk koordinat:* Om $(partial L) / (partial q_i) = 0$ är rörelsemängden $p_i = (partial L) / (partial dot(q)_i)$ bevarad.
- *Energibevarande:* Sker om:
  1. $(partial L) / (partial t) = 0$ (Systemet är tidsoberoende).
  2. $bold(r) = bold(r)(q_i)$ (Skleronoma tvång: ingen explicit tid i koord-transformation).
  3. $U = U(q_i)$ (Potentialen beror ej på hastighet).
- *Noethers teorem:* Varje kontinuerlig symmetri i $L$ motsvarar en bevarad storhet.
  - *Translationell:* $L(q+epsilon) = L(q) arrow.double$ Linjär rörelsemängd $bold(P)$ bevarad.
  - *Rotationell:* $L(bold(R)bold(q)) = L(bold(q)) arrow.double$ Rörelsemängdsmoment $bold(L)$ bevarat.

==== Bevarade storheter (Symmetrisk Snurra)
$
  p_phi = I_1 dot(phi) sin^2 theta + I_3 (dot(psi) + dot(phi) cos theta) cos theta
$
$ p_psi = I_3 (dot(psi) + dot(phi) cos theta) $
$
  E = (1)/(2) I_1 (dot(theta)^2 + dot(phi)^2 sin^2 theta) + (1)/(2) I_3 (dot(psi) + dot(phi) cos theta)^2 + U(theta)
$
==== Kopplade svängningar
1. Hitta jämvikt via $(partial U)/(partial q_i) = 0$
2. Matriser: $bold(U)_(i j) = ((partial^2 U)/(partial q_i partial q_j))_(bold(q)_0)$ och $bold(T)_(i j) = M_(i j)(bold(q)_0)$
3. Egenfrekvenser: $det(bold(U) - omega^2 bold(T)) = 0$
4. Moder $bold(a)_k$: $(bold(U) - omega_k^2 bold(T)) bold(a)_k = 0$
Allmän lösning: $bold(q)(t) = sum_k (A_k cos(omega_k t) + B_k sin(omega_k t)) bold(a)_k$
I vektorform:  $bold(a)_m = vec(a, b)$ och $omega_n bold(a)_m = A_m vec(a (e^(i omega_n t) + e^(-i omega_n t)), b (e^(i omega_n t) + e^(-i omega_n t)))$
==== Normalkoordinater
Genom att byta till $bold(Q)$ frikopplas systemet så att varje mod svänger oberoende.
- *Idé:* Varje normalkoordinat $Q_k$ beskriver amplituden för en specifik mod $bold(a)_k$.
- *Transformation:* $bold(q) = bold(A) bold(Q) quad arrow.double quad q_i (t) = sum_k Q_k (t) (bold(a)_k)_i$
- *Matrisen A:* Har egenmoderna $bold(a)_k$ som kolonner.
// - *Frikopplad L:* Om $bold(a)_k$ normaliseras ($bold(a)_k^T bold(T) bold(a)_k = 1$) fås:
// $ L = sum_k (1)/(2) (dot(Q)_k^2 - omega_k^2 Q_k^2) $
// - *Lösning:* Varje $Q_k (t)$ löser $dot.double(Q)_k + omega_k^2 Q_k = 0$, dvs $Q_k (t) = C_k cos(omega_k t + delta_k)$.
- *Instabilitet:* Om $omega_k^2 < 0$ växer $Q_k (t)$ exponentiellt (instabil jämvikt).

==== Icke-inertialsystem
$
  bold(F)_"eff" = bold(F) - m dot(bold(V)) - m dot(bold(omega)) times bold(r) - m bold(omega) times (bold(omega) times bold(r)) - 2 m bold(omega) times bold(v)_"rel"
$
- *Centrifugalkraft:* $- m bold(omega) times (bold(omega) times bold(r))$
- *Corioliskraft:* $- 2 m bold(omega) times bold(v)_"rel"$

==== Speciell Relativitetsteori

==== Lorentztransformationer
$ x' = gamma(x - v t) quad t' = gamma(t - (v x)/(c^2)) $
$ gamma = (1)/(sqrt(1 - beta^2)) quad beta = v/c $
Addition av hastighet: $u' = (u - v)/(1 - (u v)/(c^2))$

==== Energi & Rörelsemängd
$ P^mu = (E/c, bold(p)) $
$ E = gamma m c^2 quad bold(p) = gamma m bold(v) $
Invariant: $E^2 - (p c)^2 = (m c^2)^2$
Doppler: $nu = nu_0 sqrt((1 - beta)/(1 + beta))$ (bortåt)

== Rörelsemängdsmoment & Energi
$ bold(L) = bold(I) dot bold(omega) $
$ T = (1)/(2) bold(omega)^T bold(I) bold(omega) $
$
  ((d bold(L))/(d t))_"fix" = ((d bold(L))/(d t))_"rot" + bold(omega) times bold(L)
$

= Centralrörelse

== Effektiv potential & Banor
$ V_"eff"(r) = U(r) + (L^2)/(2 m r^2) $
- *Cirkelbana:* $V'_"eff"(r) = 0$
- *Vändpunkter:* $V_"eff"(r) = E$
- *Stabilitet:* $V''_"eff"(r) > 0$
Banekvation ($u = 1/r$): $u'' + u = - (m)/(L^2 u^2) f((1)/(u))$

== Keplers lagar
1. Banorna är ellipser med solen i ena brännpunkten
2. Sektorfarten är konstant: $(d A)/(d t) = (L)/(2 m)$
3. Perioden i kvadrat: $T^2 = ((4 pi^2)/(G M)) a^3$

== Vanliga Tröghetsmoment (Kring MC)
- *Stav (längd L):* $I = (1)/(12) M L^2$
- *Cylinder/Disk (radie R):* $I_z = (1)/(2) M R^2$, $I_x = I_y = (1)/(4) M R^2$
- *Klot (radie R):* $I = (2)/(5) M R^2$
- *Sfäriskt skal:* $I = (2)/(3) M R^2$

== Eulers ekvationer (Kroppsfixerat)
$ I_1 dot(omega)_1 + (I_3 - I_2) omega_2 omega_3 = N_1 $
$ I_2 dot(omega)_2 + (I_1 - I_3) omega_3 omega_1 = N_2 $
$ I_3 dot(omega)_3 + (I_2 - I_1) omega_1 omega_2 = N_3 $
Symmetrisk ($I_1 = I_2$): $I_1 dot(omega)_1 + (I_3 - I_1) omega_2 omega_3 = N_1$
==== Viktiga Begrepp

- *Principalaxel:* Axel där tröghetstensorn $bold(I)$ är diagonal. Inga deviationsmoment.
- *Symmetrisk snurra:* Kropp med $I_1 = I_2 != I_3$. Fri snurra precesserar kring $bold(L)$.
- *Eulervinklar:* ($phi, theta, psi$) Beskriver rotation: precession, nutation, egenrotation.
- *Kroppsfixt system:* Följer kroppens rotation. $bold(I)$ är konstant här.
- *Rumsfixt system:* Fixerat inertialsystem (labsystem).
- *Egentid ($tau$):* Tiden i systemet där partikeln är i vila ($d tau = d t / gamma$).
- *Vändpunkt:* Där $dot(r) = 0$ i centralrörelse ($V_"eff"(r) = E$).
- *Cyklisk koordinat:* $q_i$ saknas i $L$ $arrow.double p_i = (partial L) / (partial dot(q)_i)$ är bevarad.
- *Normalkoordinater ($Q_k$):* Koordinater som frikopplar Lagrangianen till oberoende harmoniska oscillatorer.

==== Strategier & tips

- *Lagrange Checklist:* 1. $q_i$. 2. $T = 1/2 m v^2 + 1/2 I omega^2$. 3. $U = m g h + 1/2 k x^2$. 4. $L=T-U$.
- *Cykliska koordinater:* Om $q_k$ saknas i $L$ är $p_k = (partial L)/(partial dot(q)_k)$ konstant.
- *Vridmoment:* Fix punkt: $bold(N) = dot(bold(L))$. Gyroskop: $bold(N) = bold(Omega) times bold(L)$.
- *Relativitet:* Använd alltid invarianten $P_mu P^mu = (m c)^2$ först. Det sparar tid!
- *Dimensionsanalys:* $[L] = [T] = [U] = "J". [L_"moment"] = "kg m"^2/"s"$.
- *Små vinklar:* $sin theta approx theta$, $cos theta approx 1 - (theta^2)/(2)$, $tan theta approx theta$.
- *Rullning:* Utan glidning gäller $v = r omega$ och $a = r alpha$. Glöm inte $I$ i $T$!
- *Rimlighetskoll:* Är $omega$ reellt? Är $E_"tot" = T + U$ konstant? Vid $v arrow c$ går $gamma arrow infinity$.
- *Precession:* Snabb snurra: $Omega_"prec" = (M g l)/(I_3 omega_"spin")$.
- *Egenmoder:* Symmetriska system har ofta moder som $(1, 1)$ eller $(1, -1)$.
- *Instabilitet:* Om $omega^2 < 0$ (imaginärt $omega$) är jämvikten instabil.
- *Rita Figur:* Markera krafter, hastigheter och välj ett smart koordinatsystem.


#figure(rotate(0deg, image("orbit.png", width: 110%)))
