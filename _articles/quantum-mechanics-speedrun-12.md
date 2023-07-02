---
id: 11
title: "Quantum Mechanics Speedrun (12)"
subtitle: ""
date: "2023.07.01"
tags: "qft"
---

# The Second Most Famous Equation

Last time, we rounded out the toolbox of quantum mechanics with the discovery of linear operators. Today, we'll play with our new tools to finally derive the (continuous) Schrodinger equation.

## Linear Operators (TL;DR)

Linear operators are so fundamental to quantum mechanics that they're worth a quick review. Let's see if we can do it in under a hundred words.

Systems in quantum mechanics are represented by (possibly continuous) vectors $`\ket{S}`$. An *operator* $`\hat{M}`$ is something that maps a vector $`\ket{S}`$ to another vector $`\hat{M} \ket{S}`$. A *linear operator* is an operator that satisfies

```math
\hat{M}(c \ket{A} + d \ket{B}) = c \hat{M} \ket{A} + d \hat{M} \ket{B}
```

for any vectors $`\ket{A}, \ket{B}`$ and constants $`c, d`$.

For discrete vectors, linear operators can be written as matrices (for some given basis).

Under seventy-five words. Not bad.

## Deriving the Schrodinger Equation (part 1)

We will use our fancy new operators to derive the (continuous) Schrodinger equation. This won't be too hard. In fact, we already did half of the work:

```math
\hat{E} \ket{S(x)} = -i \hbar \frac{d}{dt} \ket{S(x)} 
```

This equation is good enough for the discrete case. When we can write $`\hat{E}`$ as a matrix, it's actually quite easy. However, we have no idea how to write the energy operator for the continuous case yet. This will be our first task.

As usual, we will start with a simple question: how do we write the energy of a particle in classical mechanics?

Well, we typically split it into kinetic and potential energy:

```math
E = E_K + E_P
```

We can now narrow each part of this equation down. The kinetic energy always takes the same form:

```math
E_K = \frac{1}{2} m v^2
```

The potential energy, on the other hand, can take many forms. However, it is only ever a function of the particle's position:

```math
E_P = E_P(x)
```

With these two restrictions, we can write the energy in a slightly more actionable way:

```math
E = \frac{1}{2} m v^2 + E_P(x)
```

We'll make one further adjustment. For reasons too complicated to explain here, it is more convenient in most cases to work with a particle's momentum instead of its velocity. This is a [whole can of worms which we will not open here](https://en.wikipedia.org/wiki/Hamiltonian_mechanics). Thankfully, the upshot is fairly simple. All we have to do is rewrite the kinetic energy slightly:

```math
E = \frac{p^2}{2 m} + E_P(x)
```

## Wait, It's All Operators?

This expansion of the energy gets us closer to finding the continuous Schrodinger equation. Recall that we started with

```math
\hat{E} \ket{S(x)} = -i \hbar \ket{S(x)}
```

We then expanded the energy into kinetic and potential energy. Substituting this in, we get an inkling that the final equation will look something like this:

```math
\left(\frac{p^2}{2 m} + E_P(x)\right) \ket{S(x)} = -i \hbar \ket{S(x)}
```

Of course, it can't be exactly that easy. Since the original $`\hat{E}`$ was a linear operator, it makes sense that both the kinetic and potential energy terms should be operators too. This is easy for potential energy; for kinetic energy, it's a bit more tricky.

We'll start with the easy case. In classical mechanics, potential energy is a function of position. In quantum mechanics, it should thus be a function of the position operator:

```math
\hat{E_P}(\hat{X}) \ket{S(x)}
```

However, since we're in the position basis, the position operator is just $`x`$ itself. Thus this term reduces to

```math
\hat{E_P}(x) \ket{S(x)}
```

And that's it! Since the potential energy is so varied, we can't get any more specific about it here. Thus we'll just leave it like this: as some operator that depends on position.

## The Momentum Operator

The kinetic energy requires more effort. In our framework, this term looks like

```math
\frac{p^2}{2 m} \ket{S(x)}
```

Right off the bat, this doesn't make much sense. The core problem is that we don't know what the momentum $`p`$ of a quantum particle is. Based on everything that's happened so far, the only lead we have is that it's probably an operator:

```math
\frac{1}{2 m} \hat{p}^2 \ket{S(x)}
```

Note that the "square" of an operator is like the square of a matrix -- it just means to apply the operator twice.

The next step is to figure out what the hell this momentum operator is. As usual, we'll start simple: what's the simplest thing it could be, in the position basis?

Well, momentum is pretty closely linked to velocity. Could the momentum operator be related to the time derivative?

```math
\hat{p} \text{?}= \frac{d}{dt}
```

This isn't a bad idea. Unfortunately, the time derivative is already pretty much taken by the energy operator. It wouldn't make sense for the momentum and energy operators to be proportional to each other when they're clearly different things. So the time derivative is a good first guess, but it's not quite right.

What other derivatives do we have? Well, we have the derivative with respect to $`x`$. In the position basis, this reads something like

```math
\frac{d}{dx} \ket{S(x)} = (\text{probability density to find particle at } x + dx) - (\text{probability density to find particle at } x)
```

That's a little like a velocity. At the very least, it has to do with the probability of a particle's position "moving" from point to point. However, before we settle on it, we need to make one important change...

## The One Major Problem

I'll be honest with you: we've reached the one major problem with this method of deriving quantum mechanics. The "true" form of the momentum operator can be derived from only things we've already discovered, but to do so, we'd need to delve into a whole subfield of physics called Hamiltonian mechanics. I am in no way discouraging you from doing that -- in fact, you should definitely do it eventually. Unfortunately, it is beyond the scope of this review of quantum mechanics. I hope to cover it (as well as its cousin, Lagrangian mechanics) more fully in another series sometime, but for now, we can't really use the main method of getting at the momentum operator.

However, we are not doomed. We can still derive the momentum operator in a vaguely rigorous fashion by stealing an idea from Einstein: *the unification of energy and momentum*.

The (very tenuous) idea goes like this. In special relativity, energy and momentum are unified into a single vector. Special relativity essentially treats energy as time momentum. The only differences between the two are a factor of the speed of light $`c`$, which we will unjustifiably ignore, and a sign flip. (Seriously, if you want to learn the real reason that energy and momentum are related, study Hamiltonian mechanics. That shit is cool.)

All this to say: energy and momentum are inherently related. Thus if we write the energy (read: time momentum) operator as

```math
\hat{E} = -i \hbar \frac{d}{dt}
```

it only follows that we should write the $`x`$ momentum operator as

```math
\hat{p_x} = i \hbar \frac{d}{dx}
```

Thus ends the most shameful *math ex machina* of the exposition. If I have time, I may try to go back and justify this further.

## At Last, The Schrodinger Equation

After that leap of faith, we're finally done. Starting with the general Schrodinger equation:

```math
\hat{E} \ket{S(x)} = -i \hbar \frac{d}{dt} \ket{S(x)}
```

we split the energy into its kinetic and potential parts:

```math
\hat{E_K} \ket{S(x)} + \hat{E_P} \ket{S(x)} = -i \hbar \frac{d}{dt} \ket{S(x)}
```

The potential energy operator was too general to simplify further, so we just wrote it as a function of the position operator (which, in this basis, happens to be $`x`$). The kinetic energy operator, however, took a more helpful form:

```math
\frac{1}{2 m} \hat{p}^2 \ket{S(x)} + \hat{E_P}(x) \ket{S(x)} = -i \hbar \frac{d}{dt} \ket{S(x)}
```

A motivating why the momentum operator might be related to the spatial derivative, we took a (slightly motivated) leap of faith and ended up with

```math
\hat{p} = i \hbar \frac{d}{dx}
```

Substituting this in, we finally get the the Schrodinger equation, in the way Schrodinger himself wrote it over a hundred years ago:

```math
-\frac{\hbar^2}{2 m} \frac{d^2}{dx^2} \ket{S(x)} + \hat{E_P}(x) \ket{S(x)} = -i \hbar \frac{d}{dt} \ket{S(x)}
```

Noice.

## Two Parting Thoughts

Since that last section doubled as our usual summary, I'll slip in a little toy at the bottom of the cereal box. Recall that the eigenvectors of an average value operator for some value $`P`$ are the states where that value is constant. For the position operator, these eigenvectors were fairly intuitive:

```math
\ket{X_a} = \delta(x - a)
```

We can then find any component $`\ket{S(a)}`$ of the state by taking its dot product with the basis vectors:

```math
\ket{S(a)} = \int S(x) \delta(x - a) dx
```

However, this is not the only basis we can play in. Recall the form of the momentum operator:

```math
\ket{p} = i \hbar \frac{d}{dx}
```

Just like the position operator, this operator has eigenvectors. These eigenvectors are functions of the form $`i \hbar \frac{d}{dx} S(x) = p S(x)`$. You might already see where this is going:

```math
\ket{P_p(x)} = e^{i \frac{p x}{\hbar}}
```

This is interesting for two reasons. First of all is that, by analogy, we can also extract the $`P`$ component of any states $`\ket{S(x)}`$ by taking the dot product of $`\ket{S}`$ with the corresponding eigenvector:

```math
\ket{S(P)} = \int S(p) e^{i \frac{P x}{\hbar}} dx
```

For some, this might have no meaning at all. However, for sufficiently huge math nerds, this might blow your mind: **the position and momentum components of a state $`\ket{S(x)}`$ are related by a Fourier transform!** This suddenly makes the broad field of Fourier analysis *intensely* interesting for quantum mechanics. We won't explore this too in-depth right now, but it's worth keeping in mind...

The other reason has even more wide-ranging implications. It is that this eigenvector *does not satisfy the principle of unity when written in the $`x`$ basis.* Recall that the principle of unity states, in essence, that the total probability of observing *some value* must be equal to one:

```math
\int S(x)^* S(x) dx = 1
```

This blatantly does not hold for momentum eigenvectors like $`\ket{P_p(x)}`$. Thus we find a surprising result: *states of absolutely certain momentum seem nonsensical, and indeed, might not have any physical meaning.*

Remember when I said this was gonna be weird?
