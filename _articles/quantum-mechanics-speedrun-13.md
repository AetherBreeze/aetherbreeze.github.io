---
id: 12
title: "Quantum Mechanics Speedrun (13)"
subtitle: ""
date: "2023.07.02"
tags: "qft"
---

# Filling In The Gaps

Last time, we derived the Schrodinger equation using one significant leap of logic. This time, we will do our best to bridge that leap and introduce a crucial subfield of modern physics.

## Energy Is Better

Physics as we know it was more or less invented by Isaac Newton when he wrote his second law:

```math
F = ma
```

This was a monumental feat, an incredible act to tame the universe beneath the keel of mathematics. It's also a terrible way to do physics. (Although for engineering, it's alright).

The core problem with Newton's law is that it's a *vector equation*. On the surface, this means that there's three times as many equations to deal with. That's annoying. On a deeper level, it means that the laws of physics look very different in different bases. The most famous examples of this are the "fictitious" forces that show up in a spherical coordinate system. Having the central equaion of physics be a vector equation is not only inconvenient -- it also obscures the actual physics that's going on beneath artifacts of bases.

Instead, it's much nicer to write physics in terms of *scalars*. That way, there's only one equation to deal with, and it's more or less the same regardless of basis. Pretty much all modern physics is written in terms of scalars for this reason. Specifically, in terms of one scalar: the *energy*.

### Rewriting Newton's Law Using Energy

The problem with Newton's law, other than the fact that it's a vector, is that it's right. Thus if we want to invent a different way to view physics, we have to make sure it agrees with Newton's laws somehow.

We make this connection using the two main types of energy. We'll start with force, which connects neatly to potential energy:

```math
F = -\frac{d E_P}{dx}
```

Next, we'll try to connect the kinetic energy to the $`ma`$ term:

```math
E_K = \frac{1}{2} m v^2
```

This isn't too hard. All we need to do is differentiate with respect to $`v`$, then with respect to time:

```math
\frac{d}{dt} \frac{d}{dv} E_K = \frac{d}{dt} mv = ma
```

Thus we can rewrite both sides of Newton's equation in terms of the energy:

```math
-\frac{d E_P}{dx} = \frac{d}{dt} \frac{d E_K}{dv}
```

Now for our final trick. Note that the potential energy only depends on $`x`$, while the kinetic energy only depends on $`v`$. Thus we can write both of these derivatives in terms of the total energy:

```math
-\frac{d E}{dx} = \frac{d}{dt} \frac{d E}{dv}
```

## Momentum Is Even Better

If you were paying attention to the above calculations, you might have noticed something interesting:

```math
\frac{d E}{d v} = m v
```

This is just the momentum $`p`$. If we substitute this into our new equation, we find an even simple form:

```math
-\frac{d E}{dx} = \frac{d p}{dt}
```

This is interesting. It seems like our equations might take an even simpler form if we write then in terms of momentum instead of velocity. Let's try that, starting with the energy:

```math
E = \frac{1}{2} m v^2 + E_P(x) = \frac{p^2}{2 m} + E_P(x)
```

From this, we might wonder further. We've already taken the derivatives of $`E`$ with respect to position and velocity. What if we take the derivative with respect to momentum?

```math
\frac{d E}{d p} = \frac{p}{m} = v
```

Since we aren't using velocity directly anymore, let's write it in terms of position instead:

```math
\frac{d E}{d p} = \frac{d x}{d t}
```

...Hold on. What did our equation of motion look like again?

```math
-\frac{d E}{d x} = \frac{d p}{d t}
```

Now *this* is interesting. If we write our equations of motion in terms of $`x`$ and $`p`$, they look almost exactly symmetric!

## Going Quantum

This was no means a deep dive into Hamiltonian mechanics. In fact, we have skipped over one of the fundamental operators of that field (the [Poisson bracket](https://en.wikipedia.org/wiki/Poisson_bracket#Hamilton's_equations_of_motion), for interested readers). However, we have gotten far enough to motivate the last bit of the Schrodinger equation. It starts with our energy-ified equation of motion:

```math
-\frac{d E}{d x} = \frac{d p}{d t}
```

In classical mechanics, the energy and momentum of a system are numbers. In quantum mechanics, they are *operators*. Thus to make the jump to quantum mechanics, all we have to do is replace them:

```math
-\frac{d \hat{E}}{d x} = \frac{d \hat{P}}{d t}
```

From the basic Schrodinger equation, we already know the form of $`\hat{E}`$:

```math
\hat{E} = -i \hbar \frac{d}{dt}
```

Substituting this puts the above equation in terms of only the unknown operator $`\hat{P}`$:

```math
i \hbar \frac{d}{dx} \frac{d}{dt} = \frac{d \hat{P}}{dt}
```

Now you see what we're getting at. Integrating both sides with respect to $`t`$ gives us the momentum operator, as desired:

```math
\hat{P} = i \hbar \frac{d}{dx}
```

Notice how trivially the answer fell out when we switched from velocity to momentum. This is one of many reasons that momentum is preferred in modern physics. To see the others, I strongly implore you to take a weekend sometime and dive into Hamiltonian mechanics. Seriously, it's some of the most beautiful physics in all of the physics.

## We Did It!

And with that, we're done! We've successfully worked up from a basic though experiment to a full-scale model of quantum mechanics. From this, we'll take a (sanctioned) break, and then return to start working on our true goal: a similar understanding of quantum field theory.

See you there!
