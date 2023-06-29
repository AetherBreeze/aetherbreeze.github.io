---
id: 9
title: "Quantum Mechanics Speedrun (10)"
subtitle: ""
date: "2023.06.28"
tags: "qft"
---

# The Value Of Eigenvalues

Last time, we finally wrote down the equation of motion for quantum systems. In doing so, we came across a peculiar matrix $`\hat{E}`$ whose eigenvectors were the energy states $`\ket{E_1}, \ket{E_2},.. \ket{E_N}`$ and whose eigenvalues were the corresponding energies. Today, we will explore this entire class of matrices, and derive some properties that will be useful for measurement.

## Average Value Matrices

Consider again the matrix $`\hat{E}`$. Its eigenvectors are the energy states, and its eigenvalues are the observable energy values of those states. In that same vein, we could consider such a matrix for any set of states. Such a matrix is called an **average value matrix**. This is, unsurprisingly, because it can be used to calculate the average (or "expected") rest of measuring a quantum system.

It's quite easy to see why. Assume we've written a system $`\ket{S}`$ in terms of some observable value $`V`$ with $`N`$ states. That is to say, we've written $`\ket{S}`$ as

```math
\ket{S} = p_1 \ket{V_1} + p_2 \ket{V_2} +.. p_N \ket{V_N}
```

where the squared magnitude $`|p_a|^2`$ is the probability of measuring the value $`\ket{V_a}`$.

If we then measured the value of $`V`$ for this system, the "average" value we would expect to get would be

```math
\text{average}(V) = \sum_{a=1}^N |p_a|^2 V_a
```

Let's think about how we could get this value using linear algebra. We already defined a dot product such that the product of a vector like $`\ket{S}`$ with itself is

```math
\bra{S} \ket{S} = \sum_{a=1}^N p_a^* p_a = \sum_{a=1}^N |p_a|^2
```

(which, recall, should equal $`1`$)

This is already almost what we want. If we could just multiply every component $`\ket{V_a}`$ of $`\ket{S}`$ with its corresponding observable value $`V_a`$, we would have exactly what we need.

Of course, the energy matrix has already given away the answer. Let us define the **average value matrix of $`V`$**, as written in the $`\ket{V_a}`$ basis, as

```math
\hat{V} = \begin{bmatrix} V_1 && 0 && ... \\ 0 && V_2 && ... \\ ... && 0 && V_N \end{bmatrix}
```

Then it's easy to see that $`\hat{V} \ket{S}`$ is exactly what we want:

```math
\hat{V} \ket{S} = p_1 V_1 \ket{V_1} + p_2 V_2 \ket{V_2} +.. p_N V_N \ket{V_N}
```

Taking the dot product of this with a pristine $`\ket{S}`$ then gives us the "average" value, as desired:

```math
\bra{S} \hat{V} \ket{S} = \sum_{a=1}^{N} p_a^* V_a p_a = \sum_{a=1}^{N} V_a |p_a|^2 = \text{average}(V)
```

## Useful Quirks Of Average Value Matrices

Average value matrices are extremely useful in quantum mechanics for a simple reason: they tell us the average (or "expected") result of an experiment. Thus it is worth spending a little time getting to know them so we can make better predictions. In doing so, we will discover a very useful structure of linear algebra.

We'll start by listing a few properties we want average value matrices to satisfy:

1. All measured values are real numbers. Since the eigenvalues of an average value matrix are the possible results of measurement, **the eigenvalues of an average value matrix must be real.**
2. The eigenvectors of an average value matrix are the possible states of a system. Since a system can only be measured in one state at a time, **the eigenvectors of an average value matrix wit hdifferent eigenvalues must be orthogonal.**

This is a good example of how physics is translated into math. We start with a few physical properties (measurements must be real numbers, states are orthogonal). Then, we find mathematical ways to express those properties. Finally, we look for (or invent) an overarching concept in mathematics that fits the bill we've just drawn up.

## Stealing Mathematicians' Work

In this case, the math people have done our work for us. There is already a well-known family of matrices in linear algebra with real eigenvalues and orthogonal eigenvectors: the **conjugate-transpose-invariant matrices**.

CT-invariant matrices almost explain themselves. There are two things we can do to a matrix $`\hat{X}`$: take its conjugate (which sends each value $`x_{ab} \to x_{ab}^*`$), and take its transpose $`x_{ab} \to x_{ba}`$. The conjugate transpose (commonly denoted $`\hat{X}^\dag`$) is found by taking both. A conjugate-transpose-invariant matrix, then, is one which is equal to its conjugate transpose:

```math
\hat{X}^\dag = \hat{X} \implies x_{ab} = x_{ba}^*
```

This may seem like a complex property. However, in time, we will see it is both simple and useful. Many calculations will become simpler by virtue of a matrix being conjugate-transpose-invariant.

## Checking It Twice

So why does a conjugate-transpose-invariant (CT-invariant) matrix fit our two requirements? It's actually very easy to see.

We'll start with the easiest of two easy requirements: that the eigenvalues of a CT-invariant matrix $`\hat{X}`$ be positive. This follows almost directly from noting that *if a matrix equation holds in one basis, then it most hold in all bases*. As such, we are free to choose a basis in which $`\hat{X}`$ is diagonal. In this basis, the values on the diagonal $`x_{aa}`$ are just the eigenvalues of $`\hat{X}`$, and the CT-invariant property requires that

```math
x_{aa} = x_{aa}^*
```

Thus a CT-invariant matrix must have strictly real eigenvalues. Easy enough.

Now for the second requirement: that eigenvectors of CT-invariant matrices with distinct eigenvalues must be orthogonal. (Remember, this follows from the requirement that systems can only be measured in one state at a time).

Consider two eigenvectors $`\ket{V_A}`$ and $`\ket{V_B}`$ of a CT-invariant matrix $`\hat{V}`$ with eigenvalues $`V_A`$ and $`V_B`$ respectively. Then consider the dot product of $`\ket{V_A}`$ with $`\hat{V} \ket{V_B}`$:

```math
\bra{V_A} \hat{V} \ket{V_B}
```

Since $`\ket{V_B}`$ is an eigenvector of $`\hat{V}`$, this is just

```math
\bra{V_A} V_B \ket{V_B} = V_B \bra{V_A} \ket{V_B}
```

Similarly, we may consider the dot product of $`\hat{V} \ket{V_A}`$ with $`\ket{V_B}`$. We have to be careful here. When we take the complex transpose of $`\ket{V_A}`$ to get $`\bra{V_A}`$, we must also take the conjugate transpose of $`\hat{V}`$. Thus in order to get $`\bra{V_A} \hat{V} \ket{V_B}`$ again, we must consider

```math
\hat{V}^\dag \ket{V_A}
```

That way, when we take the dot product of $`\hat{V}^\dag \ket{V_A}`$ and $`\ket{V_B}`$, we'll have

```math
(\hat{V}^\dag \ket{V_A})^\dag \ket{V_B} = \bra{V_A} \hat{V} \ket{V_B}
```

But of course, since $`\hat{V}`$ is a CT-invariant matrix, $`\hat{V}^\dag = \hat{V}`$. Thus we have

```math
\hat{V}^\dag \ket{V_A} = \hat{V} \ket{V_A} = V_A \ket{V_A}
```

and thus

```math
(\hat{V}^\dag \ket{V_A})^\dag \ket{V_B} = \bra{V_A} \hat{V} \ket{V_B} = V_A \bra{V_A} \ket{V_B}
```

Putting everything together, we get

```math
V_A \bra{V_A} \ket{V_B} = V_B \bra{V_A} \ket{V_B}
```

Since the eigenvalues are nonzero in general, this leaves us with two options: either the eigenvalue are the same ($`V_A = V_B`$), or the eigenvectors are orthogonal $`\bra{V_A} \ket{V_B} = 0`$. Thus the eigenvectors of a CT-invariant matrix are orthogonal if their eigenvalues are different, as desired.

## Next Time

Believe it or not, we've almost covered all of (the fundamentals of) quantum mechanics. Next time, we'll take the tools we've been developing on discrete systems and generalize them once and for all to continuous systems. We'll try to end by deriving the third and most well-known form of the Schrodinger equation.