---
id: 2
title: "Quantum Mechanics Speedrun (3)"
subtitle: ""
date: "2023.06.21"
tags: "qft"
---

# Why Nature Must Be Complex

Last time, we took our "list of probabilities" model of quantum mechanics and found a cleaner way to write it. Given a system $`S`$ that can take on $`N`$ values $`V_1, V_2,.. V_N`$ with respective probabilities $`p_1, p_2,.. p_N`$, we write it as

```math
S = p_1 \ket{V_1} + p_2 \ket{V_2} +.. p_N \ket{V_N}
```

This is an upgrade over our previous system for two reasons. First, the measured value associated with each probability is much clearer than it was in the "list of numbers" model. Second, it allows us to integrate a previously unaccounted-for phenomenon of quantum mechanics: that of *conjugate values*, where measuring the value of one property affects the probabilities of other properties. This is one of the two main facets of "quantum weirdness." Today, we will explore it further and derive a more general model of quantum mechanics.

## Keeping Different States Different

When coming up with new theories, it often helps to study the simplest objects possible. We have been following this maxim by studying the magnetic field of an electron. This system has three possible "observables" (for our purposes): the components of the magnetic field in the $`x`$, $`y`$, and $`z`$ directions. Each observable can take on two values: 1 or -1. As such, we can write this model using math in three ways:

```math
\text{magnetic field } = a_1 \ket{y_+} + a_2 \ket{y_-} \\
\text{magnetic field } = b_1 \ket{x_+} + b_2 \ket{x_-} \\
\text{magnetic field } = c_1 \ket{z_+} + c_2 \ket{z_-}
```

From (purported) experiment, we know that the components in the $`x`$ and $`y`$ directions are *conjugate*. Let's break down what that means. In experiment, if we measure the magnetic field in the $`y`$ direction, then we know that our next measurement of the field in the $`x`$ direction will be $`1`$ and $`-1`$ with equal probability. This is true **regardless of what value we measure in the $`y`$ direction.** Mathematically, we might say that

```math
\ket{y_+} = 0.5 \ket{x_+} + 0.5 \ket{x_-} \\
\ket{y_-} = 0.5 \ket{x_+} + 0.5 \ket{x_-}
```

This is a problem. The states $`\ket{y_+}`$ and $`\ket{y_-}`$ are very clearly different; their difference can be physically measured by shooting the electron through a magnetic field and seeing which way it curves. However, using our current model, they're written the same way. In fact, using the "list of probabilities" model, there's really no other way they *could* be written. Thus we have a conflict: physics demands that $`\ket{y_+}`$ and $`\ket{y_-}`$ are different, while our model demands that they are the same. Something has to give.

## A New Model

There's no contest. If our model does not adequately describe how the universe behaves, then our model must change. This isn't a bad thing; rather, it is a common and necessary part of developing new physics. When a model fails, it doesn't mean that we have failed; it means that we have learned a new constraint of the universe.

That said, we don't want to change *too* much. Our "list of probabilities" model was not fully unfounded. In fact, it did an excellent job of capturing the discrete and probabilistic nature of reality. All we need to do is tweak it a little.

Let's think. Writing a simple list of probabilities didn't work, because if two values are conjugate, different states might yield the same lists of probabilities. However, we still want to preserve the idea of "lists of probabilities" in spirit. Is there a way we could write a list of numbers that are *related* to the probabilities, but that allow for duplication?

### Negative "Probabilities"

Here's an idea. What if, instead of a list of probabilities, we write a list of *square roots* of probabilities?

This is a surprisingly elegant solution. Since every positive number has two square roots, it allows us to write distinctly write two states with equal probabilities. For example, the problematic $`\ket{y_+}`$ and $`\ket{y_-}`$ could be written as

```math
\ket{y_+} = \sqrt{0.5} \ket{x_+} + \sqrt{0.5} \ket{x_-} \\
\ket{y_-} = \sqrt{0.5} \ket{x_+} - \sqrt{0.5} \ket{x_-}
```

These two states are now different, so physics is happy. Furthermore, the squares of the coefficients of $`\ket{x_\pm}`$ are all $`0.5`$, so our model is correct. Nice!

This is a great example of how to fix a failing model. Instead of throwing the whole thing out and starting over, we identified the point of contention, then proposed a minimal fix that resolves the problem while keeping the "idea" of the theory intact. Every physicist who's done anything has made incorrect models (usually far more than correct ones), so this method puts you in good company.

## A Bigger Problem

Unfortunately, no sooner do we patch this leak in our theory than we come across another one. The unvierse, it seems, is not without a sense of humor.

The problem was hidden at the very beginning of this article. It arises when we consider not just the components of the magnetic field in the $`x`$ and $`y`$ directions, but the $`z`$ direction as well:

```math
\text{magnetic field } = a_1 \ket{y_+} + a_2 \ket{y_-} \\
\text{magnetic field } = b_1 \ket{x_+} + b_2 \ket{x_-} \\
\text{magnetic field } = c_1 \ket{z_+} + c_2 \ket{z_-}
```

It should be fairly clear that the labels $`x`$, $`y`$, and $`z`$ are arbitrary. We could swap them around without changing the physics. Thus if we measure the magnetic field in the $`z`$ direction, then in the $`x`$ direction, it should act the same as if we measured it in the $`y`$ and $`x`$ directions. This means that the $`\ket{z_\pm}`$ states should also have probabilities of $`0.5`$ for $`\ket{x_+}`$ and $`\ket{x_-}`$:

```math
\ket{z_+} = \sqrt{0.5} \ket{x_+} + \sqrt{0.5} \ket{x_-} \\
\ket{z_-} = \sqrt{0.5} \ket{x_+} - \sqrt{0.5} \ket{x_-}
```

Unfortunately, by the same symmetry argument, $`\ket{y_\pm}`$ and $`\ket{z_\pm}`$ are also conjugate. Thus the states $`\ket{y_\pm}`$ can't be equal to the states $`\ket{z_\pm}`$. This is a problem because our "negative square roots" solution only allows us one extra permutation of the probabilities. At first, we might think we can get away with

```math
\ket{z_+} = -\sqrt{0.5} \ket{x_+} - \sqrt{0.5} \ket{x_-} \\
\ket{z_-} = -\sqrt{0.5} \ket{x_+} + \sqrt{0.5} \ket{x_-}
```

Unfortunately, on closer inspection this is just

```math
\ket{z_+} = -\ket{y_+} \\
\ket{z_-} = -\ket{y_-}
```

and we end up with the same problem.

## Complex Probabilities

With the addition of the $`z`$ direction, it is now clear that simply allowing for negative square roots of probabilities is not enough. What we really need is a way of encoding the same probabilities not one, not two, but an infinite number of ways. This would solve all future issues with such "probability collisions".

Fortunately, mathematics has a ready-made tool waiting for us. It has already been hinted at by our use of square roots.

First, we modeled quantum systems with a list of probabilities.

Next, we modeled them as a list of numbers whose squares yielded the probabilities.

**Now, we will model them as a list of** ***complex numbers*** **whose squared magnitudes yield the probabilities.**

This solves our problem now and forever. There are only two real numbers that square to 0.5, but *there are an infinite amount of complex numbers with squared length 0.5* ($`\sqrt{0.5}e^{i a}`$, for all $`a`$). Thus we will never again have to worry about two different states having the same representation.

Let's put this idea into action. We need to write four different states ($`\ket{y_\pm}, \ket{z_\pm}`$) such that they all have a probability of $`0.5`$ for both $`\ket{x_+}`$ and $`\ket{x_-}`$. This might look something like

```math
\ket{y_+} = \sqrt{0.5} \ket{x_+} + \sqrt{0.5} \ket{x_-} \\
\ket{y_-} = \sqrt{0.5} \ket{x_+} - \sqrt{0.5} \ket{x_-} \\
\ket{z_+} = i \sqrt{0.5} \ket{x_+} + \sqrt{0.5} \ket{x_-} \\
\ket{z_-} = i \sqrt{0.5} \ket{x_+} - \sqrt{0.5} \ket{x_-}
```

## Nature is Complex

We are almost done developing our model of quantum mechanics. All the bugs have been ironed out; all that remains is to take what we have and unite it with one of the most well-studied and powerful fields in all of mathematics.
