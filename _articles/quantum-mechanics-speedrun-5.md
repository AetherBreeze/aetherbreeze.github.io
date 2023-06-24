---
id: 4
title: "Quantum Mechanics Speedrun (5)"
subtitle: ""
date: "2023.06.23"
tags: "qft"
---

# Quantum Mechanics Is Linear Algebra

Last time, we discovered a powerful connection between physics and mathematics. We found that the principles of quantum mechanics (discrete numbers of states, each with a probability, and with some "conjugate" states whose measurement affects the values of other states) agree almost supernaturally well with the linear algebra concepts of basis vectors and changes of bases. Today, we will make this connection official.

## Turning Physics Into Math

Recall the three principles we proposed for quantum mechanics:

1. Properties of certain systems can only take on a discrete set of values.
2. When such a properties is measured, each value is observed with a certain probability.
3. Properties of certain systems are "conjugate," in that measuring one property can affect the probabilities of measuring the others.

Turning all of this into linear algebra is very easy. We can rewrite the first rule as

1. Systems can be described by $`N`$-dimensional vectors, where $`N`$ is the number of states it can take.

Integrating the second rule is even easier:

2. The $`A`$th element of such a vector (that is, the coefficient of the $`A`$th basis vector) is a complex number. The squared magnitude of that complex number is the probability of measuring the associated state.

Finally, the third rule springs fully-formed from the change of basis we discussed last time:

3. Conjugate properties are represented by different basis vectors for a system. The effect of measuring one property on measuring the others is given by the change-of-basis matrix between the two bases.

And there we have them: the mathematical axioms of quantum mechanics.

## Taking Advantage Of The Connection

We have made the connection between quantum mechanics and linear algebra. Now, we can start using that connection to develop new tools.

### Dot Products

The first thing we'll take advantage of is dot products. Recall how a state with $`N`$ values is written in our theory:

```math
S = p_1 \ket{V_1} + p_2 \ket{V_2} +.. p_N \ket{V_N}
```

To get the probability of measuring $`V_A`$, we just extract the coefficient $`p_A`$ of the basis vector $`\ket{V_A}`$ and find its squared magnitude.

In linear algebra, we can extract the cofficient of a basis vector like $`\ket{V_A}`$ by taking the **dot product** of the state vector $`S`$ with the basis vector $`\ket{V_A}`$. Thus we can rewrite the second rule of quantum mechancis using the language of linear algebra:

2. Given a state vector $`S`$, the probability of measuring a state associated with some basis vector $`\ket{V_A}`$ is the squared magnitude of the dot product between $`S`$ and $`\ket{V_A}`$.

That's a lot of words. Let's shorten it with math. 

## Inventing Nicer Notation

We want a compact way to write "the dot product between $`S`$ and $`\ket{V_A}`$. The intuitive option is obviously

```math
S \cdot \ket{V_A}
```

However, quantum mechanics typically uses a different notation. This notation is both shorter and more insightful. It's rooted in the idea that **composite states like $`S`$ and basis vectors like $`\ket{V_A}`$ are both just vectors. Indeed, in the context of conjugate values, composite states and basis vectors often interchange.** Thus for clarity, we should use a notation that puts $`S`$ and $`\ket{V_A}`$ on equal footing.

All this to say: we write the state vector $`S`$ as $`\ket{S}`$, where the brackets indicate that it's a vector.

But wait, you might say. Doesn't that make our notation for dot products even worse?

```math
\ket{S} \cdot \ket{V_A}
```

To that, I would reply: astute observation, but we're not done yet. We can keep on inventing notation to make this look nicer by writing the dot product between $`\ket{S}`$ and $`\ket{V_A}`$ as

```math
\bra{S} \ket{V_A}
```

This compact notation allows us to re-write our dot product rule extremely concisely:

2. Given a state vector $`\ket{S}`$, the probability of measuring a state represented by basis vector $`\ket{V_A}`$ is $`|\bra{S}\ket{V_A}|^2`$

## An New Important Function

This dot product notation is incredibly helpful in quantum mechanics. It simplifies the equations greatly. However, it is not *quite* the operation that's most often used. Let's see why.

Consider the inner product of a state (say, $`\ket{z_+}`$) with itself. It's a good intuition check to convince ourselves that this inner product should be $`1`$. Indeed, this is such an important check that we often write it on its own. Given two basis vectors $`\ket{V_a}, \ket{V_b}`$ representing two states of a system, their inner product is required to be

```math
\bra{V_a} \ket{V_b} = \begin{cases} 1 \text{ if } a = b \\ 0 \text{ otherwise.} \end{cases}
```

In fact, this happens so frequently that we invent a whole new notation for it. We define the **delta function** $`\delta^a_b`$ to be $`1`$ iff $`a = b`$, and $`0`$ otherwise. Thus we have the important expression:

```math
\bra{V_a} \ket{V_b} = \delta^a_b
```

This is the first of hundreds of times that we see the delta function $`\delta^a_b`$. Remember it.

## A New Inner Product

With the delta function in hand, we are almost ready to make the jump to continuous quantum mechanics. There's just one problem: our shiny new delta function breaks when used on conjugate states.

Consider the state $`\bra{z_+}`$ of the electron that we studied earlier. By the delta function identity, we should have that

```math
\bra{z_+} \ket{z_+} = 1
```

Now, let's expand this states in terms of the conjugate states $`\ket{x_\pm}`$, as we did in part 3:

```math
\ket{z_+} = i \sqrt{0.5} \ket{x_+} + \sqrt{0.5} \ket{x_-}
```

The inner product then reads

```math
\bra{z_+} \ket{z_+} = (i \sqrt{0.5} \bra{x_+} + \sqrt{0.5} \bra{x_-})(i \sqrt{0.5} \ket{x_+} + \sqrt{0.5} \ket{x_-})
```

Using the delta function, we can distribute this product to get

```math
\bra{z_+} \ket{z_-} = (i \sqrt{0.5})(i \sqrt{0.5}) \bra{x_+} \ket{x_+} + 0.5 = -0.5 + 0.5 \bra{x_-} \ket{x_-} = 0
```

Whoops. The naive definition of the dot product seems to be telling us that if the system is in state $`\ket{z_+}`$, then there's a zero percent chance of measuring it in state $`\ket{z_+}`$. That's not great.

The fix for this issue is quite simple. It follows from linear algebra, where the length of a vector $`v`$ is the square root of $`v \cdot v`$. This works in normal linear algebra because the dot product of a vector with itself is guaranteed to be positive. However, if we let vectors have imaginary components, this is no longer the case. This is the root of the problem.

There is only one way to coerce a complex number to a real number, and that is multiplying it by its conjugate. Thus we can fix the problem by requiring that **when we take the dot product, we flip one of the vectors (conventionally, the one that becomes a $`\bra{v}`$), we change each element of $`\bra{v}`$ to its complex conjugate.**

Let's confirm that this fixes our problem:

```math
\bra{z_+} \ket{z_+} = (-i \sqrt{0.5} \bra{x_+} + \sqrt{0.5} \bra{x_-})(i \sqrt{0.5} \ket{x_+} + \sqrt{0.5} \ket{x_-}) \\
= (-i \sqrt{0.5}) (i \sqrt{0.5}) + 0.5 = 0.5 + 0.5 = 1
```

Nice! By taking the complex conjugate of one vector whenever we take a dot product, we ensure that the length of a vector (and thus the probability associated with its measurement) is always non-negative.

## To The Infinite

We have just about wrapped up our discrete model of quantum mechanics. Next time, we will use this fancy linear-algebra system to generalize quantum mechanics to the continuous realm and finally take our first real steps towards quantum field theory.
