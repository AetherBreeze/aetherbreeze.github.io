---
id: 25
title: "From Particles To Fields (7)"
subtitle: ""
date: "2023.07.22"
tags: "qft"
---

# The Gaussian Integral (Now with Matrices!)

Last time, we temporarily discretized spacetime in order to get rid of the derivatives in the path integral. Now we will justify that nonsense by evaluating the resulting integral.

## Factorizing the Integral
Recall the discretized path integral, which we've written in terms of the discretized field vector $`\ket{F}`$:

```math
\left(\Pi_{a=1}^{N} \int_{-\infty}^{\infty} dF_a\right) e^{\frac{i}{\hbar} \sum -\frac{1}{2} \bra{F} (D^2 + m^2) \ket{F} + \bra{J} \ket{F}}
```

A good wa to approach these kinds of equations is to look at the scariest part first and try to make it less scary. Right now, the scariest part is definitely the product of $`N`$ integrals. Our lives would be much eaiser if we could consider each of these integrals individually. This would mean integrating over one element $`F_a`$ of the field vector at a time.

Unfortunately, we can't currently factor the integrals. The complicated term is the matrix one, $`\bra{F} D^2 \ket{F}`$. This term blends the elements of $`\ket{F}`$ in a complicated way.

What would be really nice is if $`D^2`$ was *diagonal*. In that case, we could reduce $`D^2 \ket{F}`$ to $`d_a^2 F_a \ket{F_a}`$, where $`d_a`$ is the $`a`$th eigenvalue of $`D`$. We could then use exponential properites to factor the exponential into one for each $`F_a`$, at which point we could use our old Gaussian integral result.

Unfortunately, in general, the derivative matrix $`D`$ is not diagonal... yet.

## Diagonal Derivative Coordinates

Once we identify that $`D`$ being diagonal would make things easier, our thoughts should immediately jump to finding a coordinate system in which it is. This is quite simple. We can diagonalize $`D`$ into some eigenvalue matrix $`D_E`$ and some orthogonal rotation matrix $`R`$:

```math
D = R^{-1} D_E R
```

The rotation matrices cancel out of the square:

```math
D^2 = R^{-1} D_E^2 R
```

Substituting this into our integral, and seperating the troublesome matrix term, we get

```math
\left(\Pi_{a=1}^{N} \int_{-\infty}^{\infty} dF_a\right) e^{\frac{i}{\hbar} \sum -\frac{1}{2} \bra{F} R^{-1} D_E^2 R \ket{F} - \frac{m^2}{2} \bra{F} \ket{F} + \bra{J} \ket{F}}
```

We can now invoke a clever change of coordinates. Note that since $`R`$ is an orthogonal matrix, we have $`R^\dag = R^{-1}`$. Thus the matrix term above is just

```math
\bra{F} R^{-1} D_E^2 R \ket{F} = (R \ket{F})^\dag D_E^2 (R \ket{F})
```

This immediately suggests we swap to the coordinates

```math
\ket{G} = R \ket{F}
```

These are called the **diagonal derivative coordinates**, for the complex theoretical reason that they make the derivative matrix diagonal. They are extremely nice because they don't change the integration factors $`dF_a`$ (since the change of coordinates matrix has determinant 1). Swapping to them simplifies the derivative term greatly:

```math
\left(\Pi_{a=1}^{N} \int_{-\infty}^{\infty} dG_a\right) e^{\frac{i}{\hbar} \sum -\frac{1}{2} \bra{G} D_E^2 \ket{G} - \frac{m^2}{2} \bra{G} \ket{G} + \bra{J} R^{-1} \ket{G}}
```

Success! The first term now contains a diagonal matrix and can be factored nicely.

There is one minor complication. In swapping to diagonal derivative coordinates, we have inadvertently messed up the vacuum perturbation term:

```math
\bra{J} \ket{F} = \bra{J} R^{-1} \ket{G}
```

This is a good exercise. Think now. How can we make this term nice for $`G`$ again using tools we've already seen this section?

For those of you who recalled the relation $`R^{-1} = R^\dag`$ -- very good! This key property of rotation matrices lets us group the troublesome matrix $`R`$ with $`\bra{J}`$ instead of our coordinate vector $`\ket{G}`$:

```math
\bra{J} R^{-1} \ket{G} = (R \ket{J})^\dag \ket{G}
```

## Factoring The Integral

After swapping to diagonal derivative coordinates, the above integral enters the relatively simple form:

```math
\left(\Pi_{a=1}^{N} \int_{-\infty}^{\infty} dG_a\right) e^{\frac{i}{\hbar} \sum -\frac{1}{2} \bra{G} D_E^2 \ket{G} - \frac{m^2}{2} \bra{G} \ket{G} + (R \ket{J})^\dag \ket{G}}
```

This may not look any simpler at a glance. However, since every term is now a multiple of $`\ket{G}`$ or a diagonal matrix acting on $`\ket{G}`$, we can now perform the crucial step of splitting this exponent into terms proportional to the elements $`G_a`$:

```math
\left(\Pi_{a=1}^{N} \int_{-\infty}^{\infty} dG_a\right) e^{\frac{i}{\hbar} \sum \sum_{b=1}^{N} -\frac{1}{2} [D_E]_b^2 G_b^2 - \frac{m^2}{2} G_b^2 + (R \ket{J})_b^\dag G_b}
```

where $`[D_E]_b`$ is the $`b`$th eigenvalue of the diagonalized derivative matrix $`D`$. Grouping like terms, this becomes

```math
\left(\Pi_{a=1}^{N} \int_{-\infty}^{\infty} dG_a\right) e^{\frac{i}{\hbar} \sum \sum_{b=1}^{N} -\frac{1}{2} ([D_E]_b^2 + m^2) G_b^2 + (R \ket{J})_b^\dag G_b}
```

We can now use exponential properties to factor this into $`N`$ exponentials, **each of whose exponent is only a function of the single variable $`G_b`$**:

```math
\left(\Pi_{a=1}^{N} \int_{-\infty}^{\infty} dG_a\right) \Pi_{b=1}^{N} e^{\frac{i}{\hbar} -\frac{1}{2} ([D_E]_b^2 + m^2) G_b^2 + (R \ket{J})_b^\dag G_b}
```

Finally, the moment we've been waiting for: we can factor this into a product of integrals over single variables:

```math
\Pi_{a=1}^{N} \int_{-\infty}^{\infty} e^{\frac{i}{\hbar} (-\frac{1}{2} ([D_E]_a^2 + m^2) G_a^2 + (R \ket{J})_a^\dag G_a)} dG_a
```

## Finally, We Can Be Lazy

The moment has finally come. Every element of this product is just a Gaussian integral. We know the solution to this integral:


```math
\int_{-\infty}^{\infty} e^{-c x^2 + d x} dx = e^{\frac{d^2}{4 c}} \sqrt{\frac{\pi}{c}}
```

It's elementary school math time. Plugging:

```math
c = \frac{i ([D_E]_a^2 + m^2)}{2 \hbar}
```

```math
d = \frac{i (R \ket{J})_a}{\hbar}
```

and chugging:

```math
\frac{d^2}{4 c} = -\frac{(R \ket{J})_a^2}{\hbar^2} \frac{\hbar}{2 i ([D_E]_a^2 + m^2)} = \frac{i (R \ket{J})_a^2}{2 \hbar ([D_E]_a^2 + m^2)}
```

```math
\int_{-\infty}^{\infty} e^{\frac{i}{\hbar} (-\frac{1}{2} ([D_E]_a^2 + m^2) G_a^2 + (R \ket{J})_a^\dag G_a)} dG_a = e^{\frac{i (R \ket{J})_a^2}{2 \hbar ([D_E]_a^2 + m^2)}} \sqrt{\frac{2 \pi \hbar}{i ([D_E]_a^2 + m^2)}}
```

Finally, we take a product over all discrete field values $`F_a`$ to get our discretized path integral:

```math
\Pi_{a=1}^{N} \int_{-\infty}^{\infty} e^{\frac{i}{\hbar} (-\frac{1}{2} ([D_E]_a^2 + m^2) G_a^2 + (R \ket{J})_a^\dag G_a)} dG_a = \Pi_{a=1}^{N} e^{\frac{i (R \ket{J})_a^2}{2 \hbar ([D_E]_a^2 + m^2)}} \sqrt{\frac{2 \pi \hbar}{i ([D_E]_a^2 + m^2)}}
```

## Back To Vectors

In general, expressions in terms of vector and matrix components (like the above) are nicer to work with when they're in terms of general vectors and matrices. Thus we will try to put it back in that form.

The square root term is the easy one. Consider the denominator of this term (sans the $`i`$):

```math
\Pi_{a=1}^N [D_E]_a^2 + m^2
```

This is *almost* the product of the eigenvalues of the derivative matrix. If it was, we could recognize this as simply the determinant of the derivative matrix, $`|D|`$. We can make this leap by introducing the mass-shifted derivative matrix $`\bar{D}`$:

```math
\bar{D} := D^2 + m^2 I
```

Is this cheating, since this $`D`$ technically isn't diagonalized? No, because the mass matrix $`m^2 I`$ is the same in every basis, but good question.

We can now rewrite the square root term very cleanly in terms of the mass-shifted derivative matrix's determinant:

```math
\pi_{a=1}^{N} \sqrt{\frac{2 \pi \hbar}{i ([D_E]_a^2 + m^2)}} = \sqrt{\frac{(-2 i \pi \hbar)^N}{|\bar{D}|}}
```

where we have swapped the $`i`$ in the denominator for a $`-i`$ in the numerator.

Now let's consider the tricky part:

```math
\pi_{a=1}^{N} e^{\frac{i (R \ket{J})_a^2}{2 \hbar ([D_E]_a^2 + m^2)}}
```

The exponent here is some scalar involving the rotated vacuum perturbation $`R \ket{J}`$ and the mass-shifted derivative matrix $`\bar{D}`$. We want to rewrite this scalar in terms of the original vectors and matrices. How might we do this?

Well, the usual way of combining a vector and a matrix to make a scalar is

```math
\bra{J} \bar{D} \ket{J}
```

Could we pull this "dream expression" out of the above expression?

Well, since our dream expression involves a dot product, we'll need to sum over the values of $`a`$. Exponential properties come to the rescue; the product outside the exponent becomes a sum inside of it:

```math
e^{\frac{i}{2 \hbar} \sum_{a=1}^{N} \frac{(R \ket{J})_a^2}{([D_E]_a^2 + m^2)}}
```

Things are starting to look good. Since the mass-shifted derivative is diagonal, the above sum is actually its matrix product with the vector $`(R \ket{J})_a`$. We can then multiply again by $`(R \ket{J})_a^\dag`$ on the left to get our dream expression:

```math
e^{\frac{i}{2 \hbar} (R \ket{J})^\dag \bar{D_E}^{-1} (R \ket{J})}
```

Note one very important thing: ***since the derivative matrix was in the denominator, the matrix here is the inverse of the derivative matrix.*** This may seem simple now, but remember: we eventually want to take this back to the continuum limit. When we do so, this will be incredibly consequential.

One last thing. Ideally, we want to leave no trace of our coordinate-rotating shenanigans. We achieved this goal in the square root term because the determinant is independent of basis; however, this time, the rotation matrix $`R`$ seems to stubbornly stick around. Thankfully, once again, the fact that $`R`$ is orthogonal comes in clutch:

```math
e^{\frac{i}{2 \hbar} (R \ket{J})^\dag \bar{D}^{-1} (R \ket{J})} = e^{\frac{i}{2 \hbar} \bra{J} R^\dag \bar{D_E}^{-1} R \ket{J}}
```

We can now collapse the rotation matrices back into the rotated derivative matrix to get the (inverse of the) original:

```math
e^{\frac{i}{2 \hbar} (R \ket{J})^\dag \bar{D}^{-1} (R \ket{J})} = e^{\frac{i}{2 \hbar} \bra{J} \bar{D}^{-1} \ket{J}}
```

Substituting both solutions into our path integral, we finally get the discrete solution we desire:

```math
\left(\Pi_{a=1}^{N} \int_{-\infty}^{\infty} dF_a\right) e^{\frac{i}{\hbar} \sum -\frac{1}{2} \bra{F} (D^2 + m^2) \ket{F} + \bra{J} \ket{F}} = \sqrt{\frac{(-2 i \pi \hbar)^N}{|\bar{D}|}} e^{\frac{i}{2 \hbar} \bra{J} \bar{D}^{-1} \ket{J}}
```

## Next Steps

Today, we walked through one of the most powerful and complex calculations in introductory quantum field theory. The ability to discretize and un-discretize spacetime is *incredibly* useful in this field. Today, we learned how to usefully play with the discrete. Tomorrow, we will learn to go back to the continuous, and encounter one of the most important elements in quantum field theory: the ***free propogator.***
