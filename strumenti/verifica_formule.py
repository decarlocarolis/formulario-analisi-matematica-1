"""Verifiche simboliche di regressione per formule rappresentative di Analisi I.

I controlli non sostituiscono la revisione matematica completa: intercettano
regressioni di segno, coefficienti, derivate, primitive, limiti e somme.
"""

from __future__ import annotations

import sympy as sp

x, a, b, q = sp.symbols("x a b q", real=True)
n = sp.symbols("n", integer=True, nonnegative=True)

verifiche_superate: list[str] = []


def verifica_zero(nome: str, espressione: sp.Expr) -> None:
    residuo = sp.simplify(espressione)
    if residuo != 0:
        raise RuntimeError(f"{nome}: residuo simbolico non nullo: {residuo}")
    verifiche_superate.append(nome)


def verifica_uguale(nome: str, trovato: object, atteso: object) -> None:
    if trovato != atteso:
        raise RuntimeError(f"{nome}: trovato {trovato!r}, atteso {atteso!r}")
    verifiche_superate.append(nome)


# Derivate elementari e regole di derivazione.
verifica_zero("Derivata della potenza", sp.diff(x**7, x) - 7 * x**6)
verifica_zero("Derivata dell'esponenziale", sp.diff(sp.exp(3 * x), x) - 3 * sp.exp(3 * x))
verifica_zero("Derivata del logaritmo", sp.diff(sp.log(x), x) - 1 / x)
verifica_zero("Derivata del seno", sp.diff(sp.sin(5 * x), x) - 5 * sp.cos(5 * x))
verifica_zero(
    "Regola del prodotto",
    sp.diff(x**2 * sp.exp(x), x) - (2 * x * sp.exp(x) + x**2 * sp.exp(x)),
)
verifica_zero(
    "Regola del quoziente",
    sp.diff((x**2 + 1) / (x - 1), x)
    - ((2 * x) * (x - 1) - (x**2 + 1)) / (x - 1) ** 2,
)
verifica_zero(
    "Regola della catena",
    sp.diff(sp.sin(x**2 + 1), x) - 2 * x * sp.cos(x**2 + 1),
)
verifica_zero("Derivata dell'inversa arctan", sp.diff(sp.atan(x), x) - 1 / (1 + x**2))

# Primitive e teorema fondamentale.
verifica_zero("Primitiva della potenza", sp.diff(x**6 / 6, x) - x**5)
verifica_zero("Primitiva esponenziale lineare", sp.diff(sp.exp(4 * x) / 4, x) - sp.exp(4 * x))
verifica_zero("Primitiva del reciproco quadratico", sp.diff(sp.atan(x), x) - 1 / (1 + x**2))
t = sp.symbols("t", real=True)
F = sp.integrate(sp.cos(t) ** 2, (t, 0, x))
verifica_zero("Teorema fondamentale del calcolo", sp.diff(F, x) - sp.cos(x) ** 2)
verifica_zero(
    "Integrazione per parti",
    sp.integrate(x * sp.exp(x), x) - sp.exp(x) * (x - 1),
)
verifica_zero(
    "Decomposizione in fratti semplici",
    1 / (x**2 - 1) - (sp.Rational(1, 2) / (x - 1) - sp.Rational(1, 2) / (x + 1)),
)

# Limiti notevoli.
verifica_uguale("Limite sin(x)/x", sp.limit(sp.sin(x) / x, x, 0), 1)
verifica_uguale("Limite esponenziale", sp.limit((sp.exp(x) - 1) / x, x, 0), 1)
verifica_uguale("Limite logaritmico", sp.limit(sp.log(1 + x) / x, x, 0), 1)
verifica_uguale("Limite coseno", sp.limit((1 - sp.cos(x)) / x**2, x, 0), sp.Rational(1, 2))
verifica_uguale("Limite definitorio di e", sp.limit((1 + 1 / x) ** x, x, sp.oo), sp.E)

# Taylor e identità algebriche/trigonometriche.
verifica_zero(
    "Taylor dell'esponenziale al quarto ordine",
    sp.series(sp.exp(x), x, 0, 5).removeO()
    - (1 + x + x**2 / 2 + x**3 / 6 + x**4 / 24),
)
verifica_zero(
    "Taylor del seno al quinto ordine",
    sp.series(sp.sin(x), x, 0, 7).removeO() - (x - x**3 / 6 + x**5 / 120),
)
verifica_zero("Identità pitagorica", sp.sin(x) ** 2 + sp.cos(x) ** 2 - 1)
verifica_zero("Formula del seno doppio", sp.sin(2 * x) - 2 * sp.sin(x) * sp.cos(x))
verifica_zero("Formula del coseno doppio", sp.cos(2 * x) - (sp.cos(x) ** 2 - sp.sin(x) ** 2))
verifica_zero(
    "Binomio di Newton per n=5",
    sp.expand((a + b) ** 5)
    - sum(sp.binomial(5, k) * a ** (5 - k) * b**k for k in range(6)),
)

# Successioni e somme notevoli.
verifica_zero(
    "Somma geometrica finita",
    sum(q**k for k in range(8)) - (1 - q**8) / (1 - q),
)
verifica_uguale(
    "Somma geometrica infinita campione",
    sp.summation(sp.Rational(1, 3) ** n, (n, 0, sp.oo)),
    sp.Rational(3, 2),
)
verifica_uguale("Somma dei primi n interi campione", sum(range(1, 11)), 55)
verifica_uguale("Somma dei quadrati campione", sum(k * k for k in range(1, 11)), 385)

# Numeri complessi, polinomi e funzioni speciali.
z = sp.symbols("z")
verifica_zero("Formula di Eulero", sp.exp(sp.I * x) - (sp.cos(x) + sp.I * sp.sin(x)))
polinomio = z**2 - 5 * z + 6
radici = sp.solve(polinomio, z)
verifica_uguale("Radici del trinomio", radici, [2, 3])
verifica_zero("Relazioni di Viète", sum(radici) - 5)
verifica_zero("Prodotto delle radici", sp.prod(radici) - 6)
verifica_zero("Ricorrenza Gamma", sp.gamma(6) - 5 * sp.gamma(5))
verifica_zero(
    "Identità Beta-Gamma campione",
    sp.beta(3, 4) - sp.gamma(3) * sp.gamma(4) / sp.gamma(7),
)

print(f"Verifiche simboliche superate: {len(verifiche_superate)}")
for indice, nome in enumerate(verifiche_superate, 1):
    print(f"{indice:02d}. {nome}")
