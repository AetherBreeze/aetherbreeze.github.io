---
id: 5
title: "Quantum Mechanics Speedrun (6)"
subtitle: ""
date: "2023.06.24"
tags: "qft"
---

# To Infinity And Beyond

We are close to a complete theory of quantum mechanics. Last time, we generalized our intuitive theory to a rigorous model using linear algebra. Today, we will extend this model to handle values (such as position and momentum) that can take on an infinite number of values.

## Setting The Scene

To start, let's recount our theory of quantum mechanics:


1. A system can be described by an $`N`$-dimensional vector $`\ket{S}`$, where $`N`$ is the number of states the system can be in. Each possible state $`s_a`$ is represented by a basis vector $`\ket{s_a}`$.
2. The probability of measuring the system in some state $`s_a`$ is the squared magnitude of the coefficient of $`\ket{s_a}`$. That is, $`\text{prob}(s_a) = |\bra{S} \ket{s_a}|^2`$.
3. Some systems have two properties or more properties (called *conjugate properties*) such that measuring one affects the probabilities of measuring the others. Such conjugate properties are represented by different sets of basis vectors for the same system.

where we have defined the inner product of two $`N`$-dimensional complex vectors $`\ket{A}, \ket{B}`$ with elements $`a_x, b_x`$ as

```math
    \bra{A} \ket{B} := \sum_{x=1}^N a_x^* b_x
```

and $`a_x^*`$ demotes the *complex conjugate* of $`a_x`$.

For this purpose, it is also worth making another key statement. It is intuitive that, when we measure a system, we always measure *something* -- that is, there is a probability of $`1`$ that a measurement will yield *some* value. Thus the sum of the probabilities for each state of a system $`\ket{S}`$ must be one. Using the above formalism, we can write this as

```math
\sum_{x=1}^N |\bra{s_x} \ket{S}|^2 = 1
```

In the literature, this is called the *principle of unity*, because the sum of the probabilities must be unity (1).

## Function-Vector Duality

We will now begin a series of speculative generalizations.

A system in our theory of quantum mechanics is described by a vector $`\ket{S}`$. There are many ways to write such a vector. Usually, and especially when conjugate properties are at play, we explicitly write $`\ket{S}`$ in terms of some set of basis vectors (that is, some complete set of measurable values):

```math
\ket{S} = p_1 \ket{s_1} + p_2 \ket{s_2} +.. p_N \ket{s_N}
```

However, if we assume this basis is implied, we can simply write $`\ket{S}`$ as a list of $`N`$ numbers:

```math
\ket{S} = (p_1, p_2,.. p_N) \quad \text{(in the }\ket{s_a}\text{ basis)}
```

Here is the first generalization: in this case, with the basis assumed, we can also write $`\ket{S}`$ as a function $`\ket{S(x)}`$ which takes in numbers from $`1`$ to $`N`$ and returns the corresponding element:

```math
\ket{S(x)} = p_x \quad \text{(in the }\ket{s_a}\text{ basis)}
```

Note that **even in the function formalism, we are still assuming a basis.** This fact is oft forgotten by entry-level quantum mechanics students, and it will lead you to great suffering if you ignore it.

## Preserving Unity

With this function-vector correspondence, the leap to continuous systems *seems* almost too easy. We know that we can model a discrete system with $`N`$ states using a function $`\ket{S(x)}`$ -- a function such that $`\ket{S(a)}`$ is the probability of measuring state $`\ket{s_a}`$. Why, then, can we not model a system with an *infinite* number of states (that is, a state for each value $`x \in \R`$) as a function $`\ket{S(x)}`$ over all $`x`$?

The answer is: we can, but it's a bit more complicated than that. 

The issue is this. Suppose we have a state $`\ket{S(x)}`$ in the $`\ket{s_a}`$ basis with an infinite number of states. Suppose that $`\ket{S(a)}`$, for any $`a \in \R`$, is the probability of measuring the system in state $`a`$. Then we are in trouble, because an infinite number of states with finite probabilities means that the sum of probabilities is greater than one. This contradicts the principle of unity, which states that the sum of probabilities for all states of a system must be $`1`$.

How do we solve this? Well, the issue arises when we consider the princple of unity, so we should probably start with that. This might make us realize that we haven't even *stated* the principle of unity for a continuous function yet. Thus our first step is laid clear: rewrite the principle of unity for complex systems.

The principle of unity for discrete systems says that, for a system $`\ket{S}`$ in a basis $`\ket{s_a}`$ with $`N`$ possible states, we must have

```math
\sum_{a = 1}^N |\bra{s_a} \ket{S}|^2 = 1
```

Generalizing sums like this to the continuous case is pretty simple. Usually, all we have to do is replace the sum with an integral. In this case, we also note that $`\bra{s_a} \ket{S}` is just the $`a`$th element of $`\ket{S}`$. Since the $`a`$th element of a continuous vector $`\ket{S(x)}`$ is just $`\ket{S(a)}`$, our continuous version of the principle of unity is

```math
\int |\ket{S(x)}|^2 dx = 1
```

## Enter Probability Density

This new principle of unity gives us a hint at what the value $`\ket{S(x)}`$ actually means.  Recall that in our formalism, each $`x \in \R`$ represents a state of the system $`\ket{S(x)}`$. The principle of unity then states that the probability that the system is in *any* state is 1.

One may then ask: what if we restrict the values of $`x`$? For example, what if we take the integral

```math
\int_{-1}^{1} |\ket{S(x)}|^2 dx
```

By our previous logic, this would be the probability that $`S`$ is in any of the states labeled by some $`x \in [-1, 1]`$. For example, if $`S`$ represents the position of an electron, that integral would give us the probability of finding the electron between $`x = -1`$ and $`x = 1`$.

And like magic, we have stumbled into the definition of the value $`\ket{S(x)}`$. It is a sort of infinitesimal probability, or *probability density*, of measuring the system in the state labelled by $`x`$. By itself, it has no meaning, but when squared and integrated over the range $`(a, b)`$, it gives the probability of measuring the system in some state in that range.

```math
\int_{a}^{b} |\ket{S(x)}|^2 dx = \text{(probability of measuring the system in a state labelled by some )} x \in (a, b)
```

This concept of probability density -- a value that, when squared and integrated over, gives the probability of finding the system in some range -- is absolutlely fundamental in quantum field theory. How could it not be, when fields are inherently continuous things?

## Wait, What Are The Basis Vectors?

To finalize our foundation for continuous quantum mechanics, let us address the vital concept of basis vectors. Back when we started this generalization, the first thing we did was implicitly assume a basis. This allowed us to write our vectors as lists of numbers, which, in turn, gave us function-vector duality. However, now that we have finished our sprint and we have our generalization, we should double back and ensure that this crucial concept has a continuous analogue.

We will start by asking the most vital question when generalizing a concept in math: what does a basis vector *do*?

Well, one thing it does is extract its corresponding coefficient from a vector. Specifically, the dot product of a basis vector $`\ket{s_a}`$ with a vector $`\ket{S}`$ extracts the $`a`$th coefficient of $`S`$. Denoting the $`x`th element of a vector as $`\ket{A}_x`$, we can write this as

```math
\sum_{x=1}^N \bra{s_a}_x \ket{S}_x = p_a
```

We've seen this before. To make it continuous, just assume some basis $`s_a`$ and turn the sum into an integral:

```math
\int s_a(x) S(x) dx = S(a)
```

This is a *definition* of continuous basis vectors. When we write a state as a function $`S(x)`$, we have already assumed a basis $`s_a(x)`$. The basis vectors (or rather, basis functions) are then defined as some function $`s_a(x)`$ such that the integral of $`s_a(x) S(x)`$ is $`S(a)`$.

To avoid writing all the basis vectors in the same way, we invent a new function called the **continuous delta function**. The continuous delta function $`\delta(x)`$ is not, strictly speaking, a function; rather, it is defined in terms of an integral:

```math
\int \delta(x) S(x) dx = S(0)
```

We can then rewrite each basis vector $`s_a(x)`$ as

```math
s_a(x) = \delta(x - a)
```

To check your understanding, substitute this into the definition of the delta function and confirm that it extracts $`S(a)`$.

## Next Time

Today, we discovered a crucial connection between vectors and functions. When we assume some basis $`\ket{s_a}`$, we can write a discrete vector $`\ket{S}`$ as a function $`\ket{S(x)}`$ such that $`\ket{S(a)}`$ is just the $`a`$th component of $`\ket{S}`$ (in the $`\ket{s_a}`$ basis). We used this identity to generalize from discrete systems $`\ket{S}`$ to continuous systems $`\ket{S(x)}`$. Next, we used the rule of unity to discern that each value $`\ket{S(a)}`$ is a *probability density* that, when integrated over, gives the probability of measuring the system in some range of states. Finally, we generalized basis vectors to the continuous case and defined the **continuous delta function** $`\delta(x)`$.

Next time, we wrap up our speedrun by investigating how states evolve with time.
