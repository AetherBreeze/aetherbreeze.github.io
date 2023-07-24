---
id: 26
title: "From Particles To Fields (8)"
subtitle: ""
date: "2023.07.23"
tags: "qft"
---

# The Free Propagator

Last time, we finally evaluated the discrete analogue of the simple field path integral. Today, we'll finally go back to the continuous world and meet a new, very important friend.

## A Quick Recap

Since this is a recap, let's start all the way at the beginning. The expression we originally wanted to evaluate was

```math
\bra{S_2} e^{i \frac{\hat{E}}{\hbar} T} \ket{S_1}
```

We turned this into a path integral problem by inserting $`1`$ in the forms of integrals over start and end positions:

```math
\bra{S_2} e^{i \frac{\hat{E}}{\hbar} T} \ket{S_1} = \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \bra{S_2} \ket{x_2} \bra{x_2} e^{i \frac{\hat{E}}{\hbar} T} \ket{x_1} \bra{x_1} \ket{S_1} dx_1 dx_2
```

We then took the now-scalar dot products out to the front:

```math
\bra{S_2} e^{i \frac{\hat{E}}{\hbar} T} \ket{S_1} = \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \bra{x_1} \ket{S_1} \bra{S_2} \ket{x_2} \bra{x_2} e^{i \frac{\hat{E}}{\hbar} T} \ket{x_1} dx_1 dx_2
```

The position bit of this integral is now a "standard" path integral:

```math
\bra{S_2} e^{i \frac{\hat{E}}{\hbar} T} \ket{S_1} = \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \bra{x_1} \ket{S_1} \bra{S_2} \ket{x_2} \int e^{\frac{i}{\hbar} \int_{0}^{T} L dt} dy(t) dx_1 dx_2
```

We then made a simplification: instead of considering the transition probaiblity between any two states $`S_1, S_2`$, we just considered the probability for the field to stay in its vacuum state $`\ket{0}`$. We then *perturbed* the vacuum by adding a perturbation term $`J(y(t)) y(t)`$ to the Lagrangian:

```math
\bra{0} e^{i \frac{\hat{E}}{\hbar} T} \ket{0} = \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \bra{x_1} \ket{0} \bra{S_2} \ket{0} \int e^{\frac{i}{\hbar} \int_{0}^{T} L + J(y) y(t) dt} dy(t) dx_1 dx_2
```

Finally, we focused on just the path integral. We used relativistic principles to derive the basic field Lagrangian from the conservation of four-momentum, and more directly from the proto-Schrodinger equation. We also extended our integral out towards infinite time, since that allowed us to integrate over all spacetime in the exponent:

```math
\int e^{\frac{i}{\hbar} \int \frac{1}{2} (\partial F)^2 - \frac{m^2}{2} F^2 + J(y) F(x, t) d^4 x} dF(x, t)
```

Finally, by discretizing the field into a vector $`\ket{F}`$ with $`N`$ components and swapping to diagonal derivative coordinates $`G_a`$, we got things into Gaussian integral form:

```math
\Pi_{a=1}^{N} \int e^{\frac{i}{\hbar} \left(-\frac{[D_E]_a^2 + m^2}{2} F_a^2 + (R J)_a F_a\right)} dG_a
```

Evaluating each integral piece by piece, then converting coordinates back into matrix-vector form, we got our discrete expression for the path integral:

```math
\Pi_{a=1}^{N} \int e^{\frac{i}{\hbar} \left(-\frac{[D_E]_a^2 + m^2}{2} F_a^2 + (R J)_a F_a\right)} dG_a = \sqrt{\frac{(2 i \pi \hbar)^N}{|D|}} e^{\frac{i}{2 \hbar} \bra{J} D^{-1} \ket{J}}
```

where $`D`$ is the derivative matrix.

## That Recap Took Half The Average Page Length

Fun!

It is now our task to take things back into the continuous realm.

On the surface, this is pretty simple. The only tricky part is how to turn the matrix-vector product $`\bra{J} D^{-1} \ket{J}`$ back into a product of functions. To do so, let's temporarily write $`\ket{J}`$ in function notation, where $`J(x)`$ is the $`x`$th component of $`\ket{J}`$. Since the matrix $`D^{-1}`$ has two dimensions, we will also write it in function notation with two variables $`D^{-1}(x, y)`$.

Now let's think about what actually happens when we apply the matrix $`D^{-1}(x, y)`$ to the vector $`J(x)`$. The result is a new vector $`J'(y)`$ where the $`y`$th component of $`J'`$ is

```math
D^{-1} \ket{J} = J'(y) = \sum_{x = 1}^{N} D^{-1}(x, y) J(x)
```

When we then take the inner product of that vector with another $`J(x)`$, the result is summing over the products of corresponding components:

```math
\bra{J} D^{-1} \ket{J} = \sum_{y=1}^{N} \sum_{x=1}^{N} J^\dag(y) D^{-1}(x, y) J(x)
```

Now taking this to the continuous realm is trivial. We just have to turn the sums into integrals, and remember that since we're working in 4-dimensional spacetime, each integral should be an integral over all spacetime:

```math
\bra{J} D^{-1} \ket{J} \to \int \int J^*(y) D^{-1}(x, y) J(x) d^4 x d^4 y
```

See how useful the function form of vectors can be?

Actually, we can reduce this a little more. Since the laws of physics are translation invariant, the function $`D^{-1}(x, y)`$ should only depend on the *difference* between the two coordinate vectors:

```math
\bra{J} D^{-1} \ket{J} \to \int \int J^*(y) D^{-1}(y - x) J(x) d^4 x d^4 y
```

Substituting this back into our integral, we get

```math
\int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \bra{x_1} \ket{0} \bra{S_2} \ket{0} \sqrt{\frac{(2 i \pi \hbar)^N}{|D|}} e^{\frac{i}{2 \hbar} \int \int J^*(y) D^{-1}(y - x) J(x) d^4 x d^4 y}
```

Almost done now. There is still an annoying $`N`$ in the square root coefficient. However, since this term no longer depends on any integration variable, we can simply take it out front and write it as some normalization constant C. (Yes, it diverges. A lot of this stuff diverges. I'm still waiting to see if we'll even explain it.) We'll also pull out the factor of $`e^{\frac{i}{2 \hbar}}`$ to keep just the interesting stuff on the inside.

```math
C e^{\frac{i}{2 \hbar}} \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \bra{x_1} \ket{0} \bra{S_2} \ket{0} e^{\int \int J^*(y) D^{-1}(y - x) J(x) d^4 x d^4 y}
```

This is it: the **field path integral.** After all we've seen, it actually doesn't look that bad.

The only question is: what the hell is that inverse derivative function $`D^{-1}(y - x)`$?

## The Free Propagator

The basic answer is quite simple: the inverse derivative is the inverse of the derivative. More particularly, it's the inverse of the mass-shifted derivative $`-\partial^2 - m^2`$ from last time. This means that the mass-shifted derivative times the the inverse derivative function should be some continuous analogue of the identity matrix.

Recall that the identity matrix is some matrix $`I`$ such that for any vector $`\ket{v}`$,

```math
I \ket{v} = \ket{v}
```

We're going continuous, so we'll want to use function notation:

```math
\sum_x I(x, y) v(x) = v(y)
```

Taking the continuous limit, we get

```math
\int I(x, y) v(x) = v(y) dx
```

Now this is something we've seen before -- it's just the spike function $`\delta(x)`$!

Thus to generalize the inverse of the mass-shifted derivative, we should require that $`(-\partial^2 - m^2) D(x) = \delta(x)`$ (where $`\delta(x)`$ is actually the four-dimensional delta function.)

Some courses end here and say that this is enough. However, with a bit of cleverness, we can derive the form of $`D(x)`$ a bit more specifically.

## What Is The Spike Function, Actually?

In order to solve the above equation for $`D(x)`$, we need an analytic form for the spike function. We will do this via a clever analogy with linear algebra.

Recall that we have seen the spike function $`\delta(x)`$ before. It is the basis vector for functions written in position space. Specifically, $`\delta(x)`$ by itself is the basis vector at $`x = 0`$, in that taking its dot product with some function $`f(x)`$ extracts the component at zero:

```math
\int f(x) \delta(x) dx = f(0)
```

However, the position basis is not the only basis we considered. We also talked about the *momentum basis*, in which every basis vector is an eigenvector of the momentum operator $`-i \hbar \frac{\partial}{\partial x}`$. Obviously, these basis vectors are given by

```math
\ket{p} = e^{\frac{i}{\hbar} p x}
```

We can use these basis vectors to extract the momentum components $`f_P(p)`$ of a function $`f(x)`$ written in position space:

```math
f_P(p) = \int f(x) e^{\frac{i}{\hbar} p x} dx
```

We can also go the other way. Given a function written in momentum space $`f_P(p)`$, we can extract its position space components $`f(x)`$:

```math
f(x) = \int f_P(p) e^{-\frac{i}{\hbar} p x} dp
```

This gives us a clever way to extract the basis vector $`\delta(x - y)`$. We can use the first equation to get its momentum components:

```math
\delta_P(p) = \int \delta(x - y) e^{\frac{i}{\hbar} p x} dx = e^{\frac{i}{\hbar} p y} 
```

We can then sum up all these components with the second integral to retrieve the original basis vector:

```math
\delta(x - y) = \int \delta_P(p) e^{-\frac{i}{\hbar} p x} dp = \int e^{\frac{i}{\hbar} p (y - x)} dp
```

Technically this is off by a scaling factor. In four dimensions, that scaling factor is $`(2 \pi)^{-4}`$ -- one from each momentum dimension. We will also  avoid the need for a further scaling factor by swapping to units where $`\hbar = 1`$.Thus by hopping back and forth between position and momentum space, we can derive a "real" expression for the spike function:

```math
\delta(x - y) = \frac{1}{(2 \pi)^4} \int e^{i p (y - x)} d^4 p
```

## A Nice Expression for the Free Propagator

With this expression for the spike function, we can derive a related expression for the free propagator. Recall that the free propagator is the inverse of the mass-shifted derivative:

```math
-(\partial^2 + m^2) D^{-1}(x - y) = \delta(x - y)
```

Substituting in the momentum expression for the spike function:

```math
-(\partial^2 + m^2) D^{-1}(x - y) = \frac{1}{(2 \pi)^4} \int e^{i (y - x) p} d^4 p
```

Since the right side is a simple exponential in the spatial coordinates, we can quickly check that its second antiderivative is

```math
\partial^2 \frac{1}{(2 \pi)^4} \int -\frac{e^{i (y - x) p}}{(y - x)^2} d^4 p = \frac{1}{(2 \pi)^4} \int e^{i (y - x) p} d^4 p
```

Tossing our mass term in, we can actually check very easily that

```math
D^{-1}(x - y) = \frac{1}{(2 \pi)^4} \int \frac{e^{i (y - x) p}}{p^2 - m^2} d^4 p
```

This is *aaalmost* correct. There is a small mathematical detail that we'll touch up last time, but for all intents and purposes, *this is the expression for the free propagator in quantum field theory.*

This is, in many ways, our first truly quantum field theoretical calculation. Not too shaby -- just some discretization, some Gaussian integrals, and a spot of clever swapping to and from momentum space. If you've made it this far, congratulations!
