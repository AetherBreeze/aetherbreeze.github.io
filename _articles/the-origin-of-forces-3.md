---
id: 34
title: "The Origin of Forces (3)"
subtitle: ""
date: "2023.07.31"
tags: "qft"
---

# Forces From the Path Exponent (2)

Last time, we started analyzing a sum of spike-function vacuum perturbances to the path exponent. We then ran into an absolutely nonsense piece of mathematics that didn't make sense for a variety of reasons. Today, I will double down on those reasons and present an alternate path forward.

## Nonsense in the Path Exponent

We are considering the path exponent

```math
\frac{1}{(2 \pi)^4} \int J(p)^\dag \frac{1}{p^2 - m^2 + i \epsilon} J(p) d^4 p
```

for a vacuum perturbation $`J(p)`$ that consists of two spike functions at spacetime points $`x_1, x_2`$:

```math
J(x) = \delta(x - x_1) + \delta(x - x_2)
```

Substituting this into the spatial form of the path exponent and splitting apart the time components, we got

```math
\frac{1}{(2 \pi)^4} \int \int e^{i (y_1 - y_2)_t p_t} d[y_1]_t d[y_2]_t \int \frac{e^{-i (x_2 - x_1)_\lambda p_\lambda}}{p^2 - m^2 + i \epsilon} d^4 p
```

From this reasonable point, the book diverges onto a path of chaos. First, it claims that by integrating over $`[y_2]_t`$ from $`-\infty`$ to $`\infty`$, we can transform the double spatial integral to

```math
\int \int e^{i (y_1 - y_2)_t p_t} d[y_1]_t d[y_2]_t = \int \delta(p_t) d[y_1]_t
```

It then claims that the range of $`[y_1]_t`$ is actually only integrated over a range from $`0`$ to $`T`$, which will become important later.

This smells strongly of bullshit to me. The most egregious nonsense is that we're integrating $`[y_2]_t`$ over the entire real line, but $`[y_1]_t`$ only from $`0`$ to $`T`$. No reason is given for this asymmetry. Given that $`y_1`$ and $`y_2`$ were, at some point in the past, vectors in a matrix-vector product, it is mysterious to me that they should be summed over different domains.

Second, and relatedly, I can't see why integrating over both of these variables wouldn't give delta functions. My logic goes as follows. We can split the contentious double spatial integral using exponent properties:

```math
\int \int e^{i (y_1 - y_2)_t p_t} d[y_1]_t d[y_2]_t = (\int e^{i y_1 p_t} d[y_1]_t) (\int e^{-i y_2 p_t} d[y_2]_t)
```

The first integral is literally the definition of the spike function $`\delta(p_t)`$ (well, times $`2 \pi`$). The second integral can be transformed into that integral by substituting $`[y_2]_t \to -[y_2]_t`$. This introduces a negative sign in the differential, but it's cancelled out by the swapping of the bounds. Thus the above integral seems to reduce to

```math
4 \pi^2 \delta(p_t)^2
```

This is a shame because the square of the delta function doesn't seem well defined. However, if we assume it behaves the same as the normal delta function, then it will make the spatial integral disappear and reduce the remaining integral to the case where $`p_t = 0`$, as desired.

I'm afraid that the extra factor of $`2 \pi`$ in this derivation might make something horrible happen. Tomorrow, I'll try to evaluate the remaining integral and see what happens. (Also worth noting while I'm thinking about it that the thing tomorrow seems to hinge on chosing the -1, 1, 1, 1 metric, but it doesn't because the mass-energy equivalence has a different sign on the mass depending on the convention. The mass in the relativistic mass-energy equation, when moved to the same side as the momentum, will always have the same sign as the spatial components of the momentum. Thus we are safe from conventions being given physical relevance.)
