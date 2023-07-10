---
id: 13
title: "Path Integral Formulation (1)"
subtitle: ""
date: "2023.07.010"
tags: "qft"
---

# The Path Integral Formulation

After our week-long break, we're finally back to delve into true quantum field theory. We will start with the formalism of quantum mechanics that we just finshed developing. We'll jump through a series of mathematical hoops to reach another formalism: the *path integral formalism*, famously developed by Richard Feynman.

## A Quick Review

Recall our formalism of quantum mechanics. A quantum system $`\ket{S}`$ is written as a (possibly infinite-dimensional) vector, where the basis vectors $`\ket{s_n}`$ represent the possible states of the system. The coefficient $`p_n`$ of each such basis vector is a complex number whose squared magnitude is the probability of measuring the system in state $`s_n`$.

To serve this "complex magnitude = probability" concept, we invented a generalization of the dot product. Given two quantum systems $`\ket{A}`$ and $`\ket{B}`$ with complex components $`a_n`$ and $`b_n`$, we define the complex dot product to be

```math
\bra{A} \ket{B} = \sum_{N} a_n^* b_n
```

This new element $`\bra{A}`$ has a life of its own. It is called the *covector* of $`\ket{A}`$, and its components $`a_n^*`$ are the complex conjugates of $`\ket{A}`$'s components. 

This formalism is useful because it allows us to easily calculate the probability of a quantum system being measured in a certain state. To see this, note that the dot product of a system $`\ket{A}`$ with a specific state's basis vector $`\ket{a_n}`$ is

```math
\bra{a_n} \ket{A} = p_n
```

Thus the probability of measuring the system $`\ket{A}`$ in state $`a_n`$ is just the squared magnitude of this dot product:

```math
\text{prob(measure A in state n) } = |p_n|^2 = |\bra{a_n} \ket{A}|^2
```

One might quite reasonably ask why we would ever want to do this nonsense, when we could so easily extract the $`n`$th component of $`\ket{A}`$ and find its magnitude. We will see the answer soon.

## Where Is The Particle?

With this in mind, let us try to answer perhaps the "simplest" question we can. Given a particle at position $`x_1`$ at time $`0`$, what is the probability of measuring it at position $`x_2`$ at time $`t`$?

Let's answer this question in parts. We start off with a particle in position $`x_1`$:

```math
\ket{S} = \ket{x_1}
```

We then wait until time $`t`$. Recall that in our formalism, this just means acting on the state with the **time-evolution operator** $`e^{i \frac{\hat{H}}{\hbar} t}`$:

```math
\ket{S}(t) = e^{i \frac{\hat{H}}{\hbar} t} \ket{S}(0) = e^{i \frac{\hat{H}}{\hbar} t} \ket{x_1}
```

Finally, to find the probability of measuring this particle at position $`x_2`$, we take the dot product with the basis vector $`\ket{x_2}`$:

```math
\bra{x_2} e^{i \frac{\hat{H}}{\hbar} t} \ket{x_1}
```

This is the fundamental "thing" we want to calculate. Unfortunately, as is often the case in quantum mechanics, actually doing so is an incredible pain. The time evolution operator of an interesting system is extremely complicated, so much so that this equation can often only be solved approximately. Thus this expression, while simple, is not terribly helpful.

To solve this problem, we turn to one of the most powerful tricks in physics: *zooming in*. Right now, we're looking at two states at significantly different times: time $`0`$ and time $`t`$. What if we instead look at the little steps the particle might take at each interval of time $`\delta t`$?

## Slicing Up The Path

Let's take another look at that deceptively simple expression:

```math
\bra{x_2} e^{i \frac{\hat{H}}{\hbar} t} \ket{x_1}
```

This is hard to calculate because of the large time jump. To solve this, We want to "chop" this path up into little intervals of time and calculate each little interval individually. Let's say we chop it up into $`N`$ equally long intervals:

```math
\bra{x_2} e^{i \frac{\hat{H}}{\hbar} \sum_{a=1}^N \frac{t}{N}} \ket{x_1}
```

We can then use a highly convenient property of $`e`$: turning sums in the exponent into products of exponentials:

```math
\bra{x_2} e^{i \frac{\hat{H}}{\hbar} \frac{t}{N}} e^{i \frac{\hat{H}}{\hbar} \frac{t}{N}} e^{i \frac{\hat{H}}{\hbar} \frac{t}{N}} ... \ket{x_1} = \bra{x_2} \Pi_{a=1}^N e^{i \frac{\hat{H}}{\hbar} \frac{t}{N}} \ket{x_1}
```

This is the first step. We've managed to split the single, complicated time evolution operator into several simple time evolution operators. However, these operators aren't much help unless they have something to act on. That brings us to the real trick of the path integral formulation:

## Integrating Over Paths

I've always said the defining nature of a good name is that it makes descriptions irrelevant.

We want to find some states we can let the small, simple time evolution operators act on in the path expansion:

```math
\bra{x_2} e^{i \frac{\hat{H}}{\hbar} \frac{t}{N}} e^{i \frac{\hat{H}}{\hbar} \frac{t}{N}} e^{i \frac{\hat{H}}{\hbar} \frac{t}{N}} ... \ket{x_1}
```

We've already chopped up time into small chunks. It's intuitive, then, that we might want to chop up distance into small chunks as well. That is, we might try to calculate (probability of moving from $`x_1`$ to $`x_2`$) as

```math
\text{prob}(x_1 \to x_2) = \sum_{\text{all } y_1} \sum_{\text{all } y_2} ... \sum_{\text{all } y_N} \text{prob}(x_1 \to y_1) \text{prob}(y_1 \to y_2) ... \text{prob}(y_{N - 1} \to y_N) \text{prob}(y_N \to x_2)
```

In our formulation, we could write each of these intervals pretty simply as a dot product:

```math
\text{prob}(x_1 \to x_2) ?= \sum_{\text{all } y_1} \sum_{\text{all } y_2} ... \sum_{\text{all } y_N} (\bra{x_2} e^{i \frac{\hat{H}}{\hbar} \frac{t}{N}} \ket{y_N}) (\bra{y_N} e^{i \frac{\hat{H}}{\hbar} \frac{t}{N}} \ket{y_{N - 1}}) ... (\bra{y_2} e^{i \frac{\hat{H}}{\hbar} \frac{t}{N}} \ket{y_1}) (\bra{y_1} e^{i \frac{\hat{H}}{\hbar} \frac{t}{N}} \ket{x_1}) 
```

## Ideas Unto Math

But we already know what $`\text{prob}(x_1 \to x_2)`$ is. Thus we can put this idea to the mathematical test:

```math
\bra{x_2} e^{i \frac{\hat{H}}{\hbar} \frac{t}{N}} e^{i \frac{\hat{H}}{\hbar} \frac{t}{N}} e^{i \frac{\hat{H}}{\hbar} \frac{t}{N}} ... \ket{x_1} = \sum_{\text{all } y_1} \sum_{\text{all } y_2} ... \sum_{\text{all } y_N} (\bra{x_2} e^{i \frac{\hat{H}}{\hbar} \frac{t}{N}} \ket{y_N}) (\bra{y_N} e^{i \frac{\hat{H}}{\hbar} \frac{t}{N}} \ket{y_{N - 1}}) ... (\bra{y_2} e^{i \frac{\hat{H}}{\hbar} \frac{t}{N}} \ket{y_1}) (\bra{y_1} e^{i \frac{\hat{H}}{\hbar} \frac{t}{N}} \ket{x_1}) 
```

Luckily for us, these two sides are already pretty similar. In fact, all that's changed on the right side is that we've inserted $`\sum_{\text{all } y_a} \ket{a} \bra{a}`$ for all the intermediate points $`y_a`$. Thus to show that our "sum over little paths" idea holds, we have to show that

```math
\sum_{\text{all } y_a} \ket{y_a} \bra{y_a} = 1
```

This is a bit tricky. We're used to calculating things like $`\bra{x} \ket{y}`$, not things like $`\ket{x} \bra{y}`$. The answer, as usual, is to retrofit the new in terms of the old.

Let us pick a state -- any state -- $`\ket{y}`$. We can then multiply both sides on the left by $`\bra{y}`$ and on the right by $`\ket{y}`$:

```math
\sum_{\text{all } y_a} \bra{y} \ket{y_a} \bra{y_a} \ket{y} = \bra{y} \ket{y}
```

The right side is just the dot product of a basis vector with itself. Since the length of all basis vectors is $`1`$, this simplifies to

```math
\sum_{\text{all } y_a} \bra{y} \ket{y_a} \bra{y_a} \ket{y} = 1
```

Through a clever trick, we've turned this unfamiliar element into something we know how to calculate: a couple of dot products. Not only that, but dot products between basis vectors. This is about as easy as it gets: the dot product $`\bra{y} \ket{y_a}`$ is $`1`$ if they're the same basis vector, and $`0`$ otherwise. Thus if we sum over all the basis vectors $`\ket{y_a}`$, it reduces to just

```math
\bra{y_a} \ket{y_a} \bra{y_a} \ket{y_a} = (1) (1) = 1
```

Nice! Through some deft mathematical trickery, we've managed to prove that

```math
\sum_{\text{all } y_a} \ket{y_a} \bra{y_a} = 1
```

and thus that we can insert these elements into $`\bra{x_2} e^{i \frac{\hat{H}}{\hbar} \frac{t}{N}} e^{i \frac{\hat{H}}{\hbar} \frac{t}{N}} e^{i \frac{\hat{H}}{\hbar} \frac{t}{N}} ... \ket{x_1}`$ without messing anything up.

Thus we reach the fundamental goal of this exercise: reducing a complex expression that looks simple into a simple expression that looks complex:

```math
\bra{x_2} e^{i \frac{\hat{H}}{\hbar} t} \ket{x_1} = \sum_{\text{all } y_1} \sum_{\text{all } y_2} ... \sum_{\text{all } y_N} (\bra{x_2} e^{i \frac{\hat{H}}{\hbar} \frac{t}{N}} \ket{y_N}) (\bra{y_N} e^{i \frac{\hat{H}}{\hbar} \frac{t}{N}} \ket{y_{N - 1}}) ... (\bra{y_2} e^{i \frac{\hat{H}}{\hbar} \frac{t}{N}} \ket{y_1}) (\bra{y_1} e^{i \frac{\hat{H}}{\hbar} \frac{t}{N}} \ket{x_1}) 
```

The first expression is compact, but involves a long time gap and is near-impossible to calculate. The second expression has a lot of terms, but since they all deal with a very small distance and time gap, we might actually be able to evaluate them.

## Next Steps

Today, we discovered the fundamentals of Feynman's greatest idea: the *path integral method* of quantum mechanics. We chopped up a simple-looking "global" expression into a bunch of simpler "local" parts. Next time, we'll take a closer look at one of these local parts and see if we can evaluate it.
