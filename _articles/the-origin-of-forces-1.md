---
id: 32
title: "The Origin of Forces (1)"
subtitle: ""
date: "2023.07.29"
tags: "qft"
---

# Perturbing Developments

Last time, we finished our introductory analysis of the propagator. It implied that physics looks fairly similar forwards and backwards in time, and that probabilities are mostly (but not entirely!) contributed by processes that obey the energy-momentum identity.

Today, we will start to study the other part of the path integral: the vacuum perturbations. We will do some nice tricks to coerce the integral to momentum space, then analyze how two different perturbations might interact. Our analysis will lead us towards the discovery of forces.

## Analyzing the Path Exponent

Recall the path integral for a particle moving from point $`x_1`$ to point $`x_2`$:

```math
\int e^{\frac{i}{2} \int \int J(x_2)^\dag D^{-1}(x_2 - x_1) J(x_1) d^4 x_1 d^4 x_2} dy(t)
```

If it helps you to remember, this double integral is the continuous version of a matrix-vector product.

All the interesting stuff is happening in the exponent's integral. Thus we will consider this integral by itself:

```math
\int \int J(x_2)^\dag D^{-1}(x_2 - x_1) J(x_1) d^4 x_1 d^4 x_2
```

We can now substitute in the momentum expression we found for the propagator:

```math
D^{-1}(x_2 - x_1) = \frac{1}{(2 \pi)^4} \int \frac{e^{i (x_2 - x_1) p}}{p^2 - m^2 + i \epsilon} d^4 p
```

This gives us

```math
\frac{1}{(2 \pi)^4} \int \int J(x_2)^\dag (\int \frac{e^{i (x_2 - x_1) p}}{p^2 - m^2 + i \epsilon} d^4 p) J(x_1) d^4 x_1 d^4 x_2
```

Since the perturbation functions are constant with respect to $`p`$, we can pull them into the momentum integral:

```math
\frac{1}{(2 \pi)^4} \int \int \int J(x_2)^\dag \frac{e^{i (x_2 - x_1) p}}{p^2 - m^2 + i \epsilon} J(x_1) d^4 p d^4 x_1 d^4 x_2
```

One might reasonably be concerned that we've just made everything worse. We've gone from two integrals to three -- how could this be better?

The answer is: with some help from exponent properties and factorization.

## Into Momentum Space

Let's look a bit closer at this path exponent integral:

```math
\frac{1}{(2 \pi)^4} \int \int \int J(x_2)^\dag \frac{e^{i (x_2 - x_1) p}}{p^2 - m^2 + i \epsilon} J(x_1) d^4 p d^4 x_1 d^4 x_2
```

Notice that $`x_2`$ and $`x_1`$ are only flimsily connected. In fact, we can seperate them entirely using exponent properties:

```math
\frac{1}{(2 \pi)^4} \int \int \int J(x_2)^\dag \frac{e^{i (x_2 - x_1) p}}{p^2 - m^2 + i \epsilon} J(x_1) d^4 p d^4 x_1 d^4 x_2 = \frac{1}{(2 \pi)^4} \int \int \int J(x_2)^\dag \frac{e^{i x_2 p} e^{-i x_1 p}}{p^2 - m^2 + i \epsilon} J(x_1) d^4 p d^4 x_1 d^4 x_2
```

We might then group the $`x_1`$ terms together and the $`x_2`$ terms together:

```math
\frac{1}{(2 \pi)^4} \int \int \int J(x_2)^\dag \frac{e^{i x_2 p} e^{i x_1 p}}{p^2 - m^2 + i \epsilon} J(x_1) d^4 p d^4 x_1 d^4 x_2 = \frac{1}{(2 \pi)^4} \int \int \int e^{-i x_2 p} J(x_2)^\dag \frac{1}{p^2 - m^2 + i \epsilon} e^{-i x_1 p} J(x_1) d^4 p d^4 x_1 d^4 x_2
```

Hold on. Not only are the $`x_1`$ and $`x_2`$ terms full seperate, they're both integrated over... which means that all of a sudden, we can factorize this integral!

```math
\frac{1}{(2 \pi)^4} \int \int \int e^{i x_2 p} J(x_2)^\dag \frac{1}{p^2 - m^2 + i \epsilon} e^{i x_1 p} J(x_1) d^4 p d^4 x_1 d^4 x_2 = \frac{1}{(2 \pi)^4} \int \frac{1}{p^2 - m^2 + i \epsilon} (\int e^{i x_2 p} J(x_2)^\dag d^4 x_2) (\int e^{-i x_1 p} J(x_1) d^4 x_1) dp
```

Lo and behold, these position integrals are nothing more than the Fourier transforms (i.e., the momentum expressions) of the perturbation $`J(x)`$!

Well, almost. We do need to be a little careful with the $`x_2`$ integral, since the sign in the exponent isn't quite right. This problem is solved by realizing that this should be the *complex conjugate* of the Fourier transform of $`J(x_2)`$:

```math
J_P(p)^\dag = (\int e^{-i p x} J(x) d^4 x)^\dag = \int e^{i p x} J(x)^
dag d^4 x
```

Thus the above integrals are just the Fourier transforms. We can then write the path exponent in a surprisingly simple form:

```math
\frac{1}{(2 \pi)^4} \int \frac{1}{p^2 - m^2 + i \epsilon} (\int e^{i x_2 p} J(x_2)^\dag d^4 x_2) (\int e^{-i x_1 p} J(x_1) d^4 x_1) dp = \frac{1}{(2 \pi)^4} \int J(p)^\dag \frac{1}{p^2 - m^2 + i \epsilon} J(p) dp
```

Note that we are omitting the $`P`$ subscript for a function in the momentum basis. This is to allow us to attach more subscripts later. We will preserve the information about basis using the variable (e.g. $`x`$ vs. $`p`$). From now on, we will indicate all bases in this way.

We now see that the propagator and the perturbations seem almost made for each other. The exponent in the propagator plays beautifully with the two perturbation terms at different positions, resulting in an integral that's far cleaner than anything we've seen in a while.

## Interaction Terms

Let's play a little with our new expression. Let's assume that the vacuum perturbation $`J(p)`$ is simply the sum of two small perturbations:

```math
J(p) = J_1(p) + J_2(p)
```

The path exponent we just derived then becomes

```math
\frac{1}{(2 \pi)^4} \int (J_1(p) + J_2(p))^\dag (J_1(p) + J_2(p)) \frac{1}{p^2 - m^2 + i \epsilon}d^4 p
```

The leading term factors into four smaller terms. Two of these will be terms with just $`J_1`$ or $`J_2`$, which we have already seen. However, we also find some terms in which the two disturbances $`J_1`$ and $`J_2`$ seem to interact:

```math
\frac{1}{(2 \pi)^4} \int J_2(p)^\dag \frac{1}{p^2 - m^2 + i \epsilon} J_1(p) d^4 p
```

Note that the conjugate term also exists.

This is very interesting. It seems like if two perturbations $`J_1, J_2`$ have overlapping momentum expressions, then they can affect how a particle moves. Furthermore, as before, they will have the most power if they overlap near the "rule-following" value $`p^2 - m^2`$. Thus we reach a very interesting conclusion:

**Two field perturbations that are distant in space can affect the motion of a particle, so long as their Fourier transforms overlap at values near the momentum of that particle.**

Tomorrow, we will see how this simple-seeing expression gives rise to the forces of nature -- all from working with linear vacuum perturbations.
