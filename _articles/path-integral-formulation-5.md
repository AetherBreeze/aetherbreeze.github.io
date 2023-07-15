---
id: 17
title: "Path Integral Method (4)"
subtitle: ""
date: "2023.07.14"
tags: "qft"
---

# Wrapping Up the Path Integral

Last time, we finally defined the path integral. So far we've only used it to calculate the probability for a particle to move between two positions $`x_1`$ and $`x_2`$. Today, we will generalize this to calculate the probability for a particle to move from any state $`S_1`$ to any other state $`S_2`$. We'll also take the classical limit and derive the cornerstone of classical physics: the principle of least action.

## From Position, Everything

Last time, we used defined the path integral as

```math
\int dy(t) = \lim_{N \to \infty} \left(\frac{i m \hbar N}{2 \pi t}\right)^{N / 2} \Pi_{a=1}^{N} \int_{-\infty}^{\infty} d y_a
```

This allowed us to calculate the probability of a particle moving from position $`x_1`$ to $`x_2`$ over a time $`0 \to T`$:

```math
\bra{x_2} e^{i \frac{\hat{E}}{\hbar} t} \ket{x_1} = \int e^{\frac{i}{\hbar} \int_0^T L(y(\lambda), \dot{y}(\lambda)) d \lambda} dy(t)
```

By itself, this is useful enough. The problem of "where is a particle going" has whole fields of physics dedicated to it, and the path integral is a powerful tool to answer that question. However, we can use it to bootstrap answers to an even more powerful question: what is the probability that a particle will go from any state to any other state?

Let's write this question using our formalism. Say we have an system that starts off in the state $`\ket{S_1}`$ at time $`0`$. We want to find the probability that it'll evolve to the state $`\ket{S_2}`$ at time $`T`$. This would be written as

```math
\bra{S_2} e^{i \frac{\hat{E}}{\hbar} t} \ket{S_1}
```

This expression suffers from the same problem as its position version: the long time gap makes the operator in the middle very complicated. One might then ask: could we pull the same trick here, and split this path up into several tiny paths between intermediate states?

The answer is: yes, but it isn't very helpful. There are two reasons for this:

1. The operator we're trying to simplify, $`e^{i \frac{\hat{E}}{\hbar} t}`$, is made up of position and momentum operators. Thus we won't be able to simplify it on the intermediate states $`\ket{S_a}`$.
2. We won't be able to pull the same trick of inserting momentum basis states, since they probably won't have a simple dot product with the $`\ket{S_a}`$s.

Thus we can't simply apply the path integral trick to evolution between any states. However, we can do something almost as good...

## Bootstrapping From Position Integrals

We can get the more general problem into "path integral form" by using a trick we've pulled a couple times now. We can insert $`1`$, in the form of the complete set of position states:

```math
\int_{-\infty}^{\infty} \ket{x} \bra{x} dx = 1
```

By doing this twice, once for each operator, we end up with

```math
\bra{S_2} e^{i \frac{\hat{E}}{\hbar} t} \ket{S_1} = \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \bra{S_2} \ket{x_2} \bra{x_2} e^{i \frac{\hat{E}}{\hbar} t} \ket{x_1} \bra{x_1} \ket{S_1} dx_1 dx_2
```

Suddenly, this is looking a lot more path integral-y. We can make it look even closer by realizing that $`\bra{x_1} \ket{S_1}`$ is just the $`x_1`$ component of $`\ket{S_2}`$ (that is, the scalar $`S_2(x)`$), and similarly for $`\bra{S_2} \ket{x_2}`$:

```math
\bra{S_2} e^{i \frac{\hat{E}}{\hbar} t} \ket{S_1} = \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} S_2^*(x_2) S_1(x_1) \bra{x_2} e^{i \frac{\hat{E}}{\hbar} t} \ket{x_1} dx_1 dx_2
```

This is the *scaled path integral*. It's close enough to the path integral method that we can usually calculate it with similar methods. In the next section, we will see how we can simplify this even further. For now it suffices to know that inserting position states allows us to calculate any probability density with a path integral-ish approach.

## Quantum to Classical

We will wrap up our discussion of the path integral with the small task of showing how it gives rise to all of classical mechanics. Incredibly, this is only a short step from where we already are. We already know that a particle's probability density to go from $`x_1`$ to $`x_2`$ in time $`T`$ is

```math
\bra{x_2} e^{i \frac{\hat{E}}{\hbar} T} \ket{x_1} = \int e^{\frac{i}{\hbar} \int_{0}^{T} L(y(\lambda), \dot{y}(\lambda)) d \lambda}dy(t)
```

The classical limit of quantum mechanics is when we take $`\hbar \to 0`$. However, if we do this immediately, the integral will blow up. Instead we have to use a trick we discussed last time: we need to do a *Wick rotation* in which we replace $`\lambda`$ (the time variable) with $`i \lambda`$. Doing so gives us the integral

```math
\int e^{-\frac{1}{\hbar} \int_{0}^{T} L(y(\lambda), \dot{y}(\lambda)) d \lambda} dy(t)
```

Now the limit is well-defined. Since the exponent gets arbitrarily close to $`-\infty`$, the probability density will be dominated by whichever path $`y(\lambda)`$ makes the value $`\int_{0}^{T} L(y(\lambda), \dot{y}(\lambda)) d \lambda`$ as small as possible.

Let me say that again: **in the classical limit, the probability density is dominated by the path $`y(t)`$ that minimizes the following integral:**

```math
\int_{0}^{T} L(y(\lambda), \dot{y}(\lambda)) d \lambda
```

This is exactly the principle of least action from classical mechanics. From this simple principle -- that a particle takes the path of least action -- literally all of classical physics can be derived.

## Next Steps

If you've made it this far, congratulations. You've started from nothing and derived the path integral formulation of quantum mechanics. This is literally a Nobel Prize-winning feat. It is also the key to all of quantum field theory.

Next time, we will start the process of unlocking the door.
