---
title: "Formulario di Analisi Matematica I"
branca: "Matematica"
materia: ["analisi-matematica"]
tipologia: "Formulari"
slug: "formulario-analisi-1"
dataPubblicazione: "2026-04-29"
dataUltimaModifica: "2026-08-05"
pdf:
  versione: "v.1.1"
description: "Formulario sistematico e consultabile di Analisi Matematica I: prerequisiti, limiti, continuità, derivate, Taylor, integrali, serie ed estensioni STEM."
autore: "Carlo de Carolis"
---

Raccolta di consultazione rapida per **Analisi Matematica I in una variabile**.
Il formulario comprende i prerequisiti delle scuole superiori, il nucleo comune
dei corsi STEM e alcune estensioni che variano tra facoltà e atenei.

Le formule riportano le ipotesi essenziali, i domini e i casi limite. Per le
relazioni di calcolo sono indicate le forme inverse realmente utili e
matematicamente lecite; identità, definizioni e teoremi non vengono trattati
come se possedessero automaticamente una «formula inversa». Le dimostrazioni,
le procedure complete e gli esercizi restano nelle voci collegate di
[ingegnerismo.it](https://ingegnerismo.it/).

Le sezioni 1–17 costituiscono il nucleo di Analisi I; le sezioni 18–19 raccolgono
estensioni frequentemente collocate alla fine del corso.

Raccolta separata: [Formulario di EDO e Analisi Numerica](/matematica/formulario-edo-analisi-numerica/).

<a id="sezione-0"></a>
## 0. Guida alla lettura della simbologia e delle formule

Questa sezione introduce la notazione usata nel formulario. Le condizioni poste
accanto a una formula — dominio, segni, valori esclusi e regolarità — sono parte
integrante della formula.

### Come interpretare i diversi tipi di scrittura

| Scrittura | Si legge | Uso corretto |
|---|---|---|
| $A:=B$ | «$A$ è definito come $B$» | introduce una definizione |
| $A=B$ | «$A$ è uguale a $B$» | uguaglianza valida nelle condizioni indicate |
| $A\equiv B$ | «$A$ è identicamente uguale a $B$» | identità valida per tutti i valori del dominio |
| $P\Rightarrow Q$ | «$P$ implica $Q$» | da $P$ segue $Q$; il converso non è automatico |
| $P\Longleftrightarrow Q$ | «$P$ se e solo se $Q$» | valgono sia $P\Rightarrow Q$ sia $Q\Rightarrow P$ |
| $A\not\Longrightarrow B$ | «$A$ non implica $B$» | segnala che il converso o la deduzione proposta è falsa |
| $A\approx B$ | «$A$ è approssimativamente uguale a $B$» | approssimazione numerica o locale, non uguaglianza esatta |
| $\pm$ | «più o meno» | rappresenta due casi distinti, uno con $+$ e uno con $-$ |
| $\mp$ | «meno o più» | usa il segno opposto a quello scelto in $\pm$ |
| $f\sim g$ | «$f$ è asintoticamente equivalente a $g$» | $f/g\to1$ nel regime specificato |
| $f=o(g)$ | «$f$ è un o-piccolo di $g$» | $f/g\to0$ quando il rapporto è definito |
| $f=O(g)$ | «$f$ è un O-grande di $g$» | il modulo di $f$ è limitato da una costante per il modulo di $g$ |

### Convenzioni generali sulle lettere

Le condizioni locali prevalgono sempre sulle convenzioni seguenti.

| Simbolo | Uso abituale nel formulario |
|---|---|
| $x,y,t,u$ | variabili reali; $t$ e $u$ sono spesso variabili di sostituzione |
| $a,b,c,h,k$ | parametri, estremi o costanti; il significato è indicato localmente |
| $n,m,k$ | indici; l’insieme ammesso è specificato localmente, di solito $\mathbb N_0$, $\mathbb N_+$ oppure $\mathbb Z$ |
| $\mathbb N$ | nel formulario coincide con $\mathbb N_+=\{1,2,3,\ldots\}$ |
| $\varepsilon,\delta$ | quantità positive arbitrarie usate nelle definizioni di limite e continuità |
| $C,C_0,C_1,\ldots$ | costanti arbitrarie nelle primitive |
| $D_f$ | dominio naturale o dominio assegnato della funzione $f$ |
| $\operatorname{Im}f$ | immagine di $f$, cioè insieme dei valori effettivamente assunti |
| $\overline{\mathbb R}$ | retta reale estesa $\mathbb R\cup\{-\infty,+\infty\}$ |
| $\mathbb K$ | campo scalare, di solito $\mathbb R$ oppure $\mathbb C$ |

Gli angoli sono espressi in **radianti**, salvo indicazione esplicita in gradi.
Nelle primitive la costante $C$ può assumere valori differenti sulle diverse
componenti connesse del dominio.

### Simboli logici

| Simbolo | Si legge | Significato |
|---|---|---|
| $\forall$ | per ogni | la proprietà vale per tutti gli elementi considerati |
| $\exists$ | esiste | esiste almeno un elemento che soddisfa la proprietà |
| $\exists!$ | esiste ed è unico | esiste un solo elemento con quella proprietà |
| $\nexists$ | non esiste | nessun elemento soddisfa la proprietà |
| $\neg P$ | non $P$ | negazione della proposizione $P$ |
| $P\land Q$ | $P$ e $Q$ | entrambe le proposizioni devono essere vere |
| $P\lor Q$ | $P$ oppure $Q$ | è sufficiente che almeno una sia vera; l'«oppure» è inclusivo |
| $P\Rightarrow Q$ | se $P$, allora $Q$ | implicazione |
| $P\Longleftrightarrow Q$ | $P$ se e solo se $Q$ | equivalenza |
| $:$ | tale che | separa una condizione dagli oggetti che la soddisfano |

Esempio:

$$
\forall x\in A\ \exists!y\in B:\ y=f(x)
$$

si legge: «per ogni $x$ appartenente ad $A$ esiste un unico $y$ appartenente a
$B$ tale che $y=f(x)$».

### Insiemi, intervalli e relazioni di appartenenza

| Simbolo | Si legge | Significato |
|---|---|---|
| $x\in A$ | $x$ appartiene ad $A$ | $x$ è un elemento dell'insieme $A$ |
| $x\notin A$ | $x$ non appartiene ad $A$ | $x$ non è elemento di $A$ |
| $A\subseteq B$ | $A$ è contenuto in $B$ | ogni elemento di $A$ appartiene a $B$; è ammesso $A=B$ |
| $A\subset B$ | $A$ è contenuto propriamente in $B$ | $A\subseteq B$ e $A\ne B$ |
| $\varnothing$ | insieme vuoto | insieme privo di elementi |
| $A\cup B$ | unione di $A$ e $B$ | elementi che appartengono ad almeno uno dei due insiemi |
| $A\cap B$ | intersezione di $A$ e $B$ | elementi comuni ad $A$ e $B$ |
| $A\setminus B$ | $A$ meno $B$ | elementi di $A$ che non appartengono a $B$ |
| $A^c$ | complementare di $A$ | elementi dell'insieme universo che non appartengono ad $A$ |
| $\mathcal P(A)$ | insieme delle parti di $A$ | insieme di tutti i sottoinsiemi di $A$ |
| $\operatorname{card}A$ | cardinalità di $A$ | numero di elementi, o grandezza insiemistica, di $A$ |
| $\{x:P(x)\}$ | insieme degli $x$ tali che $P(x)$ | notazione per proprietà caratteristica |

Intervalli reali:

| Scrittura | Si legge | Estremi inclusi |
|---|---|---|
| $(a,b)$ | intervallo aperto da $a$ a $b$ | nessuno |
| $[a,b]$ | intervallo chiuso da $a$ a $b$ | entrambi |
| $(a,b]$ | aperto a sinistra e chiuso a destra | soltanto $b$ |
| $[a,b)$ | chiuso a sinistra e aperto a destra | soltanto $a$ |
| $(a,+\infty)$ | reali maggiori di $a$ | $+\infty$ non è mai un estremo incluso |

Gli oggetti topologici più frequenti sono:

| Simbolo | Si legge | Significato |
|---|---|---|
| $I(x_0,r)$ | intorno di centro $x_0$ e raggio $r$ | $(x_0-r,x_0+r)$ |
| $I^*(x_0,r)$ | intorno puntato | intorno dal quale è escluso il centro $x_0$ |
| $A^\circ$ o $\operatorname{int}A$ | interno di $A$ | insieme dei punti interni |
| $A'$ | derivato di $A$ | insieme dei punti di accumulazione di $A$ |
| $\overline A$ | chiusura di $A$ | $A$ unito ai suoi punti di accumulazione |
| $\partial A$ | frontiera di $A$ | punti di confine tra $A$ e il suo complementare |

### Insiemi numerici e operatori discreti

| Simbolo | Si legge | Insieme o operatore |
|---|---|---|
| $\mathbb N_0$ | naturali incluso lo zero | $\{0,1,2,\ldots\}$ |
| $\mathbb N$ o $\mathbb N_+$ | naturali positivi | $\{1,2,3,\ldots\}$ |
| $\mathbb Z$ | interi relativi | $\ldots,-2,-1,0,1,2,\ldots$ |
| $\mathbb Z_{<0}$ | interi negativi | $\{-1,-2,-3,\ldots\}$ |
| $\mathbb Q$ | razionali | numeri rappresentabili come rapporto di interi |
| $\mathbb R$ | reali | retta reale |
| $\mathbb C$ | complessi | numeri della forma $a+ib$ |
| $\sum_{k=m}^{n}a_k$ | sommatoria da $k=m$ a $k=n$ | $a_m+a_{m+1}+\cdots+a_n$ |
| $\prod_{k=m}^{n}a_k$ | produttoria da $k=m$ a $k=n$ | $a_ma_{m+1}\cdots a_n$ |
| $n!$ | fattoriale di $n$ | prodotto degli interi da $1$ a $n$ |
| $\binom nk$ | coefficiente binomiale $n$ su $k$ | numero di scelte di $k$ elementi fra $n$ |
| $a\mid b$ | $a$ divide $b$ | esiste un intero $k$ tale che $b=ak$ |
| $n\bmod m$ | resto di $n$ modulo $m$ | resto della divisione euclidea, con $m>0$ |
| $a\equiv b\pmod m$ | $a$ congruo a $b$ modulo $m$ | $m$ divide $a-b$, con $m\in\mathbb N_+$ |
| $\lfloor x\rfloor$ | parte intera inferiore di $x$ | massimo intero non maggiore di $x$ |
| $\operatorname{sgn}x$ | segno di $x$ | vale $-1$, $0$ oppure $1$ secondo il segno di $x$ |
| $\gcd(a,b)$ | massimo comune divisore | massimo divisore positivo comune ad $a$ e $b$ |
| $\operatorname{lcm}(a,b)$ | minimo comune multiplo | minimo multiplo positivo comune ad $a$ e $b$ |
| $\deg P$ | grado di $P$ | massimo esponente con coefficiente non nullo |

### Matrici e sistemi lineari

| Scrittura | Si legge | Significato |
|---|---|---|
| $A=(a_{ij})$ | matrice $A$ di elementi $a_{ij}$ | tabella rettangolare di coefficienti |
| $[A\mid c]$ | matrice completa o aumentata | matrice dei coefficienti con la colonna dei termini noti |
| $\operatorname{rank}A$ | rango di $A$ | massimo numero di righe o colonne linearmente indipendenti |
| $\det A$ | determinante di $A$ | scalare associato a una matrice quadrata |
| $A^{-1}$ | matrice inversa | soddisfa $AA^{-1}=A^{-1}A=I$, quando esiste |
| $I$ | matrice identità | elemento neutro del prodotto tra matrici |

### Funzioni, composizione e inversa

| Scrittura | Si legge | Significato |
|---|---|---|
| $f:A\to B$ | $f$ da $A$ in $B$ | $A$ è il dominio assegnato e $B$ il codominio |
| $x\mapsto f(x)$ | $x$ viene mandato in $f(x)$ | legge di corrispondenza |
| $f(A)$ | immagine di $A$ tramite $f$ | insieme dei valori $f(x)$ con $x\in A$ |
| $f^{-1}(Y)$ | preimmagine di $Y$ | insieme degli $x$ tali che $f(x)\in Y$ |
| $f^{-1}$ | funzione inversa di $f$ | esiste come funzione soltanto se $f$ è biiettiva |
| $(g\circ f)(x)$ | $g$ composto con $f$ | si applica prima $f$, poi $g$: $g(f(x))$ |
| $\operatorname{id}_A$ | identità su $A$ | funzione $x\mapsto x$ |
| $G_f$ | grafico di $f$ | insieme delle coppie $(x,f(x))$ |
| $C(I)$ | funzioni continue su $I$ | spazio delle funzioni continue |
| $C^k(I)$ | funzioni di classe $C^k$ | derivate continue fino all'ordine $k$ |
| $\mathcal R([a,b])$ | funzioni Riemann-integrabili | funzioni integrabili secondo Riemann su $[a,b]$ |
| $\mathcal R_{\mathrm{loc}}(I)$ | localmente Riemann-integrabili | integrabili su ogni sottointervallo compatto che evita le singolarità |

### Successioni, limiti e confronto asintotico

| Scrittura | Si legge | Significato |
|---|---|---|
| $(a_n)$ | successione $a_n$ | funzione definita sugli indici naturali |
| $a_n\to L$ | $a_n$ tende a $L$ | i termini si avvicinano arbitrariamente a $L$ |
| $n\to\infty$ | $n$ tende all'infinito | si considerano indici sempre più grandi |
| $x\to x_0^-$ | $x$ tende a $x_0$ da sinistra | $x<x_0$ |
| $x\to x_0^+$ | $x$ tende a $x_0$ da destra | $x>x_0$ |
| $x\to\pm\infty$ | $x$ tende a più o meno infinito | si studia il comportamento per modulo grande |
| $\limsup a_n$ | limite superiore | massimo valore di aderenza per successioni limitate |
| $\liminf a_n$ | limite inferiore | minimo valore di aderenza per successioni limitate |
| $a_n\nearrow$ | successione non decrescente | i termini non diminuiscono al crescere di $n$ |
| $a_n\searrow$ | successione non crescente | i termini non aumentano al crescere di $n$ |
| $f\ll g$ | $f$ è trascurabile rispetto a $g$ | abbreviazione di $f/g\to0$ |

«Definitivamente» significa «da un certo indice in poi» per le successioni e
«in un opportuno intorno puntato del regime considerato» per i limiti di
funzione.

La definizione

$$
\forall\varepsilon>0\ \exists\delta>0:\
0<|x-x_0|<\delta
\Rightarrow
|f(x)-L|<\varepsilon
$$

si legge: «per ogni tolleranza positiva $\varepsilon$, esiste una distanza
positiva $\delta$ tale che, quando $x$ è diverso da $x_0$ ma dista da $x_0$ meno
di $\delta$, il valore $f(x)$ dista da $L$ meno di $\varepsilon$».

### Derivate, differenziali e integrali

| Scrittura | Si legge | Significato |
|---|---|---|
| $f'(x)$ | derivata prima di $f$ in $x$ | tasso di variazione istantaneo e pendenza della tangente |
| $f^{(n)}(x)$ | derivata $n$-esima | derivata applicata $n$ volte |
| $f'_-(x_0)$, $f'_+(x_0)$ | derivate sinistra e destra | limiti laterali del rapporto incrementale |
| $df_{x_0}(h)$ | differenziale di $f$ in $x_0$ applicato a $h$ | parte lineare dell'incremento di $f$ |
| $F_x$, $F_y$ | derivate parziali di $F$ | derivazione rispetto a $x$ o a $y$ mantenendo fissa l'altra variabile |
| $\int f(x)\,dx$ | integrale indefinito di $f$ | famiglia delle primitive $F+C$ |
| $\int_a^b f(x)\,dx$ | integrale di $f$ da $a$ a $b$ | accumulazione o area orientata |
| $dx$ | differenziale della variabile $x$ | indica la variabile rispetto alla quale si integra |
| $[F(x)]_a^b$ | $F$ calcolata tra $a$ e $b$ | $F(b)-F(a)$ |
| $\operatorname{PV}\int$ | valore principale di Cauchy | limite simmetrico; non coincide necessariamente con la convergenza impropria |
| $\lVert f\rVert_{\infty,E}$ | norma uniforme o del supremo | $\sup_{x\in E}\lvert f(x)\rvert$, per $E\ne\varnothing$ e $f:E\to\mathbb R$ limitata |

La derivata

$$
f'(x_0)=\lim_{h\to0}\frac{f(x_0+h)-f(x_0)}h
$$

si legge: «la derivata di $f$ in $x_0$ è il limite, per l'incremento $h$ che
tende a zero, del rapporto tra l'incremento della funzione e l'incremento della
variabile».

Nelle ipotesi della formula di Newton–Leibniz, l'integrale

$$
\int_a^b f(x)\,dx=F(b)-F(a),
\qquad F'=f,
$$

si legge: «l'integrale di $f$ da $a$ a $b$ è la differenza fra i valori, in $b$
e in $a$, di una qualsiasi primitiva $F$ di $f$».

### Serie numeriche e serie di funzioni

| Scrittura | Si legge | Significato |
|---|---|---|
| $\sum_{n=n_0}^{\infty}a_n$ | serie degli $a_n$ | limite delle somme parziali, non una somma eseguita “tutta insieme” |
| $s_N=\sum_{n=n_0}^{N}a_n$ | somma parziale $N$-esima | somma finita dei termini fino a $N$ |
| $R_N=\sum_{n=N+1}^{\infty}a_n$ | resto dopo il termine $N$ | quando la serie converge, errore commesso sostituendola con $s_N$ |
| $f_n\xrightarrow[]{p}f$ | convergenza puntuale | la soglia può dipendere dal punto $x$ |
| $f_n\xrightarrow[]{u}f$ | convergenza uniforme | una sola soglia funziona per tutti i punti del dominio |

La scrittura

$$
\sum_{n=n_0}^{\infty}a_n=A
\Longleftrightarrow
\lim_{N\to\infty}\sum_{n=n_0}^{N}a_n=A
$$

significa che la successione delle somme parziali converge al numero $A$.

### Numeri complessi

| Simbolo | Si legge | Significato |
|---|---|---|
| $i$ | unità immaginaria | $i^2=-1$ |
| $\operatorname{Re}z$ | parte reale di $z$ | coefficiente reale di $z=a+ib$ |
| $\operatorname{Im}z$ | parte immaginaria di $z$ | coefficiente $b$ di $i$ |
| $\overline z$ | coniugato di $z$ | se $z=a+ib$, allora $\overline z=a-ib$ |
| $\lvert z\rvert$ | modulo di $z$ | distanza di $z$ dall'origine nel piano complesso |
| $\arg z$ | argomenti di $z\ne0$ | insieme multivalore degli angoli modulo $2\pi$ |
| $\operatorname{Arg}z$ | argomento principale di $z\ne0$ | rappresentante scelto in un intervallo prefissato |

### Formule dirette, formule inverse e rami

Una **formula diretta** è risolta rispetto alla grandezza che si vuole calcolare.
Una **formula inversa** è la stessa relazione risolta rispetto a un'altra
grandezza. L'isolamento algebrico è lecito soltanto se non si divide per zero e
se si rispettano dominio, segno e numero dei rami.

Esempio multivalore:

$$
y=x^2
\Longleftrightarrow
x=\pm\sqrt y,
\qquad y\ge0.
$$

La relazione non definisce una funzione inversa globale di $x\mapsto x^2$.
Restringendo il dominio a $[0,+\infty)$ si ottiene $x=\sqrt y$; restringendolo a
$(-\infty,0]$ si ottiene $x=-\sqrt y$.

Analogamente,

$$
\sin^2x+\cos^2x=1
$$

è un'identità, non una formula con una sola inversa. Da essa si ricava

$$
\sin x=\pm\sqrt{1-\cos^2x},
$$

ma il segno dipende dal quadrante. Quando compaiono $\pm$, radici, logaritmi,
funzioni goniometriche inverse o elevamenti a potenza, il controllo dei rami è
obbligatorio.

<a id="sezione-1"></a>
## 1. Logica, insiemi, numeri e strumenti discreti

### Logica matematica minima

Nelle formule seguenti $P$ e $Q$ sono proposizioni, mentre $P(x)$ è una
proprietà che può essere vera o falsa a seconda di $x$. I simboli $\mathrm V$ e
$\mathrm F$ indicano rispettivamente «vero» e «falso».

$$
\neg(\forall x\ P(x))\Longleftrightarrow\exists x:\neg P(x),
\qquad
\neg(\exists x\ P(x))\Longleftrightarrow\forall x:\neg P(x).
$$

$$
P\Rightarrow Q
\Longleftrightarrow
\neg P\lor Q
\Longleftrightarrow
\neg Q\Rightarrow\neg P.
$$

L'ultima equivalenza è la **contrapposizione**: «se $P$ implica $Q$, allora
non $Q$ implica non $P$». Non va confusa con il converso $Q\Rightarrow P$.

$$
P\Longleftrightarrow Q
\Longleftrightarrow
(P\Rightarrow Q)\land(Q\Rightarrow P).
$$

$$
\begin{array}{c|c|c|c}
P&Q&P\Rightarrow Q&P\Longleftrightarrow Q\\
\hline
\mathrm V&\mathrm V&\mathrm V&\mathrm V\\
\mathrm V&\mathrm F&\mathrm F&\mathrm F\\
\mathrm F&\mathrm V&\mathrm V&\mathrm F\\
\mathrm F&\mathrm F&\mathrm V&\mathrm V
\end{array}
$$

Approfondimento: [logica matematica](/matematica/logica-matematica/), [quantificatori](/matematica/quantificatori/).

### Insiemi, intervalli e intorni

Nella notazione $\{x:P(x)\}$ i due punti si leggono «tale che». In questa
sottosezione $U$ è l'insieme universo rispetto al quale si prende il
complementare.

$$
A\cup B=\{x:x\in A\lor x\in B\},
\qquad
A\cap B=\{x:x\in A\land x\in B\},
$$

$$
A\setminus B=\{x\in A:x\notin B\},
\qquad
A^c=U\setminus A.
$$

| Intervallo | Condizione su $x$ |
|---|---|
| $(a,b)$ | $a<x<b$ |
| $[a,b]$ | $a\le x\le b$ |
| $(a,b]$ | $a<x\le b$ |
| $[a,b)$ | $a\le x<b$ |
| $(a,+\infty)$ | $x>a$ |
| $[a,+\infty)$ | $x\ge a$ |
| $(-\infty,b)$ | $x<b$ |
| $(-\infty,b]$ | $x\le b$ |

$$
I(x_0,r)=(x_0-r,x_0+r),
\qquad
I^*(x_0,r)=I(x_0,r)\setminus\{x_0\},
\qquad r>0.
$$

$$
I_D(x_0,r)=D\cap I(x_0,r),
\qquad
I_D^*(x_0,r)=D\cap I^*(x_0,r).
$$

$$
x_0\in\operatorname{int}A
\Longleftrightarrow
\exists r>0:\ I(x_0,r)\subseteq A.
$$

$$
x_0\in A'
\Longleftrightarrow
\forall r>0:\ I^*(x_0,r)\cap A\ne\varnothing.
$$

$$
x_0\notin A'
\Longleftrightarrow
\exists r>0:\ I^*(x_0,r)\cap A=\varnothing.
$$

$$
a\text{ isolato in }A
\Longleftrightarrow
a\in A\ \land\ \exists r>0:\ I(a,r)\cap A=\{a\}.
$$

$$
\overline A=A\cup A'.
$$

Qui $A'$ è l'insieme dei punti di accumulazione, $\overline A$ è la chiusura e
$\operatorname{int}A$ è l'interno. Gli intorni relativi $I_D$ limitano la
ricerca ai soli punti appartenenti al dominio $D$.

Approfondimento: [insieme](/matematica/insieme/), [operazioni tra insiemi](/matematica/operazioni-tra-insiemi/), [intervallo reale](/matematica/intervallo-reale/), [intorni e topologia della retta](/matematica/intorni-e-topologia-della-retta/), [punto di accumulazione](/matematica/punto-di-accumulazione/).

Esercizi svolti: [intorni, punti di accumulazione e punti isolati](/matematica/intorni-accumulazione-esercizi/).

### Topologia essenziale della retta reale

Per $A\subseteq\mathbb R$:

$$
A^\circ=\operatorname{int}A,
\qquad
\partial A=\overline A\setminus A^\circ
=\overline A\cap\overline{A^c}.
$$

$$
\begin{aligned}
A\text{ aperto}
&\Longleftrightarrow A=A^\circ,\\
A\text{ chiuso}
&\Longleftrightarrow A'\subseteq A
\Longleftrightarrow A=\overline A.
\end{aligned}
$$

$$
A\text{ limitato}
\Longleftrightarrow
\exists M>0:\ |x|\le M\quad\forall x\in A.
$$

In $\mathbb R$ vale il teorema di Heine–Borel:

$$
K\text{ compatto}
\Longleftrightarrow
K\text{ chiuso e limitato}.
$$

Caratterizzazione sequenziale della compattezza:

$$
K\text{ compatto}
\Longleftrightarrow
\text{ogni successione in }K\text{ ammette una sottosuccessione convergente a un punto di }K.
$$

Un sottoinsieme non vuoto di $\mathbb R$ è connesso se e solo se è un intervallo.

Cardinalità essenziale:

$$
\mathbb N_0,\ \mathbb Z,\ \mathbb Q\text{ sono numerabili},
\qquad
\mathbb R\text{ non è numerabile}.
$$

Per l'insieme delle parti

$$
\mathcal P(A)=\{B:B\subseteq A\},
$$

il teorema di Cantor afferma

$$
\operatorname{card}\mathcal P(A)>\operatorname{card}A.
$$

### Insiemi numerici, ordine e completezza

$$
\mathbb N_0\subset\mathbb Z\subset\mathbb Q\subset\mathbb R\subset\mathbb C,
\qquad
\mathbb N_0=\{0,1,2,\ldots\},
\qquad
\mathbb N=\mathbb N_+=\{1,2,3,\ldots\}.
$$

$$
M=\max A
\Longleftrightarrow
M\in A\ \land\ \forall x\in A:\ x\le M,
$$

$$
m=\min A
\Longleftrightarrow
m\in A\ \land\ \forall x\in A:\ m\le x.
$$

Per $A\ne\varnothing$ superiormente limitato:

$$
s=\sup A
\Longleftrightarrow
\begin{cases}
\forall x\in A,\ x\le s,\\
\forall\varepsilon>0,\ \exists x\in A:\ s-\varepsilon<x\le s.
\end{cases}
$$

Per $A\ne\varnothing$ inferiormente limitato:

$$
i=\inf A
\Longleftrightarrow
\begin{cases}
\forall x\in A,\ i\le x,\\
\forall\varepsilon>0,\ \exists x\in A:\ i\le x<i+\varepsilon.
\end{cases}
$$

$$
A\ne\varnothing,\ A\subseteq\mathbb R,\ A\text{ superiormente limitato}
\Longrightarrow
\sup A\in\mathbb R.
$$

$$
A\ne\varnothing,\ A\subseteq\mathbb R,\ A\text{ inferiormente limitato}
\Longrightarrow
\inf A\in\mathbb R.
$$

Per $A\ne\varnothing$ superiormente limitato:

$$
\max A\text{ esiste}
\Longleftrightarrow
\sup A\in A.
$$

Per $A\ne\varnothing$ inferiormente limitato:

$$
\min A\text{ esiste}
\Longleftrightarrow
\inf A\in A.
$$

Il massimo e il minimo, quando esistono, appartengono all'insieme; il supremo e
l'infimo possono non appartenervi.

$$
\forall x\in\mathbb R,\ \exists n\in\mathbb N_+:\ n>x.
$$

$$
x<y
\Longrightarrow
\exists q\in\mathbb Q:\ x<q<y,
\qquad
\exists r\in\mathbb R\setminus\mathbb Q:\ x<r<y.
$$

Approfondimento: [insiemi numerici](/matematica/insiemi-numerici/), [completezza dei reali](/matematica/completezza-dei-reali/), [estremo superiore](/matematica/estremo-superiore/).

### Aritmetica, divisibilità e segni

La tabella seguente vale sia per la moltiplicazione sia per la divisione, purché
il divisore sia non nullo.

$$
\begin{array}{c|cc}
\cdot\text{ o }:&+&-\\
\hline
+&+&-\\
-&-&+
\end{array}
$$

$$
\frac{a+b}{c-d}=(a+b):(c-d),
\qquad c-d\ne0.
$$

$$
a\mid b
\Longleftrightarrow
\exists k\in\mathbb Z:\ b=ak.
$$

Per $a,b\in\mathbb Z$ con $a\ne0$ esistono unici $q,r\in\mathbb Z$ tali che

$$
b=aq+r,
\qquad
0\le r<|a|.
$$

Se $a,b\in\mathbb N_+$ sono scritti mediante la fattorizzazione prima

$$
a=\prod_p p^{\alpha_p},
\qquad
b=\prod_p p^{\beta_p},
$$

allora

$$
\gcd(a,b)=\prod_p p^{\min(\alpha_p,\beta_p)},
\qquad
\operatorname{lcm}(a,b)=\prod_p p^{\max(\alpha_p,\beta_p)}.
$$

$$
\gcd(a,b)\operatorname{lcm}(a,b)=ab,
\qquad a,b>0.
$$

Approfondimento: [aritmetica di interi, frazioni e decimali](/matematica/aritmetica-interi-frazioni-decimali/).

### Frazioni, decimali e notazione scientifica

$$
\frac ab=\frac cd
\Longleftrightarrow
ad=bc,
\qquad b,d\ne0.
$$

$$
\frac{-a}{b}=\frac{a}{-b}=-\frac ab,
\qquad
\frac{-a}{-b}=\frac ab.
$$

$$
\frac ab\pm\frac cd=\frac{ad\pm bc}{bd},
\qquad
\frac ab\frac cd=\frac{ac}{bd},
$$

$$
\frac{a/b}{c/d}=\frac{ad}{bc},
\qquad
b,c,d\ne0.
$$

$$
\frac{ac}{bc}=\frac ab\quad(bc\ne0).
$$

$$
\begin{array}{c|c}
\text{forma}&\text{valore}\\
\hline
0/b\ (b\ne0)&0\\
a/0&\text{non definita}\\
0/0&\text{non definita}
\end{array}
$$

Per $a/b$ ridotta ai minimi termini, con $b>0$:

$$
\frac ab\text{ ha sviluppo decimale finito}
\Longleftrightarrow
b=2^m5^n,
\qquad m,n\in\mathbb N_0.
$$

$$
x=m\,10^k,
\qquad
1\le|m|<10,
\qquad
k\in\mathbb Z,
\qquad x\ne0.
$$

$$
(m_1 10^{k_1})(m_2 10^{k_2})=(m_1m_2)10^{k_1+k_2},
$$

$$
\frac{m_1 10^{k_1}}{m_2 10^{k_2}}
=\frac{m_1}{m_2}10^{k_1-k_2},
\qquad m_2\ne0.
$$

Approfondimento: [frazioni numeriche](/matematica/frazioni-numeriche/), [notazione scientifica e approssimazioni](/matematica/notazione-scientifica-approssimazioni/).

### Rapporti, proporzioni e percentuali

**Proporzione.** Nella scrittura $a:b=c:d$, i termini $b$ e $d$ sono i
conseguenti e devono essere non nulli:

$$
a:b=c:d
\Longleftrightarrow
\frac ab=\frac cd
\Longleftrightarrow
ad=bc,
\qquad b,d\ne0.
$$

Forme risolte più usate:

| Incognita | Formula | Condizioni operative |
|---|---|---|
| $a$ | $a=\dfrac{bc}{d}$ | $d\ne0$ |
| $c$ | $c=\dfrac{ad}{b}$ | $b\ne0$ |
| $b$ | $b=\dfrac{ad}{c}$ | $c\ne0$, $d\ne0$ e risultato $b\ne0$ |
| $d$ | $d=\dfrac{bc}{a}$ | $a\ne0$, $b\ne0$ e risultato $d\ne0$ |

Se $a=c=0$, ogni coppia $b,d\ne0$ soddisfa la proporzione e né $b$ né $d$ è
determinato univocamente. Se uno solo tra $a$ e $c$ è nullo, la proporzione non
può essere verificata con $b,d\ne0$.

**Proporzionalità diretta.** $x$ è la variabile indipendente, $y$ quella
dipendente e $k$ la costante di proporzionalità:

$$
y=kx,
\qquad
x=\frac yk\quad(k\ne0),
\qquad
k=\frac yx\quad(x\ne0).
$$

Se $k=0$, allora $y=0$ per ogni $x$ e la relazione non permette di ricavare un
unico $x$ da $y$.

**Proporzionalità inversa:**

$$
y=\frac kx,
\qquad x\ne0,
$$

$$
k=xy,
\qquad
x=\frac ky\quad(y\ne0).
$$

Se $k=0$, si ha $y=0$ per ogni $x\ne0$; anche in questo caso non esiste una
formula inversa univoca per $x$.

**Percentuali.** $Q_i$ è il valore iniziale, $Q_f$ il valore finale e $p$ la
variazione percentuale **con segno**: $p>0$ indica un aumento, $p<0$ una
riduzione.

$$
p\%=\frac p{100}.
$$

Per calcolare il $p\%$ di una quantità $Q$, posto $V$ il valore percentuale:

$$
V=Q\frac p{100},
\qquad
Q=\frac{100V}{p}\quad(p\ne0),
\qquad
p=\frac{100V}{Q}\quad(Q\ne0).
$$

Se $p=0$, allora $V=0$ per ogni $Q$ e $Q$ non è ricavabile in modo univoco;
se $Q=0$, allora $V=0$ per ogni $p$ e $p$ non è ricavabile in modo univoco.

Formula diretta e forme inverse per una variazione percentuale:

$$
Q_f=Q_i\left(1+\frac p{100}\right),
$$

$$
Q_i=\frac{Q_f}{1+p/100},
\qquad p\ne-100,
$$

$$
p=100\left(\frac{Q_f}{Q_i}-1\right),
\qquad Q_i\ne0.
$$

Se si preferisce indicare una riduzione mediante una percentuale positiva
$r\ge0$:

$$
Q_f=Q_i\left(1-\frac r{100}\right),
\qquad
Q_i=\frac{Q_f}{1-r/100}\quad(r\ne100),
$$

$$
r=100\left(1-\frac{Q_f}{Q_i}\right),
\qquad Q_i\ne0.
$$

Variazioni successive $p_1,\ldots,p_m$:

$$
Q_f=Q_i\prod_{j=1}^m\left(1+\frac{p_j}{100}\right),
$$

$$
p_{\mathrm{tot}}
=100\left[
\prod_{j=1}^m\left(1+\frac{p_j}{100}\right)-1
\right].
$$

La percentuale che riporta $Q_f$ al valore iniziale non è, in generale, $-p$.
Se $p$ è la variazione da $Q_i$ a $Q_f$, la variazione inversa è

$$
p_{\mathrm{inv}}=-\frac{100p}{100+p},
\qquad p\ne-100.
$$

In particolare, applicare prima $+p\%$ e poi $-p\%$ produce

$$
\left(1+\frac p{100}\right)\left(1-\frac p{100}\right)
=1-\left(\frac p{100}\right)^2,
$$

quindi non si torna al valore iniziale, salvo $p=0$.

Approfondimento: [rapporti, proporzioni e percentuali](/matematica/rapporti-proporzioni-percentuali/), [proporzionalità diretta e inversa](/matematica/proporzionalita-diretta-e-inversa/), [variazioni percentuali](/matematica/variazioni-percentuali/).

### Potenze e radicali reali

Per $n\in\mathbb N_+$:

$$
a^n=\underbrace{a\cdot\ldots\cdot a}_{n\text{ fattori}},
\qquad
a^0=1\ (a\ne0),
\qquad
a^{-n}=\frac1{a^n}\ (a\ne0).
$$

$$
\begin{array}{c|c}
\text{forma}&\text{valore nel campo reale}\\
\hline
0^n,\ n>0&0\\
0^0&\text{non definita}\\
0^{-n},\ n>0&\text{non definita}
\end{array}
$$

Per $m,n\in\mathbb Z$, quando tutte le potenze sono definite (in particolare
$a\ne0$ se compare un esponente negativo):

$$
a^ma^n=a^{m+n},
\qquad
\frac{a^m}{a^n}=a^{m-n}\quad(a\ne0),
$$

$$
(a^m)^n=a^{mn},
\qquad
(ab)^n=a^nb^n,
\qquad
\left(\frac ab\right)^n=\frac{a^n}{b^n}\ (b\ne0).
$$

La radice $\sqrt[n]{a}$ indica il **ramo reale principale**. Per
$n\in\mathbb N_+$:

$$
\sqrt[n]{a}=r
\Longleftrightarrow
\begin{cases}
r^n=a\ \land\ r\ge0,&n\text{ pari e }a\ge0,\\
r^n=a,&n\text{ dispari e }a\in\mathbb R.
\end{cases}
$$

L'equazione $x^n=a$ è invece una relazione da risolvere e può avere più rami:

| Parità di $n$ | Condizione su $a$ | Soluzioni reali di $x^n=a$ |
|---|---|---|
| $n$ pari | $a>0$ | $x=\pm\sqrt[n]{a}$ |
| $n$ pari | $a=0$ | $x=0$ |
| $n$ pari | $a<0$ | nessuna |
| $n$ dispari | $a\in\mathbb R$ | $x=\sqrt[n]{a}$ |

$$
\sqrt{a^2}=|a|,
\qquad
(\sqrt[n]{a})^n=a,
$$

$$
\sqrt[n]{a^n}=
\begin{cases}
|a|,&n\text{ pari},\\
a,&n\text{ dispari}.
\end{cases}
$$

Per $m\in\mathbb Z$, $n\in\mathbb N_+$ e $m/n$ ridotto ai minimi termini:

$$
a^{m/n}=(\sqrt[n]{a})^m.
$$

$$
\begin{array}{c|c}
n\text{ pari}&a\ge0;\ a>0\text{ se }m<0\\
n\text{ dispari}&a\in\mathbb R;\ a\ne0\text{ se }m<0
\end{array}
$$

$$
a^x=e^{x\ln a},
\qquad a>0,
\qquad x\in\mathbb R.
$$

$$
\begin{array}{c|c|c}
&\sqrt[n]{ab}=\sqrt[n]a\sqrt[n]b
&\sqrt[n]{a/b}=\sqrt[n]a/\sqrt[n]b\\
\hline
n\text{ dispari}&a,b\in\mathbb R&a\in\mathbb R,\ b\ne0\\
n\text{ pari}&a,b\ge0&a\ge0,\ b>0
\end{array}
$$

$$
\frac1{\sqrt a}=\frac{\sqrt a}{a},
\qquad a>0,
$$

$$
\frac1{\sqrt a+\sqrt b}
=\frac{\sqrt a-\sqrt b}{a-b},
\qquad a,b\ge0,
\qquad a\ne b.
$$

$$
x^2=a
\Longleftrightarrow
x=\pm\sqrt a,
\qquad a\ge0,
$$

$$
\sqrt{x^2}=\lvert x\rvert.
$$

Approfondimento: [potenze e radicali](/matematica/potenze-e-radicali/).

### Principio di induzione e disuguaglianza di Bernoulli

$$
\left.
\begin{array}{l}
P(n_0)\\
\forall n\ge n_0:\ P(n)\Rightarrow P(n+1)
\end{array}
\right\}
\Longrightarrow
\forall n\ge n_0:\ P(n).
$$

$$
(1+x)^n\ge1+nx,
\qquad
n\in\mathbb N_+,
\qquad
x\ge-1.
$$

$$
(1+x)^n=1+nx
\Longleftrightarrow
n=1\ \lor\ x=0.
$$

Approfondimento: [principio di induzione](/matematica/principio-di-induzione/), [disuguaglianza di Bernoulli](/matematica/disuguaglianza-di-bernoulli/).

### Fattoriale e coefficienti binomiali

$$
n!=\prod_{k=1}^n k,
\qquad
0!=1,
\qquad
n\in\mathbb N_0.
$$

$$
\binom nk=\frac{n!}{k!(n-k)!},
\qquad
n\in\mathbb N_0,
\qquad
0\le k\le n.
$$

$$
\binom nk=\binom n{n-k},
\qquad 0\le k\le n,
$$

$$
\binom nk+\binom n{k+1}=\binom{n+1}{k+1},
\qquad 0\le k\le n-1.
$$

$$
(a+b)^n=\sum_{k=0}^n\binom nk a^{n-k}b^k.
$$

Approfondimento: [fattoriale](/matematica/fattoriale/), [coefficiente binomiale](/matematica/coefficiente-binomiale/).

### Sommatorie, progressioni e somme finite

Nella sommatoria $\sum_{k=m}^{n}a_k$, $k$ è un **indice muto**: può essere
rinominato senza cambiare il valore, purché siano modificati coerentemente
estremi e termine generale.

Per $m,n\in\mathbb Z$ con $m\le n$, linearità e cambio di indice:

$$
\sum_{k=m}^{n}(\alpha a_k+\beta b_k)
=
\alpha\sum_{k=m}^{n}a_k
+
\beta\sum_{k=m}^{n}b_k,
$$

$$
\sum_{k=m}^{n}a_k
=
\sum_{j=0}^{n-m}a_{m+j}.
$$

Somme fondamentali, per $n\in\mathbb N_+$:

$$
\sum_{k=1}^{n}1=n,
\qquad
\sum_{k=1}^{n}k=\frac{n(n+1)}2,
$$

$$
\sum_{k=1}^{n}k^2=\frac{n(n+1)(2n+1)}6,
\qquad
\sum_{k=1}^{n}k^3=\left[\frac{n(n+1)}2\right]^2.
$$

**Progressione aritmetica.** $a_1$ è il primo termine, $d$ la differenza comune,
$a_n$ il termine di indice $n$ e $S_n$ la somma dei primi $n$ termini:

$$
a_n=a_1+(n-1)d,
$$

$$
S_n=\sum_{k=1}^{n}a_k
=\frac n2(a_1+a_n)
=\frac n2\bigl[2a_1+(n-1)d\bigr].
$$

Forme inverse principali, per $n>1$:

$$
d=\frac{a_n-a_1}{n-1},
\qquad
a_1=a_n-(n-1)d,
$$

$$
a_1=\frac{S_n}{n}-\frac{n-1}{2}d,
\qquad
d=\frac{2(S_n-na_1)}{n(n-1)}.
$$

Se $d\ne0$:

$$
n=1+\frac{a_n-a_1}{d},
$$

ma il risultato è un indice valido soltanto se appartiene a $\mathbb N_+$.

**Progressione geometrica.** $q$ è la ragione comune. Il primo termine è
sempre $a_1$; per $n>1$:

$$
a_n=a_1q^{n-1}.
$$

$$
S_n=\sum_{k=1}^{n}a_k
=
\begin{cases}
\displaystyle a_1\frac{1-q^n}{1-q},&q\ne1,\\[8pt]
na_1,&q=1.
\end{cases}
$$

Forme inverse utili:

$$
a_1=a_n\quad(n=1),
\qquad
a_1=\frac{a_n}{q^{n-1}}\quad(n>1,\ q\ne0),
$$

$$
q=\frac{a_{n+1}}{a_n}\quad(a_n\ne0),
$$

$$
q^{n-1}=\frac{a_n}{a_1}\quad(a_1\ne0).
$$

L'ultima relazione può produrre più rami reali o nessun ramo, a seconda del
segno di $a_n/a_1$ e della parità di $n-1$. Se $q>0$, $q\ne1$ e
$a_n/a_1>0$, si può ricavare anche l'indice:

$$
n=1+\frac{\ln(a_n/a_1)}{\ln q},
$$

accettando il risultato soltanto quando $n\in\mathbb N_+$.

### Valore assoluto

$$
|x|=
\begin{cases}
x,&x\ge0,\\
-x,&x<0.
\end{cases}
$$

$$
|x|\ge0,
\qquad
|x|=0\Longleftrightarrow x=0,
\qquad
|-x|=|x|.
$$

$$
|xy|=|x||y|,
\qquad
\left|\frac xy\right|=\frac{|x|}{|y|}\quad(y\ne0).
$$

$$
|x+y|\le|x|+|y|,
\qquad
\bigl||x|-|y|\bigr|\le|x-y|.
$$

Per $r\ge0$:

$$
|x-a|<r\Longleftrightarrow a-r<x<a+r,
$$

$$
|x-a|\le r\Longleftrightarrow a-r\le x\le a+r,
$$

$$
|x-a|>r\Longleftrightarrow x<a-r\ \lor\ x>a+r,
$$

$$
|x-a|\ge r\Longleftrightarrow x\le a-r\ \lor\ x\ge a+r.
$$

Approfondimento: [valore assoluto](/matematica/valore-assoluto/), [disuguaglianza triangolare](/matematica/disuguaglianza-triangolare/).

### Disuguaglianze fondamentali

Per $a,b\in\mathbb R$:

$$
2|ab|\le a^2+b^2,
\qquad
(a-b)^2\ge0.
$$

Media aritmetica e geometrica, per $a,b\ge0$:

$$
\sqrt{ab}\le\frac{a+b}{2},
$$

con uguaglianza se e solo se $a=b$.

Disuguaglianza di Cauchy–Schwarz in $\mathbb R^n$:

$$
\left(\sum_{k=1}^{n}a_kb_k\right)^2
\le
\left(\sum_{k=1}^{n}a_k^2\right)
\left(\sum_{k=1}^{n}b_k^2\right).
$$

L'uguaglianza vale se e solo se i vettori $(a_1,\ldots,a_n)$ e
$(b_1,\ldots,b_n)$ sono linearmente dipendenti, compreso il caso in cui uno
dei due sia nullo.

<a id="sezione-2"></a>
## 2. Algebra, equazioni e disequazioni

### Espressioni algebriche, dominio e polinomi

Per $m\in\mathbb N_+$, le condizioni di esistenza più frequenti sono:

| Espressione | Condizione reale |
|---|---|
| $P(x)/Q(x)$ | $Q(x)\ne0$ |
| $\sqrt[2m]{A(x)}$ | $A(x)\ge0$ |
| $\log_a A(x)$ | $a>0$, $a\ne1$, $A(x)>0$ |
| $A(x)^{g(x)}$ con esponente reale variabile | $A(x)>0$ |

$$
P(x)=a_nx^n+\cdots+a_1x+a_0,
\qquad a_n\ne0,
\qquad \deg P=n.
$$

$$
\deg(PQ)=\deg P+\deg Q,
\qquad P,Q\ne0,
$$

$$
\deg(P+Q)\le\max(\deg P,\deg Q),
\qquad P,Q,P+Q\ne0.
$$

$$
(a\pm b)^2=a^2\pm2ab+b^2,
\qquad
(a+b)(a-b)=a^2-b^2,
$$

$$
(a\pm b)^3=a^3\pm3a^2b+3ab^2\pm b^3,
$$

$$
a^3-b^3=(a-b)(a^2+ab+b^2),
\qquad
a^3+b^3=(a+b)(a^2-ab+b^2).
$$

$$
a^n-b^n=(a-b)\sum_{k=0}^{n-1}a^{n-1-k}b^k,
\qquad n\ge1,
$$

$$
a^n+b^n=(a+b)\sum_{k=0}^{n-1}(-1)^k a^{n-1-k}b^k,
\qquad n\ge1\text{ dispari}.
$$

$$
(a+b)^n=\sum_{k=0}^n\binom nk a^{n-k}b^k.
$$

$$
ax^2+bx+c=a(x-x_1)(x-x_2),
\qquad a\ne0,
$$

quando $x_1,x_2$ sono le radici reali, anche coincidenti. Il completamento del
quadrato fornisce inoltre

$$
ax^2+bx+c
=a\left(x+\frac{b}{2a}\right)^2-\frac{\Delta}{4a},
\qquad
\Delta=b^2-4ac.
$$

$$
P=DQ+R,
\qquad
D\ne0,
\qquad
R=0\ \lor\ \deg R<\deg D.
$$

$$
P(x)=(x-a)Q(x)+P(a),
\qquad
(x-a)\mid P(x)\Longleftrightarrow P(a)=0.
$$

Per $P\in\mathbb Z[x]$ con coefficiente principale $a_n$ e termine noto $a_0$:

$$
\frac pq\text{ radice razionale ridotta}
\Longrightarrow
p\mid a_0,
\qquad q\mid a_n.
$$

$$
\frac{(x-a)P(x)}{x-a}=P(x),
\qquad x\ne a.
$$

Approfondimento: [polinomio](/matematica/polinomio/), [fattorizzazione di polinomi](/matematica/fattorizzazione-di-polinomi/), [divisione tra polinomi](/matematica/divisione-tra-polinomi/).

### Equivalenze, implicazioni e trasformazioni lecite

Le trasformazioni devono essere eseguite nel dominio comune nel quale tutte le
espressioni coinvolte sono definite.

$$
A=B
\Longleftrightarrow
A+C=B+C.
$$

$$
A=B
\Longleftrightarrow
AC=BC,
\qquad C\ne0.
$$

Se $A$ e $B$ sono non nulli:

$$
A=B
\Longleftrightarrow
\frac1A=\frac1B.
$$

L'elevamento al quadrato conserva soltanto un'implicazione in avanti:

$$
A=B\Longrightarrow A^2=B^2,
\qquad
A^2=B^2\Longleftrightarrow A=B\ \lor\ A=-B.
$$

$$
\begin{array}{c|c}
\text{trasformazione in una disequazione}&\text{effetto sul verso}\\
\hline
+C&\text{invariato}\\
\times C,\ C>0&\text{invariato}\\
\times C,\ C<0&\text{invertito}\\
\times C,\ C\text{ di segno incognito}&\text{separazione dei casi}
\end{array}
$$

Per reciproci positivi:

$$
0<A<B
\Longleftrightarrow
\frac1A>\frac1B.
$$

Approfondimento: [equazioni algebriche elementari](/matematica/equazioni-algebriche-elementari/), [disequazione](/matematica/disequazione/).

### Equazioni di primo e secondo grado

L'insieme delle soluzioni reali di $ax=b$ è

$$
S=
\begin{cases}
\left\{\dfrac ba\right\},&a\ne0,\\[6pt]
\mathbb R,&a=0,\ b=0,\\
\varnothing,&a=0,\ b\ne0.
\end{cases}
$$

$$
ax^2+bx+c=0,
\qquad
a\ne0,
\qquad
\Delta=b^2-4ac,
$$

$$
x_{1,2}=\frac{-b\pm\sqrt\Delta}{2a},
\qquad
\Delta\ge0.
$$

La doppia scrittura $x_{1,2}$ significa

$$
x_1=\frac{-b-\sqrt\Delta}{2a},
\qquad
x_2=\frac{-b+\sqrt\Delta}{2a},
$$

salvo scambiare l'ordine delle due radici.

$$
\begin{array}{c|c}
\Delta&\text{radici reali}\\
\hline
\Delta>0&x_1\ne x_2\\
\Delta=0&x_1=x_2=-b/(2a)\\
\Delta<0&\varnothing
\end{array}
$$

$$
x_1+x_2=-\frac ba,
\qquad
x_1x_2=\frac ca,
$$

$$
b=-a(x_1+x_2),
\qquad
c=ax_1x_2,
\qquad
ax^2+bx+c=a(x-x_1)(x-x_2).
$$

$$
x_1,x_2\text{ sono le radici di }x^2-sx+p=0
\Longleftrightarrow
x_1+x_2=s,
\qquad
x_1x_2=p.
$$

$$
P_1(x)\cdots P_m(x)=0
\Longleftrightarrow
\bigvee_{j=1}^m\bigl[P_j(x)=0\bigr].
$$

$$
\frac{P(x)}{Q(x)}=0
\Longleftrightarrow
P(x)=0\ \land\ Q(x)\ne0.
$$

Approfondimento: [equazioni algebriche elementari](/matematica/equazioni-algebriche-elementari/).

### Disequazioni e segno dei polinomi

L'insieme delle soluzioni reali di $ax>b$ è

$$
S=
\begin{cases}
\left(\dfrac ba,+\infty\right),&a>0,\\[6pt]
\left(-\infty,\dfrac ba\right),&a<0,\\[6pt]
\mathbb R,&a=0,\ b<0,\\
\varnothing,&a=0,\ b\ge0.
\end{cases}
$$

Per $P(x)=ax^2+bx+c$, $a\ne0$, con $x_1<x_2$ quando $\Delta>0$:

$$
\begin{array}{c|c|c}
\Delta&\text{insieme}&\operatorname{sgn}P\\
\hline
>0&(-\infty,x_1)\cup(x_2,+\infty)&\operatorname{sgn}a\\
>0&(x_1,x_2)&-\operatorname{sgn}a\\
=0&\mathbb R\setminus\{-b/(2a)\}&\operatorname{sgn}a\\
<0&\mathbb R&\operatorname{sgn}a
\end{array}
$$

Per $\Delta>0$ vale $P(x_1)=P(x_2)=0$; per $\Delta=0$ vale
$P(-b/(2a))=0$. I punti di annullamento vanno inclusi nelle disequazioni non
strette ($\ge,\le$) ed esclusi in quelle strette ($>,<$).

$$
\operatorname{sgn}\!\left(\prod_{j=1}^m F_j\right)
=\prod_{j=1}^m\operatorname{sgn}(F_j),
$$

$$
\operatorname{sgn}\!\left(\frac PQ\right)
=\operatorname{sgn}(P)\operatorname{sgn}(Q),
\qquad Q\ne0.
$$

Se $F(x)=(x-x_0)^mG(x)$, con $G$ continua in un intorno di $x_0$ e $G(x_0)\ne0$, per $\varepsilon>0$ sufficientemente piccolo:

$$
\operatorname{sgn}F(x_0-\varepsilon)
=(-1)^m\operatorname{sgn}F(x_0+\varepsilon).
$$

$$
F(x_0)=0
\Longrightarrow
x_0\in\{F\ge0\}\cap\{F\le0\},
\qquad
Q(x_0)=0
\Longrightarrow
x_0\notin\operatorname{Dom}\frac PQ.
$$

$$
S_{\text{sistema}}=\bigcap_j S_j,
\qquad
S_{\text{alternativa}}=\bigcup_j S_j.
$$

Approfondimento: [disequazione](/matematica/disequazione/).

### Equazioni e disequazioni con valore assoluto

Per espressioni reali $A,B$:

$$
|A|=B
\Longleftrightarrow
B\ge0\ \land\ (A=B\ \lor\ A=-B).
$$

$$
|A|\le B
\Longleftrightarrow
B\ge0\ \land\ (-B\le A\le B),
$$

$$
|A|<B
\Longleftrightarrow
B>0\ \land\ (-B<A<B).
$$

$$
|A|\ge B
\Longleftrightarrow
\begin{cases}
A\le-B\ \lor\ A\ge B,&B>0,\\
\text{ogni punto del dominio},&B\le0,
\end{cases}
$$

$$
|A|>B
\Longleftrightarrow
\begin{cases}
A<-B\ \lor\ A>B,&B\ge0,\\
\text{ogni punto del dominio},&B<0.
\end{cases}
$$

Approfondimento: [valore assoluto](/matematica/valore-assoluto/), [disequazione](/matematica/disequazione/).

### Equazioni e disequazioni irrazionali

In tutte le formule seguenti $m\in\mathbb N_+$.

$$
\sqrt[2m]{A}=B
\Longleftrightarrow
\begin{cases}
A=B^{2m},\\
B\ge0,
\end{cases}
$$

$$
\sqrt[2m+1]{A}=B
\Longleftrightarrow
A=B^{2m+1}.
$$

$$
\sqrt A<B
\Longleftrightarrow
A\ge0,\ B>0,\ A<B^2,
$$

$$
\sqrt A\le B
\Longleftrightarrow
A\ge0,\ B\ge0,\ A\le B^2,
$$

$$
\sqrt A>B
\Longleftrightarrow
A\ge0\ \land\ (B<0\ \lor\ A>B^2),
$$

$$
\sqrt A\ge B
\Longleftrightarrow
A\ge0\ \land\ (B\le0\ \lor\ A\ge B^2).
$$

Approfondimento: [equazioni algebriche elementari](/matematica/equazioni-algebriche-elementari/), [funzioni potenza e irrazionali](/matematica/funzioni-potenza-e-irrazionali/), [disequazione](/matematica/disequazione/).

### Esponenziali e logaritmi

$$
a^{x+y}=a^xa^y,
\qquad
a^{x-y}=\frac{a^x}{a^y},
\qquad
(a^x)^y=a^{xy},
\qquad a>0.
$$

$$
y=a^x
\Longleftrightarrow
x=\log_a y,
\qquad a>0,
\qquad a\ne1,
\qquad y>0.
$$

Questa è una vera coppia diretta/inversa perché l'esponenziale di base
ammissibile è biiettivo da $\mathbb R$ a $(0,+\infty)$.

$$
\begin{array}{c|c|c|c}
\text{funzione}&\text{dominio}&\text{immagine}&\text{monotonia}\\
\hline
a^x&\mathbb R&(0,+\infty)&\nearrow\ a>1,\ \searrow\ 0<a<1\\
\log_a x&(0,+\infty)&\mathbb R&\nearrow\ a>1,\ \searrow\ 0<a<1
\end{array}
$$

$$
\log_a(xy)=\log_a x+\log_a y,
\qquad
\log_a\frac xy=\log_a x-\log_a y,
$$

$$
\log_a(x^r)=r\log_a x,
\qquad
\log_a x=\frac{\ln x}{\ln a},
$$

con argomenti positivi.

$$
a^{\log_a x}=x\quad(x>0),
\qquad
\log_a(a^x)=x\quad(x\in\mathbb R),
\qquad
a>0,\quad a\ne1.
$$

Nelle equivalenze seguenti, $a>0$ e $a\ne1$.

$$
a^{f(x)}=a^{g(x)}
\Longleftrightarrow
f(x)=g(x),
$$

$$
a^{f(x)}=b
\Longleftrightarrow
f(x)=\log_a b,
\qquad b>0,
$$

$$
\log_a f(x)=c
\Longleftrightarrow
f(x)=a^c,
\qquad f(x)>0,
$$

$$
\log_a f(x)=\log_a g(x)
\Longleftrightarrow
f(x)=g(x)>0.
$$

$$
a^{f(x)}>a^{g(x)}
\Longleftrightarrow
\begin{cases}
f(x)>g(x),&a>1,\\
f(x)<g(x),&0<a<1,
\end{cases}
$$

$$
\log_a f(x)>\log_a g(x)
\Longleftrightarrow
\begin{cases}
f(x)>g(x)>0,&a>1,\\
0<f(x)<g(x),&0<a<1.
\end{cases}
$$

Le stesse regole valgono sostituendo $>$ con $\ge$, $<$ o $\le$: per
$a>1$ il verso si conserva; per $0<a<1$ si inverte. Nei confronti logaritmici
gli argomenti devono restare strettamente positivi.

Approfondimento: [esponenziale](/matematica/esponenziale/), [logaritmo](/matematica/logaritmo/), [proprietà dei logaritmi](/matematica/proprieta-dei-logaritmi/).

### Sistemi di equazioni lineari

Nel sistema seguente $x,y$ sono le incognite; $a_i,b_i$ sono i coefficienti e
$c_i$ i termini noti.

$$
\begin{cases}
a_1x+b_1y=c_1,\\
a_2x+b_2y=c_2,
\end{cases}
$$

$$
D=a_1b_2-a_2b_1,
\qquad
D_x=c_1b_2-c_2b_1,
\qquad
D_y=a_1c_2-a_2c_1.
$$

Con

$$
A=\begin{pmatrix}a_1&b_1\\a_2&b_2\end{pmatrix},
\qquad
[A\mid c]=
\begin{pmatrix}a_1&b_1&c_1\\a_2&b_2&c_2\end{pmatrix},
$$

il teorema di Rouché–Capelli dà la classificazione completa:

| Condizione | Soluzioni |
|---|---|
| $\operatorname{rank}A<\operatorname{rank}[A\mid c]$ | nessuna |
| $\operatorname{rank}A=\operatorname{rank}[A\mid c]=2$ | una sola |
| $\operatorname{rank}A=\operatorname{rank}[A\mid c]<2$ | infinitamente molte |

Nel caso $D\ne0$ la soluzione unica si calcola con Cramer:

$$
x=\frac{D_x}{D},
\qquad
y=\frac{D_y}{D}.
$$

Se $D=0$ e almeno uno tra $a_1,b_1,a_2,b_2$ è non nullo, allora

$$
D_x=D_y=0
\Longleftrightarrow
\text{infinitamente molte soluzioni};
$$

se invece almeno uno tra $D_x,D_y$ è non nullo, il sistema è impossibile.
Quando tutti i coefficienti delle incognite sono nulli, si controllano direttamente
le eventuali equazioni $0=c_i$.

Approfondimento: [sistemi di equazioni](/matematica/sistemi-di-equazioni/).

<a id="sezione-3"></a>
## 3. Funzioni e geometria analitica

### Funzioni elementari di riferimento

Per $n,m\in\mathbb N_+$, salvo diversa indicazione, le funzioni di uso frequente sono:

| Funzione | Dominio | Immagine | Proprietà essenziale |
|---|---|---|---|
| $x^n$, $n$ pari | $\mathbb R$ | $[0,+\infty)$ | pari, decrescente su $(-\infty,0]$, crescente su $[0,+\infty)$ |
| $x^n$, $n$ dispari | $\mathbb R$ | $\mathbb R$ | dispari, strettamente crescente |
| $\lvert x\rvert$ | $\mathbb R$ | $[0,+\infty)$ | pari, decrescente su $(-\infty,0]$, crescente su $[0,+\infty)$ |
| $1/x$ | $\mathbb R\setminus\{0\}$ | $\mathbb R\setminus\{0\}$ | dispari, strettamente decrescente su ciascuna componente del dominio |
| $\sqrt[2m]{x}$ | $[0,+\infty)$ | $[0,+\infty)$ | strettamente crescente |
| $\sqrt[2m+1]{x}$ | $\mathbb R$ | $\mathbb R$ | strettamente crescente |
| $a^x$, $a>1$ | $\mathbb R$ | $(0,+\infty)$ | strettamente crescente |
| $a^x$, $0<a<1$ | $\mathbb R$ | $(0,+\infty)$ | strettamente decrescente |
| $\ln x$ | $(0,+\infty)$ | $\mathbb R$ | strettamente crescente |

Parte intera, parte frazionaria e segno:

$$
\lfloor x\rfloor\le x<\lfloor x\rfloor+1,
\qquad
\{x\}=x-\lfloor x\rfloor\in[0,1),
$$

$$
\operatorname{sgn}x=
\begin{cases}
-1,&x<0,\\
0,&x=0,\\
1,&x>0.
\end{cases}
$$

### Dominio, immagine, preimmagine, composizione e inversa

Nella scrittura $f:A\to B$, $A$ è il dominio e $B$ il codominio. L'immagine
$f(A)$ può essere un sottoinsieme proprio del codominio; la suriettività richiede
$f(A)=B$.

Il grafico e la preimmagine di un insieme $Y\subseteq B$ sono

$$
G_f=\{(x,f(x)):x\in A\},
\qquad
f^{-1}(Y)=\{x\in A:f(x)\in Y\}.
$$

La notazione $f^{-1}(Y)$ indica una **preimmagine** ed è definita anche quando
$f$ non è invertibile. La funzione inversa $f^{-1}:B\to A$ esiste invece solo
quando $f$ è biiettiva.

$$
f:A\to B,
\qquad
f(A)=\{f(x):x\in A\}\subseteq B.
$$

$$
f\text{ iniettiva}
\Longleftrightarrow
f(x_1)=f(x_2)\Rightarrow x_1=x_2,
$$

$$
f\text{ suriettiva su }B
\Longleftrightarrow
\forall y\in B,\ \exists x\in A:\ f(x)=y,
$$

$$
f\text{ biiettiva}
\Longleftrightarrow
f\text{ iniettiva e suriettiva}.
$$

Se $f:A\to B$ è biiettiva, per $x\in A$ e $y\in B$:

$$
f^{-1}(y)=x
\Longleftrightarrow
f(x)=y.
$$

$$
f^{-1}\circ f=\operatorname{id}_A,
\qquad
f\circ f^{-1}=\operatorname{id}_B.
$$

$$
(g\circ f)(x)=g(f(x)),
\qquad
D_{g\circ f}=\{x\in D_f:f(x)\in D_g\}.
$$

$$
(g\circ f)^{-1}=f^{-1}\circ g^{-1},
$$

quando $f$ e $g$ sono invertibili.

Coppie diretta/inversa frequenti:

| Funzione diretta | Restrizione che la rende biiettiva | Funzione inversa |
|---|---|---|
| $y=x^n$, $n$ pari | $x\in[0,+\infty)$ | $x=\sqrt[n]{y}$, $y\ge0$ |
| $y=x^n$, $n$ pari | $x\in(-\infty,0]$ | $x=-\sqrt[n]{y}$, $y\ge0$ |
| $y=x^n$, $n$ dispari | $x\in\mathbb R$ | $x=\sqrt[n]{y}$ |
| $y=a^x$, $a>0$, $a\ne1$ | $x\in\mathbb R$ | $x=\log_a y$, $y>0$ |
| $y=\sin x$ | $x\in[-\pi/2,\pi/2]$ | $x=\arcsin y$, $\lvert y\rvert\le1$ |
| $y=\cos x$ | $x\in[0,\pi]$ | $x=\arccos y$, $\lvert y\rvert\le1$ |
| $y=\tan x$ | $x\in(-\pi/2,\pi/2)$ | $x=\arctan y$ |

Per $D_f=-D_f$:

$$
f(-x)=f(x)\quad\text{pari},
\qquad
f(-x)=-f(x)\quad\text{dispari}.
$$

$$
D_f+T=D_f,
\qquad
f(x+T)=f(x),
\qquad T>0.
$$

Qui $D_f+T=\{x+T:x\in D_f\}$. Un **periodo fondamentale** è il minimo
periodo positivo, quando tale minimo esiste.

Limitatezza su $E\subseteq D_f$:

$$
\begin{aligned}
f\text{ limitata superiormente su }E
&\Longleftrightarrow \exists M\in\mathbb R:\ f(x)\le M\quad\forall x\in E,\\
f\text{ limitata inferiormente su }E
&\Longleftrightarrow \exists m\in\mathbb R:\ m\le f(x)\quad\forall x\in E,\\
f\text{ limitata su }E
&\Longleftrightarrow \exists C>0:\ |f(x)|\le C\quad\forall x\in E.
\end{aligned}
$$

Monotonia su un intervallo $I$:

$$
\begin{aligned}
x_1<x_2&\Longrightarrow f(x_1)\le f(x_2)
&&\text{non decrescente},\\
x_1<x_2&\Longrightarrow f(x_1)<f(x_2)
&&\text{strettamente crescente},\\
x_1<x_2&\Longrightarrow f(x_1)\ge f(x_2)
&&\text{non crescente},\\
x_1<x_2&\Longrightarrow f(x_1)>f(x_2)
&&\text{strettamente decrescente}.
\end{aligned}
$$

Estremi assoluti su $E$:

$$
\begin{aligned}
x_M\in E\text{ è punto di massimo assoluto}
&\Longleftrightarrow f(x)\le f(x_M)\quad\forall x\in E,\\
x_m\in E\text{ è punto di minimo assoluto}
&\Longleftrightarrow f(x_m)\le f(x)\quad\forall x\in E.
\end{aligned}
$$

Per un estremo locale le stesse disuguaglianze sono richieste soltanto in un
intorno relativo del punto considerato.

Approfondimento: [funzione matematica](/matematica/funzione-matematica/), [funzione inversa](/matematica/funzione-inversa/), [funzione monotona](/matematica/funzione-monotona/).

### Trasformazioni dei grafici

$$
\begin{array}{c|c}
\text{funzione}&\text{trasformazione di }y=f(x)\\
\hline
f(x)+k&\text{traslazione verticale di }k\\
f(x-h)&\text{traslazione orizzontale di }h\\
af(x)&\text{scala verticale }|a|;\ \text{riflessione rispetto all'asse }x\text{ se }a<0\\
f(bx)&\text{scala orizzontale }1/|b|\ (b\ne0);\ \text{riflessione rispetto all'asse }y\text{ se }b<0\\
-f(x)&\text{riflessione rispetto all'asse }x\\
f(-x)&\text{riflessione rispetto all'asse }y\\
|f(x)|&\text{rami negativi riflessi sopra l'asse }x\\
f(|x|)&\text{ramo }x\ge0\text{ copiato per }x\le0
\end{array}
$$

Per $b=0$, $f(bx)=f(0)$ soltanto se $0\in D_f$.

Se $f$ è biiettiva, il grafico dell’inversa si ottiene riflettendo il
grafico di $f$ rispetto alla bisettrice $y=x$:

$$
G_{f^{-1}}=\text{riflessione di }G_f\text{ rispetto a }y=x.
$$

Approfondimento: [trasformazioni di grafici](/matematica/trasformazioni-di-grafici/).

### Geometria analitica nel piano

Le coordinate sono espresse in un sistema cartesiano ortonormale. Per
$u=(u_1,u_2)$ e $v=(v_1,v_2)$:

$$
u\cdot v=u_1v_1+u_2v_2,
\qquad
\lVert u\rVert=\sqrt{u_1^2+u_2^2},
$$

$$
u\perp v\Longleftrightarrow u\cdot v=0,
\qquad
\cos\theta=\frac{u\cdot v}{\lVert u\rVert\,\lVert v\rVert}
\quad(u,v\ne0),
$$

con $\theta\in[0,\pi]$ angolo non orientato fra i due vettori.

Retta passante per $P_0=(x_0,y_0)$ con vettore direttore $v=(v_1,v_2)\ne0$:

$$
(x,y)=(x_0,y_0)+t(v_1,v_2),
\qquad t\in\mathbb R.
$$

Per $A(x_1,y_1)$ e $B(x_2,y_2)$, $AB$ indica la distanza e $M$ il punto
medio del segmento:

$$
AB=\sqrt{(x_2-x_1)^2+(y_2-y_1)^2},
$$

$$
M=\left(\frac{x_1+x_2}{2},\frac{y_1+y_2}{2}\right).
$$

$$
m=\frac{y_2-y_1}{x_2-x_1},
\qquad x_1\ne x_2,
$$

$$
y-y_1=m(x-x_1),
\qquad
x=x_1\quad(x_1=x_2).
$$

Forma generale, forma esplicita e forma degli intercetti:

$$
ax+by+c=0,
\qquad (a,b)\ne(0,0),
$$

$$
y=mx+q,
\qquad
m=-\frac ab,
\qquad
q=-\frac cb,
\qquad b\ne0,
$$

$$
\frac xp+\frac yq=1,
\qquad pq\ne0,
$$

in cui $p$ e $q$ sono rispettivamente le intercette sugli assi $x$ e $y$. Dalla
forma generale:

$$
p=-\frac ca,
\qquad
q=-\frac cb,
\qquad
abc\ne0.
$$

Se $c=0$, la retta passa per l'origine e la forma degli intercetti con
$pq\ne0$ non è disponibile. Se $a=0$ oppure $b=0$, la retta è parallela a uno
degli assi e manca la corrispondente intercetta finita.

$$
r_1\parallel r_2
\Longleftrightarrow
a_1b_2-a_2b_1=0,
$$

$$
r_1\perp r_2
\Longleftrightarrow
a_1a_2+b_1b_2=0.
$$

La prima condizione confronta le direzioni e comprende anche il caso di rette
coincidenti; per richiedere rette parallele distinte occorre escludere la
coincidenza.

Se le rette non sono verticali, con coefficienti angolari $m_1,m_2$:

$$
r_1\parallel r_2\Longleftrightarrow m_1=m_2,
\qquad
r_1\perp r_2\Longleftrightarrow m_1m_2=-1.
$$

Per $P=(x_0,y_0)$ e $r:ax+by+c=0$:

$$
d(P,r)=\frac{|ax_0+by_0+c|}{\sqrt{a^2+b^2}}.
$$

Circonferenza:

$$
(x-h)^2+(y-k)^2=r^2,
\qquad r\ge0,
$$

$$
x^2+y^2+Dx+Ey+F=0.
$$

Passaggio fra le due forme:

$$
D=-2h,
\qquad
E=-2k,
\qquad
F=h^2+k^2-r^2,
$$

$$
C=\left(-\frac D2,-\frac E2\right),
\qquad
r^2=\frac{D^2+E^2}{4}-F.
$$

| Condizione | Luogo reale |
|---|---|
| $r^2>0$ | circonferenza di raggio $r=\sqrt{r^2}$ |
| $r^2=0$ | il solo punto $C$ |
| $r^2<0$ | insieme vuoto in $\mathbb R^2$ |

Parabola con asse verticale:

$$
y=ax^2+bx+c,
\qquad a\ne0,
$$

$$
x_V=-\frac b{2a},
\qquad
y_V=-\frac\Delta{4a},
\qquad
\text{asse}:x=x_V,
$$

$$
y=a(x-x_V)^2+y_V.
$$

Dalla forma del vertice alla forma esplicita:

$$
b=-2ax_V,
\qquad
c=ax_V^2+y_V.
$$

La parabola è rivolta verso l'alto per $a>0$ e verso il basso per $a<0$.

Coniche canoniche non ruotate. In tutte le formule $(h,k)$ è il centro;
$a$ indica il semiasse trasverso o maggiore e $b$ l'altro semiasse.

Ellisse con asse maggiore orizzontale:

$$
\frac{(x-h)^2}{a^2}+\frac{(y-k)^2}{b^2}=1,
\qquad a,b>0,
$$

$$
c^2=a^2-b^2,
\qquad a\ge b,
\qquad
F_{1,2}=(h\pm c,k).
$$

Iperbole con asse trasverso orizzontale:

$$
\frac{(x-h)^2}{a^2}-\frac{(y-k)^2}{b^2}=1,
\qquad a,b>0,
$$

$$
c^2=a^2+b^2,
\qquad
F_{1,2}=(h\pm c,k),
\qquad
y-k=\pm\frac ba(x-h).
$$

Ellisse con asse maggiore verticale:

$$
\frac{(x-h)^2}{b^2}+\frac{(y-k)^2}{a^2}=1,
\qquad
c^2=a^2-b^2,
\qquad
F_{1,2}=(h,k\pm c),
\qquad a\ge b>0.
$$

Iperbole con asse trasverso verticale:

$$
\frac{(y-k)^2}{a^2}-\frac{(x-h)^2}{b^2}=1,
\qquad
c^2=a^2+b^2,
\qquad
F_{1,2}=(h,k\pm c),
$$

$$
y-k=\pm\frac ab(x-h),
\qquad a,b>0.
$$

Approfondimento: [retta](/matematica/retta/), [circonferenza](/matematica/circonferenza/), [parabola](/matematica/parabola/), [ellisse](/matematica/ellisse/), [iperbole](/matematica/iperbole/).

<a id="sezione-4"></a>
## 4. Goniometria e funzioni iperboliche

### Angoli, radianti e circonferenza goniometrica

$$
180^\circ=\pi\ \mathrm{rad},
\qquad
\theta_{\mathrm{rad}}=\theta_{^\circ}\frac\pi{180},
\qquad
\theta_{^\circ}=\theta_{\mathrm{rad}}\frac{180}{\pi}.
$$

Per un angolo al centro $\theta$ espresso in radianti, $r$ è il raggio,
$s\ge0$ la lunghezza dell'arco e $A_{\mathrm{settore}}\ge0$ l'area del
settore:

$$
s=r|\theta|,
\qquad
A_{\mathrm{settore}}=\frac12r^2|\theta|,
\qquad r>0.
$$

Forme inverse:

$$
|\theta|=\frac sr\quad(r>0),
\qquad
r=\frac{s}{|\theta|}\quad(s>0,\ \theta\ne0),
$$

$$
|\theta|=\frac{2A_{\mathrm{settore}}}{r^2}\quad(r>0),
\qquad
r=\sqrt{\frac{2A_{\mathrm{settore}}}{|\theta|}}
\quad(A_{\mathrm{settore}}>0,\ \theta\ne0).
$$

Per $\theta=0$ si ha $s=A_{\mathrm{settore}}=0$ per ogni $r>0$: dai soli
valori nulli di arco o area non si può quindi ricavare un raggio unico.

$$
P=(x,y)=(\cos\theta,\sin\theta),
$$

$$
\tan\theta=\frac{\sin\theta}{\cos\theta}
\quad(\cos\theta\ne0),
\qquad
\cot\theta=\frac{\cos\theta}{\sin\theta}
\quad(\sin\theta\ne0),
$$

$$
\sec\theta=\frac1{\cos\theta}
\quad(\cos\theta\ne0),
\qquad
\csc\theta=\frac1{\sin\theta}
\quad(\sin\theta\ne0).
$$

Approfondimento: [angolo](/matematica/angolo/), [cerchio unitario](/matematica/cerchio-unitario/), [trigonometria](/matematica/trigonometria/).

### Funzioni goniometriche: domini, immagini, periodicità e valori

$$
\begin{array}{c|c|c|c|c}
f&\operatorname{Dom}f&\operatorname{Im}f&T&\text{zeri}\\
\hline
\sin x&\mathbb R&[-1,1]&2\pi&k\pi\\
\cos x&\mathbb R&[-1,1]&2\pi&\pi/2+k\pi\\
\tan x&\mathbb R\setminus\{\pi/2+k\pi\}&\mathbb R&\pi&k\pi\\
\cot x&\mathbb R\setminus\{k\pi\}&\mathbb R&\pi&\pi/2+k\pi\\
\sec x&\mathbb R\setminus\{\pi/2+k\pi\}&(-\infty,-1]\cup[1,+\infty)&2\pi&\varnothing\\
\csc x&\mathbb R\setminus\{k\pi\}&(-\infty,-1]\cup[1,+\infty)&2\pi&\varnothing
\end{array}
$$

con $k\in\mathbb Z$.

$$
\begin{array}{c|ccc}
\text{quadrante}&\sin&\cos&\tan,\cot\\
\hline
\mathrm I&+&+&+\\
\mathrm{II}&+&-&-\\
\mathrm{III}&-&-&+\\
\mathrm{IV}&-&+&-
\end{array}
$$

$$
\begin{array}{c|ccccc}
\theta&0&\pi/6&\pi/4&\pi/3&\pi/2\\
\hline
\sin\theta&0&1/2&\sqrt2/2&\sqrt3/2&1\\
\cos\theta&1&\sqrt3/2&\sqrt2/2&1/2&0\\
\tan\theta&0&1/\sqrt3&1&\sqrt3&\text{n.d.}\\
\cot\theta&\text{n.d.}&\sqrt3&1&1/\sqrt3&0
\end{array}
$$

$$
\sin(-x)=-\sin x,
\quad
\tan(-x)=-\tan x,
\quad
\cot(-x)=-\cot x,
\quad
\csc(-x)=-\csc x,
$$

$$
\cos(-x)=\cos x,
\qquad
\sec(-x)=\sec x.
$$

Approfondimento: [funzioni trigonometriche](/matematica/funzioni-trigonometriche/), [cerchio unitario](/matematica/cerchio-unitario/).

### Angoli associati e identità fondamentali

$$
\sin^2x+\cos^2x=1,
$$

$$
1+\tan^2x=\sec^2x,
\qquad
1+\cot^2x=\csc^2x,
$$

nei rispettivi domini.

$$
\begin{array}{c|ccc}
\theta&\sin\theta&\cos\theta&\tan\theta\\
\hline
-x&-\sin x&\cos x&-\tan x\\
\pi-x&\sin x&-\cos x&-\tan x\\
\pi+x&-\sin x&-\cos x&\tan x\\
2\pi-x&-\sin x&\cos x&-\tan x\\
\pi/2-x&\cos x&\sin x&\cot x\\
\pi/2+x&\cos x&-\sin x&-\cot x
\end{array}
$$

Approfondimento: [identità goniometriche](/matematica/identita-goniometriche/).

### Addizione, sottrazione, duplicazione e bisezione

$$
\sin(a\pm b)=\sin a\cos b\pm\cos a\sin b,
$$

$$
\cos(a\pm b)=\cos a\cos b\mp\sin a\sin b,
$$

$$
\tan(a\pm b)=\frac{\tan a\pm\tan b}{1\mp\tan a\tan b},
$$

nei punti in cui tutti i membri sono definiti.

$$
\cot(a+b)=\frac{\cot a\cot b-1}{\cot a+\cot b},
\qquad
\cot(a-b)=\frac{\cot a\cot b+1}{\cot b-\cot a},
$$

nei punti in cui $\cot a$, $\cot b$ e i due membri della formula considerata
sono definiti.

$$
\sin2x=2\sin x\cos x,
$$

$$
\cos2x=\cos^2x-\sin^2x=1-2\sin^2x=2\cos^2x-1,
$$

$$
\tan2x=\frac{2\tan x}{1-\tan^2x},
$$

nei rispettivi domini.

$$
\sin3x=3\sin x-4\sin^3x,
\qquad
\cos3x=4\cos^3x-3\cos x.
$$

$$
\sin^2\frac x2=\frac{1-\cos x}{2},
\qquad
\cos^2\frac x2=\frac{1+\cos x}{2},
$$

$$
\sin\frac x2=\pm\sqrt{\frac{1-\cos x}{2}},
\qquad
\cos\frac x2=\pm\sqrt{\frac{1+\cos x}{2}},
$$

con segno determinato dal quadrante di $x/2$.

$$
\tan\frac x2
=\frac{\sin x}{1+\cos x}
=\frac{1-\cos x}{\sin x},
$$

ciascuna identità nel proprio dominio.

$$
\sin^2x=\frac{1-\cos2x}{2},
\qquad
\cos^2x=\frac{1+\cos2x}{2},
\qquad
\sin x\cos x=\frac12\sin2x.
$$

Approfondimento: [identità goniometriche](/matematica/identita-goniometriche/).

### Formule prodotto-somma e somma-prodotto

$$
\sin a\sin b=\frac12[\cos(a-b)-\cos(a+b)],
$$

$$
\cos a\cos b=\frac12[\cos(a-b)+\cos(a+b)],
$$

$$
\sin a\cos b=\frac12[\sin(a+b)+\sin(a-b)],
$$

$$
\cos a\sin b=\frac12[\sin(a+b)-\sin(a-b)].
$$

$$
\sin a+\sin b=2\sin\frac{a+b}{2}\cos\frac{a-b}{2},
$$

$$
\sin a-\sin b=2\cos\frac{a+b}{2}\sin\frac{a-b}{2},
$$

$$
\cos a+\cos b=2\cos\frac{a+b}{2}\cos\frac{a-b}{2},
$$

$$
\cos a-\cos b=-2\sin\frac{a+b}{2}\sin\frac{a-b}{2}.
$$

Per $(A,B)\ne(0,0)$:

$$
A\sin x+B\cos x=R\sin(x+\varphi),
\qquad
R=\sqrt{A^2+B^2},
$$

$$
\cos\varphi=\frac AR,
\qquad
\sin\varphi=\frac BR,
\qquad
\varphi\pmod{2\pi}.
$$

Per $A=B=0$, l'espressione è identicamente nulla e $\varphi$ è indeterminata.

Approfondimento: [identità goniometriche](/matematica/identita-goniometriche/).

### Equazioni goniometriche

Le soluzioni sono famiglie infinite. Il parametro $k\in\mathbb Z$ genera
tutti gli angoli coterminali; il simbolo $\pm$ indica che devono essere
considerati entrambi i segni.

Per $k\in\mathbb Z$:

$$
\sin x=s
\Longleftrightarrow
x=(-1)^k\arcsin s+k\pi,
\qquad |s|\le1,
$$

equivalentemente

$$
x=\arcsin s+2k\pi
\quad\lor\quad
x=\pi-\arcsin s+2k\pi.
$$

$$
\cos x=c
\Longleftrightarrow
x=\pm\arccos c+2k\pi,
\qquad |c|\le1.
$$

$$
\tan x=t
\Longleftrightarrow
x=\arctan t+k\pi,
$$

$$
\cot x=t
\Longleftrightarrow
x=\operatorname{arccot}t+k\pi,
\qquad
\operatorname{arccot}t\in(0,\pi).
$$

$$
\sec x=q
\Longleftrightarrow
\cos x=\frac1q,
\qquad |q|\ge1,
$$

$$
\csc x=q
\Longleftrightarrow
\sin x=\frac1q,
\qquad |q|\ge1.
$$

Per $R=\sqrt{A^2+B^2}>0$:

$$
A\sin x+B\cos x=C
\Longleftrightarrow
\sin(x+\varphi)=\frac CR.
$$

$$
\begin{array}{c|c}
|C|>R&\varnothing\\
|C|=R&\text{una famiglia modulo }2\pi\\
|C|<R&\text{due famiglie modulo }2\pi
\end{array}
$$

Per $R=0$: ogni $x$ se $C=0$, nessuna soluzione se $C\ne0$.

Approfondimento: [equazioni goniometriche elementari](/matematica/equazioni-goniometriche-elementari/).

### Disequazioni goniometriche

Per $k\in\mathbb Z$, $s,c\in[-1,1]$,

$$
\alpha=\arcsin s\in[-\pi/2,\pi/2],
\qquad
\beta=\arccos c\in[0,\pi].
$$

$$
\sin x\ge s
\Longleftrightarrow
x\in[\alpha+2k\pi,\pi-\alpha+2k\pi],
$$

$$
\sin x\le s
\Longleftrightarrow
x\in[\pi-\alpha+2k\pi,2\pi+\alpha+2k\pi],
$$

$$
\cos x\ge c
\Longleftrightarrow
x\in[-\beta+2k\pi,\beta+2k\pi],
$$

$$
\cos x\le c
\Longleftrightarrow
x\in[\beta+2k\pi,2\pi-\beta+2k\pi].
$$

Per $t\in\mathbb R$ e $\gamma=\arctan t$:

$$
\tan x\ge t
\Longleftrightarrow
x\in[\gamma+k\pi,\pi/2+k\pi),
$$

$$
\tan x\le t
\Longleftrightarrow
x\in(-\pi/2+k\pi,\gamma+k\pi].
$$

Per $\delta=\operatorname{arccot}t\in(0,\pi)$:

$$
\cot x\ge t
\Longleftrightarrow
x\in(k\pi,\delta+k\pi],
$$

$$
\cot x\le t
\Longleftrightarrow
x\in[\delta+k\pi,(k+1)\pi).
$$

Per $s,c\in(-1,1)$:

$$
\sin x>s
\Longleftrightarrow
x\in(\alpha+2k\pi,\pi-\alpha+2k\pi),
$$

$$
\sin x<s
\Longleftrightarrow
x\in(\pi-\alpha+2k\pi,2\pi+\alpha+2k\pi),
$$

$$
\cos x>c
\Longleftrightarrow
x\in(-\beta+2k\pi,\beta+2k\pi),
$$

$$
\cos x<c
\Longleftrightarrow
x\in(\beta+2k\pi,2\pi-\beta+2k\pi).
$$

$$
\begin{aligned}
\tan x>t
&\Longleftrightarrow
x\in(\gamma+k\pi,\pi/2+k\pi),\\
\tan x<t
&\Longleftrightarrow
x\in(-\pi/2+k\pi,\gamma+k\pi),\\
\cot x>t
&\Longleftrightarrow
x\in(k\pi,\delta+k\pi),\\
\cot x<t
&\Longleftrightarrow
x\in(\delta+k\pi,(k+1)\pi).
\end{aligned}
$$

Per $h\in\{\sin,\cos\}$:

$$
\begin{array}{c|cccc}
&u<-1&u=-1&u=1&u>1\\
\hline
\{x:h(x)>u\}&\mathbb R&\mathbb R\setminus h^{-1}(\{-1\})&\varnothing&\varnothing\\
\{x:h(x)<u\}&\varnothing&\varnothing&\mathbb R\setminus h^{-1}(\{1\})&\mathbb R\\
\{x:h(x)\ge u\}&\mathbb R&\mathbb R&h^{-1}(\{1\})&\varnothing\\
\{x:h(x)\le u\}&\varnothing&h^{-1}(\{-1\})&\mathbb R&\mathbb R
\end{array}
$$

Approfondimento: [disequazioni goniometriche](/matematica/disequazioni-goniometriche/).

### Funzioni goniometriche inverse e composizioni

$$
\arcsin:[-1,1]\to[-\pi/2,\pi/2],
$$

$$
\arccos:[-1,1]\to[0,\pi],
\qquad
\arctan:\mathbb R\to(-\pi/2,\pi/2).
$$

$$
\sin(\arcsin y)=y,
\qquad
\cos(\arccos y)=y,
\qquad |y|\le1,
$$

$$
\tan(\arctan y)=y,
\qquad y\in\mathbb R.
$$

$$
\cos(\arcsin y)=\sqrt{1-y^2},
\qquad
\sin(\arccos y)=\sqrt{1-y^2},
\qquad |y|\le1,
$$

$$
\tan(\arcsin y)=\frac{y}{\sqrt{1-y^2}},
\qquad |y|<1,
$$

$$
\tan(\arccos y)=\frac{\sqrt{1-y^2}}{y},
\qquad |y|\le1,
\qquad y\ne0,
$$

$$
\sin(\arctan y)=\frac{y}{\sqrt{1+y^2}},
\qquad
\cos(\arctan y)=\frac1{\sqrt{1+y^2}}.
$$

$$
\arctan(\tan x)=x-k\pi,
\qquad
x\in(-\pi/2+k\pi,\pi/2+k\pi).
$$

$$
\arcsin(\sin x)=
\begin{cases}
x-2k\pi,&x\in[-\pi/2+2k\pi,\pi/2+2k\pi],\\
\pi-x+2k\pi,&x\in[\pi/2+2k\pi,3\pi/2+2k\pi],
\end{cases}
$$

$$
\arccos(\cos x)=
\begin{cases}
x-2k\pi,&x\in[2k\pi,(2k+1)\pi],\\
2k\pi-x,&x\in[(2k-1)\pi,2k\pi].
\end{cases}
$$

Approfondimento: [funzioni trigonometriche](/matematica/funzioni-trigonometriche/), [funzione inversa](/matematica/funzione-inversa/).

### Trigonometria dei triangoli

In un triangolo qualunque i lati $a,b,c$ sono opposti rispettivamente agli
angoli $A,B,C$; $R$ è il raggio della circonferenza circoscritta, $K$ l'area e
$s$ il semiperimetro.

**Triangolo rettangolo.** Se $C=\pi/2$, allora $c$ è l'ipotenusa e $a,b$ sono i
cateti:

$$
c^2=a^2+b^2,
\qquad
c=\sqrt{a^2+b^2},
$$

$$
a=\sqrt{c^2-b^2},
\qquad
b=\sqrt{c^2-a^2},
$$

con $a,b,c>0$ e $c>a$, $c>b$.

Rispetto all'angolo acuto $A$:

$$
\sin A=\frac ac,
\qquad
\cos A=\frac bc,
\qquad
\tan A=\frac ab,
$$

$$
a=c\sin A=b\tan A,
\qquad
b=c\cos A=\frac a{\tan A},
$$

$$
A=\arcsin\frac ac
=\arccos\frac bc
=\arctan\frac ab.
$$

Le formule per l'angolo $B$ si ottengono scambiando $a$ e $b$; inoltre
$A+B=\pi/2$.

**Triangolo qualunque:**

$$
A+B+C=\pi,
\qquad
A=\pi-B-C,
$$

con $0<A,B,C<\pi$.

Teorema dei seni:

$$
\frac a{\sin A}=\frac b{\sin B}=\frac c{\sin C}=2R,
$$

$$
a=2R\sin A,
\qquad
R=\frac a{2\sin A},
\qquad
\sin A=\frac a{2R},
$$

$$
a=b\frac{\sin A}{\sin B}
=c\frac{\sin A}{\sin C},
$$

nei casi in cui i denominatori sono non nulli; in un triangolo non degenere lo
sono sempre.

Teorema del coseno:

$$
a^2=b^2+c^2-2bc\cos A,
$$

$$
b^2=a^2+c^2-2ac\cos B,
\qquad
c^2=a^2+b^2-2ab\cos C.
$$

Forme inverse per gli angoli:

$$
A=\arccos\frac{b^2+c^2-a^2}{2bc},
\qquad
B=\arccos\frac{a^2+c^2-b^2}{2ac},
$$

$$
C=\arccos\frac{a^2+b^2-c^2}{2ab}.
$$

Condizioni di esistenza del triangolo:

$$
a,b,c>0,
\qquad
a<b+c,
\qquad
b<a+c,
\qquad
c<a+b.
$$

Area:

$$
K=\frac12bc\sin A
=\frac12ca\sin B
=\frac12ab\sin C,
$$

$$
\sin A=\frac{2K}{bc},
\qquad
\sin B=\frac{2K}{ca},
\qquad
\sin C=\frac{2K}{ab},
$$

$$
s=\frac{a+b+c}{2},
\qquad
K=\sqrt{s(s-a)(s-b)(s-c)}.
$$

Scelta della formula in base ai dati:

| Dati noti | Formula primaria |
|---|---|
| SSS: tre lati | teorema del coseno inverso |
| SAS: due lati e angolo compreso | teorema del coseno |
| ASA o AAS: due angoli e un lato | somma degli angoli e teorema dei seni |
| SSA: due lati e un angolo non compreso | caso ambiguo del teorema dei seni |

Caso SSA con $0<A<\pi/2$, lato noto $a$ opposto ad $A$, altro lato noto $b$ e
altezza $h=b\sin A$:

| Condizione | Numero di triangoli |
|---|---:|
| $a<h$ | $0$ |
| $a=h$ | $1$, rettangolo |
| $h<a<b$ | $2$ |
| $a\ge b$ | $1$ |

Per $A\ge\pi/2$ esiste un solo triangolo se e solo se $a>b$.

Approfondimento: [trigonometria](/matematica/trigonometria/), [teorema dei seni](/matematica/teorema-dei-seni/), [teorema del coseno](/matematica/teorema-del-coseno/).

### Funzioni iperboliche

$$
\sinh x=\frac{e^x-e^{-x}}2,
\qquad
\cosh x=\frac{e^x+e^{-x}}2,
$$

$$
\tanh x=\frac{\sinh x}{\cosh x},
\qquad
\coth x=\frac{\cosh x}{\sinh x}\quad(x\ne0).
$$

$$
\begin{array}{c|c|c|c}
f&\operatorname{Dom}f&\operatorname{Im}f&\text{parità}\\
\hline
\sinh&\mathbb R&\mathbb R&\text{dispari}\\
\cosh&\mathbb R&[1,+\infty)&\text{pari}\\
\tanh&\mathbb R&(-1,1)&\text{dispari}\\
\coth&\mathbb R\setminus\{0\}&(-\infty,-1)\cup(1,+\infty)&\text{dispari}
\end{array}
$$

$$
\cosh^2x-\sinh^2x=1,
\qquad
1-\tanh^2x=\frac1{\cosh^2x}.
$$

$$
\sinh(x\pm y)=\sinh x\cosh y\pm\cosh x\sinh y,
$$

$$
\cosh(x\pm y)=\cosh x\cosh y\pm\sinh x\sinh y.
$$

$$
\sinh2x=2\sinh x\cosh x,
\qquad
\cosh2x=\cosh^2x+\sinh^2x.
$$

$$
\operatorname{arsinh}x=\ln(x+\sqrt{x^2+1}),
\qquad x\in\mathbb R,
$$

$$
\operatorname{arcosh}x=\ln(x+\sqrt{x^2-1}),
\qquad x\ge1,
$$

$$
\operatorname{artanh}x=\frac12\ln\frac{1+x}{1-x},
\qquad |x|<1,
$$

$$
\operatorname{arcoth}x=\frac12\ln\frac{x+1}{x-1},
\qquad |x|>1.
$$

Composizioni diretta dopo inversa, nei rispettivi domini:

$$
\sinh(\operatorname{arsinh}x)=x,
\qquad
\cosh(\operatorname{arcosh}x)=x\quad(x\ge1),
$$

$$
\tanh(\operatorname{artanh}x)=x\quad(|x|<1),
\qquad
\coth(\operatorname{arcoth}x)=x\quad(|x|>1).
$$

Composizioni inversa dopo diretta:

$$
\operatorname{arsinh}(\sinh x)=x,
\qquad
\operatorname{arcosh}(\cosh x)=|x|,
\qquad x\in\mathbb R,
$$

$$
\operatorname{artanh}(\tanh x)=x\quad(x\in\mathbb R),
\qquad
\operatorname{arcoth}(\coth x)=x\quad(x\ne0).
$$

Il valore assoluto nella composizione con $\cosh$ è necessario perché $\cosh$
è pari e diventa invertibile soltanto restringendola a $[0,+\infty)$.


Approfondimento: [funzioni iperboliche](/matematica/funzioni-iperboliche/).

<a id="sezione-5"></a>
## 5. Numeri complessi

### Forma algebrica e operazioni

Nelle formule seguenti $a,b,c,d\in\mathbb R$; $i$ è l'unità immaginaria.

$$
\displaystyle
z=a+ib,
\qquad
i^2=-1,
\qquad
\operatorname{Re}z=a,
\qquad
\operatorname{Im}z=b.
$$

Per $z=a+ib$ e $w=c+id$:

$$
\begin{aligned}
z+w&=(a+c)+i(b+d),\\
z-w&=(a-c)+i(b-d),\\
zw&=(ac-bd)+i(ad+bc).
\end{aligned}
$$

$$
\displaystyle
\overline z=a-ib,
\qquad
|z|=\sqrt{a^2+b^2},
\qquad
z\overline z=|z|^2.
$$

$$
\begin{aligned}
\overline{z+w}&=\overline z+\overline w,\\
\overline{zw}&=\overline z\,\overline w,\\
|zw|&=|z|\,|w|,\\
|z+w|&\le |z|+|w|.
\end{aligned}
$$

Per $z\ne0$:

$$
\displaystyle
\frac1z=\frac{\overline z}{|z|^2}
=\frac{a-ib}{a^2+b^2}.
$$

Per $w\ne0$:

$$
\displaystyle
\frac zw
=
\frac{z\overline w}{|w|^2}
=
\frac{(ac+bd)+i(bc-ad)}{c^2+d^2}.
$$

Potenze di $i$:

| $n\pmod 4$ | $i^n$ |
|---:|:---:|
| $0$ | $1$ |
| $1$ | $i$ |
| $2$ | $-1$ |
| $3$ | $-i$ |

Approfondimenti: [numeri complessi](/matematica/numeri-complessi/) e [modulo
di un numero complesso](/matematica/modulo-numero-complesso/).

### Forma trigonometrica ed esponenziale

Per $z=a+ib\ne0$:

$$
\displaystyle
\rho=|z|=\sqrt{a^2+b^2},
\qquad
z=\rho(\cos\theta+i\sin\theta)=\rho e^{i\theta}.
$$

$$
\displaystyle
\cos\theta=\frac a\rho,
\qquad
\sin\theta=\frac b\rho,
\qquad
\tan\theta=\frac ba\quad(a\ne0),
$$

$$
a=\rho\cos\theta,
\qquad
b=\rho\sin\theta.
$$

Per scegliere il quadrante corretto non basta in generale $\arctan(b/a)$: si
usa l'argomento determinato congiuntamente dai segni di $a$ e $b$, spesso
indicato operativamente con $\operatorname{atan2}(b,a)$.

$$
\displaystyle
e^{i\theta}=\cos\theta+i\sin\theta.
$$

$$
\displaystyle
\arg z=\{\theta+2k\pi:k\in\mathbb Z\}.
$$

Se $z=\rho e^{i\theta}$ e $w=\sigma e^{i\varphi}$:

$$
\begin{aligned}
zw&=\rho\sigma e^{i(\theta+\varphi)},\\
\frac zw&=\frac\rho\sigma e^{i(\theta-\varphi)},\qquad w\ne0,\\
\overline z&=\rho e^{-i\theta}.
\end{aligned}
$$

Approfondimenti: [argomento di un numero
complesso](/matematica/argomento-numero-complesso/) e [formula di
Eulero](/matematica/formula-di-eulero/).

### Potenze e radici

Formula di De Moivre:

$$
\displaystyle
(\cos\theta+i\sin\theta)^n
=
\cos(n\theta)+i\sin(n\theta),
\qquad n\in\mathbb Z,
$$

con base non nulla se $n<0$.

Per $z=\rho e^{i\theta}\ne0$:

$$
\displaystyle
z^n=\rho^n e^{in\theta},
\qquad n\in\mathbb Z.
$$

$$
\displaystyle
0^n=0,
\qquad n\ge1.
$$

Per $n\ge1$, $z=\rho e^{i\theta}\ne0$, l'equazione $w^n=z$ possiede
esattamente $n$ radici distinte:

$$
\displaystyle
w_k=\sqrt[n]{\rho}\,
e^{i(\theta+2k\pi)/n},
\qquad
k=0,1,\ldots,n-1.
$$

Cambiare $\theta$ con $\theta+2m\pi$ non produce nuove radici oltre alle
$n$ già elencate: ne modifica soltanto l'ordine.

Caso nullo:

$$
\displaystyle
w^n=0
\quad\Longleftrightarrow\quad
w=0,
\qquad n\ge1.
$$

Convenzione sulle potenze nulle:

$$
\displaystyle
z^0=1\quad(z\ne0),
\qquad
0^0\text{ non definito}.
$$

Approfondimenti: [formula di De Moivre](/matematica/formula-di-de-moivre/) e
[radici complesse](/matematica/radici-complesse/).

### Teorema fondamentale dell’algebra

Per ogni polinomio complesso non costante

$$
P(z)=a_nz^n+a_{n-1}z^{n-1}+\cdots+a_1z+a_0,
\qquad a_n\ne0,
\qquad n\ge1,
$$

esistono $z_1,\ldots,z_n\in\mathbb C$, ripetuti secondo la molteplicità, tali
che

$$
P(z)=a_n\prod_{k=1}^{n}(z-z_k).
$$

Quindi un polinomio di grado $n$ ha esattamente $n$ radici complesse contando
le molteplicità. Se $P\in\mathbb R[z]$:

$$
P(z_0)=0
\Longrightarrow
P(\overline{z_0})=0,
$$

perciò le radici non reali compaiono a coppie coniugate.

### Esponenziale e logaritmo complesso (estensione)

$$
\displaystyle
e^{a+ib}=e^a(\cos b+i\sin b).
$$

Per $z\ne0$:

$$
\displaystyle
\operatorname{Arg}z\in(-\pi,\pi],
\qquad
\arg z
=
\{\operatorname{Arg}z+2k\pi:k\in\mathbb Z\}.
$$

Logaritmo multivalore. A differenza del logaritmo reale, $\log z$ è un
insieme infinito di valori:

$$
\displaystyle
\log z
=
\left\{
\ln|z|+i\bigl(\operatorname{Arg}z+2k\pi\bigr):
k\in\mathbb Z
\right\}.
$$

$$
\displaystyle
e^w=z
\quad\Longleftrightarrow\quad
w\in\log z,
\qquad z\ne0.
$$

Ramo principale analitico con taglio sull'asse reale non positivo:

$$
\displaystyle
z\in\mathbb C\setminus(-\infty,0],
\qquad
\operatorname{Arg}z\in(-\pi,\pi),
\qquad
\operatorname{Log}z
=
\ln|z|+i\operatorname{Arg}z.
$$

Approfondimento: [logaritmo complesso](/matematica/logaritmo-complesso/).

<a id="sezione-6"></a>
## 6. Successioni numeriche

Una successione $(a_n)$ è una funzione il cui argomento è un indice naturale.

### Definizione e indicizzazione

$$
a:\mathbb N_0\to\mathbb R,
\qquad
n\mapsto a_n.
$$

$$
\exists N_0\in\mathbb N_0:\
\forall n\ge N_0,\ a_n=b_n
\Longrightarrow
\left(a_n\to L\Longleftrightarrow b_n\to L\right).
$$

$$
a_n\to L
\Longleftrightarrow
a_{n+n_0}\to L,
\qquad n_0\in\mathbb N_0.
$$

Approfondimento: [successione](/matematica/successione/).

### Successioni elementari

Per $q\in\mathbb R$:

$$
\lim_{n\to\infty}q^n=
\begin{cases}
0,&|q|<1,\\
1,&q=1,\\
+\infty,&q>1,
\end{cases}
$$

mentre per $q\le-1$ la successione non converge; se $q<-1$ il modulo tende a
$+\infty$ e il segno alterna.

Per $\alpha\in\mathbb R$, considerando $n\ge1$:

$$
\lim_{n\to\infty}n^\alpha=
\begin{cases}
+\infty,&\alpha>0,\\
1,&\alpha=0,\\
0,&\alpha<0.
\end{cases}
$$

### Limite finito

$$
\lim_{n\to\infty}a_n=L
\Longleftrightarrow
\forall\varepsilon>0,\ \exists N\in\mathbb N_0:\
n\ge N\Rightarrow |a_n-L|<\varepsilon.
$$

Forma equivalente:

$$
\forall\varepsilon>0,\ \exists N:\
n\ge N\Rightarrow L-\varepsilon<a_n<L+\varepsilon.
$$

Negazione:

$$
a_n\not\to L
\Longleftrightarrow
\exists\varepsilon_0>0,\ \forall N,\ \exists n\ge N:\
|a_n-L|\ge\varepsilon_0.
$$

Approfondimenti: [limite di successione](/matematica/limite-di-successione/) e
[unicità del limite](/matematica/unicita-del-limite/).

### Unicità del limite

$$
a_n\to L,
\qquad
a_n\to L'
\Longrightarrow
L=L'.
$$

Approfondimento: [unicità del limite](/matematica/unicita-del-limite/).

### Limitatezza delle successioni convergenti

$$
a_n\to L\in\mathbb R
\Longrightarrow
\exists M>0:\ |a_n|\le M\quad\forall n.
$$

$$
a_n\text{ limitata}
\Longleftrightarrow
\exists m,M\in\mathbb R:\ m\le a_n\le M\quad\forall n.
$$

Il converso non vale.

Approfondimento: [limitatezza delle successioni convergenti](/matematica/limitatezza-delle-successioni-convergenti/), [successione](/matematica/successione/).

### Permanenza del segno

$$
a_n\to L>0
\Longrightarrow
a_n>\frac L2>0
\quad\text{definitivamente},
$$

$$
a_n\to L<0
\Longrightarrow
a_n<\frac L2<0
\quad\text{definitivamente}.
$$

$$
a_n\ge0\quad\text{definitivamente},
\qquad
a_n\to L
\Longrightarrow
L\ge0.
$$

$$
a_n\le0\quad\text{definitivamente},
\qquad
a_n\to L
\Longrightarrow
L\le0.
$$

Approfondimento: [permanenza del segno per successioni convergenti](/matematica/permanenza-del-segno-per-successioni-convergenti/).

### Limite infinito

$$
a_n\to+\infty
\Longleftrightarrow
\forall M>0,\ \exists N:\ n\ge N\Rightarrow a_n>M,
$$

$$
a_n\to-\infty
\Longleftrightarrow
\forall M>0,\ \exists N:\ n\ge N\Rightarrow a_n<-M.
$$

Negazioni:

$$
a_n\not\to+\infty
\Longleftrightarrow
\exists M_0>0,\ \forall N,\ \exists n\ge N:\ a_n\le M_0,
$$

$$
a_n\not\to-\infty
\Longleftrightarrow
\exists M_0>0,\ \forall N,\ \exists n\ge N:\ a_n\ge-M_0.
$$

Approfondimento: [limite di successione](/matematica/limite-di-successione/).

### Algebra dei limiti

Se $a_n\to a$, $b_n\to b$ con $a,b\in\mathbb R$ e $\lambda\in\mathbb R$:

$$
a_n\pm b_n\to a\pm b,
\qquad
\lambda a_n\to\lambda a,
$$

$$
a_nb_n\to ab,
\qquad
|a_n|\to|a|,
$$

$$
\frac{a_n}{b_n}\to\frac ab,
\qquad
b\ne0,
$$

poiché $b_n\ne0$ definitivamente per la permanenza del segno.

$$
a_n^k\to a^k,
\qquad k\in\mathbb N_+.
$$

$$
a_n\to a\ne0,
\qquad
k\in\mathbb Z_{<0}
\Longrightarrow
a_n^k\to a^k.
$$

$$
a_n\to a,
\qquad
a_n\ge0\text{ definitivamente},
\qquad
a\ge0
\Longrightarrow
\sqrt[2m]{a_n}\to\sqrt[2m]{a},
\qquad m\in\mathbb N_+.
$$

$$
a_n\to a
\Longrightarrow
\sqrt[2m+1]{a_n}\to\sqrt[2m+1]{a},
\qquad m\in\mathbb N_0.
$$

Approfondimento: [algebra dei limiti per successioni convergenti](/matematica/algebra-dei-limiti-per-successioni-convergenti/).

### Ordine, confronto e teorema dei carabinieri

Nelle prime due formule $A,B\in\mathbb R$.

$$
a_n\le b_n\quad\text{definitivamente},
\qquad
a_n\to A,
\qquad
b_n\to B
\Longrightarrow
A\le B.
$$

$$
a_n\to A,
\qquad
b_n\to B,
\qquad
A<B
\Longrightarrow
a_n<b_n\quad\text{definitivamente}.
$$

$$
\ell_n\le x_n\le u_n\quad\text{definitivamente},
\qquad
\ell_n,u_n\to L
\Longrightarrow
x_n\to L.
$$

$$
|x_n-L|\le r_n,
\qquad
r_n\to0
\Longrightarrow
x_n\to L.
$$

$$
a_n\le b_n\quad\text{definitivamente},
\qquad
a_n\to+\infty
\Longrightarrow
b_n\to+\infty,
$$

$$
a_n\le b_n\quad\text{definitivamente},
\qquad
b_n\to-\infty
\Longrightarrow
a_n\to-\infty.
$$

Approfondimento: [ordine e confronto per limiti di successioni](/matematica/ordine-e-confronto-per-limiti-di-successioni/), [teorema dei carabinieri](/matematica/teorema-dei-carabinieri/).

### Successioni monotone

$$
a_{n+1}\ge a_n\quad\forall n
\Longleftrightarrow
(a_n)\text{ non decrescente},
$$

$$
a_{n+1}\le a_n\quad\forall n
\Longleftrightarrow
(a_n)\text{ non crescente}.
$$

$$
\begin{array}{c|c|c}
\text{monotonia}&\text{vincolo}&\text{limite}\\
\hline
\nearrow&\text{superiormente limitata}&\sup_n a_n\\
\nearrow&\text{non superiormente limitata}&+\infty\\
\searrow&\text{inferiormente limitata}&\inf_n a_n\\
\searrow&\text{non inferiormente limitata}&-\infty
\end{array}
$$

Approfondimento: [successione monotona](/matematica/successione-monotona/), [completezza dei reali](/matematica/completezza-dei-reali/).

### Successioni definite per ricorrenza

$$
a_{n+1}=\varphi(a_n),
\qquad a_0\text{ assegnato}.
$$

$$
a_n\to L,
\qquad
\varphi\text{ continua in }L
\Longrightarrow
L=\varphi(L).
$$

Se $I$ è chiuso, $a_0\in I$, $\varphi(I)\subseteq I$ e $\varphi$ è una
contrazione, cioè

$$
|\varphi(x)-\varphi(y)|\le q|x-y|,
\qquad
0\le q<1,
\qquad x,y\in I,
$$

allora esiste un unico punto fisso $L\in I$ e

$$
a_n\to L,
$$

$$
|a_n-L|\le q^n|a_0-L|,
$$

$$
|a_n-L|\le\frac{q^n}{1-q}|a_1-a_0|.
$$

Ricorrenza affine:

$$
a_{n+1}=qa_n+b.
$$

Per $q\ne1$:

$$
L=\frac b{1-q},
\qquad
a_n=L+q^n(a_0-L).
$$

$$
\begin{array}{c|c}
q&\text{comportamento per }q\ne1,\ a_0\ne L\\
\hline
|q|<1&a_n\to L\\
q=-1&\text{alternanza di due valori}\\
q>1&|a_n|\to\infty\text{ con segno determinato}\\
q<-1&\text{oscillazione con modulo crescente}
\end{array}
$$

$$
q\ne1,\quad a_0=L
\Longrightarrow
a_n=L.
$$

$$
q=1
\Longrightarrow
a_n=a_0+nb,
\qquad
\lim_{n\to\infty}a_n=
\begin{cases}
a_0,&b=0,\\
+\infty,&b>0,\\
-\infty,&b<0.
\end{cases}
$$

Approfondimento: [successioni ricorsive](/matematica/successioni-ricorsive/).

### Numero di Nepero

$$
e=\lim_{n\to\infty}\left(1+\frac1n\right)^n
=\sum_{k=0}^{\infty}\frac1{k!}
\approx2{,}718281828.
$$

$$
\left(1+\frac xn\right)^n\to e^x,
\qquad x\in\mathbb R.
$$

$$
\left(1+\frac1n\right)^n<e<\left(1+\frac1n\right)^{n+1},
\qquad n\ge1.
$$

Approfondimento: [numero di Nepero](/matematica/numero-di-nepero/).

### Sottosuccessioni e Bolzano–Weierstrass

$$
a_{n_k},
\qquad
n_0<n_1<\cdots<n_k<\cdots.
$$

$$
a_n\to L
\Longrightarrow
a_{n_k}\to L
\quad\text{per ogni sottosuccessione}.
$$

$$
\text{ogni successione reale ammette una sottosuccessione monotona}.
$$

$$
(a_n)\text{ limitata}
\Longrightarrow
\exists(a_{n_k})\text{ convergente}.
$$

$$
a_{n_k}\to L_1,
\qquad
a_{m_k}\to L_2,
\qquad
L_1\ne L_2
\Longrightarrow
(a_n)\text{ non converge}.
$$

Approfondimenti: [teorema della sottosuccessione monotona](/matematica/sottosuccessione/#teorema-della-sottosuccessione-monotona) e [teorema di Bolzano–Weierstrass](/matematica/teorema-di-bolzano-weierstrass/).

Esercizi svolti: [sottosuccessioni e Bolzano–Weierstrass](/matematica/sottosuccessioni-bolzano-esercizi/).

### Limite superiore e limite inferiore

Le quantità seguenti sono considerate nella retta reale estesa
$\overline{\mathbb R}$:

$$
U_N=\sup_{n\ge N}a_n,
\qquad
L_N=\inf_{n\ge N}a_n.
$$

$$
U_{N+1}\le U_N,
\qquad
L_{N+1}\ge L_N.
$$

$$
\limsup_{n\to\infty}a_n
=\lim_{N\to\infty}U_N
=\inf_N U_N,
$$

$$
\limsup_{n\to\infty}a_n
=\inf_{N}\sup_{n\ge N}a_n,
$$

$$
\liminf_{n\to\infty}a_n
=\lim_{N\to\infty}L_N
=\sup_N L_N,
$$

$$
\liminf_{n\to\infty}a_n
=\sup_{N}\inf_{n\ge N}a_n.
$$

$$
\liminf a_n\le\limsup a_n.
$$

Quando almeno uno dei due estremi non è finito, i soli profili compatibili con
$\liminf a_n\le\limsup a_n$ sono i cinque seguenti (con $L\in\mathbb R$):

| $\liminf a_n$ | $\limsup a_n$ | Esempio |
|---:|---:|---|
| $-\infty$ | $-\infty$ | $a_n=-n$ |
| $-\infty$ | $L$ | $a_{2k}=L$, $a_{2k+1}=-(k+3)$ |
| $-\infty$ | $+\infty$ | $a_n=(-1)^n n$ |
| $L$ | $+\infty$ | $a_{2k}=L$, $a_{2k+1}=k+3$ |
| $+\infty$ | $+\infty$ | $a_n=n$ |

$$
a_n\to L\in\overline{\mathbb R}
\Longleftrightarrow
\liminf a_n=\limsup a_n=L.
$$

Per $(a_n)$ limitata:

$$
\liminf a_n=\min\{\text{valori di aderenza}\},
\qquad
\limsup a_n=\max\{\text{valori di aderenza}\}.
$$

Approfondimento: [limite superiore e limite inferiore di una successione](/matematica/limite-superiore-e-limite-inferiore-di-una-successione/).

Esercizi svolti: [limite superiore e limite inferiore](/matematica/limsup-liminf-successioni-esercizi/).

### Criterio di Cauchy

$$
(a_n)\text{ di Cauchy}
\Longleftrightarrow
\forall\varepsilon>0,\ \exists N\in\mathbb{N},\ \forall m,n\in\mathbb N:\
m,n\ge N\Longrightarrow |a_n-a_m|<\varepsilon.
$$

Negazione:

$$
\exists\varepsilon_0>0,\ \forall N\in\mathbb N,\ \exists m,n\in\mathbb N:\
m,n\ge N\ \land\ |a_n-a_m|\ge\varepsilon_0.
$$

In $\mathbb R$:

$$
a_n\text{ converge}
\Longleftrightarrow
(a_n)\text{ è di Cauchy}.
$$

$$
(a_n)\text{ di Cauchy}
\Longrightarrow
(a_n)\text{ limitata}.
$$

Approfondimento: [criterio di Cauchy](/matematica/criterio-di-cauchy/), [completezza dei reali](/matematica/completezza-dei-reali/).

### Limiti notevoli e gerarchie

$$
\left(1+\frac xn\right)^n\to e^x,
\qquad x\in\mathbb R,
$$

$$
\sqrt[n]a\to1,
\qquad a>0,
$$

$$
\sqrt[n]n\to1,
$$

$$
\frac{n^\alpha}{a^n}\to0,
\qquad a>1,
\qquad \alpha>0,
$$

$$
\frac{a^n}{n!}\to0,
\qquad a>0.
$$

$$
\ln n\ll n^\alpha\ll a^n\ll n!\ll n^n,
\qquad
\alpha>0,
\qquad
a>1.
$$

Formula di Stirling:

$$
n!\sim\sqrt{2\pi n}\left(\frac ne\right)^n,
\qquad
\sqrt[n]{n!}\sim\frac ne.
$$

Qui $f\ll g$ significa $f/g\to0$ nel regime indicato.

Approfondimenti: [limite di successione](/matematica/limite-di-successione/) e
[numero di Nepero](/matematica/numero-di-nepero/).

### Medie di Cesàro e teorema di Stolz–Cesàro (estensione)

$$
a_n\to L
\Longrightarrow
\frac1n\sum_{k=1}^n a_k\to L,
$$

con $L\in\overline{\mathbb R}$; il converso non vale.

Se $(b_n)$ è strettamente crescente, $b_n\to+\infty$ e

$$
\lim_{n\to\infty}\frac{a_{n+1}-a_n}{b_{n+1}-b_n}=L
\in\overline{\mathbb R},
$$

allora

$$
\lim_{n\to\infty}\frac{a_n}{b_n}=L.
$$

Approfondimento: [teorema di Stolz–Cesàro e medie di
Cesàro](/matematica/teorema-di-stolz-cesaro/).

<a id="sezione-7"></a>
## 7. Limiti di funzione

### Limite finito in un punto finito

Siano $f:D\subseteq\mathbb R\to\mathbb R$, $x_0\in D'$ e
$L\in\mathbb R$.

$$
\lim_{\substack{x\to x_0\\x\in D}}f(x)=L
$$

$$
\Longleftrightarrow
\forall\varepsilon>0,\ \exists\delta>0,\ \forall x\in D:\
0<|x-x_0|<\delta
\Rightarrow
|f(x)-L|<\varepsilon.
$$

In questa definizione $x$ si avvicina a $x_0$ senza essere obbligato a
coincidere con $x_0$; il valore $f(x_0)$ può anche non essere definito. Il limite
descrive il comportamento **vicino** al punto, non necessariamente nel punto.

Negazione:

$$
\lim_{\substack{x\to x_0\\x\in D}}f(x)\ne L
$$

$$
\Longleftrightarrow
\exists\varepsilon_0>0,\ \forall\delta>0,\ \exists x\in D:\
0<|x-x_0|<\delta,
\quad
|f(x)-L|\ge\varepsilon_0.
$$

Approfondimento: [limite di funzione](/matematica/limite-di-funzione/).

### Regimi finiti e infiniti

Nelle formule con limite finito si assume $L\in\mathbb R$.

Per $x_0\in D'$:

$$
\lim_{\substack{x\to x_0\\x\in D}}f(x)=+\infty
$$

$$
\Longleftrightarrow
\forall M>0,\ \exists\delta>0,\ \forall x\in D:\
0<|x-x_0|<\delta
\Rightarrow
f(x)>M.
$$

$$
\lim_{\substack{x\to x_0\\x\in D}}f(x)=-\infty
$$

$$
\Longleftrightarrow
\forall M>0,\ \exists\delta>0,\ \forall x\in D:\
0<|x-x_0|<\delta
\Rightarrow
f(x)<-M.
$$

Per $D$ non superiormente limitato:

$$
\lim_{\substack{x\to+\infty\\x\in D}}f(x)=L
$$

$$
\Longleftrightarrow
\forall\varepsilon>0,\ \exists A\in\mathbb R,\ \forall x\in D:\
x>A\Rightarrow|f(x)-L|<\varepsilon.
$$

$$
\lim_{\substack{x\to+\infty\\x\in D}}f(x)=+\infty
$$

$$
\Longleftrightarrow
\forall M>0,\ \exists A\in\mathbb R,\ \forall x\in D:\
x>A\Rightarrow f(x)>M.
$$

$$
\lim_{\substack{x\to+\infty\\x\in D}}f(x)=-\infty
$$

$$
\Longleftrightarrow
\forall M>0,\ \exists A\in\mathbb R,\ \forall x\in D:\
x>A\Rightarrow f(x)<-M.
$$

Per $D$ non inferiormente limitato:

$$
\lim_{\substack{x\to-\infty\\x\in D}}f(x)=L
\Longleftrightarrow
\forall\varepsilon>0,\ \exists A\in\mathbb R,\ \forall x\in D:\
x<A\Rightarrow|f(x)-L|<\varepsilon.
$$

$$
\lim_{\substack{x\to-\infty\\x\in D}}f(x)=+\infty
\Longleftrightarrow
\forall M>0,\ \exists A\in\mathbb R,\ \forall x\in D:\
x<A\Rightarrow f(x)>M.
$$

$$
\lim_{\substack{x\to-\infty\\x\in D}}f(x)=-\infty
\Longleftrightarrow
\forall M>0,\ \exists A\in\mathbb R,\ \forall x\in D:\
x<A\Rightarrow f(x)<-M.
$$

Approfondimento: [limite di funzione](/matematica/limite-di-funzione/).

### Caratterizzazione sequenziale

Per $x_0\in D'$ e $L\in\overline{\mathbb R}$:

$$
\lim_{\substack{x\to x_0\\x\in D}}f(x)=L
$$

$$
\Longleftrightarrow
\forall(a_n)\subseteq D\setminus\{x_0\}:
a_n\to x_0
\Rightarrow
f(a_n)\to L.
$$

$$
\exists(a_n),(b_n)\subseteq D\setminus\{x_0\},
\quad
a_n,b_n\to x_0,
$$

$$
f(a_n)\to L_1,
\qquad
f(b_n)\to L_2,
\qquad
L_1\ne L_2
\Longrightarrow
\nexists\lim_{x\to x_0}f(x).
$$

$$
\delta_n=\dfrac{1}{n+1}\downarrow0.
$$

Approfondimento: [caratterizzazione sequenziale del limite](/matematica/caratterizzazione-sequenziale-del-limite/).

Esercizi svolti: [caratterizzazione sequenziale del limite](/matematica/caratterizzazione-sequenziale-del-limite-esercizi/).

### Limiti laterali

Le definizioni seguenti richiedono che $x_0$ sia punto di accumulazione di
$D\cap(-\infty,x_0)$, rispettivamente di $D\cap(x_0,+\infty)$.

$$
\lim_{\substack{x\to x_0^-\\x\in D}}f(x)=L
\Longleftrightarrow
\forall\varepsilon>0,\ \exists\delta>0,\ \forall x\in D:\
x_0-\delta<x<x_0
\Rightarrow
|f(x)-L|<\varepsilon,
$$

$$
\lim_{\substack{x\to x_0^+\\x\in D}}f(x)=L
\Longleftrightarrow
\forall\varepsilon>0,\ \exists\delta>0,\ \forall x\in D:\
x_0<x<x_0+\delta
\Rightarrow
|f(x)-L|<\varepsilon.
$$

Se $x_0$ è punto di accumulazione di $D$ da entrambi i lati:

$$
\lim_{\substack{x\to x_0\\x\in D}}f(x)=L
\Longleftrightarrow
\lim_{\substack{x\to x_0^-\\x\in D}}f(x)
=
\lim_{\substack{x\to x_0^+\\x\in D}}f(x)
=L.
$$

Approfondimento: [limiti laterali](/matematica/limiti-laterali/).

### Limiti delle funzioni monotone

Sia $f:I\to\mathbb R$ monotona e $c\in\operatorname{int}I$.

$$
\begin{array}{c|c|c}
\text{monotonia}&f(c^-)&f(c^+)\\
\hline
\text{non decrescente}&\sup f(I\cap(-\infty,c))&\inf f(I\cap(c,+\infty))\\
\text{non crescente}&\inf f(I\cap(-\infty,c))&\sup f(I\cap(c,+\infty))
\end{array}
$$

$$
f\nearrow
\Longrightarrow
f(c^-)\le f(c)\le f(c^+),
$$

$$
f\searrow
\Longrightarrow
f(c^-)\ge f(c)\ge f(c^+).
$$

Se $I$ è illimitato nelle direzioni indicate:

$$
\begin{array}{c|c|c}
\text{monotonia}&\lim_{x\to-\infty}f(x)&\lim_{x\to+\infty}f(x)\\
\hline
\text{non decrescente}&\inf f(I)&\sup f(I)\\
\text{non crescente}&\sup f(I)&\inf f(I)
\end{array}
$$

$$
f\text{ continua in }c
\Longleftrightarrow
f(c^-)=f(c)=f(c^+).
$$

Per $f$ non decrescente:

$$
\lim_{x\to-\infty}f(x)=\inf f(I),
\qquad
\lim_{x\to+\infty}f(x)=\sup f(I),
$$

quando $I$ è illimitato nella direzione corrispondente. Nei punti di
discontinuità interna:

$$
J_f(c)=f(c^+)-f(c^-)>0.
$$

Esiste un'iniezione dell'insieme delle discontinuità in $\mathbb Q$:

$$
c\longmapsto q_c,
\qquad
q_c\in\mathbb Q\cap\bigl(f(c^-),f(c^+)\bigr).
$$

Approfondimento: [limiti delle funzioni monotone](/matematica/limiti-delle-funzioni-monotone/).

Esercizi svolti: [limiti delle funzioni monotone](/matematica/limiti-funzioni-monotone-esercizi/).

### Algebra dei limiti e permanenza del segno

Se $f(x)\to\ell$, $g(x)\to m$ con $\ell,m\in\mathbb R$:

$$
f\pm g\to\ell\pm m,
\qquad
\lambda f\to\lambda\ell,
$$

$$
fg\to\ell m,
\qquad
|f|\to|\ell|,
$$

$$
\frac fg\to\frac\ell m,
\qquad m\ne0.
$$

$$
f(x)\to L>0
\Longrightarrow
f(x)>0\quad\text{definitivamente},
$$

$$
f(x)\to L<0
\Longrightarrow
f(x)<0\quad\text{definitivamente}.
$$

Come regola di limite, non come operazione aritmetica sui simboli infiniti:

$$
f(x)\to\ell\in\mathbb R,
\qquad
|g(x)|\to+\infty
\Longrightarrow
\frac{f(x)}{g(x)}\to0.
$$

Se $f\to\ell\ne0$ e $g\to0$:

$$
\begin{array}{c|cc}
&g\to0^+&g\to0^-\\
\hline
\ell>0&f/g\to+\infty&f/g\to-\infty\\
\ell<0&f/g\to-\infty&f/g\to+\infty
\end{array}
$$

Approfondimento: [algebra dei limiti](/matematica/algebra-dei-limiti/), [permanenza del segno](/matematica/permanenza-del-segno/).

### Composizione dei limiti

Se

$$
f(x)\to\ell,
\qquad
g(y)\to m\quad(y\to\ell),
$$

e definitivamente

$$
f(x)\in D_g,
\qquad
f(x)\ne\ell,
$$

allora

$$
g(f(x))\to m.
$$

Se $g$ è continua in $\ell$:

$$
f(x)\to\ell
\Longrightarrow
g(f(x))\to g(\ell),
$$

senza richiedere $f(x)\ne\ell$.

Approfondimento: [algebra dei limiti](/matematica/algebra-dei-limiti/), [limite di funzione](/matematica/limite-di-funzione/).

### Teorema dei carabinieri

$$
f(x)\le g(x)\le h(x)\quad\text{definitivamente},
$$

$$
f(x)\to L,
\qquad
h(x)\to L
\Longrightarrow
g(x)\to L.
$$

Per $L\in\mathbb R$, una forma equivalente particolarmente utile è:

$$
|g(x)-L|\le r(x),
\qquad
r(x)\to0
\Longrightarrow
g(x)\to L.
$$

Versioni infinite:

$$
f\le g,
\qquad
f\to+\infty
\Longrightarrow
g\to+\infty,
$$

$$
g\le h,
\qquad
h\to-\infty
\Longrightarrow
g\to-\infty.
$$

Approfondimento: [teorema dei carabinieri](/matematica/teorema-dei-carabinieri/).

### Funzioni razionali all’infinito

Siano

$$
P(x)=a_mx^m+\cdots,
\qquad
Q(x)=b_nx^n+\cdots,
\qquad a_m b_n\ne0.
$$

Per $x\to\pm\infty$:

$$
\frac{P(x)}{Q(x)}
\sim
\frac{a_m}{b_n}x^{m-n}.
$$

In particolare, per $x\to+\infty$:

| Gradi | Limite di $P/Q$ |
|---|---|
| $m<n$ | $0$ |
| $m=n$ | $a_m/b_n$ |
| $m>n$ | si studia il segno di $(a_m/b_n)x^{m-n}$ |

Per $x\to-\infty$ occorre considerare anche la parità di $m-n$.

### Forme indeterminate

Le scritture seguenti non sono risultati: indicano che le sole informazioni sui
limiti dei fattori non bastano a determinare il limite dell'espressione.

$$
\frac00,
\qquad
\frac\infty\infty,
\qquad
0\cdot\infty,
\qquad
\infty-\infty,
\qquad
0^0,
\qquad
1^\infty,
\qquad
\infty^0.
$$

Trasformazioni standard:

$$
f\,g=\frac f{1/g}=\frac g{1/f},
$$

$$
f-g=\frac{f^2-g^2}{f+g}
\quad\text{oppure}\quad
f-g=\frac{1/g-1/f}{1/(fg)},
$$

nei rispettivi domini.

Per $f(x)>0$:

$$
f(x)^{g(x)}
=\exp(g(x)\ln f(x)).
$$

Approfondimento: [forme indeterminate](/matematica/forme-indeterminate/).

### Potenze con base ed esponente variabili

Per una forma $f(x)^{g(x)}$ con $f(x)>0$ definitivamente, porre

$$
H(x)=g(x)\ln f(x).
$$

Se $H(x)\to L\in\overline{\mathbb R}$, allora

$$
f(x)^{g(x)}=e^{H(x)}\to e^L,
$$

con le convenzioni $e^{-\infty}=0$ ed $e^{+\infty}=+\infty$.

Caso fondamentale:

$$
u(x)\to0,
\qquad
v(x)u(x)\to L
\Longrightarrow
[1+u(x)]^{v(x)}\to e^L,
$$

purché $1+u(x)>0$ definitivamente.

### Limiti notevoli

Per $x\to0$:

$$
\frac{\sin x}{x}\to1,
\qquad
\frac{1-\cos x}{x^2}\to\frac12,
\qquad
\frac{\tan x}{x}\to1,
$$

$$
\frac{\arcsin x}{x}\to1,
\qquad
\frac{\arctan x}{x}\to1,
$$

$$
\frac{e^x-1}{x}\to1,
\qquad
\frac{a^x-1}{x}\to\ln a
\quad(a>0),
$$

$$
\frac{\ln(1+x)}{x}\to1,
\qquad
\frac{(1+x)^\alpha-1}{x}\to\alpha,
$$

$$
(1+x)^{1/x}\to e.
$$

Per $x\to+\infty$:

$$
\left(1+\frac ax\right)^x\to e^a,
$$

$$
\frac{\ln x}{x^\alpha}\to0,
\qquad \alpha>0,
$$

$$
\frac{x^\alpha}{a^x}\to0,
\qquad a>1,
\qquad \alpha>0.
$$

Le formule trigonometriche richiedono gli angoli in radianti.

Approfondimento: [limiti notevoli](/matematica/limiti-notevoli/).

<a id="sezione-8"></a>
## 8. Continuità

Quando $x_0$ è un punto di accumulazione del dominio, la continuità richiede
tre elementi: $f(x_0)$ deve essere definita, il limite per $x\to x_0$ deve
esistere ed essere finito, e deve coincidere con $f(x_0)$. Nei punti isolati la
continuità è automatica.

### Definizione e caratterizzazione mediante il limite

Per $f:D\to\mathbb R$ e $x_0\in D$:

$$
f\text{ continua in }x_0
$$

$$
\Longleftrightarrow
\forall\varepsilon>0,\ \exists\delta>0,\ \forall x\in D:\
|x-x_0|<\delta
\Rightarrow
|f(x)-f(x_0)|<\varepsilon.
$$

Se $x_0\in D\cap D'$:

$$
f\text{ continua in }x_0
\Longleftrightarrow
\lim_{\substack{x\to x_0\\x\in D}}f(x)=f(x_0).
$$

Caratterizzazione sequenziale:

$$
f\text{ continua in }x_0
\Longleftrightarrow
\forall(x_n)\subseteq D:\ x_n\to x_0
\Rightarrow
f(x_n)\to f(x_0).
$$

Agli estremi di un intervallo $[a,b]$:

$$
f\text{ continua in }a
\Longleftrightarrow
\lim_{x\to a^+}f(x)=f(a),
\qquad
f\text{ continua in }b
\Longleftrightarrow
\lim_{x\to b^-}f(x)=f(b).
$$

Se $x_0$ è isolato in $D$, $f$ è continua in $x_0$.

Approfondimento: [continuità](/matematica/continuita/).

### Operazioni con funzioni continue

Se $f,g$ sono continue in $x_0$:

$$
\alpha f+\beta g,
\qquad
fg,
\qquad
|f|,
\qquad
f^n\ (n\in\mathbb N_+)
$$

sono continue in $x_0$ nei rispettivi domini.

Se $g(x_0)\ne0$:

$$
\frac1g,
\qquad
\frac fg
$$

sono continue in $x_0$.

$$
D_{f\pm g}=D_f\cap D_g,
\qquad
D_{fg}=D_f\cap D_g,
$$

$$
D_{f/g}=\{x\in D_f\cap D_g:g(x)\ne0\}.
$$

$$
\max(f,g)=\frac{f+g+|f-g|}{2},
\qquad
\min(f,g)=\frac{f+g-|f-g|}{2}.
$$

Se $f$ è continua in $x_0$ e $g$ è continua in $f(x_0)$:

$$
g\circ f\text{ è continua in }x_0,
$$

$$
D_{g\circ f}=\{x\in D_f:f(x)\in D_g\}.
$$

$$
\begin{array}{c|c}
\text{famiglia}&\text{dominio naturale di continuità}\\
\hline
\text{polinomi}&\mathbb R\\
\text{razionali}&\{Q\ne0\}\\
\sqrt[2m]{f}&\{f\ge0\}\\
\log_a f&\{f>0\},\ a>0,\ a\ne1\\
a^x&\mathbb R,\ a>0\\
\sin,\cos,\sinh,\cosh,\tanh&\mathbb R\\
\tan,\sec&\mathbb R\setminus\{\pi/2+k\pi\}\\
\cot,\csc&\mathbb R\setminus\{k\pi\}
\end{array}
$$

Approfondimento: [continuità](/matematica/continuita/).

### Continuità dell’inversa monotona

Se $I$ è un intervallo e $f:I\to\mathbb R$ è continua e strettamente monotona:

$$
J=f(I)\text{ è un intervallo},
$$

$$
f^{-1}:J\to I\text{ è continua e strettamente monotona}.
$$

$$
f\nearrow\Longrightarrow f^{-1}\nearrow,
\qquad
f\searrow\Longrightarrow f^{-1}\searrow.
$$

Approfondimento: [continuità della funzione inversa](/matematica/continuita-della-funzione-inversa/), [funzione inversa](/matematica/funzione-inversa/).

### Continuità uniforme e funzioni lipschitziane

La continuità uniforme è una proprietà dell'intero dominio, non di un singolo
punto. Una funzione $f:D\to\mathbb R$ è uniformemente continua su $D$ se

$$
\forall\varepsilon>0\ \exists\delta>0\ \forall x,y\in D:
|x-y|<\delta
\Longrightarrow
|f(x)-f(y)|<\varepsilon.
$$

Negazione:

$$
\exists\varepsilon_0>0\ \forall\delta>0\ \exists x,y\in D:
|x-y|<\delta,
\qquad
|f(x)-f(y)|\ge\varepsilon_0.
$$

Condizione di Lipschitz:

$$
|f(x)-f(y)|\le L|x-y|
\quad\forall x,y\in D,
\qquad L\ge0,
$$

$$
f\text{ lipschitziana}
\Longrightarrow
f\text{ uniformemente continua}.
$$

### Tipi di discontinuità e prolungamento continuo

Per $x_0\in D$ punto di accumulazione del dominio da entrambi i lati:

$$
\begin{array}{c|c}
\text{tipo}&\text{condizione}\\
\hline
\text{eliminabile}&\lim_{x\to x_0}f(x)=L\in\mathbb R,\ f(x_0)\ne L\\
\text{a salto}&f(x_0^-),f(x_0^+)\in\mathbb R,\ f(x_0^-)\ne f(x_0^+)\\
\text{infinita}&f(x_0^-),f(x_0^+)\text{ esistono in }\overline{\mathbb R}
\text{ e almeno uno vale }\pm\infty\\
\text{oscillatoria o irregolare}&\text{almeno un limite laterale non esiste in }\overline{\mathbb R}
\end{array}
$$

Se $x_0\notin D$, $x_0\in D'$ e

$$
\lim_{\substack{x\to x_0\\x\in D}}f(x)=L\in\mathbb R,
$$

il prolungamento continuo è

$$
\widetilde f(x)=
\begin{cases}
f(x),&x\in D,\\
L,&x=x_0.
\end{cases}
$$

Approfondimento: [punti di discontinuità](/matematica/punti-di-discontinuita/), [continuità](/matematica/continuita/).

### Teorema di Weierstrass

$$
f\in C([a,b])
\Longrightarrow
\exists x_m,x_M\in[a,b],\ \forall x\in[a,b]:
f(x_m)\le f(x)\le f(x_M).
$$

$$
f(x_m)=\min_{[a,b]}f,
\qquad
f(x_M)=\max_{[a,b]}f.
$$

Approfondimento: [teorema di Weierstrass](/matematica/teorema-di-weierstrass/).

### Teorema degli zeri

$$
f\in C([a,b]),
\qquad
f(a)f(b)<0
$$

$$
\Longrightarrow
\exists c\in(a,b):\ f(c)=0.
$$

$$
f\in C([a,b]),
\qquad
f(a)f(b)<0,
\qquad
f\text{ strettamente monotona}
\Longrightarrow
\exists!c\in(a,b):\ f(c)=0.
$$

Approfondimento: [teorema degli zeri](/matematica/teorema-degli-zeri/).

Esercizi svolti: [teorema degli zeri e bisezione](/matematica/teorema-degli-zeri-esercizi/).

### Teorema dei valori intermedi

$$
f\in C([a,b]),
\qquad
y\in[\min\{f(a),f(b)\},\max\{f(a),f(b)\}]
$$

$$
\Longrightarrow
\exists c\in[a,b]:\ f(c)=y.
$$

Equivalentemente, per ogni intervallo $I$:

$$
f\in C(I)
\Longrightarrow
f(I)\text{ è un intervallo}.
$$

Approfondimento: [teorema dei valori intermedi](/matematica/teorema-dei-valori-intermedi/).

### Teorema di Heine–Cantor

$$
f\in C([a,b])
\Longrightarrow
\forall\varepsilon>0,\ \exists\delta>0,\ \forall x,y\in[a,b]:
$$

$$
|x-y|<\delta
\Rightarrow
|f(x)-f(y)|<\varepsilon.
$$

Approfondimento: [teorema di Heine–Cantor](/matematica/teorema-di-heine-cantor/).

<a id="sezione-9"></a>
## 9. Confronto asintotico e simboli di Landau

Ogni scrittura asintotica deve essere accompagnata dal regime, per esempio
$x\to0$, $x\to+\infty$ oppure $n\to\infty$. Le equivalenze si possono
sostituire in prodotti e quozienti, ma non in generale in somme o differenze
nelle quali può verificarsi cancellazione.

Esempio:

$$
\sin x\sim x\quad(x\to0),
$$

ma sostituire direttamente $\sin x$ con $x$ in $\sin x-x$ cancellerebbe il
termine principale; serve uno sviluppo di ordine superiore:

$$
\sin x-x\sim-\frac{x^3}{6}.
$$

### Simboli di Landau

Siano $D\subseteq\mathbb R$, $a\in\overline{\mathbb R}$ un punto di
accumulazione nel regime considerato e $f,g:D\to\mathbb R$. Gli insiemi $U_\varepsilon$ e $U$ indicano intorni del regime, puntati quando $a\in\mathbb R$.

$$
\displaystyle
f=o(g)
\quad\Longleftrightarrow\quad
\forall\varepsilon>0\ \exists U_\varepsilon:
|f(x)|\le\varepsilon|g(x)|
\quad\forall x\in D\cap U_\varepsilon.
$$

Se $g$ è definitivamente non nulla:

$$
\displaystyle
f=o(g)
\quad\Longleftrightarrow\quad
\frac{f}{g}\to0.
$$

$$
\displaystyle
f=O(g)
\quad\Longleftrightarrow\quad
\exists C>0\ \exists U:
|f(x)|\le C|g(x)|
\quad\forall x\in D\cap U.
$$

$$
\displaystyle
f=\Theta(g)
\quad\Longleftrightarrow\quad
\exists c,C>0\ \exists U:
c|g(x)|\le |f(x)|\le C|g(x)|
\quad\forall x\in D\cap U.
$$

Se $g$ è definitivamente non nulla:

$$
\displaystyle
f\sim g
\quad\Longleftrightarrow\quad
\frac{f}{g}\to1
\quad\Longleftrightarrow\quad
f=g+o(g).
$$

Approfondimenti: [simboli di Landau](/matematica/simboli-di-landau/) ed
[equivalenza asintotica](/matematica/equivalenza-asintotica/).

Esercizi svolti: [simboli di Landau](/matematica/simboli-di-landau-esercizi/).

### Algebra degli ordini

Nel medesimo dominio e regime:

$$
\begin{aligned}
o(g)+o(g)&=o(g),&
O(g)+O(g)&=O(g),\\
f=o(g),\ g=O(h)&\Rightarrow f=o(h),&
f=O(g),\ g=o(h)&\Rightarrow f=o(h),\\
f=O(g),\ g=O(h)&\Rightarrow f=O(h),&
o(g)\,O(h)&=o(gh),\\
O(g)\,O(h)&=O(gh).&&
\end{aligned}
$$

$$
\displaystyle
g=\Theta(h)
\quad\Longrightarrow\quad
O(g)=O(h),
\qquad
o(g)=o(h).
$$

Se $q$ è definitivamente non nulla:

$$
\displaystyle
r=o(g)
\quad\Longrightarrow\quad
\frac rq=o\!\left(\frac gq\right),
$$

e analogamente per $O$.

$$
\displaystyle
\frac{a+o(1)}{b+o(1)}
=\frac ab+o(1),
\qquad b\ne0.
$$

Se $f\sim g$ e $h\sim k$, con denominatori definitivamente non nulli:

$$
\displaystyle
fh\sim gk,
\qquad
\frac fh\sim\frac gk.
$$

Approfondimento: [algebra degli o-piccoli](/matematica/algebra-degli-o-piccoli/).

Esercizi svolti: [algebra degli o-piccoli](/matematica/algebra-degli-o-piccoli-esercizi/).

### Equivalenze fondamentali per $x\to0$

$$
\begin{gathered}
\sin x\sim x,
\qquad
\tan x\sim x,
\qquad
\arcsin x\sim x,
\qquad
\arctan x\sim x,\\[4pt]
1-\cos x\sim\frac{x^2}{2},\\[4pt]
e^x-1\sim x,
\qquad
\ln(1+x)\sim x,\\[4pt]
(1+x)^\alpha-1\sim\alpha x,
\qquad \alpha\ne0.
\end{gathered}
$$

### Gerarchie di crescita

Per $x\to+\infty$, $\alpha,\beta>0$ e $a>1$:

$$
\displaystyle
(\ln x)^\beta=o(x^\alpha),
\qquad
x^\alpha=o(a^x).
$$

In notazione compatta:

$$
\displaystyle
(\ln x)^\beta\ll x^\alpha\ll a^x.
$$

Per $n\to\infty$ e $a>1$:

$$
\displaystyle
a^n\ll n!\ll n^n.
$$

Approfondimento: [gerarchia degli infiniti](/matematica/gerarchia-degli-infiniti/).

<a id="sezione-10"></a>
## 10. Calcolo differenziale

La derivata misura il tasso di variazione locale di una funzione. Ogni regola
va applicata soltanto nei punti nei quali la funzione originaria, le funzioni
intermedie e la formula risultante sono definite. La notazione $u'$ abbrevia
$du/dx$ quando $u=u(x)$.

### Derivata, derivate laterali e retta tangente

Siano $f:D\to\mathbb R$ e $x_0\in D$ punto di accumulazione di $D$.

$$
\displaystyle
f'(x_0)=
\lim_{\substack{h\to0\\h\ne0,\ x_0+h\in D}}
\frac{f(x_0+h)-f(x_0)}{h}.
$$

Forma equivalente, ponendo $x=x_0+h$:

$$
f'(x_0)
=\lim_{\substack{x\to x_0\\x\ne x_0,\ x\in D}}
\frac{f(x)-f(x_0)}{x-x_0}.
$$

Il numeratore è l'incremento $\Delta f$ e il denominatore l'incremento
$\Delta x$; il loro rapporto è il rapporto incrementale.

$$
\displaystyle
f'_+(x_0)=
\lim_{\substack{h\to0^+\\x_0+h\in D}}
\frac{f(x_0+h)-f(x_0)}{h},
\qquad
f'_-(x_0)=
\lim_{\substack{h\to0^-\\x_0+h\in D}}
\frac{f(x_0+h)-f(x_0)}{h}.
$$

Se $x_0$ è punto di accumulazione del dominio da entrambi i lati:

$$
\displaystyle
f'(x_0)\in\mathbb R
\quad\Longleftrightarrow\quad
f'_-(x_0)=f'_+(x_0)\in\mathbb R.
$$

Approssimazione lineare e retta tangente:

$$
\displaystyle
f(x_0+h)=f(x_0)+f'(x_0)h+o(h),
$$

$$
\displaystyle
y=f(x_0)+f'(x_0)(x-x_0).
$$

Retta normale al grafico nel punto $(x_0,f(x_0))$:

$$
y-f(x_0)=-\frac{1}{f'(x_0)}(x-x_0),
\qquad f'(x_0)\ne0,
$$

$$
x=x_0,
\qquad f'(x_0)=0.
$$

$$
\displaystyle
f\text{ derivabile in }x_0
\quad\Longrightarrow\quad
f\text{ continua in }x_0.
$$

Il viceversa non vale; caso standard:

$$
\displaystyle
f(x)=|x|,
\qquad
f'_-(0)=-1,
\qquad
f'_+(0)=1.
$$

Approfondimento: [derivata](/matematica/derivata/).

### Punti di non derivabilità

| Caso | Derivate laterali | Modello in $x_0=0$ |
|---|---|---|
| Punto angoloso | $f'_-,f'_+\in\mathbb R$, $f'_-\ne f'_+$ | $f(x)=\lvert x\rvert$ |
| Cuspide | $f'_-,f'_+$ infiniti di segno opposto | $f(x)=\sqrt{\lvert x\rvert}$ |
| Tangente verticale | $f'_-=f'_+=\pm\infty$ | $f(x)=\sqrt[3]{x}$ |
| Caso misto | un laterale è finito e l'altro infinito o inesistente | $f(x)=\begin{cases}x,&x<0\\ \sqrt{x},&x\ge0\end{cases}$ |

Approfondimento: [punti di non derivabilità](/matematica/punti-di-non-derivabilita/).

### Differenziale e linearizzazione

Sia $f:D\to\mathbb R$ derivabile in $x_0\in D\cap D'$. Per $h\to0$ con
$x_0+h\in D$:

$$
\displaystyle
df_{x_0}:h\longmapsto f'(x_0)h.
$$

$$
\displaystyle
f(x_0+h)-f(x_0)=f'(x_0)h+r(h),
\qquad
\lim_{h\to0}\frac{r(h)}{h}=0.
$$

$$
L_{x_0}(x)
=f(x_0)+df_{x_0}(x-x_0)
=f(x_0)+f'(x_0)(x-x_0).
$$

Con $h=\Delta x$:

$$
\begin{aligned}
\Delta f&=f(x_0+h)-f(x_0),\\
df_{x_0}(h)&=f'(x_0)h,\\
r(h)&=\Delta f-df_{x_0}(h).
\end{aligned}
$$

Stime di primo ordine, valide per incrementi sufficientemente piccoli e con
errore trascurabile rispetto a $|\Delta x|$:

$$
\displaystyle
|\Delta f|\approx |f'(x_0)|\,|\Delta x|,
$$

$$
\displaystyle
\frac{|\Delta f|}{|f(x_0)|}
\approx
\left|\frac{f'(x_0)}{f(x_0)}\right|\,|\Delta x|,
\qquad f(x_0)\ne0.
$$

Approfondimento: [differenziale e linearizzazione](/matematica/differenziale/).

Esercizi svolti: [differenziale e approssimazione lineare](/matematica/differenziale-approssimazione-lineare-esercizi/).

### Derivate elementari

| Funzione | Derivata | Condizioni |
|---|---|---|
| $c$ | $0$ | $c\in\mathbb R$ |
| $x$ | $1$ | $x\in\mathbb R$ |
| $x^\alpha$ | $\alpha x^{\alpha-1}$ | $x>0$, $\alpha\in\mathbb R$ |
| $x^n$ | $n x^{n-1}$ | $x\in\mathbb R$, $n\in\mathbb N_+$ |
| $x^{-n}$ | $-n x^{-n-1}$ | $x\ne0$, $n\in\mathbb N_+$ |
| $\sqrt{x}$ | $1/(2\sqrt{x})$ | $x>0$ |
| $\lvert x\rvert$ | $\operatorname{sgn}x$ | $x\ne0$; non derivabile in $0$ |
| $e^x$ | $e^x$ | $x\in\mathbb R$ |
| $a^x$ | $a^x\ln a$ | $a>0$ |
| $\ln x$ | $1/x$ | $x>0$ |
| $\log_a x$ | $1/(x\ln a)$ | $x>0$, $a>0$, $a\ne1$ |
| $\sin x$ | $\cos x$ | $x\in\mathbb R$ |
| $\cos x$ | $-\sin x$ | $x\in\mathbb R$ |
| $\tan x$ | $1/\cos^2x=1+\tan^2x$ | $x\ne\pi/2+k\pi$ |
| $\cot x$ | $-1/\sin^2x$ | $x\ne k\pi$ |
| $\sec x$ | $\sec x\tan x$ | $\cos x\ne0$ |
| $\csc x$ | $-\csc x\cot x$ | $\sin x\ne0$ |

### Derivate delle funzioni inverse

| Funzione | Derivata | Dominio della derivata |
|---|---|---|
| $\arcsin x$ | $1/\sqrt{1-x^2}$ | $\lvert x\rvert<1$ |
| $\arccos x$ | $-1/\sqrt{1-x^2}$ | $\lvert x\rvert<1$ |
| $\arctan x$ | $1/(1+x^2)$ | $x\in\mathbb R$ |
| $\operatorname{arccot}x$ | $-1/(1+x^2)$ | $x\in\mathbb R$, con valori in $(0,\pi)$ |

### Derivate iperboliche

| Funzione | Derivata | Dominio della derivata |
|---|---|---|
| $\sinh x$ | $\cosh x$ | $x\in\mathbb R$ |
| $\cosh x$ | $\sinh x$ | $x\in\mathbb R$ |
| $\tanh x$ | $1/\cosh^2x$ | $x\in\mathbb R$ |
| $\coth x$ | $-1/\sinh^2x$ | $x\ne0$ |
| $\operatorname{arsinh}x$ | $1/\sqrt{1+x^2}$ | $x\in\mathbb R$ |
| $\operatorname{arcosh}x$ | $1/\sqrt{x^2-1}$ | $x>1$ |
| $\operatorname{artanh}x$ | $1/(1-x^2)$ | $\lvert x\rvert<1$ |
| $\operatorname{arcoth}x$ | $1/(1-x^2)$ | $\lvert x\rvert>1$ |

Approfondimenti: [derivata](/matematica/derivata/) e [derivate di ordine
superiore](/matematica/derivata-ordine-superiore/).

### Regole di derivazione

$$
\begin{aligned}
(\alpha f+\beta g)'&=\alpha f'+\beta g',\\
(fg)'&=f'g+fg',\\
\left(\frac1f\right)'&=-\frac{f'}{f^2},\qquad f\ne0,\\
\left(\frac fg\right)'&=\frac{f'g-fg'}{g^2},\qquad g\ne0,\\
(f\circ g)'(x)&=f'(g(x))g'(x),\\
(|f|)'&=\operatorname{sgn}(f)f',\qquad f\ne0.
\end{aligned}
$$

Nei punti in cui $f(x)=0$, la derivabilità di $|f|$ va controllata direttamente:
la formula con $\operatorname{sgn}(f)$ non decide il caso.

Se $f$ è continua e strettamente monotona su un intervallo $I$, è derivabile
in $x_0\in\operatorname{int}I$ e $f'(x_0)\ne0$, posto $y_0=f(x_0)$:

$$
\displaystyle
(f^{-1})'(y_0)=\frac{1}{f'(x_0)}.
$$

In forma operativa, per ogni $y$ nel tratto nel quale valgono le stesse ipotesi:

$$
(f^{-1})'(y)
=\frac{1}{f'\bigl(f^{-1}(y)\bigr)}.
$$

Derivate successive:

$$
\displaystyle
f^{(0)}=f,
\qquad
f^{(n)}=(f^{(n-1)})'.
$$

Formula di Leibniz:

$$
\displaystyle
(fg)^{(n)}
=
\sum_{k=0}^{n}\binom nk f^{(k)}g^{(n-k)}.
$$

Derivata logaritmica:

$$
\displaystyle
(\ln|f(x)|)'=\frac{f'(x)}{f(x)},
\qquad f(x)\ne0.
$$

Potenza a base ed esponente variabili:

$$
\displaystyle
\bigl(u(x)^{v(x)}\bigr)'
=
u(x)^{v(x)}
\left[
v'(x)\ln u(x)+v(x)\frac{u'(x)}{u(x)}
\right],
\qquad u(x)>0.
$$

Approfondimenti: [regole di derivazione](/matematica/regole-di-derivazione/),
[regola della catena](/matematica/regola-della-catena/) e [derivata
logaritmica](/matematica/derivata-logaritmica/).

### Tabella delle derivate composte

Per $u=u(x)$ derivabile, nei rispettivi domini:

| Funzione composta | Derivata | Condizioni |
|---|---|---|
| $u^\alpha$ | $\alpha u^{\alpha-1}u'$ | dove la potenza è reale e derivabile; per $\alpha\in\mathbb R$ arbitrario, $u>0$ |
| $\sqrt{u}$ | $u'/(2\sqrt{u})$ | $u>0$ |
| $\lvert u\rvert$ | $\operatorname{sgn}(u)u'$ | $u\ne0$ |
| $e^u$ | $e^u u'$ | — |
| $a^u$ | $a^u\ln(a)\,u'$ | $a>0$ |
| $\ln\lvert u\rvert$ | $u'/u$ | $u\ne0$ |
| $\sin u$ | $\cos u\,u'$ | — |
| $\cos u$ | $-\sin u\,u'$ | — |
| $\tan u$ | $u'/\cos^2u$ | $\cos u\ne0$ |
| $\arcsin u$ | $u'/\sqrt{1-u^2}$ | $\lvert u\rvert<1$ |
| $\arccos u$ | $-u'/\sqrt{1-u^2}$ | $\lvert u\rvert<1$ |
| $\arctan u$ | $u'/(1+u^2)$ | — |
| $\operatorname{arccot}u$ | $-u'/(1+u^2)$ | — |
| $\cot u$ | $-u'/\sin^2u$ | $\sin u\ne0$ |
| $\sec u$ | $\sec u\tan u\,u'$ | $\cos u\ne0$ |
| $\csc u$ | $-\csc u\cot u\,u'$ | $\sin u\ne0$ |
| $\sinh u$ | $\cosh u\,u'$ | — |
| $\cosh u$ | $\sinh u\,u'$ | — |
| $\tanh u$ | $u'/\cosh^2u$ | — |
| $\coth u$ | $-u'/\sinh^2u$ | $u\ne0$ |
| $\operatorname{arsinh}u$ | $u'/\sqrt{1+u^2}$ | — |
| $\operatorname{arcosh}u$ | $u'/\sqrt{u^2-1}$ | $u>1$ |
| $\operatorname{artanh}u$ | $u'/(1-u^2)$ | $\lvert u\rvert<1$ |
| $\operatorname{arcoth}u$ | $u'/(1-u^2)$ | $\lvert u\rvert>1$ |

### Derivazione implicita e parametrica

Se $F\in C^1$ in un intorno di $(x_0,y_0)$, $F(x_0,y_0)=0$ e
$F_y(x_0,y_0)\ne0$, allora localmente $F(x,y(x))=0$ e

$$
y'(x)=-\frac{F_x(x,y(x))}{F_y(x,y(x))}.
$$

Qui $F_x$ e $F_y$ sono le derivate parziali. La condizione $F_y\ne0$ permette
di risolvere localmente l'equazione rispetto a $y$; se invece $F_x\ne0$ si può
risolvere localmente rispetto a $x$.

Per una curva parametrica $x=x(t)$, $y=y(t)$ con $x'(t)\ne0$:

$$
\frac{dy}{dx}=\frac{y'(t)}{x'(t)},
$$

$$
\frac{d^2y}{dx^2}
=
\frac{1}{x'(t)}\frac{d}{dt}\left(\frac{y'(t)}{x'(t)}\right).
$$

<a id="sezione-11"></a>
## 11. Teoremi del calcolo differenziale

Nei teoremi seguenti le righe prima della freccia sono le **ipotesi** e ciò che
segue la freccia è la **conclusione**. Il converso non è valido salvo quando è
espressamente dichiarata un'equivalenza.

### Teorema di Fermat

$$
\displaystyle
\left.
\begin{array}{l}
x_0\in\operatorname{int}D,\\
x_0\text{ estremo locale di }f,\\
f\text{ derivabile in }x_0
\end{array}
\right\}
\quad\Longrightarrow\quad
f'(x_0)=0.
$$

Condizione necessaria, non sufficiente:

$$
\displaystyle
f(x)=x^3,
\qquad
f'(0)=0,
\qquad
0\text{ non è un estremo}.
$$

Caso di frontiera:

$$
\displaystyle
f(x)=x\text{ su }[0,1],
\qquad
\max f=f(1),
\qquad
f'_-(1)=1.
$$

Approfondimento: [teorema di Fermat](/matematica/teorema-di-fermat/).

### Teorema di Rolle

Per $a<b$:

$$
\displaystyle
\left.
\begin{array}{l}
f\in C([a,b]),\\
f\text{ derivabile in }(a,b),\\
f(a)=f(b)
\end{array}
\right\}
\quad\Longrightarrow\quad
\exists c\in(a,b):\ f'(c)=0.
$$

Approfondimento: [teorema di Rolle](/matematica/teorema-di-rolle/).

### Teorema di Lagrange

Per $a<b$:

$$
\displaystyle
\left.
\begin{array}{l}
f\in C([a,b]),\\
f\text{ derivabile in }(a,b)
\end{array}
\right\}
\quad\Longrightarrow\quad
\exists c\in(a,b):
f'(c)=\frac{f(b)-f(a)}{b-a}.
$$

Se $f$ è derivabile su un intervallo $I$, valgono le conseguenze:

$$
\begin{aligned}
f'\ge0\text{ su }I&\Longrightarrow f\text{ non decrescente su }I,\\
f'\le0\text{ su }I&\Longrightarrow f\text{ non crescente su }I,\\
f'=0\text{ su }I&\Longrightarrow f\text{ costante su }I,\\
f'>0\text{ su }I&\Longrightarrow f\text{ strettamente crescente su }I,\\
f'<0\text{ su }I&\Longrightarrow f\text{ strettamente decrescente su }I.
\end{aligned}
$$

Se $|f'|\le M$ su $I$:

$$
\displaystyle
|f(y)-f(x)|\le M|y-x|
\qquad\forall x,y\in I.
$$

Approfondimento: [teorema di Lagrange](/matematica/teorema-di-lagrange/).

Esercizi svolti: [Fermat, Rolle e Lagrange](/matematica/fermat-rolle-lagrange-esercizi/).

### Teorema di Cauchy

Per $a<b$:

$$
\displaystyle
\left.
\begin{array}{l}
f,g\in C([a,b]),\\
f,g\text{ derivabili in }(a,b)
\end{array}
\right\}
\quad\Longrightarrow\quad
\exists c\in(a,b):
$$

$$
\displaystyle
f'(c)[g(b)-g(a)]
=
g'(c)[f(b)-f(a)].
$$

Se inoltre $g'(x)\ne0$ per ogni $x\in(a,b)$:

$$
\displaystyle
\exists c\in(a,b):
\frac{f'(c)}{g'(c)}
=
\frac{f(b)-f(a)}{g(b)-g(a)}.
$$

Caso particolare $g(x)=x$: teorema di Lagrange.

Approfondimento: [teorema di Cauchy](/matematica/teorema-di-cauchy/).

Esercizi svolti: [teorema di Cauchy](/matematica/teoremi-calcolo-differenziale-esercizi/).

### Teorema di Darboux per le derivate

Sia $f$ derivabile su un intervallo $I$; per $x_1<x_2$ in $I$ e

$$
\min\{f'(x_1),f'(x_2)\}<\lambda<\max\{f'(x_1),f'(x_2)\},
$$

vale

$$
\exists c\in(x_1,x_2):\ f'(c)=\lambda.
$$

$$
f'(I)\text{ è un intervallo}.
$$

Approfondimento: [teorema di Darboux](/matematica/teorema-di-darboux/).

Esercizi svolti: [teorema di Darboux per le derivate](/matematica/teorema-di-darboux-esercizi/).

### Teorema di de l’Hôpital

Sia $a\in\overline{\mathbb R}$ e sia $I$ un intervallo puntato, eventualmente
unilatero, che tende ad $a$:

$$
\displaystyle
f,g\text{ derivabili in }I,
\qquad
g(x)\ne0,
\qquad
g'(x)\ne0
\quad\text{in }I.
$$

Forme ammesse:

$$
\displaystyle
f(x)\to0,
\quad g(x)\to0,
$$

oppure

$$
\displaystyle
|f(x)|\to+\infty,
\quad |g(x)|\to+\infty.
$$

Se

$$
\displaystyle
\lim_{x\to a}\frac{f'(x)}{g'(x)}=L
\in\overline{\mathbb R},
$$

allora

$$
\displaystyle
\lim_{x\to a}\frac{f(x)}{g(x)}=L.
$$

Riduzioni standard:

| Forma | Trasformazione |
|---|---|
| $0\cdot\infty$ | $u v=\dfrac{u}{1/v}=\dfrac{v}{1/u}$ |
| $\infty-\infty$ | denominatore comune oppure razionalizzazione |
| $0^0$, $1^\infty$, $\infty^0$ | $u^v=\exp(v\ln u)$, con $u>0$ |

Approfondimento: [teorema di de l’Hôpital](/matematica/teorema-di-de-l-hopital/).

<a id="sezione-12"></a>
## 12. Taylor e sviluppi di Maclaurin

$T_{n,x_0}f$ è il polinomio di Taylor di grado al più $n$ centrato in $x_0$;
Maclaurin è il caso particolare $x_0=0$. Il termine $R_n=f-T_{n,x_0}f$ è il
resto.

### Polinomio e coefficienti di Taylor

$$
\displaystyle
T_{n,x_0}f(x)
=
\sum_{k=0}^{n}
\frac{f^{(k)}(x_0)}{k!}(x-x_0)^k.
$$

Se

$$
\displaystyle
T_{n,x_0}f(x)=\sum_{k=0}^{n}c_k(x-x_0)^k,
$$

allora

$$
\displaystyle
c_k=\frac{f^{(k)}(x_0)}{k!},
\qquad
f^{(k)}(x_0)=k!\,c_k.
$$

Approfondimento: [formula di Taylor](/matematica/formula-di-taylor/).

### Resti di Peano, Lagrange, Cauchy e integrale

Una condizione sufficiente per la forma di Peano è $f\in C^n$ in un intervallo
aperto contenente $x_0$. Allora, per $x\to x_0$:

$$
\displaystyle
f(x)=T_{n,x_0}f(x)+o((x-x_0)^n).
$$

Per $x\ne x_0$, se $f,f',\ldots,f^{(n)}$ sono continue sul segmento di estremi
$x_0,x$ e $f^{(n+1)}$ esiste al suo interno, esiste $\xi_L$ strettamente
interno al segmento tale che

$$
\displaystyle
f(x)=T_{n,x_0}f(x)
+\frac{f^{(n+1)}(\xi_L)}{(n+1)!}(x-x_0)^{n+1}.
$$

Se $|f^{(n+1)}(t)|\le M$ sul segmento:

$$
\displaystyle
|f(x)-T_{n,x_0}f(x)|
\le
\frac{M}{(n+1)!}|x-x_0|^{n+1}.
$$

Sotto le stesse ipotesi, esiste un punto $\xi_C$ strettamente interno al segmento tale che:

$$
R_n(x)
=
\frac{f^{(n+1)}(\xi_C)}{n!}
(x-\xi_C)^n(x-x_0).
$$

Se $f\in C^{n+1}$ sul segmento di estremi $x_0$ e $x$:

$$
R_n(x)
=
\frac1{n!}\int_{x_0}^{x}f^{(n+1)}(t)(x-t)^n\,dt,
$$

$$
f(x)=T_{n,x_0}f(x)+R_n(x).
$$

La forma integrale richiede integrale definito e teorema fondamentale del
calcolo. Approfondimento: [resto di Taylor](/matematica/resto-di-taylor/).
Esercizi: [resti di Taylor](/matematica/resti-di-taylor-esercizi/).

### Progetto dell'approssimazione

Se $A=T_{n,x_0}f(x)$ e $|f^{(n+1)}(t)|\le M_{n+1}$ sul segmento fra $x_0$ e
$x$, porre

$$
B_n=\dfrac{M_{n+1}}{(n+1)!}|x-x_0|^{n+1}.
$$

Allora $|f(x)-A|\le B_n$. Per una tolleranza assoluta $\varepsilon$ si cerca
il più piccolo $n$ per cui $B_n\le\varepsilon$; il fallimento di questa
maggiorazione non prova, da solo, che l'errore effettivo superi la tolleranza.
Se $B_n<|A|$:

$$
\dfrac{|f(x)-A|}{|f(x)|}
\le
\dfrac{B_n}{|A|-B_n}.
$$

L'intervallo $[A-B_n,A+B_n]$ certifica le cifre che si arrotondano nello
stesso modo in tutti i suoi punti; segno del resto e stime unilaterali possono
restringerlo. Esercizi: [approssimazione numerica con
Taylor](/matematica/approssimazione-numerica-con-taylor-esercizi/).

### Sviluppi di Maclaurin notevoli

Per $x\to0$:

$$
\displaystyle
e^x=\sum_{k=0}^{n}\frac{x^k}{k!}+o(x^n),
\qquad n\ge0.
$$

$$
\displaystyle
\ln(1+x)
=
\sum_{k=1}^{n}(-1)^{k+1}\frac{x^k}{k}+o(x^n),
\qquad n\ge1,
\quad x>-1.
$$

Per $\alpha\in\mathbb R$, $n\ge0$ e $1+x>0$:

$$
\displaystyle
(1+x)^\alpha
=
\sum_{k=0}^{n}\binom{\alpha}{k}x^k+o(x^n),
$$

$$
\displaystyle
\binom{\alpha}{0}=1,
\qquad
\binom{\alpha}{k}
=
\frac{\alpha(\alpha-1)\cdots(\alpha-k+1)}{k!}.
$$

Per ogni $n\ge0$:

$$
\displaystyle
\sin x
=
\sum_{k=0}^{n}(-1)^k\frac{x^{2k+1}}{(2k+1)!}
+o(x^{2n+1}).
$$

$$
\displaystyle
\cos x
=
\sum_{k=0}^{n}(-1)^k\frac{x^{2k}}{(2k)!}
+o(x^{2n}).
$$

$$
\displaystyle
\tan x=x+\frac{x^3}{3}+\frac{2x^5}{15}+o(x^5).
$$

$$
\displaystyle
\arctan x=x-\frac{x^3}{3}+\frac{x^5}{5}+o(x^5).
$$

$$
\displaystyle
\arcsin x=x+\frac{x^3}{6}+\frac{3x^5}{40}+o(x^5).
$$

$$
\displaystyle
\arccos x
=\frac\pi2-x-\frac{x^3}{6}-\frac{3x^5}{40}+o(x^5).
$$

$$
\displaystyle
\sinh x
=
\sum_{k=0}^{n}\frac{x^{2k+1}}{(2k+1)!}
+o(x^{2n+1}).
$$

$$
\displaystyle
\cosh x
=
\sum_{k=0}^{n}\frac{x^{2k}}{(2k)!}
+o(x^{2n}).
$$

Approfondimento: [sviluppo asintotico](/matematica/sviluppo-asintotico/).

### Sviluppi aggiuntivi di uso frequente

Altri sviluppi utili, per $x\to0$:

$$
\frac1{1-x}=\sum_{k=0}^{n}x^k+o(x^n),
\qquad
\frac1{1+x}=\sum_{k=0}^{n}(-1)^kx^k+o(x^n),
$$

$$
\ln(1-x)=-\sum_{k=1}^{n}\frac{x^k}{k}+o(x^n),
$$

$$
\sqrt{1+x}
=1+\frac x2-\frac{x^2}{8}+\frac{x^3}{16}+o(x^3),
$$

$$
\frac1{\sqrt{1+x}}
=1-\frac x2+\frac{3x^2}{8}-\frac{5x^3}{16}+o(x^3).
$$

### Serie di Taylor e analiticità

Una funzione è **analitica reale in $x_0$** se esiste $r>0$ e una serie di
potenze convergente tale che

$$
f(x)=\sum_{k=0}^{\infty}c_k(x-x_0)^k
\qquad\text{per ogni }|x-x_0|<r.
$$

In tal caso la funzione è di classe $C^\infty$ e necessariamente

$$
c_k=\frac{f^{(k)}(x_0)}{k!},
$$

perciò la serie è la serie di Taylor

$$
\displaystyle
\sum_{k=0}^{\infty}
\frac{f^{(k)}(x_0)}{k!}(x-x_0)^k.
$$

Per un punto $x$ fissato nel dominio della serie di Taylor:

$$
\displaystyle
f(x)=\sum_{k=0}^{\infty}
\frac{f^{(k)}(x_0)}{k!}(x-x_0)^k
\quad\Longleftrightarrow\quad
R_n(x)=f(x)-T_{n,x_0}f(x)\to0
\quad(n\to\infty).
$$

$$
f\in C^\infty
\not\Longrightarrow
f(x)=\sum_{k=0}^{\infty}\frac{f^{(k)}(x_0)}{k!}(x-x_0)^k.
$$

Caso $C^\infty$ non analitico in $0$:

$$
\displaystyle
f(x)=
\begin{cases}
e^{-1/x^2}, & x\ne0,\\
0, & x=0,
\end{cases}
\qquad
f^{(k)}(0)=0\quad\forall k\ge0.
$$

Approfondimento: [serie di Taylor](/matematica/serie-di-taylor/).

<a id="sezione-13"></a>
## 13. Studio di funzione e metodi numerici

### Candidati agli estremi assoluti

Se $f\in C([a,b])$ ed è derivabile salvo eventualmente in un insieme finito
$N\subset(a,b)$:

$$
\operatorname*{arg\,max}_{[a,b]} f,\quad
\operatorname*{arg\,min}_{[a,b]} f
\subseteq
\{a,b\}\cup\{x\in(a,b):f'(x)=0\}\cup N.
$$

### Asintoti

Asintoto verticale. Basta un solo laterale infinito fra quelli ammessi dal dominio:

$$
\displaystyle
x=x_0
\quad\Longleftrightarrow\quad
\lim_{x\to x_0^-}f(x)=\pm\infty
\quad\text{oppure}\quad
\lim_{x\to x_0^+}f(x)=\pm\infty.
$$

Asintoto orizzontale nella direzione $\sigma\in\{+,-\}$:

$$
\displaystyle
y=\ell
\quad\Longleftrightarrow\quad
\lim_{x\to\sigma\infty}f(x)=\ell\in\mathbb R.
$$

Asintoto obliquo nella direzione $\sigma\in\{+,-\}$:

$$
\displaystyle
y=m_\sigma x+q_\sigma,
$$

$$
\displaystyle
m_\sigma=\lim_{x\to\sigma\infty}\frac{f(x)}{x},
\qquad
q_\sigma=\lim_{x\to\sigma\infty}\bigl(f(x)-m_\sigma x\bigr),
$$

con $m_\sigma,q_\sigma\in\mathbb R$ e $m_\sigma\ne0$.

$$
\displaystyle
\lim_{x\to\sigma\infty}
\bigl[f(x)-(m_\sigma x+q_\sigma)\bigr]=0.
$$

Approfondimenti: [asintoto](/matematica/asintoto/) e [studio di
funzione](/matematica/studio-di-funzione/).

### Punti stazionari ed estremi

$$
\displaystyle
x_0\text{ stazionario}
\quad\Longleftrightarrow\quad
f'(x_0)=0.
$$

Test del segno di $f'$, assumendo $f$ continua in $x_0$ e derivabile nei due
intorni laterali puntati:

$$
\begin{aligned}
f':+\to- &\Longrightarrow x_0\text{ massimo locale},\\
f':-\to+ &\Longrightarrow x_0\text{ minimo locale},\\
f'>0\text{ sui due lati oppure }f'<0\text{ sui due lati}
&\Longrightarrow x_0\text{ non è un estremo}.
\end{aligned}
$$

Test della derivata seconda:

$$
\begin{aligned}
f'(x_0)=0,\ f''(x_0)>0
&\Longrightarrow x_0\text{ minimo locale},\\
f'(x_0)=0,\ f''(x_0)<0
&\Longrightarrow x_0\text{ massimo locale},\\
f'(x_0)=0,\ f''(x_0)=0
&\Longrightarrow \text{test inconcludente}.
\end{aligned}
$$

Test della prima derivata non nulla, nelle ipotesi di Taylor di ordine $m\ge2$:

$$
\displaystyle
f'(x_0)=\cdots=f^{(m-1)}(x_0)=0,
\qquad
f^{(m)}(x_0)\ne0.
$$

| Caso | Classificazione |
|---|---|
| $m$ pari, $f^{(m)}(x_0)>0$ | minimo locale |
| $m$ pari, $f^{(m)}(x_0)<0$ | massimo locale |
| $m$ dispari | non estremo; per $m\ge3$, flesso stazionario |

Approfondimenti: [punto critico](/matematica/punto-critico/),
[massimo](/matematica/massimo/) e [minimo](/matematica/minimo/).

### Convessità, concavità e flessi

Per $f:I\to\mathbb R$:

$$
\displaystyle
f\text{ convessa}
\quad\Longleftrightarrow\quad
f(\lambda x+(1-\lambda)y)
\le
\lambda f(x)+(1-\lambda)f(y)
$$

$$
\displaystyle
f\text{ concava}
\quad\Longleftrightarrow\quad
f(\lambda x+(1-\lambda)y)
\ge
\lambda f(x)+(1-\lambda)f(y),
$$

per ogni $x,y\in I$ e $\lambda\in[0,1]$.

Se $f$ è due volte derivabile su $I$:

$$
\begin{aligned}
f\text{ convessa su }I&\Longleftrightarrow f''\ge0\text{ su }I,\\
f\text{ concava su }I&\Longleftrightarrow f''\le0\text{ su }I.
\end{aligned}
$$

$$
\begin{aligned}
f''>0\text{ su }I&\Longrightarrow f\text{ strettamente convessa},\\
f''<0\text{ su }I&\Longrightarrow f\text{ strettamente concava}.
\end{aligned}
$$

Se $f$ è continua in $x_0$ e la concavità cambia attraversando il punto, si
ha un flesso. In particolare, quando $f''$ esiste nei due intorni laterali
puntati:

$$
\displaystyle
f''\text{ cambia segno attraversando }x_0
\quad\Longrightarrow\quad
x_0\text{ è un flesso}.
$$

$$
\displaystyle
f''(x_0)=0
\quad\not\Longrightarrow\quad
x_0\text{ è un flesso}.
$$

Approfondimenti: [convessità](/matematica/convessita/),
[concavità](/matematica/concavita/) e [flesso](/matematica/flesso/).

### Bisezione e metodo di Newton (estensione)

Nel seguito $\alpha$ è uno zero di $f$, $x_n$ l'approssimazione al passo $n$ ed
$e_n=x_n-\alpha$ l'errore vero.

Se $f\in C([a,b])$ e $f(a)f(b)<0$, il metodo di bisezione produce intervalli
annidati contenenti uno zero. Dopo $n$ bisezioni:

$$
b_n-a_n=\frac{b-a}{2^n},
\qquad
|x_n-\alpha|\le\frac{b-a}{2^{n+1}},
$$

dove $x_n=(a_n+b_n)/2$ e $\alpha$ è lo zero contenuto nell'intervallo.

Metodo di Newton:

$$
x_{n+1}=x_n-\frac{f(x_n)}{f'(x_n)},
\qquad f'(x_n)\ne0.
$$

Vicino a uno zero semplice $\alpha$, sotto le usuali ipotesi di regolarità,
la convergenza è quadraticamente locale:

$$
e_{n+1}
=
\frac{f''(\alpha)}{2f'(\alpha)}e_n^2
+o(e_n^2),
\qquad e_n=x_n-\alpha.
$$

Teoria: [metodo di bisezione](/matematica/metodo-di-bisezione/) e
[metodo di Newton](/matematica/metodo-di-newton/).

Esercizi svolti: [teorema degli zeri e bisezione](/matematica/teorema-degli-zeri-esercizi/).

<a id="sezione-14"></a>
## 14. Primitive e integrali indefiniti

### Primitive e costanti

Su un intervallo $I$:

$$
\displaystyle
F'(x)=f(x)
\quad\Longleftrightarrow\quad
\int f(x)\,dx=F(x)+C.
$$

Equivalentemente:

$$
\frac{d}{dx}\left[\int f(x)\,dx\right]=f(x),
\qquad
\int F'(x)\,dx=F(x)+C,
$$

intendendo il primo membro come una qualsiasi primitiva scelta localmente.

Se $D=\bigcup_j I_j$ è unione disgiunta di componenti intervallari:

$$
\displaystyle
G_{\mid I_j}=F_{\mid I_j}+C_j,
\qquad C_j\in\mathbb R.
$$

Linearità. Se $F'=f$ e $G'=g$, allora per ogni $\alpha,\beta\in\mathbb R$:

$$
\displaystyle
\int\bigl(\alpha f(x)+\beta g(x)\bigr)\,dx
=
\alpha F(x)+\beta G(x)+C.
$$

Teoria: [integrazione](/matematica/integrazione/) e [integrali immediati](/matematica/integrali-immediati/).

### Tabella delle primitive fondamentali

Nelle formule seguenti $a\ne0$; le costanti additive sono intese per ogni componente del dominio.

| Integranda | Primitiva | Condizioni |
|---|---|---|
| $1$ | $x+C$ | $x\in\mathbb R$ |
| $x^\alpha$ | $\dfrac{x^{\alpha+1}}{\alpha+1}+C$ | $\alpha\ne-1$; sugli intervalli reali di definizione |
| $\dfrac1x$ | $\ln\lvert x\rvert+C$ | $x\ne0$ |
| $(ax+b)^\alpha$ | $\dfrac{(ax+b)^{\alpha+1}}{a(\alpha+1)}+C$ | $\alpha\ne-1$; sugli intervalli di definizione |
| $\dfrac1{ax+b}$ | $\dfrac1a\ln\lvert ax+b\rvert+C$ | $ax+b\ne0$ |
| $e^{ax+b}$ | $\dfrac1a e^{ax+b}+C$ | $x\in\mathbb R$ |
| $q^{ax+b}$ | $\dfrac{q^{ax+b}}{a\ln q}+C$ | $q>0,\ q\ne1$ |
| $\sin(ax+b)$ | $-\dfrac1a\cos(ax+b)+C$ | $x\in\mathbb R$ |
| $\cos(ax+b)$ | $\dfrac1a\sin(ax+b)+C$ | $x\in\mathbb R$ |
| $\tan(ax+b)$ | $-\dfrac1a\ln\lvert\cos(ax+b)\rvert+C$ | $\cos(ax+b)\ne0$ |
| $\cot(ax+b)$ | $\dfrac1a\ln\lvert\sin(ax+b)\rvert+C$ | $\sin(ax+b)\ne0$ |
| $\sec(ax+b)$ | $\dfrac1a\ln\lvert\sec(ax+b)+\tan(ax+b)\rvert+C$ | $\cos(ax+b)\ne0$ |
| $\csc(ax+b)$ | $\dfrac1a\ln\lvert\csc(ax+b)-\cot(ax+b)\rvert+C$ | $\sin(ax+b)\ne0$ |
| $\sec^2(ax+b)$ | $\dfrac1a\tan(ax+b)+C$ | $\cos(ax+b)\ne0$ |
| $\csc^2(ax+b)$ | $-\dfrac1a\cot(ax+b)+C$ | $\sin(ax+b)\ne0$ |
| $\sec(ax+b)\tan(ax+b)$ | $\dfrac1a\sec(ax+b)+C$ | $\cos(ax+b)\ne0$ |
| $\csc(ax+b)\cot(ax+b)$ | $-\dfrac1a\csc(ax+b)+C$ | $\sin(ax+b)\ne0$ |
| $\sinh(ax+b)$ | $\dfrac1a\cosh(ax+b)+C$ | $x\in\mathbb R$ |
| $\cosh(ax+b)$ | $\dfrac1a\sinh(ax+b)+C$ | $x\in\mathbb R$ |
| $\tanh(ax+b)$ | $\dfrac1a\ln\cosh(ax+b)+C$ | $x\in\mathbb R$ |
| $\coth(ax+b)$ | $\dfrac1a\ln\lvert\sinh(ax+b)\rvert+C$ | $\sinh(ax+b)\ne0$ |

Per $a>0$:

| Integranda | Primitiva | Condizioni |
|---|---|---|
| $\dfrac1{a^2+x^2}$ | $\dfrac1a\arctan\dfrac xa+C$ | $x\in\mathbb R$ |
| $\dfrac1{\sqrt{a^2-x^2}}$ | $\arcsin\dfrac xa+C$ | $\lvert x\rvert<a$ |
| $\dfrac1{a^2-x^2}$ | $\dfrac1{2a}\ln\left\lvert\dfrac{a+x}{a-x}\right\rvert+C$ | $x\ne\pm a$ |
| $\dfrac1{x^2-a^2}$ | $\dfrac1{2a}\ln\left\lvert\dfrac{x-a}{x+a}\right\rvert+C$ | $x\ne\pm a$ |
| $\dfrac1{\sqrt{x^2+a^2}}$ | $\operatorname{arsinh}\dfrac xa+C=\ln\left\lvert x+\sqrt{x^2+a^2}\right\rvert+C$ | $x\in\mathbb R$ |
| $\dfrac1{\sqrt{x^2-a^2}}$ | $\ln\left\lvert x+\sqrt{x^2-a^2}\right\rvert+C$ | $\lvert x\rvert>a$ |

Teoria e tabelle estese: [integrali immediati](/matematica/integrali-immediati/).

### Primitive di funzioni composte

Schemi immediati ottenuti con la regola della catena inversa:

| Integranda | Primitiva | Condizioni |
|---|---|---|
| $u'(x)u(x)^\alpha$ | $\dfrac{u(x)^{\alpha+1}}{\alpha+1}+C$ | $\alpha\ne-1$; dominio reale della potenza |
| $\dfrac{u'(x)}{u(x)}$ | $\ln\lvert u(x)\rvert+C$ | $u(x)\ne0$ |
| $u'(x)e^{u(x)}$ | $e^{u(x)}+C$ | — |
| $u'(x)a^{u(x)}$ | $\dfrac{a^{u(x)}}{\ln a}+C$ | $a>0$, $a\ne1$ |
| $u'(x)\cos u(x)$ | $\sin u(x)+C$ | — |
| $u'(x)\sin u(x)$ | $-\cos u(x)+C$ | — |
| $\dfrac{u'(x)}{1+u(x)^2}$ | $\arctan u(x)+C$ | — |
| $\dfrac{u'(x)}{\sqrt{1-u(x)^2}}$ | $\arcsin u(x)+C$ | $\lvert u(x)\rvert<1$ |
| $-\dfrac{u'(x)}{\sqrt{1-u(x)^2}}$ | $\arccos u(x)+C$ | $\lvert u(x)\rvert<1$ |

### Sostituzione

Se $g\in C^1(I)$ e $f$ è continua su un intervallo contenente $g(I)$:

$$
\displaystyle
u=g(x),
\qquad
\int f(g(x))g'(x)\,dx
=
\int f(u)\,du.
$$

Se $g\in C^1([a,b])$ e $f$ è continua su un intervallo contenente $g([a,b])$:

$$
\displaystyle
\int_a^b f(g(x))g'(x)\,dx
=
\int_{g(a)}^{g(b)}f(u)\,du.
$$

Con $x=\varphi(t)$, $\varphi\in C^1$, se $F'=f$ allora

$$
\displaystyle
\int f(\varphi(t))\varphi'(t)\,dt
=
F(\varphi(t))+C.
$$

Se $\varphi$ è invertibile, al termine si sostituisce $t=\varphi^{-1}(x)$.

Teoria ed esempi: [integrazione per sostituzione](/matematica/integrazione-per-sostituzione/).

### Integrazione per parti

Per $u,v\in C^1(I)$:

$$
\displaystyle
\int u(x)v'(x)\,dx
=
u(x)v(x)-\int u'(x)v(x)\,dx,
$$

$$
\displaystyle
\int u\,dv=uv-\int v\,du.
$$

Forma definita:

$$
\displaystyle
\int_a^b u(x)v'(x)\,dx
=
\bigl[u(x)v(x)\bigr]_a^b
-\int_a^b u'(x)v(x)\,dx.
$$

Teoria, scelta dei fattori e casi ripetuti: [integrazione per parti](/matematica/integrazione-per-parti/).

### Funzioni razionali e fratti semplici

Per $\deg P\ge\deg Q$:

$$
\displaystyle
\frac{P(x)}{Q(x)}
=
S(x)+\frac{R(x)}{Q(x)},
\qquad
\deg R<\deg Q.
$$

Se

$$
\displaystyle
Q(x)
=
c_0\prod_i(x-a_i)^{m_i}
\prod_j(x^2+p_jx+r_j)^{n_j},
\qquad
c_0\ne0,
\qquad
p_j^2-4r_j<0,
$$

allora

$$
\displaystyle
\frac{R(x)}{Q(x)}
=
\sum_i\sum_{k=1}^{m_i}\frac{A_{ik}}{(x-a_i)^k}
+
\sum_j\sum_{k=1}^{n_j}
\frac{B_{jk}x+C_{jk}}{(x^2+p_jx+r_j)^k}.
$$

Primitive dei fattori lineari:

$$
\displaystyle
\int\frac{A}{x-a}\,dx
=
A\ln\lvert x-a\rvert+C,
$$

$$
\displaystyle
\int\frac{A}{(x-a)^k}\,dx
=
\frac{A}{1-k}(x-a)^{1-k}+C,
\qquad k\ge2.
$$

Per $Q_2(x)=x^2+px+r$, $p^2-4r<0$:

$$
\displaystyle
Bx+C
=
\frac B2(2x+p)+\left(C-\frac{Bp}{2}\right).
$$

La prima parte è proporzionale a $Q_2'(x)$ e produce un logaritmo; la parte
costante residua produce un'arcotangente dopo il completamento del quadrato.

Teoria e determinazione dei coefficienti: [fratti semplici](/matematica/fratti-semplici/).

### Primitive dei fattori quadratici irriducibili

Per evitare di usare la stessa lettera per il polinomio e per il termine noto,
poniamo

$$
Q_2(x)=x^2+px+r,
\qquad
p^2-4r<0,
\qquad
h=\sqrt{r-\frac{p^2}{4}}>0.
$$

Allora

$$
\int\frac{Bx+C}{Q_2(x)}\,dx
=
\frac B2\ln Q_2(x)
+
\frac{C-Bp/2}{h}
\arctan\left(\frac{x+p/2}{h}\right)+C_0.
$$

Qui $B,C$ sono coefficienti del numeratore, mentre $C_0$ è la costante di
integrazione.

### Integrali trigonometrici e formule di riduzione

Per $n\ge2$, formule di riduzione:

$$
\int\sin^n x\,dx
=-\frac{\sin^{n-1}x\cos x}{n}
+\frac{n-1}{n}\int\sin^{n-2}x\,dx,
$$

$$
\int\cos^n x\,dx
=\frac{\cos^{n-1}x\sin x}{n}
+\frac{n-1}{n}\int\cos^{n-2}x\,dx.
$$

Per $\int\sin^m x\cos^n x\,dx$:

- se uno degli esponenti è dispari, si conserva un fattore della funzione
  corrispondente e si usa $\sin^2x=1-\cos^2x$ oppure
  $\cos^2x=1-\sin^2x$;
- se entrambi sono pari, si usano le formule di bisezione.

### Sostituzioni trigonometriche

Sostituzione di Weierstrass:

$$
\displaystyle
t=\tan\frac x2,
\qquad
\sin x=\frac{2t}{1+t^2},
\qquad
\cos x=\frac{1-t^2}{1+t^2},
\qquad
dx=\frac{2}{1+t^2}\,dt,
$$

$$
\displaystyle
x\ne(2k+1)\pi,
\qquad k\in\mathbb Z.
$$

Per $a>0$:

| Radicale | Sostituzione | Identità risultante |
|---|---|---|
| $\sqrt{a^2-x^2}$ | $x=a\sin\theta$, $-\dfrac\pi2\le\theta\le\dfrac\pi2$ | $\sqrt{a^2-x^2}=a\cos\theta$, $dx=a\cos\theta\,d\theta$ |
| $\sqrt{a^2+x^2}$ | $x=a\tan\theta$, $-\dfrac\pi2<\theta<\dfrac\pi2$ | $\sqrt{a^2+x^2}=a\sec\theta$, $dx=a\sec^2\theta\,d\theta$ |
| $\sqrt{x^2-a^2}$, $x\ge a$ | $x=a\sec\theta$, $0\le\theta<\dfrac\pi2$ | $\sqrt{x^2-a^2}=a\tan\theta$, $dx=a\sec\theta\tan\theta\,d\theta$ |
| $\sqrt{x^2-a^2}$, $x\le-a$ | $x=-a\sec\theta$, $0\le\theta<\dfrac\pi2$ | $\sqrt{x^2-a^2}=a\tan\theta$, $dx=-a\sec\theta\tan\theta\,d\theta$ |

Teoria e casi operativi: [sostituzioni di Weierstrass](/matematica/sostituzioni-di-weierstrass/) e [integrali trigonometrici](/matematica/integrali-trigonometrici/).

<a id="sezione-15"></a>
## 15. Integrale di Riemann e integrali definiti

L'integrale definito $\int_a^b f(x)\,dx$ è un numero, non una famiglia di
primitive, e quindi non contiene la costante $C$. Il segno dipende
dall'orientazione degli estremi; l'interpretazione come area geometrica richiede
invece valori non negativi o l'uso del valore assoluto.

### Integrale di Riemann

Sia $f:[a,b]\to\mathbb R$ limitata.

Partizione marcata:

$$
\displaystyle
P:\ a=x_0<x_1<\cdots<x_n=b,
\qquad
\xi_i\in[x_{i-1},x_i],
$$

$$
\displaystyle
\lVert P\rVert=\max_{1\le i\le n}(x_i-x_{i-1}),
\qquad
S(f;P,\xi)
=
\sum_{i=1}^{n}f(\xi_i)(x_i-x_{i-1}).
$$

Integrabilità secondo Riemann:

$$
\displaystyle
\exists I\in\mathbb R\ \forall\varepsilon>0\ \exists\delta>0\quad
\forall(P,\xi):
\quad
\lVert P\rVert<\delta
\Longrightarrow
\lvert S(f;P,\xi)-I\rvert<\varepsilon,
$$

$$
\displaystyle
I=\int_a^b f(x)\,dx.
$$

Somme di Darboux:

$$
\displaystyle
m_i=\inf_{[x_{i-1},x_i]}f,
\qquad
M_i=\sup_{[x_{i-1},x_i]}f,
$$

$$
\displaystyle
L(f,P)=\sum_i m_i(x_i-x_{i-1}),
\qquad
U(f,P)=\sum_i M_i(x_i-x_{i-1}),
$$

$$
\displaystyle
f\in\mathcal R([a,b])
\quad\Longleftrightarrow\quad
\forall\varepsilon>0\ \exists P:
\ U(f,P)-L(f,P)<\varepsilon.
$$

Classi sufficienti:

$$
\displaystyle
f\in C([a,b])
\quad\Longrightarrow\quad
f\in\mathcal R([a,b]),
$$

$$
\displaystyle
f\ \text{monotona su }[a,b]
\quad\Longrightarrow\quad
f\in\mathcal R([a,b]),
$$

$$
\displaystyle
f\ \text{limitata con un numero finito di discontinuità}
\quad\Longrightarrow\quad
f\in\mathcal R([a,b]).
$$

Teoria: [integrale di Riemann](/matematica/integrale-di-riemann/) e [criteri di integrabilità](/matematica/criteri-di-integrabilita/).

### Proprietà dell’integrale definito

Nelle formule seguenti $f$ e $g$ sono Riemann-integrabili su un intervallo
che contiene tutti gli estremi utilizzati. Con la convenzione degli integrali
orientati, per $a,b,c\in\mathbb R$:

$$
\displaystyle
\int_a^a f=0,
\qquad
\int_b^a f=-\int_a^b f,
\qquad
\int_a^b f+\int_b^c f=\int_a^c f.
$$

La linearità vale per ogni orientazione:

$$
\displaystyle
\int_a^b(\alpha f+\beta g)
=
\alpha\int_a^b f+\beta\int_a^b g.
$$

Le proprietà d'ordine seguenti richiedono $a\le b$:

$$
\displaystyle
f\le g\text{ su }[a,b]
\quad\Longrightarrow\quad
\int_a^b f\le\int_a^b g.
$$

Se $m\le f(x)\le M$ su $[a,b]$:

$$
m(b-a)
\le
\int_a^b f(x)\,dx
\le
M(b-a).
$$

$$
\displaystyle
\left\lvert\int_a^b f(x)\,dx\right\rvert
\le
\int_a^b\lvert f(x)\rvert\,dx
\le
(b-a)\lVert f\rVert_{\infty,[a,b]}.
$$

Teoria: [integrale definito](/matematica/integrale-definito/) e [linearità dell’integrale](/matematica/linearita-dell-integrale/).

### Simmetrie, periodicità e disuguaglianze

Se $f$ è integrabile su $[-a,a]$:

$$
f\text{ pari}
\Longrightarrow
\int_{-a}^{a}f(x)\,dx=2\int_0^a f(x)\,dx,
$$

$$
f\text{ dispari}
\Longrightarrow
\int_{-a}^{a}f(x)\,dx=0.
$$

Se $f$ è periodica di periodo $T>0$ e integrabile su ogni intervallo compatto:

$$
\int_{\alpha}^{\alpha+T}f(x)\,dx
=
\int_0^T f(x)\,dx,
$$

$$
\int_{\alpha}^{\alpha+nT}f(x)\,dx
=n\int_0^T f(x)\,dx,
\qquad n\in\mathbb Z.
$$

Per funzioni reali $f,g$ continue su $[a,b]$ (più in generale,
quadrato-integrabili), vale la disuguaglianza integrale di Cauchy–Schwarz:

$$
\left|\int_a^b f(x)g(x)\,dx\right|^2
\le
\left(\int_a^b |f(x)|^2\,dx\right)
\left(\int_a^b |g(x)|^2\,dx\right).
$$

### Teorema fondamentale del calcolo

Se $f\in\mathcal R([a,b])$ e

$$
\displaystyle
F(x)=\int_a^x f(t)\,dt,
$$

allora

$$
\displaystyle
\lvert F(y)-F(x)\rvert
\le
\lVert f\rVert_{\infty,[a,b]}\lvert y-x\rvert.
$$

Se $f$ è continua in $x\in(a,b)$:

$$
\displaystyle
F'(x)=f(x).
$$

Se $f\in C([a,b])$:

$$
\displaystyle
F'_+(a)=f(a),
\qquad
F'_-(b)=f(b).
$$

Formula di Newton–Leibniz: se $f\in\mathcal R([a,b])$ e $F$ è una sua
primitiva su $[a,b]$ (derivabile in $(a,b)$ e continua agli estremi), allora

$$
\displaystyle
\int_a^b f(x)\,dx
=
F(b)-F(a)
=
\bigl[F(x)\bigr]_a^b.
$$

Teoria: [teorema fondamentale del calcolo](/matematica/teorema-fondamentale-calcolo/) e [funzione integrale](/matematica/funzione-integrale/).

### Integrali dipendenti da un parametro

Per un intervallo aperto $I$ e $f\in C([a,b]\times I)$:

$$
F(t)=\int_a^b f(x,t)\,dx
\quad\Longrightarrow\quad
F\in C(I).
$$

Se inoltre $\partial_t f\in C([a,b]\times I)$:

$$
F\in C^1(I),
\qquad
F'(t)=\int_a^b\partial_t f(x,t)\,dx.
$$

Per $\alpha,\beta\in C^1(I)$ e $f,\partial_t f$ continue su un intorno della
striscia compresa tra $\alpha(t)$ e $\beta(t)$:

$$
\begin{aligned}
G(t)&=\int_{\alpha(t)}^{\beta(t)}f(x,t)\,dx,\\
G'(t)
=\;&f(\beta(t),t)\beta'(t)
-f(\alpha(t),t)\alpha'(t)\\
&+\int_{\alpha(t)}^{\beta(t)}
\partial_t f(x,t)\,dx.
\end{aligned}
$$

Casi particolari:

$$
\alpha,\beta\ \text{costanti}
\quad\Longrightarrow\quad
G'(t)=\int_\alpha^\beta\partial_t f(x,t)\,dx,
$$

$$
\partial_t f=0
\quad\Longrightarrow\quad
G'(t)=f(\beta(t),t)\beta'(t)-f(\alpha(t),t)\alpha'(t),
$$

$$
\alpha=\beta
\quad\Longrightarrow\quad
G=G'=0.
$$

Esercizi svolti: [integrali dipendenti da un parametro](/matematica/integrali-dipendenti-parametro-esercizi/).

### Valore medio integrale

Per $a<b$:

$$
\displaystyle
f_{\mathrm{medio}}
=
\frac1{b-a}\int_a^b f(x)\,dx,
\qquad
\int_a^b f(x)\,dx=(b-a)f_{\mathrm{medio}}.
$$

Se $f\in C([a,b])$:

$$
\displaystyle
\exists c\in[a,b]:
\qquad
\int_a^b f(x)\,dx=f(c)(b-a).
$$

Versione pesata, con $f\in C([a,b])$, $g\in\mathcal R([a,b])$, $g\ge0$ e $\int_a^b g>0$:

$$
\displaystyle
\exists c\in[a,b]:
\qquad
\int_a^b f(x)g(x)\,dx
=
f(c)\int_a^b g(x)\,dx.
$$

Teoria: [teorema della media integrale](/matematica/teorema-della-media-integrale/).

### Formule geometriche

Per funzioni continue e intervalli sui quali le condizioni indicate sono soddisfatte:

| Grandezza | Formula | Condizioni |
|---|---|---|
| Area orientata | $A_{\mathrm{or}}=\displaystyle\int_a^b f(x)\,dx$ | — |
| Area tra grafico e asse | $A=\displaystyle\int_a^b\lvert f(x)\rvert\,dx$ | — |
| Area tra curve | $A=\displaystyle\int_a^b\lvert f(x)-g(x)\rvert\,dx$ | — |
| Dischi attorno all’asse $x$ | $V=\pi\displaystyle\int_a^b R(x)^2\,dx$ | $R\ge0$ |
| Corone attorno all’asse $x$ | $V=\pi\displaystyle\int_a^b\bigl(R(x)^2-r(x)^2\bigr)\,dx$ | $R\ge r\ge0$ |
| Gusci attorno all’asse $y$ | $V=2\pi\displaystyle\int_a^b x\,h(x)\,dx$ | $x\ge0,\ h\ge0$ |
| Lunghezza del grafico | $L=\displaystyle\int_a^b\sqrt{1+\bigl(f'(x)\bigr)^2}\,dx$ | $f\in C^1([a,b])$ |
| Superficie attorno all’asse $x$ | $S=2\pi\displaystyle\int_a^b f(x)\sqrt{1+\bigl(f'(x)\bigr)^2}\,dx$ | $f\in C^1,\ f\ge0$ |

Teoria generale: [integrale definito](/matematica/integrale-definito/).

<a id="sezione-16"></a>
## 16. Integrali impropri

Un integrale improprio **converge** soltanto quando tutti i limiti che lo
definiscono esistono come numeri reali finiti. Un limite uguale a $+\infty$ o
$-\infty$, oppure inesistente, determina la divergenza dell'integrale
improprio ordinario.

### Definizioni e valore principale di Cauchy

Si assume $f\in\mathcal R_{\mathrm{loc}}$ fuori dai punti singolari, cioè
Riemann-integrabile su ogni intervallo compatto che non contiene singolarità.

Estremi infiniti:

$$
\displaystyle
\int_a^{+\infty}f(x)\,dx
=
\lim_{R\to+\infty}\int_a^R f(x)\,dx,
$$

$$
\displaystyle
\int_{-\infty}^{b}f(x)\,dx
=
\lim_{R\to-\infty}\int_R^b f(x)\,dx.
$$

Intera retta. Per un qualunque $c\in\mathbb R$, la somma seguente è la
definizione dell'integrale soltanto quando entrambi i termini convergono:

$$
\displaystyle
\int_{-\infty}^{+\infty}f(x)\,dx
=
\int_{-\infty}^{c}f(x)\,dx
+
\int_c^{+\infty}f(x)\,dx.
$$

$$
\displaystyle
\int_{-\infty}^{+\infty}f\ \text{converge}
\quad\Longleftrightarrow\quad
\int_{-\infty}^{c}f\ \text{e}\ \int_c^{+\infty}f\ \text{convergono}.
$$

Singolarità agli estremi:

$$
\displaystyle
\int_a^b f(x)\,dx
=
\lim_{\varepsilon\to0^+}
\int_{a+\varepsilon}^{b}f(x)\,dx,
$$

$$
\displaystyle
\int_a^b f(x)\,dx
=
\lim_{\varepsilon\to0^+}
\int_a^{b-\varepsilon}f(x)\,dx.
$$

Se entrambi gli estremi sono singolari, si sceglie un punto
$c\in(a,b)$ e si definisce

$$
\int_a^b f
=
\int_a^c f+\int_c^b f,
$$

richiedendo separatamente la convergenza finita dei due integrali.

Singolarità interna $c\in(a,b)$:

$$
\displaystyle
\int_a^b f
=
\lim_{t\to c^-}\int_a^t f(x)\,dx
+
\lim_{t\to c^+}\int_t^b f(x)\,dx,
$$

$$
\displaystyle
\int_a^b f\ \text{converge}
\quad\Longleftrightarrow\quad
\text{entrambi i limiti sono finiti}.
$$

Valore principale di Cauchy per una singolarità interna $c\in(a,b)$:

$$
\displaystyle
\operatorname{PV}\int_a^b f(x)\,dx
=
\lim_{\varepsilon\to0^+}
\left[
\int_a^{c-\varepsilon}f(x)\,dx
+
\int_{c+\varepsilon}^{b}f(x)\,dx
\right].
$$

Le due parti possono divergere separatamente e cancellarsi nel limite
simmetrico; per questo l'esistenza del valore principale non implica la
convergenza dell'integrale improprio ordinario.

Nel caso simmetrico rispetto all'origine, con $a>0$:

$$
\displaystyle
\operatorname{PV}\int_{-a}^{a}f(x)\,dx
=
\lim_{\varepsilon\to0^+}
\left(
\int_{-a}^{-\varepsilon}f(x)\,dx
+
\int_{\varepsilon}^{a}f(x)\,dx
\right),
$$

$$
\displaystyle
\operatorname{PV}\int_{-\infty}^{+\infty}f(x)\,dx
=
\lim_{R\to+\infty}\int_{-R}^{R}f(x)\,dx.
$$

Caso particolare:

$$
\displaystyle
\operatorname{PV}\int_{-1}^{1}\frac{dx}{x}=0,
\qquad
\int_{-1}^{1}\frac{dx}{x}\ \text{diverge}.
$$

Teoria e casi multipli: [integrali impropri](/matematica/integrali-impropri/).

### Integrali impropri campione

$$
\displaystyle
\int_1^{+\infty}\frac{dx}{x^p}
=
\begin{cases}
\dfrac1{p-1}, & p>1,\\[4pt]
\text{diverge}, & p\le1,
\end{cases}
$$

$$
\displaystyle
\int_0^1\frac{dx}{x^p}
=
\begin{cases}
\dfrac1{1-p}, & p<1,\\[4pt]
\text{diverge}, & p\ge1.
\end{cases}
$$

Secondo campione fondamentale:

$$
\int_e^{+\infty}\frac{dx}{x(\ln x)^q}
=
\frac1{q-1},
\qquad q>1,
$$

$$
\int_e^{+\infty}\frac{dx}{x(\ln x)^q}\text{ diverge}
\Longleftrightarrow q\le1.
$$

Regole asintotiche pratiche per integrande positive, con $A$ sufficientemente grande e $\delta>0$ sufficientemente piccolo:

$$
f(x)\sim\frac{C}{x^p}\quad(x\to+\infty),\ C>0
\Longrightarrow
\int_A^{+\infty} f(x)\,dx\text{ converge}\Longleftrightarrow p>1,
$$

$$
f(x)\sim\frac{C}{(x-a)^p}\quad(x\to a^+),\ C>0
\Longrightarrow
\int_a^{a+\delta} f(x)\,dx\text{ converge}\Longleftrightarrow p<1.
$$

### Criteri di convergenza

Criterio di Cauchy su $[a,+\infty)$:

$$
\displaystyle
\int_a^{+\infty}f\ \text{converge}
\quad\Longleftrightarrow\quad
\forall\varepsilon>0\ \exists R>a\ \forall A,B:
\ B>A>R
\Longrightarrow
\left\lvert\int_A^B f(x)\,dx\right\rvert<\varepsilon.
$$

Confronto, per $0\le f\le g$ definitivamente:

$$
\displaystyle
\int g\ \text{converge}
\Longrightarrow
\int f\ \text{converge},
$$

$$
\displaystyle
\int f\ \text{diverge}
\Longrightarrow
\int g\ \text{diverge}.
$$

Confronto asintotico, per $f,g>0$ definitivamente:

$$
\displaystyle
\lim\frac{f}{g}=\ell,\quad 0<\ell<+\infty
\quad\Longrightarrow\quad
\int f\ \text{e}\ \int g\ \text{hanno lo stesso carattere}.
$$

Casi unilaterali:

$$
\displaystyle
\frac fg\to0,\quad \int g\ \text{converge}
\quad\Longrightarrow\quad
\int f\ \text{converge},
$$

$$
\displaystyle
\frac fg\to+\infty,\quad \int g\ \text{diverge}
\quad\Longrightarrow\quad
\int f\ \text{diverge}.
$$

Convergenza assoluta:

$$
\displaystyle
\int\lvert f\rvert<+\infty
\quad\Longrightarrow\quad
\int f\ \text{converge},
\qquad
\left\lvert\int f\right\rvert\le\int\lvert f\rvert.
$$

Dirichlet, su $[a,+\infty)$:

$$
\displaystyle
F(R)=\int_a^R f(x)\,dx,\quad
\sup_{R\ge a}\lvert F(R)\rvert<+\infty,\quad
g\ \text{monotona},\quad g(x)\to0
$$

$$
\displaystyle
\Longrightarrow
\int_a^{+\infty}f(x)g(x)\,dx\ \text{converge}.
$$

Abel, su $[a,+\infty)$:

$$
\displaystyle
\int_a^{+\infty}f(x)\,dx\ \text{converge},\quad
g\ \text{monotona e limitata}
$$

$$
\displaystyle
\Longrightarrow
\int_a^{+\infty}f(x)g(x)\,dx\ \text{converge}.
$$

Teoria: [criteri di integrabilità](/matematica/criteri-di-integrabilita/), [integrali impropri](/matematica/integrali-impropri/) e [criteri di Abel e Dirichlet](/matematica/criteri-di-abel-e-dirichlet/).

<a id="sezione-17"></a>
## 17. Serie numeriche

$$
\sum a_n\text{ e }\sum b_n\text{ hanno lo stesso carattere}
\Longleftrightarrow
\bigl(\text{entrambe convergenti}\bigr)
\lor
\bigl(\text{entrambe divergenti}\bigr).
$$

### Definizioni e proprietà

Per $a_n\in\mathbb K$, con $\mathbb K\in\{\mathbb R,\mathbb C\}$:

$$
\displaystyle
\sum_{n=n_0}^{\infty}a_n,
\qquad
s_N=\sum_{n=n_0}^{N}a_n,
$$

$$
\displaystyle
\sum_{n=n_0}^{\infty}a_n=A
\quad\Longleftrightarrow\quad
s_N\to A.
$$

Se la serie converge a $A$, il **resto dopo il termine di indice $N$** è

$$
R_N=A-s_N=\sum_{n=N+1}^{\infty}a_n,
\qquad
R_N\to0.
$$

Invarianza rispetto a un numero finito di termini, per $N_0\ge n_0$:

$$
\displaystyle
\sum_{n=n_0}^{\infty}a_n
\ \text{e}\
\sum_{n=N_0}^{\infty}a_n
\quad
\text{hanno lo stesso carattere},
\qquad N_0\ge n_0.
$$

Linearità:

$$
\displaystyle
\sum a_n=A,\quad \sum b_n=B
\quad\Longrightarrow\quad
\sum(\alpha a_n+\beta b_n)=\alpha A+\beta B.
$$

Per $a_n\ge0$ definitivamente:

$$
\displaystyle
\sum a_n\ \text{converge}
\quad\Longleftrightarrow\quad
(s_N)\ \text{è limitata superiormente},
$$

$$
\displaystyle
(s_N)\ \text{non limitata}
\quad\Longrightarrow\quad
s_N\to+\infty.
$$

Teoria: [serie numerica](/matematica/serie-numerica/).

### Condizione necessaria e criterio di Cauchy

$$
\displaystyle
\sum a_n\ \text{converge}
\quad\Longrightarrow\quad
a_n\to0.
$$

$$
\displaystyle
a_n\not\to0
\quad\Longrightarrow\quad
\sum a_n\ \text{diverge}.
$$

Il converso della condizione necessaria è falso:

$$
\frac1n\to0,
\qquad
\sum_{n=1}^{\infty}\frac1n\text{ diverge}.
$$

$$
\displaystyle
\sum a_n\ \text{converge}
\quad\Longleftrightarrow\quad
\forall\varepsilon>0\ \exists N\ \forall p,q:
\ q\ge p\ge N
\Longrightarrow
\left\lvert\sum_{n=p}^{q}a_n\right\rvert<\varepsilon.
$$

Teoria: [condizione necessaria di convergenza](/matematica/condizione-necessaria-convergenza/) e [criterio di Cauchy](/matematica/criterio-di-cauchy/).

### Serie notevoli

Serie geometrica, $q\ne1$:

$$
\displaystyle
\sum_{n=0}^{N}q^n
=
\frac{1-q^{N+1}}{1-q}.
$$

Per $q=1$:

$$
\displaystyle
\sum_{n=0}^{N}1=N+1.
$$

$$
\displaystyle
\sum_{n=0}^{\infty}q^n
=
\begin{cases}
\dfrac1{1-q}, & \lvert q\rvert<1,\\[4pt]
\text{diverge}, & \lvert q\rvert\ge1.
\end{cases}
$$

Per $\lvert q\rvert<1$:

$$
\displaystyle
R_N=\sum_{n=N+1}^{\infty}q^n
=
\frac{q^{N+1}}{1-q},
$$

$$
|R_N|=\frac{|q|^{N+1}}{|1-q|}.
$$

Per garantire $|R_N|\le\varepsilon$ si sceglie $N$ tale che

$$
|q|^{N+1}\le\varepsilon|1-q|.
$$

Serie armonica e $p$-serie:

$$
\displaystyle
\sum_{n=1}^{\infty}\frac1n
\quad\text{diverge},
$$

$$
\displaystyle
\sum_{n=1}^{\infty}\frac1{n^p}\text{ converge}
\Longleftrightarrow p>1,
$$

$$
\displaystyle
\sum_{n=1}^{\infty}\frac1{n^p}\text{ diverge}
\Longleftrightarrow p\le1.
$$

Serie logaritmica, per $p,q\in\mathbb R$; il carattere è dato da:

$$
\displaystyle
\sum_{n=2}^{\infty}\frac1{n^p(\ln n)^q}\text{ converge}
\Longleftrightarrow
p>1\ \lor\ (p=1\ \land\ q>1),
$$

$$
\displaystyle
\sum_{n=2}^{\infty}\frac1{n^p(\ln n)^q}\text{ diverge}
\Longleftrightarrow
p<1\ \lor\ (p=1\ \land\ q\le1).
$$

Serie telescopica:

$$
\displaystyle
\sum_{n=1}^{N}(b_n-b_{n+1})
=
b_1-b_{N+1},
$$

$$
\displaystyle
\sum_{n=1}^{\infty}(b_n-b_{n+1})
\ \text{converge}
\quad\Longleftrightarrow\quad
b_n\to L\in\mathbb K,
$$

$$
\displaystyle
\sum_{n=1}^{\infty}(b_n-b_{n+1})
=
b_1-L.
$$

Serie armonica alternata:

$$
\displaystyle
\sum_{n=1}^{\infty}\frac{(-1)^{n-1}}n=\ln2.
$$

Serie di Mengoli:

$$
\frac1{n(n+1)}=\frac1n-\frac1{n+1},
$$

$$
\sum_{n=1}^{N}\frac1{n(n+1)}=1-\frac1{N+1},
\qquad
\sum_{n=1}^{\infty}\frac1{n(n+1)}=1.
$$

Per $|q|<1$:

$$
\sum_{n=1}^{\infty}nq^{n-1}=\frac1{(1-q)^2},
\qquad
\sum_{n=1}^{\infty}nq^n=\frac{q}{(1-q)^2}.
$$

Teoria e casi: [serie notevoli](/matematica/serie-notevoli/) e [serie geometrica](/matematica/serie-geometrica/).

### Confronto e confronto asintotico

Se $0\le a_n\le b_n$ definitivamente:

$$
\displaystyle
\sum b_n\ \text{converge}
\Longrightarrow
\sum a_n\ \text{converge},
$$

$$
\displaystyle
\sum a_n\ \text{diverge}
\Longrightarrow
\sum b_n\ \text{diverge}.
$$

Se entrambe convergono:

$$
\displaystyle
0\le
R_N^{(a)}
=
\sum_{n=N+1}^{\infty}a_n
\le
\sum_{n=N+1}^{\infty}b_n
=
R_N^{(b)}.
$$

La stima vale per ogni $N$ successivo alla soglia del confronto.

Se $a_n\ge0$, $b_n>0$ definitivamente:

$$
\displaystyle
\frac{a_n}{b_n}\to\ell,
\qquad
0<\ell<+\infty
\quad\Longrightarrow\quad
\sum a_n\ \text{e}\ \sum b_n\ \text{hanno lo stesso carattere}.
$$

Casi unilaterali:

$$
\displaystyle
\frac{a_n}{b_n}\to0,\quad
\sum b_n\ \text{converge}
\quad\Longrightarrow\quad
\sum a_n\ \text{converge},
$$

$$
\displaystyle
\frac{a_n}{b_n}\to+\infty,\quad
\sum b_n\ \text{diverge}
\quad\Longrightarrow\quad
\sum a_n\ \text{diverge}.
$$

### Criteri del rapporto, della radice e di Raabe

Se $a_n\ne0$ definitivamente ed esiste, finito o esteso,

$$
\displaystyle
L=\lim_{n\to\infty}\left\lvert\frac{a_{n+1}}{a_n}\right\rvert,
$$

allora

$$
\displaystyle
\begin{cases}
L<1 &\Longrightarrow \text{convergenza assoluta},\\
L>1 &\Longrightarrow \text{divergenza},\\
L=1 &\Longrightarrow \text{criterio inconcludente}.
\end{cases}
$$

Criterio della radice, valido senza richiedere l'esistenza di un limite
ordinario:

$$
\displaystyle
\rho=\limsup_{n\to\infty}\sqrt[n]{\lvert a_n\rvert},
$$

$$
\displaystyle
\begin{cases}
\rho<1 &\Longrightarrow \text{convergenza assoluta},\\
\rho>1 &\Longrightarrow \text{divergenza},\\
\rho=1 &\Longrightarrow \text{criterio inconcludente}.
\end{cases}
$$

Criterio di Raabe, per $a_n>0$ definitivamente:

$$
\displaystyle
L=\lim_{n\to\infty}
n\left(\frac{a_n}{a_{n+1}}-1\right),
$$

$$
\displaystyle
\begin{cases}
L>1 &\Longrightarrow \sum a_n\ \text{converge},\\
L<1 &\Longrightarrow \sum a_n\ \text{diverge},\\
L=1 &\Longrightarrow \text{criterio inconcludente}.
\end{cases}
$$

Teoria generale: [criteri di convergenza per serie](/matematica/criteri-convergenza-serie/).

### Criterio integrale e condensazione

Se $f:[N_0,+\infty)\to(0,+\infty)$ è continua e decrescente e $a_n=f(n)$:

$$
\displaystyle
\sum_{n=N_0}^{\infty}a_n
\ \text{e}\
\int_{N_0}^{+\infty}f(x)\,dx
\quad
\text{hanno lo stesso carattere}.
$$

Se la serie converge, per $N\ge N_0$:

$$
\displaystyle
\int_{N+1}^{+\infty}f(x)\,dx
\le
R_N
=
\sum_{n=N+1}^{\infty}a_n
\le
\int_N^{+\infty}f(x)\,dx.
$$

Condensazione di Cauchy, per $a_n\ge0$ decrescente:

$$
\displaystyle
\sum_{n=1}^{\infty}a_n
\ \text{e}\
\sum_{k=0}^{\infty}2^k a_{2^k}
\quad
\text{hanno lo stesso carattere}.
$$

Teoria: [criterio dell’integrale](/matematica/criterio-dell-integrale/) e [condensazione di Cauchy](/matematica/criterio-di-condensazione-di-cauchy/).

### Serie alternate

Se $a_n\ge0$, $a_{n+1}\le a_n$ definitivamente e $a_n\to0$:

$$
\displaystyle
\sum_{n=0}^{\infty}(-1)^n a_n
\quad\text{converge}.
$$

Stima del resto, oltre la soglia di monotonia:

$$
\displaystyle
R_N
=
\sum_{n=N+1}^{\infty}(-1)^n a_n,
\qquad
\lvert R_N\rvert\le a_{N+1}.
$$

Il resto ha inoltre il segno del primo termine omesso, salvo che sia nullo. Per
ottenere un errore non superiore a $\varepsilon$ è sufficiente imporre
$a_{N+1}\le\varepsilon$.

Teoria: [criterio di Leibniz](/matematica/criterio-di-leibniz/).

### Sommazione per parti, Dirichlet e Abel

Posto

$$
\displaystyle
A_n=\sum_{k=0}^{n}a_k,
\qquad
A_{-1}=0,
$$

$$
\displaystyle
\sum_{n=p}^{q}a_nb_n
=
A_qb_q-A_{p-1}b_p
+
\sum_{n=p}^{q-1}A_n(b_n-b_{n+1}).
$$

Dirichlet:

$$
\displaystyle
\sup_n\left\lvert\sum_{k=0}^{n}a_k\right\rvert<+\infty,
\qquad
b_n\ \text{monotona},
\qquad
b_n\to0
$$

$$
\displaystyle
\Longrightarrow
\sum a_nb_n\ \text{converge}.
$$

Abel:

$$
\displaystyle
\sum a_n\ \text{converge},
\qquad
b_n\ \text{monotona e limitata}
$$

$$
\displaystyle
\Longrightarrow
\sum a_nb_n\ \text{converge}.
$$

Teoria: [criteri di Abel e Dirichlet](/matematica/criteri-di-abel-e-dirichlet/).

### Prodotto di Cauchy

$$
\displaystyle
c_n=\sum_{k=0}^{n}a_kb_{n-k}.
$$

Se

$$
\displaystyle
\sum a_n=A,
\qquad
\sum b_n=B,
$$

e almeno una delle due serie converge assolutamente:

$$
\displaystyle
\sum_{n=0}^{\infty}c_n=AB.
$$

Se entrambe convergono assolutamente:

$$
\displaystyle
\sum_{n=0}^{\infty}\lvert c_n\rvert<+\infty.
$$

### Convergenza assoluta e condizionata

$$
\displaystyle
\sum\lvert a_n\rvert<+\infty
\quad\Longrightarrow\quad
\sum a_n\ \text{converge}.
$$

Per $q\ge p$:

$$
\displaystyle
\left\lvert\sum_{n=p}^{q}a_n\right\rvert
\le
\sum_{n=p}^{q}\lvert a_n\rvert.
$$

Per serie reali:

$$
\displaystyle
a_n^+=\frac{\lvert a_n\rvert+a_n}{2},
\qquad
a_n^-=\frac{\lvert a_n\rvert-a_n}{2},
\qquad
a_n=a_n^+-a_n^-.
$$

Convergenza condizionata:

$$
\displaystyle
\sum a_n\ \text{converge},
\qquad
\sum\lvert a_n\rvert\ \text{diverge}.
$$

Una serie assolutamente convergente può essere riordinata arbitrariamente
senza cambiare la somma. Per una serie reale condizionatamente convergente, un
riordinamento può invece cambiare la somma oppure distruggere la convergenza.

Teoria: [convergenza assoluta e condizionata](/matematica/convergenza-assoluta/).

<a id="sezione-18"></a>
## 18. Successioni, serie di funzioni e serie di potenze

Si assume $\varnothing\ne E\subseteq\mathbb R$ e funzioni a valori in
$\mathbb K\in\{\mathbb R,\mathbb C\}$.

Teoria ed esercizi: [scambio fra limite, integrale e derivata](/matematica/scambio-limite-integrale-derivata-esercizi/).

### Convergenza puntuale e uniforme

La differenza è nell'ordine dei quantificatori: nella convergenza puntuale la
soglia $N$ può dipendere da $x$; in quella uniforme una sola soglia deve
funzionare contemporaneamente per ogni $x\in E$.

Convergenza puntuale:

$$
\displaystyle
f_n\xrightarrow[]{p}f\ \text{su }E
\quad\Longleftrightarrow\quad
\forall x\in E\ \forall\varepsilon>0\ \exists N=N(x,\varepsilon):
\ n\ge N
\Longrightarrow
\lvert f_n(x)-f(x)\rvert<\varepsilon.
$$

Per una funzione $g:E\to\mathbb K$ poniamo, con valore eventualmente infinito,

$$
\displaystyle
\lVert g\rVert_{\infty,E}
=
\sup_{x\in E}\lvert g(x)\rvert\in[0,+\infty].
$$

Sullo spazio delle funzioni limitate questo valore è finito ed è la norma uniforme.

Convergenza uniforme:

$$
\displaystyle
f_n\xrightarrow[]{u}f\ \text{su }E
\quad\Longleftrightarrow\quad
\lVert f_n-f\rVert_{\infty,E}\to0,
$$

$$
\displaystyle
\forall\varepsilon>0\ \exists N=N(\varepsilon):
\ n\ge N
\Longrightarrow
\lvert f_n(x)-f(x)\rvert<\varepsilon
\quad\forall x\in E.
$$

$$
\displaystyle
f_n\xrightarrow[]{u}f
\quad\Longrightarrow\quad
f_n\xrightarrow[]{p}f.
$$

Negazione dell’uniformità:

$$
\displaystyle
f_n\not\xrightarrow[]{u}f
\quad\Longleftrightarrow\quad
\exists\varepsilon_0>0\ \forall N\ \exists n\ge N\ \exists x_n\in E:
\ \lvert f_n(x_n)-f(x_n)\rvert\ge\varepsilon_0.
$$

Criterio uniforme di Cauchy:

$$
\displaystyle
f_n\ \text{converge uniformemente su }E
$$

$$
\displaystyle
\Longleftrightarrow
\forall\varepsilon>0\ \exists N\ \forall m,n:
\ m,n\ge N
\Longrightarrow
\sup_{x\in E}\lvert f_n(x)-f_m(x)\rvert<\varepsilon.
$$

Se $K\ne\varnothing$ è compatto, lo spazio $C(K)$ con la norma uniforme è completo:

$$
(f_n)\text{ di Cauchy in }\lVert\cdot\rVert_{\infty,K}
\Longrightarrow
\exists f\in C(K):\ \lVert f_n-f\rVert_{\infty,K}\to0.
$$

Teoria: [convergenza uniforme](/matematica/convergenza-uniforme/).

### Teoremi di scambio

Continuità:

$$
\displaystyle
f_n\in C(E),\quad
f_n\xrightarrow[]{u}f
\quad\Longrightarrow\quad
f\in C(E).
$$

Scambio dei limiti, con $x_0$ punto di accumulazione di $E$ e con ogni
$\ell_n$ esistente e finito:

$$
\displaystyle
f_n\xrightarrow[]{u}f,\qquad
\ell_n=\lim_{\substack{x\to x_0\\x\in E}}f_n(x)
$$

$$
\displaystyle
\Longrightarrow
\ell_n\text{ converge},
\qquad
\lim_{\substack{x\to x_0\\x\in E}}f(x)
=
\lim_{n\to\infty}\ell_n.
$$

Teorema di Dini, nel caso reale:

$$
\displaystyle
E\ \text{compatto},\quad
f_n,f\in C(E),\quad
f_n\xrightarrow[]{p}f,
$$

$$
\displaystyle
f_n\le f_{n+1}\ \ \forall n
\quad\text{oppure}\quad
f_n\ge f_{n+1}\ \ \forall n
$$

$$
\displaystyle
\Longrightarrow
f_n\xrightarrow[]{u}f.
$$

Scambio con l’integrale:

$$
\displaystyle
f_n\in\mathcal R([a,b]),\quad
f_n\xrightarrow[]{u}f
$$

$$
\displaystyle
\Longrightarrow
f\in\mathcal R([a,b]),
\qquad
\lim_{n\to\infty}\int_a^b f_n(x)\,dx
=
\int_a^b f(x)\,dx.
$$

Stima:

$$
\displaystyle
\left\lvert\int_a^b(f_n-f)\right\rvert
\le
(b-a)\lVert f_n-f\rVert_{\infty,[a,b]}.
$$

Scambio con la derivata:

$$
\displaystyle
f_n\in C^1([a,b]),\quad
f_n(x_\ast)\ \text{convergente per un }x_\ast\in[a,b],
\quad
f_n'\xrightarrow[]{u}g
$$

$$
\displaystyle
\Longrightarrow
\exists f\in C^1([a,b]):
\quad
f_n\xrightarrow[]{u}f,
\qquad
f'=g.
$$

Teoria generale: [convergenza uniforme](/matematica/convergenza-uniforme/).

### Serie di funzioni

Somme parziali:

$$
\displaystyle
S_N(x)=\sum_{n=0}^{N}f_n(x).
$$

Convergenza puntuale e uniforme:

$$
\displaystyle
\sum_{n=0}^{\infty}f_n(x)=S(x)
\quad\Longleftrightarrow\quad
S_N(x)\to S(x),
$$

$$
\displaystyle
\sum f_n\ \text{converge uniformemente}
\quad\Longleftrightarrow\quad
\lVert S_N-S\rVert_{\infty,E}\to0.
$$

Criterio uniforme di Cauchy:

$$
\displaystyle
\forall\varepsilon>0\ \exists N\ \forall p,q:
\ q\ge p\ge N
\Longrightarrow
\sup_{x\in E}
\left\lvert\sum_{n=p}^{q}f_n(x)\right\rvert<\varepsilon.
$$

Condizione necessaria:

$$
\displaystyle
\sum f_n\ \text{converge uniformemente}
\quad\Longrightarrow\quad
\lVert f_n\rVert_{\infty,E}\to0.
$$

Convergenza totale:

$$
\displaystyle
\sum_{n=0}^{\infty}\lVert f_n\rVert_{\infty,E}<+\infty.
$$

Criterio di Weierstrass:

$$
\displaystyle
M_n\ge0,\qquad\lvert f_n(x)\rvert\le M_n\quad\forall x\in E,
\qquad
\sum M_n<+\infty
$$

$$
\displaystyle
\Longrightarrow
\sum f_n\ \text{converge totalmente, uniformemente e puntualmente in modo assoluto}.
$$

Stima uniforme del resto:

$$
\displaystyle
\sup_{x\in E}
\left\lvert
\sum_{n=N+1}^{\infty}f_n(x)
\right\rvert
\le
\sum_{n=N+1}^{\infty}M_n.
$$

Teoria: [convergenza uniforme](/matematica/convergenza-uniforme/) e [convergenza totale](/matematica/convergenza-totale/).

### Continuità, integrazione e derivazione delle serie

Continuità:

$$
\displaystyle
f_n\in C(E),\quad
\sum f_n\ \text{converge uniformemente}
\quad\Longrightarrow\quad
\sum f_n\in C(E).
$$

Integrazione:

$$
\displaystyle
f_n\in\mathcal R([a,b]),\quad
\sum f_n\ \text{converge uniformemente}
$$

$$
\displaystyle
\Longrightarrow
\int_a^b\sum_{n=0}^{\infty}f_n(x)\,dx
=
\sum_{n=0}^{\infty}\int_a^b f_n(x)\,dx.
$$

Derivazione:

$$
\displaystyle
f_n\in C^1([a,b]),\quad
\sum f_n(x_\ast)\ \text{converge per un }x_\ast\in[a,b],
\quad
\sum f_n'\ \text{converge uniformemente}
$$

$$
\displaystyle
\Longrightarrow
\sum f_n\ \text{converge uniformemente},
\qquad
\left(\sum_{n=0}^{\infty}f_n\right)'
=
\sum_{n=0}^{\infty}f_n'.
$$

Dirichlet uniforme:

$$
\displaystyle
\sup_{\substack{N\ge0\\x\in E}}
\left\lvert\sum_{n=0}^{N}a_n(x)\right\rvert<+\infty,
\quad
b_n(x)\ge0,
\quad
b_{n+1}(x)\le b_n(x),
\quad
\sup_{x\in E}b_n(x)\to0
$$

$$
\displaystyle
\Longrightarrow
\sum a_n(x)b_n(x)\ \text{converge uniformemente}.
$$

Abel uniforme:

$$
\displaystyle
\sum a_n(x)\ \text{converge uniformemente},
\quad
b_n(x)\ \text{monotona in }n\ \text{con verso comune},
\quad
\sup_{\substack{n\ge0\\x\in E}}\lvert b_n(x)\rvert<+\infty
$$

$$
\displaystyle
\Longrightarrow
\sum a_n(x)b_n(x)\ \text{converge uniformemente}.
$$

Teoria: [convergenza totale](/matematica/convergenza-totale/) e [criteri di Abel e Dirichlet](/matematica/criteri-di-abel-e-dirichlet/).

### Serie di potenze

Nella serie

$$
\displaystyle
\sum_{n=0}^{\infty}c_n(x-x_0)^n,
$$

$x_0$ è il centro, $c_n$ il coefficiente di ordine $n$ e $R$ il raggio di
convergenza. Il termine con $n=0$ è il termine costante $c_0$, anche nel centro
$x=x_0$, secondo la convenzione contestuale illustrata nella guida iniziale.
All'interno di $|x-x_0|<R$ la serie converge assolutamente; i due estremi,
quando finiti, vanno studiati separatamente.

Formula di Cauchy–Hadamard:

$$
\displaystyle
\rho=\limsup_{n\to\infty}\sqrt[n]{\lvert c_n\rvert},
\qquad
R=\frac1\rho.
$$

Qui $R=+\infty$ quando $\rho=0$ e $R=0$ quando $\rho=+\infty$: sono
convenzioni per il raggio di convergenza, non divisioni ordinarie per zero o
per infinito.

Se $c_{n+1}\ne0$ definitivamente ed esiste il limite, finito o esteso:

$$
\displaystyle
R=\lim_{n\to\infty}
\left\lvert\frac{c_n}{c_{n+1}}\right\rvert.
$$

Regione di convergenza:

| Raggio | Convergenza | Divergenza | Bordi |
|---|---|---|---|
| $R=0$ | $x=x_0$ | $x\ne x_0$ | nessun bordo da studiare |
| $0<R<+\infty$ | assoluta per $\lvert x-x_0\rvert<R$ | per $\lvert x-x_0\rvert>R$ | $x_0-R$ e $x_0+R$, separatamente |
| $R=+\infty$ | assoluta per ogni $x\in\mathbb R$ | — | nessun bordo finito |

Casi estremi:

$$
\displaystyle
\sum_{n=0}^{\infty}n!(x-x_0)^n:
\qquad R=0,
$$

$$
\displaystyle
\sum_{n=0}^{\infty}\frac{(x-x_0)^n}{n!}:
\qquad R=+\infty.
$$

Convergenza totale sui compatti interni, per $0\le r<R$:

$$
\displaystyle
\sum_{n=0}^{\infty}
\sup_{\lvert x-x_0\rvert\le r}
\lvert c_n(x-x_0)^n\rvert
=
\sum_{n=0}^{\infty}\lvert c_n\rvert r^n
<+\infty.
$$

Comportamenti al bordo per serie centrate in $0$:

| Serie | $R$ | $x=-R$ | $x=R$ |
|---|---:|---|---|
| $\displaystyle\sum_{n=0}^{\infty}x^n$ | $1$ | diverge | diverge |
| $\displaystyle\sum_{n=1}^{\infty}\dfrac{x^n}{n}$ | $1$ | converge condizionatamente | diverge |
| $\displaystyle\sum_{n=1}^{\infty}\dfrac{x^n}{n^2}$ | $1$ | converge assolutamente | converge assolutamente |

### Operazioni sulle serie di potenze

Posto

$$
\displaystyle
F(x)=\sum_{n=0}^{\infty}c_n(x-x_0)^n,
\qquad
\lvert x-x_0\rvert<R,
$$

per $k\in\mathbb N_0$:

$$
\displaystyle
F^{(k)}(x)
=
\sum_{n=k}^{\infty}
\frac{n!}{(n-k)!}\,
c_n(x-x_0)^{n-k},
$$

$$
\displaystyle
c_k=\frac{F^{(k)}(x_0)}{k!}.
$$

Integrazione:

$$
\displaystyle
\int_{x_0}^{x}F(t)\,dt
=
\sum_{n=0}^{\infty}
\frac{c_n}{n+1}(x-x_0)^{n+1}.
$$

Le serie derivata e integrata hanno raggio $R$.

Somma e prodotto, per $\lvert x-x_0\rvert<\min\{R_A,R_B\}$:

$$
\displaystyle
\sum a_n(x-x_0)^n+\sum b_n(x-x_0)^n
=
\sum(a_n+b_n)(x-x_0)^n,
$$

$$
\displaystyle
\left(\sum a_n(x-x_0)^n\right)
\left(\sum b_n(x-x_0)^n\right)
=
\sum_{n=0}^{\infty}
\left(\sum_{k=0}^{n}a_kb_{n-k}\right)
(x-x_0)^n.
$$

Teorema di Abel al bordo destro, per $0<R<+\infty$:

$$
\displaystyle
\sum_{n=0}^{\infty}c_nR^n\ \text{converge}
\quad\Longrightarrow\quad
\lim_{x\to(x_0+R)^-}F(x)
=
\sum_{n=0}^{\infty}c_nR^n.
$$

Bordo sinistro:

$$
\displaystyle
\sum_{n=0}^{\infty}c_n(-R)^n\ \text{converge}
\quad\Longrightarrow\quad
\lim_{x\to(x_0-R)^+}F(x)
=
\sum_{n=0}^{\infty}c_n(-R)^n.
$$

Teoria, bordi e operazioni: [serie di potenze](/matematica/serie-di-potenze/).

### Serie di potenze notevoli

Identità fondamentali:

$$
\sum_{n=0}^{\infty}x^n=\frac1{1-x},
\qquad |x|<1,
$$

$$
e^x=\sum_{n=0}^{\infty}\frac{x^n}{n!},
\qquad x\in\mathbb R,
$$

$$
\sin x=\sum_{n=0}^{\infty}(-1)^n\frac{x^{2n+1}}{(2n+1)!},
\qquad
\cos x=\sum_{n=0}^{\infty}(-1)^n\frac{x^{2n}}{(2n)!},
\qquad x\in\mathbb R,
$$

$$
-\ln(1-x)=\sum_{n=1}^{\infty}\frac{x^n}{n},
\qquad -1\le x<1,
$$

$$
\ln(1+x)=\sum_{n=1}^{\infty}(-1)^{n-1}\frac{x^n}{n},
\qquad -1<x\le1,
$$

$$
\arctan x=\sum_{n=0}^{\infty}(-1)^n\frac{x^{2n+1}}{2n+1},
\qquad |x|\le1.
$$

$$
\arcsin x
=\sum_{n=0}^{\infty}
\frac{\binom{2n}{n}}{4^n(2n+1)}x^{2n+1},
\qquad |x|\le1.
$$

Per $\alpha\in\mathbb R$:

$$
(1+x)^\alpha
=\sum_{n=0}^{\infty}\binom{\alpha}{n}x^n,
\qquad |x|<1,
$$

con gli estremi da discutere in base ad $\alpha$.

Agli estremi del raggio di convergenza il comportamento va sempre controllato
separatamente: la serie può convergere assolutamente, convergere soltanto
condizionatamente oppure divergere. Nei casi elencati sopra:

- $\sum_{n=0}^{\infty}x^n$ diverge sia per $x=1$ sia per $x=-1$;
- la serie di $-\ln(1-x)$ converge condizionatamente per $x=-1$ e diverge per
  $x=1$;
- la serie di $\ln(1+x)$ diverge per $x=-1$ e converge condizionatamente per
  $x=1$;
- la serie di $\arctan x$ converge condizionatamente per $x=1$ e per $x=-1$;
- la serie di $\arcsin x$ converge assolutamente per $x=1$ e per $x=-1$;
- per la serie binomiale il comportamento dipende da $\alpha$ e va studiato
  separatamente nei due estremi.

<a id="sezione-19"></a>
## 19. Funzioni Gamma e Beta

Argomento di approfondimento, utile soprattutto nelle applicazioni
scientifiche e probabilistiche. Nelle definizioni, $t$ è una variabile muta di
integrazione. La funzione Gamma estende il fattoriale dagli interi positivi ai
reali positivi.

### Definizioni e identità fondamentali

Per $x>0$:

$$
\displaystyle
\Gamma(x)
=
\int_0^{+\infty}t^{x-1}e^{-t}\,dt,
$$

$$
\displaystyle
\Gamma(x+1)=x\Gamma(x),
\qquad
\Gamma(n)=(n-1)!\quad(n\in\mathbb N_+),
\qquad
\Gamma(n+1)=n!\quad(n\in\mathbb N_0),
\qquad
\Gamma\left(\frac12\right)=\sqrt\pi.
$$

Per $x,y>0$:

$$
\displaystyle
B(x,y)
=
\int_0^1 t^{x-1}(1-t)^{y-1}\,dt,
$$

$$
\displaystyle
B(x,y)=B(y,x)
=
\frac{\Gamma(x)\Gamma(y)}{\Gamma(x+y)},
$$

$$
\displaystyle
B(x+1,y)=\frac{x}{x+y}B(x,y),
\qquad
B(x,y+1)=\frac{y}{x+y}B(x,y).
$$

Teoria: [funzione Gamma](/matematica/funzione-gamma/) e [funzione Beta](/matematica/funzione-beta/).
