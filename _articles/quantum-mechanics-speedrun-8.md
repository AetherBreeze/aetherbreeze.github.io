---
id: 7
title: "Quantum Mechanics Speedrun (8)"
subtitle: ""
date: "2023.06.26"
tags: "qft"
---

# How Quantum Systems Evolve

Last time, we came up with a quantum version of the conservation of energy. We hinted strongly at how this concept can be used to derive the Schrodinger equation. Today, we will follow through on that promise.

## Quantum Conservation of Energy

First, let's remind ourselves what quantum conservation of energy means. Since the energy level of a system $`S`$ is just a state of that system, we can expand $`S`$ in terms of its energy levels and their respective probabilities. For simplicity, let's assume that $`S`$ only has a finite number $`N`$ of energy states. Then this expansion might look like

```math
\ket{S} = p_1 \ket{E_1} + p_2 \ket{E_2} +.. p_N \ket{E_N}
```

Quantum conservation of energy states that the probability $`|p_A|^2`$ of each energy state must not change with time. This ensures that the *average energy* of a system is preserved.

These sorts of conservation laws are absurdly powerful. In this case, we know that whatever our time evolution equation is, it must preserve the magnitudes of all the energy coefficients. In other words, if we write our system as a function of time:

```math
\ket{S}(t) = p_1(t) \ket{E_1} + p_2(t) \ket{E_2} +.. p_N(t) \ket{E_N}
```

then for all $`p_A(t)`$, we must have

```math
|p_A(t)|^2 = |p_A(0)|^2
```

Since the coefficients are complex numbers, this constrains $`p_A(t)`$ to

```math
p_A(t) = e^{i C_A t} p_A(0)
```

for some coefficient $`C_A`$.

## Occam's Razor

We are already surprisingly close to the quantum equation of motion. Just by using the quantum conservation of energy, we have already narrowed it down to

```math
\ket{S}(t) = \sum_{x=1}^{N} e^{i C_x t} p_x(0) \ket{E_x}
```

All we need to do now is determine the coefficients $`C_x`$ in the exponents. To do so, we will use another extremely powerful principle of physics: Occam's razor.

In its original Latin, Occam's razor reads:

**Complexity should not be proposed without necessity.**

Or, in more modern terms,

**Keep everything as simple as possible, but no simpler.**

This statement is so useful that it can hardly be considered philosophy. We use it almost every time we develop new physics: first, we consider the simplest possible theory; then, we add just as much complexity as is necessary to make it match reality.

With Occam's razor in mind, then, what form of the coefficients $`C_x`$ would we consider first?

Well, the simplest thing would be if all the coefficients were equal. That is, $`C_x = C`$ for some single constant $`C`$. This would simplify the equation of motion to

```math
\ket{S}(t) = \sum_{x=1}^{N} e^{i C t} p_x(0) \ket{E_x} =  e^{i C t} \sum_{x=1}^{N} p_x(0) \ket{E_x}
```

Unfortunately, this is *too* simple. We know from classical physics that systems evolve differently depending on their energies. A particle with more kinetic energy moves faster than a particle with less; a particle with more gravitational potential accelerates faster, and so on. Thus Occam's razor leads us to disregard the constant exponent option: it is too simple.

What's the next simplest option? Well, we just made the case that energy must play *some* role in the evolution of a system. What if the exponent $`C_x`$ is just the energy $`E_x`$ of the corresponding state?

```math
\ket{S}(t) = \sum_{x=1}^{N} e^{i E_x t} p_x(0) \ket{E_x}
```

Oh, and let's throw in some other constant so that the units make sense:

```math
\ket{S}(t) = \sum_{x=1}^{N} e^{i \frac{E_x}{\hbar} t} p_x(0) \ket{E_x}
```

That's it. That's the Schrodinger equation.

## Wait, Seriously?

Yep.

## Damn.

Right? And they say quantum mechanics is complicated.

## Everything Is Linear Algebra

After we first established our model of a quantum system, we immediately went back and formalized it in terms of linear algebra. This is a general model for developing physics: start by jamming math together until it works, then go back and fit it nicely into some larger theory. Now it is time to do the same for our quantum equation of motion.

For reference, let's re-state our equation of motion:

```math
\ket{S}(t) = \sum_{x=1}^{N} e^{i \frac{E_x}{\hbar} t} p_x(0) \ket{E_x}
```

How can we integrate this into linear algebra? It's actually quite simple. Recall that all the energy states $`\ket{E_x}`$ are just basis vectors. Our equation says that time evolution multiplies each basis vector by a different number. Is there a formal way of doing that in linear algebra?

Of course there is. All we have to do is multiply by a diagonal matrix!

```math
\ket{S}(t) = \sum_{x=1}^{N} e^{i \frac{E_x}{\hbar} t} p_x(0) \ket{E_x} \\
= \begin{bmatrix} e^{i \frac{E_1}{\hbar} t} && 0 && ... \\ 0 && e^{i \frac{E_2}{\hbar} t} && ... \\ ... \\ ... && 0 && e^{i \frac{E_N}{\hbar} t} \end{bmatrix} \sum_{x=1}^{N} p_x(0) \ket{E_x} \\
= \begin{bmatrix} e^{i \frac{E_1}{\hbar} t} && 0 && ... \\ 0 && e^{i \frac{E_2}{\hbar} t} && ... \\ ... \\ ... && 0 && e^{i \frac{E_N}{\hbar} t} \end{bmatrix} \ket{S}(0)
```

(One day I will find a math library with matrices that don't make my eyes spontaneously develop cataracts, but today is not that day. Just know that it's a matrix with $`e^{i \frac{E_x}{\hbar} t}`$ on the diagonal.)

Because of how long we've been working on this, it may seem less impressive let it is. For effect, then, let us re-state: *time evolution in quantum mechanics is just matrix multiplication!*

## Looking Forward

Today, we derived the Schrodinger equation from basic principles. We then united forces with linear algebra to show that time evolution in quantum mechancis is just matrix multiplication -- and, in the energy basis, *diagonal* matrix multiplication. Next time, we will expand on this concept and catch our first glimpse of the most important operation in advanced theoretical physics: the *exponential map*.
