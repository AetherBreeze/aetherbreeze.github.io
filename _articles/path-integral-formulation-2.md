---
id: 14
title: "Path Integral Formulation (2)"
subtitle: ""
date: "2023.07.11"
tags: "qft"
---

# One Small Step At A Time

Last time, we developed the roots of the *path integral method* in quantum mechanics. In order to calculate the probability of a particle moving from one place to another, we split up a deceptively simple expression into a chain of actually simple expressions. Today, we will zoom in on one of those simple expressions and try to solve it analytically.

## A Quick Review

Let us recall our problem. We are trying to calculate the probability density of a particle moving from some point $`x_1`$ at time $`0`$ to another point $`x_2`$ at time $`t`$. Using our vector formalism of quantum mechanics, we can write this probability density as

```math
\bra{x_2} e^{i \frac{\hat{E}}{\hbar} t} \ket{x_1}
```

This simple-looking expression is actually devilishly hard to calculate. This is because of the long time gap, over which the energy operator is very complicated. It is more practical to split this path up into a bunch of little paths: say, $`x_1 \to y_1`$, $`x_1 \to y_2`$,.. $`y_{N-1} \to y_N`$, and $`y_N \to x_2`$. We can then sum over all possible intermediate points $`y_1, y_2,.. y_N`$ to recover the full probability density. In our formalism, that looks like this:

```math
\bra{x_2} e^{i \frac{\hat{E}}{\hbar} t} \ket{x_1} = \sum_{\text{all } y_1} \sum_{\text{all } y_2} ... \sum_{\text{all } y_N} (\bra{x_2} e^{i \frac{\hat{E}}{\hbar} \frac{t}{N}} \ket{y_N}) (\bra{y_N} e^{i \frac{\hat{E}}{\hbar} \frac{t}{N}} \ket{y_{N - 1}}) ... (\bra{y_2} e^{i \frac{\hat{E}}{\hbar} \frac{t}{N}} \ket{y_1}) (\bra{y_1} e^{i \frac{\hat{E}}{\hbar} \frac{t}{N}} \ket{x_1}) 
```

Let us take just one of those small intermediate probability densities:

```math
\bra{y_a} e^{i \frac{\hat{E}}{\hbar} \frac{t}{N}} \ket{y_b}
```

## The Simplest Interesting Thing

We will now continue one of the greatest traditions in theoretical physics. We will make the system as simple as mathematically possible. making things as simple as mathematically possible. This is a powerful method in your theoretical physics toolbox. Physics is complicated, and solving a system in its simplest possible state will often teach you useful tricks or patterns that can be used to solve it more generally. Whenever you're dipping your toes into a new field, it's often useful to start off with the "simplest interesting thing."

So what is the simplest interesting form of this system? Well, recall the general form of the energy operator $`\hat{E}`$:

```math
\hat{E} = \frac{\hat{P}^2}{2 m} + \hat{V}(\hat{X})
```

The simplest possible version of this is the version *without any potential energy*. In this case, the energy operator simplifies to

```math
\hat{E} = \frac{\hat{P}^2}{2 m}
```

and our tiny path probability density becomes

```math
\bra{y_a} e^{i \frac{\hat{P}^2}{2 m \hbar} \frac{t}{N}} \ket{y_b}
```

## Actually Evaluating Something

Notice how the momentum operator has suddenly showed up. This should immediately make you think of putting the system in the *momentum basis*, where each basis vector $`\ket{p_n}`$ is an eigenvector of this operator with eigenvalue $`p_a`$. Unfortunately, we're already pretty stuck with the position basis -- we're trying to calculate the probability of moving from one point to another, after all. Thus the best we can do is find some other way to stick momentum basis vectors in here.

In fact, you might remember that we've already solved this problem. Just last time we derived a very clever way to insert basis vectors into an expression without changing it:

```math
\sum_{p_n} \ket{p_n} \bra{p_n} = 1
```

We derived this expression using position basis vectors. However, since the rule of unity applies to *every* set of basis vectors, we can easily generalize it to use momentum basis vectors instead. Using this identity, we can insert $`1`$ into the expression to get

```math
\sum_{p_n} \bra{y_a} e^{i \frac{\hat{P}^2}{2 m \hbar} \frac{t}{N}} \ket{p_n} \bra{p_n} \ket{y_b}
```

Now we're talking. We showed in the quantum mechanics speedrun that if $`\ket{p_n}`$ is an eigenvector of $`\hat{P}`$ with eigenvalue $`p_n`$, it's also an eigenvalue of $`e^{\hat{P}}`$ with eigenvalue $`e^{p_n}`$. Thus we can finally get rid of this troublesome operator by letting it do act on a momentum eigenvector:

```math
\sum_{p_n} \bra{y_a} e^{i \frac{p_n^2}{2 m \hbar} \frac{t}{N}} \ket{p_n} \bra{p_n} \ket{y_b}
```

Since this middle term is now just a number, we can take it out of the dot product to get

```math
\sum_{p_n} e^{i \frac{p_n^2}{2 m \hbar} \frac{t}{N}} \bra{y_a} \ket{p_n} \bra{p_n} \ket{y_b}
```

## Momentum And Position Dot Products

We're done with the first of two tricky parts. Now that we've turned the operator into a scalar, we can get to evaluating these dot products. The question then becomes: what is the dot product of a position basis vector with a momentum basis vector?

```math
\bra{y_a} \ket{p_n} = \text{?}
```

To answer this question, we need to figure out what a momentum basis vector $`\ket{p_n}`$ looks like in the position basis. To this end, we need only recall that these basis vectors are eigenvectors of the momentum operator $`\hat{P}`$. In the position basis this operator is

```math
\hat{P} = i \hbar \frac{d}{dx}
```

A momentum basis vector written in the position basis is a function $`\ket{p_n}(x)`$ that satisfies

```math
\hat{P} \ket{p_n}(x) = i \hbar \frac{d}{dx} \ket{p_n}(x) = p_n \ket{p_n}(x)
```

This is just about the easiest differential equation in calculus. The solution is

```math
\ket{p_n}(x) = e^{-i \frac{p_n x}{\hbar}}
```

To make the position basis more obvious, we can write this as a sum over position basis vectors:

```math
\ket{p_n}(x) = \sum_{x_m} e^{-i \frac{p_n x_m}{\hbar}} \ket{x_m}
```

With this expression, the dot product becomes trivial:

```math
\bra{y_a} \ket{p_n} = \bra{y_a} \sum_{x_m} e^{-i \frac{p_n x_m}{\hbar}} \ket{x_m} = \sum_{x_m} e^{-i \frac{p_n x_m}{\hbar}} \bra{y_a} \ket{x_m} = e^{-i \frac{p_n y_a}{\hbar}}
```

With a single stroke, we can also calculate the other dot product. Note that because this momentum operator is a covector $`\bra{p_n}`$, we must take the its complex conjugate, cancelling the minus sign on the exponential:

```math
\bra{p_n} \ket{y_b} = \bra{x_m} \sum_{x_m} e^{i \frac{p_n x_m}{\hbar}} \ket{y_b} = e^{i \frac{p_n y_b}{\hbar}}
```

## Something Simpler(?)

We have now evaluated every part of this little path's probability density. Let's put it all together. Drumroll, please:

```math
\bra{y_a} e^{i \frac{\hat{P}^2}{2 m \hbar} \frac{t}{N}} \ket{y_b} = \sum_{p_n} e^{i \frac{p_n^2}{2 m \hbar} \frac{t}{N}} \bra{y_a} \ket{p_n} \bra{p_n} \ket{y_b} = \sum_{p_n} e^{i \frac{p_n^2}{2 m \hbar} \frac{t}{N}} e^{-i \frac{p_n y_a}{\hbar}} e^{i \frac{p_n x_m}{\hbar}} = \sum_{p_n} e^{i \frac{p_n^2}{2 m \hbar} \frac{t}{N}} e^{i \frac{p_n (y_a - y_b)}{\hbar}}
```

This... doesn't look any better. In fact, this arguably looks worse. How the hell are we supposed to actually calculate this?

The answer is twofold. First of all, since we're dealing with the position (and momentum) of a particle, it's reasonable to assume there are continuously many possible positions. Thus we can take the continuous limit and turn this sum into an integral:

```math
\sum_{p_n} e^{i \frac{p_n^2}{2 m \hbar} \frac{t}{N}} e^{i \frac{p_n (y_a - y_b)}{\hbar}} \to \int e^{i \frac{p_n^2}{2 m \hbar} \frac{t}{N}} e^{i \frac{p_n (y_a - y_b)}{\hbar}} dp_n
```

One would be well excused for thinking we've made things even worse. However, the trained physicists among you might know better. What we have just written is a very famous expression, not just in physics, but in classical mathematics as well. It is nothing other than a **Gaussian integral,** and a large chunk of quantum mechanics is based on its evaluation.

Next time, we will walk through the evaluation which forms the basis for much of quantum field theory.
