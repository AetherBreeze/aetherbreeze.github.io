---
id: 1
title: "Quantum Mechanics Speedrun (2)"
subtitle: ""
date: "2023.06.20"
tags: "qft"
---

# Inventing Quantum Mechanics

Last time, we started the process of re-discovering quantum mechanics. We did this by considering two systems: a big magnet which obeyed the laws of classical physics, and a small magnet that did not. Next, we came up with a set of rules that we think might describe the small magnet (and thus quantum mechanics):

1. Some physical quantities can only take on a discrete set of values (e.g. either $`1`$ or $`-1`$).
2. Measuring one property of a system **can** affect future measurements of different properties.
3. In the above situation, the future measurements' values seem to be random.

Finally, we took a first stab at turning these rules into a model of physics. Given a system that can take on $`N`$ possible values, we proposed that it can be described the $`N`$ numbers $`p_1, p_2,.. p_N`$ where $`p_A`$ is the probability of the $`A`$th value being observed. This model accounts for rules $`1`$ and $`3`$, and in math, it looks like this:

```math
\text{model = } \begin{bmatrix} p_1 \\ p_2 \\ ... \\ p_N \end{bmatrix}
```

Today, we will extend this model to account for rule $`2`$. Then, if there's time, we'll bugfix a few problems with the model. The end product will be a complete model of quantum physics (or at least its fundamentals).


# How Conjugate Variables Screw Everything Up

We want to translate rule 2 of our model into math. Let's start by reminding ourselves what rule $`2`$ is and why it's necessary.

Consider our fundamental rule-breaking model, the electron. Rule $`2`$ is motivated by the following (possible) series of measurements:

1. We measure the magnetic field of the electron in the $`y`$ direction and find it to be $`1`$.
2. To ensure no shenanigans are happening, we measure it several more times in the $`y`$ direction. Every time, we find it to be $`1`$.
3. We measure the magnetic field in the $`x`$ direction and get either $`1`$ or $`-1`$ (with 50% probability of each).
4. Finally, we measure it in the $`y`$ direction again and find that it's either $`1`$ or $`-1`$ (with 50% probability of each).

This is *not* how classical physics works. Classical values are not entwined like this -- measuring the position of a car has no effect on how fast the car is going, and vice versa. However, in the land of quantum mechanics, these sorts of properties are common. We call such groups of properties *conjugate values* because they are conjoined: measuring one may change the other.

To account for conjugate values, we wrote Rule 2:

**Rule 2: Measurements of one value can affect future measurements of another value**.

We then summarily ignored rule 2 and created our model using only rule 1 and 3. Now it's time to fix that.


## Turning Rule 2 Into Math

Let's start with our current model. Given a system with $`N`$ possible states, we describe it as a list of $`N`$ corresponding probabilities:

```math
\text{model } = \begin{bmatrix} p_1 \\ p_2 \\ ... \\ p_N \end{bmatrix}
```

For now, let's restrict ourselves to the magnetic field of the electron in the $`y`$ direction. It only has two possible values, $`1`$ and $`-1`$:

```math
\text{magnetic field (y)} = \begin{bmatrix} p_1 \\ p_2 \end{bmatrix}
```

### This Is Confusing (Let's Fix It)

Here we run into our first problem. Say we also want to write the magnetic field of the electron in the $`x`$ direction. With our current model, we would write this as

```math
\text{magnetic field (x)} = \begin{bmatrix} p_1 \\ p_2 \end{bmatrix}
```

These two states are very different. The problem is that they're written in exactly the same way. This is not a *critical issue*, per se, but it is extremely confusing, and in a field like quantum mechanics, there's already plenty of confusion to go around. To prevent the proliferation of head-shaped holes in walls, it would behoove us to come up with a clearer notation.

As always, we'll start with the simplest option. What if we just tag each probability $`p_a`$ with a label that tells us what that probability represents?


Let's sketch how this might look. Say we tag the probability of measuring a magnetic field of $`1`$ in the $`y`$ direction with $`\ket{y_+}`$, and the probability of measuring $`-1`$ with $`\ket{y_-}`$. In this notation, our model for the magnetic field in the $`y`$ direction might look like this:

```math
\text{magnetic field (y)} = p_1 \ket{y_+} + p_2 \ket{y_-}
```

Similarly, our model for the magnetic field in the $`x`$ direction would look like this:

```math
\text{magnetic field (x)} = p_1 \ket{x_+} + p_2 \ket{x_-}
```

Looking much better already! In fact, now that state information is stored on the right side, we can drop the labels from the left side:

```math
\text{magnetic field} = p_1 \ket{y_+} + p_2 \ket{y_-} \\
\text{magnetic field} = q_1 \ket{x_+} + q_2 \ket{x_-}
```

Hold on. Though it might not seem like it, we've just done something very important. Instead of writing the magnetic field in the $`x`$ direction and the magnetic field in the $`y`$ direction seperately, we're writing them as models of *one single magnetic field*.

This is a crucial fact about conjugate values. **Conjugate values are not two different but related systems; conjugate values are two ways of describing** ***the same*** **system**.

### Implementing Rule 2

With our fancy new notation in hand, it's finally time to put Rule 2 into math. Let's remind ourselves of the measurements that motivated it:

1. We measure the magnetic field of the electron in the $`y`$ direction and find it to be $`1`$.
2. To ensure no shenanigans are happening, we measure it several more times in the $`y`$ direction. Every time, we find it to be $`1`$.
3. We measure the magnetic field in the $`x`$ direction and get either $`1`$ or $`-1`$ (with 50% probability of each).
4. Finally, we measure it in the $`y`$ direction again and find that it's either $`1`$ or $`-1`$ (with 50% probability of each).

At first, our electron has a magnetic field of $`1`$ in the $`y`$ direction. Let's say this means it's in the state $`\ket{y_+}`$. When we then measure this electron's $`x`$ magnetic field, it has a 50% chance of being 1 and a 50% chance of being -1. Mathematically, we might write this as

```math
\ket{y_+} = 0.5 \ket{x_+} + 0.5 \ket{x_-}
```

Say we measure the $`x`$ magnetic field. The magnetic field can now be in one of two states: $`\ket{x_+}`$ or $`\ket{x_-}`$. We then go back and measure the $`y`$ field again. From experiment, we find that there is a 50% probability of measuring -1 and a 50% probability of measuring -1. Importantly, this is true **no matter whether the electron starts off in the state $`\ket{x_+}`$ or the state $`\ket{x_-}`$.**

Let's try to write this fact in math using the same method as before:

```math
\ket{x_+} = 0.5 \ket{y_+} + 0.5 \ket{y_-} \\
\ket{x_-} = 0.5 \ket{y_+} + 0.5 \ket{y_-}
```

Hmmm. That's strange. We know for sure that "magnetic field of 1 along the $`x`$ direction" and "magnetic field of -1 in the $`x`$ direction" are two very different states. This means that $`\ket{x_+}`$ and $`\ket{x_-}`$ should be two very different objects. However, using our current model, *these states look the same when written in terms of $`\ket{y_\pm}`$*. This is a problem -- distinct states like $`\ket{x_+}`$ and $`\ket{x_-}`$ should be clearly different, no matter which way they're written.

# Solving The Problem (Next Time)

Today, we came up with a clearer way to write our "list of probabilities" model of quantum mechanics. Instead of writing the probabilities in an unmarked (and poorly rendered) column, we label each probability $`p_A`$ with a label $`\ket{A}`$ that tells us which state it represents. We then tried to apply this new formalism to our model of the electron. When we did so, we reached a new milestone: we found a problem in the theory we're developing.

Next time, we will address this problem. In doing so, we will tease out the reasoning behind one of the most confusing features of quantum mechanics.
