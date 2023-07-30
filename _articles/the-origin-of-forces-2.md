---
id: 33
title: "The Origin of Forces (2)"
subtitle: ""
date: "2023.07.30"
tags: "qft"
---

# Forces From the Path Exponent

Last time, we used our freshly derived propagator to analyze some vacuum perturbations. We found that the exponent in the path integral takes a remarkably simple form. When we introduced linear superpositions of disturbances, we found that they could interact under certain circumstances. Today, we will analyze those circumstances more and stumble across one of the most celebrated discoveries in 20th century physics.

## Perturbances in the Path Exponent

Recall the momentum-space form we derived for the path exponent:

```math
\frac{1}{(2 \pi)^4} \int J(p)^\dag \frac{1}{p^2 - m^2 + i \epsilon} J(p) d^4 p
```

Last time, we noticed that if we considered a perturbation $`J(p)`$ that's the sum of two other perturbations, a la

```math
J(p) = J_1(p) + J_2(p)
```

then the total integral ends up with these interesting-looking interaction terms:

```math
\frac{1}{(2 \pi)^4} \int J_2(p)^\dag \frac{1}{p^2 - m^2 + i \epsilon} J_1(p) d^4 p
```

These seem to indicate that two vacuum perturbations can interact, so long as their momentum-space expressions overlap in the region where the integral is large (that is, where $`p^2 \approx m^2`$).

## Pointlike Perturbations

How might we explore this phenomenon? The same way we explore every phenomenon: starting off with the simplest possible example and seeing how it plays out.

In this case, the simplest possible perturbation is probably a localized one. We will consider two perturbations $`J_1, J_2`$ which are just spike functions at different points in space (notably, NOT in spacetime):

```math
J_1(x) = \delta(x - x_1)
```

```math
J_2(x) = \delta (x - x_2)
```

Note that we've jumped back to position space, since localized perturbations make more sense there.

Plugging these into the original expression and taking the interaction terms, we find that

```math
\frac{1}{(2 \pi)^4} \int \int \int J_2(y_2) \frac{e^{i (y_2 - y_1) p}}{p^2 - m^2 + i \epsilon} J_1(y_1) d^4 p d^4 y_1 d^4 y_2
```

The delta functions make the integrals over space trivial. However, we still have yet to integrate over time:

```math
\frac{1}{(2 \pi)^4} \int \int \int \delta (y_2 - x_2) \frac{e^{i (y_2 - y_1) p}}{p^2 - m^2 + i \epsilon} J_1(y_1 - x_1) d^4 p d^4 y_1 d^4 y_2 = \frac{1}{(2 \pi)^4} \int \int \int \frac{e^{i ((y_1 - y_2)_t p_t - (x_2 - x_1)_\lambda p_\lambda)}}{p^2 - m^2 + i \epsilon} d^4 p d [y_1]_t d [y_2]_t
```

We will factor out this integral with respect to the time components:

```math
\frac{1}{(2 \pi)^4} \int \int \int \frac{e^{i ((y_1 - y_2)_t p_t - (x_2 - x_1)_\lambda p_\lambda)}}{p^2 - m^2 + i \epsilon} d^4 p d [y_1]_t d [y_2]_t = \frac{1}{(2 \pi)^4} \int \int e^{i (y_1 - y_2)_t p_t} d[y_1]_t d[y_2]_t \int \frac{e^{-i (x_2 - x_1)_\lambda p_\lambda}}{p^2 - m^2 + i \epsilon} d^4 p
```

This is a point where the book loses me. It says we can integrate over just $`[y_2]_t`$ to get a delta function for $`p_t`$. It then claims that this will leave us with an integral over all of $`[y_1]_t`$, which it says can be shortened to just give us a time interval instead of integrating over all of time. There are a few reasons this doesn't make sense to me:

1. Why would we integrate over just $`[y_2]_t`$? It seems to me that we can just split the exponential for the time components to get delta functions in both variables, if any exists.
2. Why can we suddenly choose to integrate time just from $`0`$ to $`T`$, when previously we have made great use of integration by parts, which requires us to integrate over all of spacetime?

I'll try to figure out some answers later.
