---
id: 15
title: "Path Integral Interlude: Gaussian Integral"
subtitle: ""
date: "2023.07.12"
tags: "qft"
---

# The Most Important Integral in Quantum Field Theory

Last time, we used the path integral method to split a single complicated calculation up into several smaller calculations. We then took one of those smaller calculations and simplified it until it was just an integral. Today, we will evaluate that integral -- the most widely used integral in quantum field theory.

## The Full Integral

The integral at hand is as follows:

```math
\frac{1}{2 \pi} \int e^{i \frac{p_n^2}{2 m \hbar} \frac{t}{N}} e^{i \frac{p_n (y_a - y_b)}{\hbar}} dp_n
```

As is the grand tradition of this series, we will attack this problem in parts. We'll start with the simplest thing that takes the same form, then slowly build on it until we can calculate the entire thing. To whit, we'll start with the "simplest interesting part" of this integral:

```math
\int e^{-x^2} dx
```

We'll then quickly generalize this to encompass the first term in the integral:

```math
\int e^{-c x^2} dx
```

Finally, we'll add a linear term in the exponent:

```math
\int e^{-c x^2 + d x} dx
```

This is the essential form of the full integral, and will allow us to finally evaluate our "tiny path probability."

With all that said... into the breach.

## The Gaussian Integral

Consider the first step:

```math
\int e^{-x^2} dx
```

This is a deceptively complicated integral. In fact, this integral has *no algebraic solution* -- there is no antiderivative of $`e^{-x^2}`$ that can be written in terms of standard algebraic functions.

Luckily, we don't need such an antiderivative. In our original expression, this integral is over *all possible values* of momentum. In this case, that means all possible values of $`x`$. Thus we are specifically interested in the integral from $`-\infty`$ to $`\infty`$:

```math
\int_{-\infty}^{\infty} e^{-x^2} dx
```

This *can* be evaluated. However, it takes quite an absurd trick. This is one of the few tricks in this series that I have trouble motivating. I'll do my best, but know that this is deep mathematical wizardry.

## Deep Mathematical Wizardry

We'll start by imagining how this integral could be easier. Obviously, it would be easier if it had an antiderivative. Thus we might consider how we could alter this integral to get one with an antiderivative. The simplest way would be to multiply it by $`2 x`$:

```math
\int_{-\infty}^{\infty} 2 x e^{-x^2} dx
```

Any first-year calculus student could tell you the antiderivative of $`2 x e^{-x^2}`$ is $`-e^{-x^2}`$. Thus if we can somehow wrangle the integral into this form, we can evaluate it easily.

So how could we make our original integral look like this? Well, one way would be to change coordinates (somehow) to some $`dy`$ such that $`dy = 2 x dx`$. That would give us the crucial factor we need. 

There is actually a promising candidate we might already be familiar with: *polar coordinates*. Polar coordinates are an alternative 2D coordinate system with the area factor

```math
dx dy = r dr d\theta
```

Note the multiplication by one of the variables. This is exactly what we need. Unfortunately, our integral is one-dimensional, not two-dimensional. Thus we can't use polar coordinates here...

...or can we?

## Wherein We Use Polar Coordinates Here

Once we have the idea to use polar coordinates, we might start trying to turn our one-dimensional integral into a two-dimensional integral. The easiest way to do this is by squaring the integral, then re-naming the other integration variable:

```math
\left(\int_{-\infty}^{\infty} e^{-x^2} dx\right)^2 = \int_{-\infty}^{\infty} e^{-x^2} dx \int_{-\infty}^{\infty} e^{-x^2} dx = \int_{-\infty}^{\infty} e^{-x^2} dx \int_{-\infty}^{\infty} e^{-y^2} dy
```

Since these integrals are over completely different variables, we can merge them. We can then use exponential properties to simplify the integrand:

```math
\int_{-\infty}^{\infty} e^{-x^2} dx \int_{-\infty}^{\infty} e^{-y^2} dy = \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} e^{-(x^2 + y^2)} dx dy
```

And like magic, the radius $`x^2 + y^2`$ appears! The stage is now perfectly set for our change to polar coordinates:

```math
\int_{-\infty}^{\infty} \int_{-\infty}^{\infty} e^{-(x^2 + y^2)} dx dy = \int_{0}^{\infty} \int_{0}^{2 \pi} e^{-r^2} r dr d\theta
```

Since the inner expression doesn't depend on $`\theta`$, the $`\theta`$ integral is trivial:

```math
\int_{0}^{\infty} \int_{0}^{2 \pi} e^{-r^2} r dr d\theta = 2 \pi \int_{0}^{\infty} e^{-r^2} r dr
```

Pulling the factor of two back into the integral and rearranging:

```math
\int_{0}^{\infty} \int_{0}^{2 \pi} e^{-r^2} r dr d\theta = \pi \int_{0}^{\infty} 2 r e^{-r^2} dr
```

This is the integral we dreamed about earlier. We can evaluate it using its antiderivative:

```math
\pi \int_{0}^{\infty} 2 r e^{-r^2} dr = \pi \left[-e^{-r^2}\right]_0^{\infty} = \pi
```

The number of places that $`\pi`$ shows up out of nowhere is truly absurd.

Thus by hopping up one dimension, we can use polar coordinates to evaluate this integral and find

```math
\left(\int_{-\infty}^{\infty} e^{-x^2} dx\right)^2 = \pi
```

and thus

```math
\int_{-\infty}^{\infty} e^{-x^2} dx = \sqrt{\pi}
```

## Adding In a Constant

We've completed the first step of our process. Now we'll take the second step by adding a constant to the exponent:

```math
\int_{-\infty}^{\infty} e^{-c x^2} dx
```

After last step's dark magic, this is refreshingly simple. All we have to do is change coordinates to $`y = \sqrt{c} x`$:

```math
\int_{-\infty}^{\infty} e^{-y^2} dx = \int_{-\infty}^{\infty} e^{-y^2} \frac{dy}{\sqrt{c}}
```

Now we can just factor out the constant and use our previous result:

```math
\int_{-\infty}^{\infty} e^{-c x^2} dx = \frac{1}{\sqrt{c}} \int_{-\infty}^{\infty} e^{-y^2} dy = \sqrt{\frac{\pi}{c}}
```

Nice.

## Adding The Linear Term

We're finally ready to tackle the full (functional) form of the integral:

```math
\int_{-\infty}^{\infty} e^{-c x^2 + d x} dx
```

This is not as complicated as it seems. Whenever we see something of the form $`-c x^2 + d x`$, we should immediately think about completing the square:

```math
-c x^2 + d x = -c (x^2 - \frac{d}{c} x) = -c \left(\left(x - \frac{d}{2 c}\right)^2 - \frac{d^2}{4 c^2}\right) = -c \left(x - \frac{d}{2 c}\right)^2 + \frac{d^2}{4 c}
```

Substituting this into our exponent, we get

```math
\int_{-\infty}^{\infty} e^{-c x^2 + d x} dx = \int_{-\infty}^{\infty} e^{-c \left(x - \frac{d}{2 c}\right)^2 + \frac{d^2}{4 c}} dx
```

Now we see the magic of this approach. Using exponent properties, we can split this to a contant exponent and an exponent of the form $`e^{-c y^2}`$:

```math
\int_{-\infty}^{\infty} e^{-c \left(x - \frac{d}{2 c}\right)^2 + \frac{d^2}{4 c}} dx = \int_{-\infty}^{\infty} e^{-c \left(x - \frac{d}{2 c}\right)^2} e^{\frac{d^2}{4 c}} dx = e^{\frac{d^2}{4 c}} \int_{-\infty}^{\infty} e^{-c \left(x - \frac{d}{2 c}\right)^2} dx
```

This is now a simple change of variables away from our previous integral. Swapping to $`y = x - \frac{d}{2 c}`$:

```math
e^{\frac{d^2}{4 c}} \int_{-\infty}^{\infty} e^{-c \left(x - \frac{d}{2 c}\right)^2} dx = e^{\frac{d^2}{4 c}} \int_{-\infty}^{\infty} e^{-c y^2} dy = e^{\frac{d^2}{4 c}} \sqrt{\frac{\pi}{c}}
```

## Putting It All Together

We're finally ready to evaluate the probability density of our small path:

```math
\frac{1}{2 \pi} \int_{-\infty}^{\infty} e^{i \frac{p_n^2}{2 m \hbar} \frac{t}{N}} e^{i \frac{p_n (y_a - y_b)}{\hbar}} dp_n = e^{i \frac{p_n^2}{2 m \hbar} \frac{t}{N} + i \frac{p_n (y_a - y_b)}{\hbar}}
```

Our solution is for integrals of the form

```math
\int_{-\infty}^{\infty} e^{- c x^2 + d x}
```

The corresponding coefficients in our case are

```math
c = \frac{-i}{2 m \hbar} \frac{t}{N} \\
d = i \frac{y_a - y_b}{\hbar}
```

We will simplify a little by writing $`\frac{t}{N} = \delta_N t`$. Plugging and chugging, we find that

```math
\int_{-\infty}^{\infty} e^{- c x^2 + d x} = e^{\frac{d^2}{4 c}} \sqrt{\frac{\pi}{c}} = e^{i m \frac{(y_b - y_a)^2}{2 \delta_N t}} \sqrt{\frac{i 2 m \hbar \pi}{\delta_N t}}
```

Finally, multiplying through by the constant $`\frac{1}{2 \pi}`$ gives us our final probability density:

```math
\frac{1}{2 \pi} \int e^{i \frac{p_n^2}{2 m \hbar} \frac{t}{N}} e^{i \frac{p_n (y_a - y_b)}{\hbar}} dp_n = e^{i m \frac{(y_b - y_a)^2}{2 \delta_N t}} \sqrt{\frac{i m \hbar}{2 \pi \delta_N t}}
```

## Next Steps

If you made it this far, congratulations are in order. The Gaussian integral is not easy. However, the time investment to solve it is well worth it. With our solution in hand, we will be able to breeze through literally hundreds of calculations for the rest of this course. This is probably *the* single most common calculation in quantum field theory, and we've already done it. Next time, we'll see it pay dividends.
