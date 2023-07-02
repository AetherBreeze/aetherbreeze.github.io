---
id: 10
title: "Quantum Mechanics Speedrun (11)"
subtitle: ""
date: "2023.06.29"
tags: "qft"
---

# To Infinity And Beyond (Again)

Last time, we derived the last fundamental concepts of quantum mechanics in the discrete case. Today, we will generalize these concepts to the continuous case.

## What Are Continuous Matrices?

We will start by generalizing our quantum equation of motion:

```math
-i \hbar \frac{d}{dt} \ket{S} = \hat{E} \ket{S}
```

This equation was derived using discrete systems $`\ket{S}`$. In these systems, $`\hat{E}`$ is the energy matrix -- a matrix whose eigenvectors are the system's energy states, and whose eigenvalues are the corresponding energies. However, for continuous systems $`\ket{S(x)}`$, it's a bit more complicated. We can't simply write a martix with a continuous number of rows and columns. We'll have to dig a bit deeper.

Thus, we ask ourselves: what *is* a matrix?

Perhaps more useful, and in my mind equivalent: what does a matrix *do*?

This more "functional" question helps a lot. A matrix is not simply a square of numbers. Rather, a matrix $`\hat{M}`$ represents a *linear transformation* on a vector. A matrix is a function such that for any vectors $`\ket{A}, \ket{B}`$ and any constants $`x, y`$,

```math
\hat{M}(x \ket{A} + y \ket{B}) = x \hat{M} \ket{A} + y \hat{M} \ket{B}
```

Read closely, this is important. The above equation is not *a property* of matrices -- it is *the definition* of a matrix. It just so happens that, when the vectors $`\ket{A}, \ket{B}`$ are discrete, all such transformations $`\hat{M}`$ can be written as squares of numbers (in some given basis).

This functional view answers our earlier question: what is a continuous matrix that operates on continuous vectors $`\ket{V(x)}`$? It's some "operator" $`\hat{M(x)}`$ that acts on vectors in a way that satisfies

```math
\hat{M(x)}(c \ket{A(x)} + d \ket{B(x)}) = c \hat{M(x)} \ket{A(x)} + d \hat{M(x)} \ket{B(x)}
```

## Matrices and Operators

This generalization is so significant that it's no longer helpful to call these things "matrices". The term "matrix" represents that, for discrete systems, a linear transformation can be written as a literal matrix of numbers. Once we leave the discrete, the term becomes at best vestigal; at worst, misleading. Thus we must come up with a new name for these things.

At its core, a "matrix" is a thing that operates on a vector to produce another vector. We will call a general object that acts in this way an ***operator***:

***Definition:*** An ***operator*** $`\hat{M}`$ is something that acts on a vector $`\ket{S}`$ to produce a new vector $`\hat{M} \ket{S}`$

Note that this definition is more general than a matrix. We call an operator that satisfies the matrix condition (given above) a ***linear operator***:

***Definition***: A ***linear operator*** $`\hat{M}`$ is an operator that satisfies

```math
\hat{M}(c \ket{A} + d \ket{B}) = c \hat{M} \ket{A} + d \hat{M} \ket{B}
```

for any vectors $`\ket{A}, \ket{B}`$ and constants $`c, d`$.

Note that linear operators, like matrices, can have eigenvectors and eigenvalues. A vector $`\ket{S}`$ is an *eigenvector* of some operator $`\hat{M}`$ iff

```math
\hat{M} \ket{S} = m \ket{S}
```

for some constant $`m`$, which is called $`\ket{S}`$'s *eigenvalue*.

## Examples of Linear Operators

The best way to remember a new thing is to play around with examples of it. As such, let's play a little with some examples and understand why they work.

We'll start with perhaps the simplest linear operator. We can define an operator $`\hat{M(x)}`$ that simply multiplies the vector by a function:

```math
\hat{M(x)} \ket{S} = M(x) \ket{S}
```

From the basic properties of multiplication, we can easily see that

```math
\hat{M(x)} (c \ket{A} + d \ket{B}) = c M(x) \ket{A} + d M(x) \ket{B}
```

and thus this is indeed a linear operator.

A more subtle linear operator, and one we will make *extensive* use of, is differentiation. Define the operator $`\hat{D_x}`$'s action on a continuous vector $`\ket{S(x)}`$ as

```math
\hat{D_x} \ket{S(x)} = \frac{d}{dx} \ket{S(x)}
```

From the properties of differentiation, we can again check that

```math
\hat{D_x} (c \ket{A(x)} + d \ket{B(x)}) = \frac{d}{dx} (c \ket{A(x)} + d \ket{B(x)}) = c \frac{d}{dx} \ket{A(x)} + d \frac{d}{dx} \ket{B(x)}
```

and thus the differentiation operator $`\hat{D_x}`$ is a linear operator.

These are simple examples of linear operators. They are also the only two types of operators used by most in quantum mechanics. Indeed, we have already seen the differentiation operator show up:

```math
i \hbar \frac{d}{dt} \ket{S} = \hat{E} \ket{S}
```

The operator in this case is

```math
\hat{E} = i \hbar \frac{d}{dt}
```

If you've seen enough background whiteboards in video games, this one might even look a little familiar...

With this definition of "continuous matrices" under our belt, we can turn to generalizing the other new concept: average value matrices. An *average value matrix* $`\hat{P}`$ for an observable property $`p`$ is one whose eigenvectors are the states with constant values of $`p`$, and whose eigenvalues are those values of $`p`$. The energy matrix $`\hat{E}`$ is a specific case of this for the observable property of energy. These matrices are crucial for making experimental predictions, so generalizing them is very important.

## How To Measure Continuous Systems

Now that we've generalized matrices to linear operators, it's time to look at their main use in quantum mechanics: average value operators. 

Average value operators are the most powerful tool for making predictions using quantum mechanics. An average value matrix $`\hat{P}`$ for some observable property $`p`$ is a matrix whose eigenvectors are the states of constant $`p`$, and whose eigenvalues are the corresponding values of $`p`$. We can use this operator to calculate the *average value* we get when we measure the value of $`p`$ for a system $`\ket{S}`$:

```math
\text{average}(P)\ket{S} = \bra{S} \hat{P} \ket{S} 
```

There are two things we need to do to make this continuous. First, we generalize $`\hat{P}`$ from a matrix to a linear operator. Second, since there's an inner product happening here, we need to express it as an integral:

```math
\text{average}(P)\ket{S(x)} = \int S(x)^* \hat{P} \ket{S} dx
```

Note that, in accordance with our complex dot product, we have turned $`\bra{S}`$ into the complex conjugate $`S(x)^*`$.

## The Simplest Average Value Operator

As with linear operators, we will reinforce this concept of continuous systems with some simple examples. We will do so by considering the simplest average value operator: the average value operator for position, $`\hat{X}`$.

This is the simplest operator because we often work in the position basis. For some particle, let $`\ket{S(x)}`$ be the probability density of finding the particle at location $`x`$. Then the basis vector for a particle at position $`X`$ would just be $`\delta(x - X)`$. To check this, let's confirm that the dot product of this basis vector with $`\ket{S(x)}`$ extracts $`S(x)`$:

```math
\bra{\delta(x - X)}\ket{S(x)} = \int \delta{x - X} S(x) dx = S(X)
```

The position operator $`\hat{X}`$ should then be a linear operator such that $`\delta{x - X}`$ is an eigenvector with eigenvalue `X`. That is, we should have

```math
\int \hat{X} \delta{x - X} \ket{S(x)} dx = X S(X)
```

This is almost too simple -- the position operator $`\hat{X}`$ (in the position basis) is just multiplication by $`x`$!

```math
\int x \delta{x - X} \ket{S(x)} dx = X S(X)
```

Since this operator simply multiplies by a function, it is trivially a linear operator. The same thing can be generalized to any basis -- if the basis vectors are states of constant $`P`$ for some observable $`P`$, then the average value operator $`\ket{P}`$ will just be $`p`$.

## Next Steps

Today, we generalized two crucial concepts -- the equation of motion and average value operators -- from the discrete to the continuous case. Next time, we will wrap up our review by playing with these tools and cooking up the most famous equation in quantum mechanics.
