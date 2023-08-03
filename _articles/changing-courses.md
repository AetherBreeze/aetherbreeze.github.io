---
id: 35
title: "Changing Courses"
subtitle: ""
date: "2023.08.02"
tags: "qft"
---

# Changing Courses

Over the past few days, we've been working through an integral related to vacuum perturbations. We encountered a mathematical problem which the book seemed to sidestep, and which I could not explain. Today, I will conclude my investigation into it and change my plans somewhat.

## A Tale of Delta Functions and Infinite Integrals

In the course of trying to evaluate a path integral, we made a couple of mathematical leaps that I had trouble justifying.

We started analyzing a vacuum perturbation of two spike functions:

```math
J(x) = \delta(x_\lambda - [y_1]_\lambda) + \delta(x_\lambda - [y_2]_\lambda)
```

This perturbation greatly simplified the standard path integral exponent. The integrals over the position components of $`x`$ fall away, leaving just the integral over the time component:

```math
\int \int \int J(x_2)^\dag \frac{e^{i (x_2 - x_1) p}}{p^2 - m^2 + i \epsilon} J(x_1) d^4 p d^4 x_1 d^4 x_2 = \int \int \int \frac{e^{i ((x_2 - x_1)_t p_t - (y_2 - y_1)_\lambda p_\lambda)}}{p^2 - m^2 + i \epsilon} d^4 p d [x_1]_t d [x_2]_t
```

We then split the integral into an outer integral over $`d^4 p`$ and an inner integral over the remaining time components:

```math
\int \int \int J(x_2)^\dag \frac{e^{i ((x_2 - x_1)_t p_t - (y_2 - y_1)_\lambda p_\lambda)}}{p^2 - m^2 + i \epsilon} d^4 p d [x_1]_t d [x_2]_t = \int (\int \int e^{i (x_2 - x_1)_t p_t} d [x_1]_t d [x_2]_t) \frac{e^{-i (y_2 - y_1)_\lambda p_\lambda}}{p^2 - m^2 + i \epsilon} d^4 p
```

This is the point where (to my mind) we stray into nonsense. First, we somehow extract the time component of the momentum integral and group it with the spatial compoennts -- even though the time component is still a factor in the denominator $`p^2`$.

```math
\int \int \int J(x_2)^\dag \frac{e^{i ((x_2 - x_1)_t p_t - (y_2 - y_1)_\lambda p_\lambda)}}{p^2 - m^2 + i \epsilon} d^4 p d [x_1]_t d [x_2]_t = \int (\int \int e^{i (x_2 - x_1)_t p_t} d [x_1]_t d [x_2]_t d p_t) \frac{e^{-i (y_2 - y_1)_\lambda p_\lambda}}{p^2 - m^2 + i \epsilon} d^3 p_\lambda
```

That's nonsense number 1. Nonsense number two is when we integrate over $`[x_1]_t`$ to give a spike function in $`p_t`$. This *almost* makes sense; after all, the spike function for $`p_t`$ is defined as

```math
\delta(p_t) := \int_{-\infty}^{\infty} e^{i p_t x} dx
```

and the minus sign doesn't matter because we're integrating over symmetric bounds.

So let's say I'm fine with this. We integrate over $`[x_1]_t`$ from $`-\infty`$ to $`\infty`$ and get

```math
\int \int e^{i x_2 p_t} \delta(p_t) d [x_2]_t d p_t
```

We can then do the momentum integral (ignoring the fact that we're leaving a $`p_t`$ in the main momentum integral via $`p^2`$). This will set $`p_t`$ to zero here, reducing the exponential to

```math
\int \int e^{i x_2 p_t} \delta(p_t) d [x_2]_t d p_t = \int 1 d[x_2]_t
```

Here is bullshit number three. We just integrated $`[x_2]_t`$ from negative infinity to infinity. This makes sense because the endpoints $`x_1, x_2`$ were the continuous equivalents of a matrix-vector product. Integrating over all their possible values is the continuous equivalent of the matrix acting on each of the vector's values.

It makes no sense, then, that the book tells us to only integrate over $`[x_1]_t`$ from $`0`$ to some finite $`T`$.

There are many reasons for this, but the two that irritate me the most are:

1. $`x_1`$ and $`x_2`$ are not meaningfully different.
2. We already gave up on integrating over finite ranges long ago. We even used this to do some integration by parts tricks.

Thus the choices needed to coerce this integral into its "correct" physical form make no sense to me.

## Another Course

The core principle behind this course -- behind my study of physics in general -- is that when I'm done, I should feel like I could've derived the results I learned myself. An important component of this is that the math is consistent. Not rigorous; just consistent. And when it's not consistent, that inconsistency should be explained somewhere. For these reasons, which have been behind a lot of my recent lack of progress, I have decided to try out another book which I hope will help me personally learn better.

The new book in question is *No-Nonsense Quantum Field Theory*. I've chosen this for a few reasons:

1. It's also an introductory textbook on quantum field theory, so it suits my needs.
2. It (supposedly) walks through its equations very explicitly, which will help avoid the mathematical nonsense that's held me up here.

Let it be know that I don't think at all that QFTIAN is a bad textbook. I just don't think it suits my learning style, and the learning style of this course, and that adapting to it has been slowing me down too much.

As stated, I'll be taking a break from Thursday to Sunday. When I'm back, we'll dive into the beginning of No-Nonsense Quantum Field Theory -- starting with a quick refresher on special relativity.
