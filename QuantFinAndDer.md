---
layout: post
title: Quantitative Finance and Derivatives
...

Models for asset pricing
========================

Underlying processes
--------------------

### Stochastic Processes

Stochastic processes are collections of random variables representing
the evolution of some system over time. Stochastic processes can have
discrete or continuous values, and can evolve over discrete or
continuous time.

We have four different possible situations:

1.  $X(n,\omega) : \mathbb{N} \times (\Omega,\mathcal{F},\mathbb{P}) \to \text{a subset of } \mathbb{Z}:$
    discrete time, discrete values. For example: a *random walk*.

2.  $X(n,\omega) : \mathbb{N} \times (\Omega,\mathcal{F},\mathbb{P}) \to \text{a subset of } \mathbb{R}:$
    discrete time, continuous values.

3.  $X(n,\omega) : \mathbb{R}^+ \times (\Omega,\mathcal{F},\mathbb{P}) \to \text{a subset of } \mathbb{Z}:$
    continuous time, discrete values. For example: a *Poisson process*.

4.  $X(n,\omega) : \mathbb{R}^+ \times (\Omega,\mathcal{F},\mathbb{P}) \to \text{a subset of } \mathbb{R}:$
    continuous time, continuous values. For example: a *Brownian
    motion*.

#### From random walk to Brownian motion

Let $$(X_n)_{n   \geq    0}$$ be a stochastic process such that $X_i$,
for any $i$, can take value $1$ with probability
$\mathbb{P}(X_i=1)=\frac{1}{2}$, and $-1$ with probability
$\mathbb{P}(X_i=-1)=\frac{1}{2}$. Let then
$S_n = X_1 + X_2 + \ldots +X_n$ be the position you are at on a line
after $n$ steps. Informally, each $X_i$ “moves” you randomly one step to
the right or one step to the left. We want to know expectation and
variance of this process. Let’s assume the $(X_n)_{n \geq  0}$ to be
*independent and identically distributed*. We can now assert the
following:

$$E\left[X_i\right] = (+1) \cdot \frac{1}{2} + (-1) \cdot \frac{1}{2} = 0$$

$$E\left[X_i^2\right] = (+1)^2 \cdot \frac{1}{2} + (-1)^2 \cdot \frac{1}{2} = 1$$

Hence,

$$E\left[S_n\right] = \sum_{i=1}^n E\left[X_i\right] = 0$$

$$Var\left[S_n\right] = \sum_{i=1}^n E\left[X_i^2\right] = n$$

As $n$ approaches infinity, the conditions for the *Central Limit
Theorem* hold: $X_i$s are *i.i.d.*, so we can apply

$$\frac{S_n - n \cdot E\left[X_i\right]}{\sqrt{n \cdot Var\left[X_i\right]}}
    = \frac{S_n}{\sqrt{n}} \underset{n \to \infty}{\sim} \mathcal{N}(0,1)$$

Consider now a non-unitary time. Suppose we move in time steps of
$\delta >
  0$ and in space steps of $\sqrt{\delta}$, and let’s consider the
process in the interval $[0,t],\ t\in\mathbb{R}^+$. Then,

$$S_t = \sum_{i=0}^{\left\lfloor \frac{t}{\delta} \right\rfloor} X_i$$

where $X_i$ moves by $\pm\sqrt\delta$ with probability
$\mathbb{P}=\frac{1}{2}$. Then, $E\left[S_t\right]=0$ and

$$Var[X_i] = E^2[X_i] - E[X_i^2] = E^2[X_i] = (+\sqrt{\delta})^2 \cdot \frac{1}{2} + (-\sqrt{\delta})^2 \cdot \frac{1}{2} 
      = \delta$$

$$Var[S_t] = \frac{t}{\delta} \cdot \delta = t$$

Let’s now apply *Central Limit Theorem*:

$$\frac{S_t - \frac{t}{\delta} E[X_i]}{\sqrt{\frac{t}{\delta} Var[X_i]}}
    = \frac{S_t}{\sqrt{t}} \underset{t \to \infty}{\sim} \mathcal{N}(0,1).$$

So, $S_t \sim \mathcal{N}(0,t)$: this is the *Brownian motion*.

**(Brownian motion).** The stochastic process

$$(W_t)_{t\in\mathbb{R}^+} : \mathbb{R}^+ \times (\Omega, (\mathcal{F}_t)_{t \geq 0}, \mathbb{P}) \to \mathbb{R}$$

is a Brownian motion if and only if

1.  $W_0 = 0$,

2.  it is continuous,

3.  has stationary increments: the distribution doesn’t depend on
    initial time, only on waiting time.

    $$\forall t > s,\ W_t - W_s \sim \mathcal{N}(0,t-s)$$

4.  has independent increments over disjoint intervals:

    $$\forall q < r < s < t,\ (W_r-W_q) \perp (W_t-W_s).$$

**(Classes of Brownian motions.)**

1.  *Standard Brownian motion*, or *Wiener Process*.

2.  *Arithmetic Brownian motion*, or *Bachelier Model*.

    $$dp_t = p_{t+h} - p_t = \mu dt + \sigma dW_t$$

    Where $\mu$ is called *drift*, and $\sigma$ the *volatility*. This
    is a *stochastic differential equation*, *SDE* for short: while the
    $\mu dt$ part is *deterministic*, the $\sigma  dW_t$ contains a
    *stochastic* component, which is a standard Brownian motion. This
    kind of equations provides a model for the change of the price $p_t$
    over the infinitesimal time increment from $t$ to $t+h$. The price
    variation could be equivalently modeled this way:

    $$p_t - p_0 = \mu(t-0) + \sigma(W_t - W_0) = \mu t + \sigma W_t$$

    Noting that

    $$E[W_t]  =  0
            \quad \text{and} \quad
            Var[\sigma W_t]  =  E[(\sigma W_t)^2]  = \sigma^2 E[W_t^2] =  \sigma^2 t,$$

    we have that, in Bachelier’s model, the price
    $p_t = \mu t + \sigma W_t +
          p_0$ is a *random variable* distributed like

    $$p_t \sim \mathcal{N}(p_0 + \mu t + E[W_t], \sigma^2 t) \equiv
              \mathcal{N}(p_0 + \mu t, \sigma^2 t).$$

3.  *Geometric Brownian motion*, or *Black-Scholes model*.

    $$dp_t = \mu p_t dt + \sigma p_t dW_t$$

    This model is similar to Bachelier’s, but acts on a multiplicative
    instead of additive principle. For this model, we will need to find
    a solution and its distribution.

### Itō Formula

Suppose a model for an underlying asset price dynamics is given: we know
the form of $dp_t$; we’ll assume Black-Scholes. It is now natural to
assume that the price of a derivative on this asset is a *function*, let
it be $f(p_t)$, of the asset price. How can we get a *stochastic
differential equation* that models the derivative price variation?

Let’s evaluate the *Taylor expansion* for $f(p_t)$ like in a
deterministic setting.

$$f(x) \approx f(x_0) + f'(x_0)(x-x_0) + \frac{1}{2} f''(x_0)(x-x_0)^2 + \varepsilon$$

where $\varepsilon$ is a remainder that goes quickly to zero. We will
now discard all terms in the approximation that go to 0 faster than $dt$
does, thus truncating the approximation to to the first order. Let now
$x=p_{t+dt}$, $x_0 = p_t$ and $dp_t = p_{t+dt} - p_t$

$$f(p_{t+dt}) \approx f(p_t) + f'(p_t)(dp_t) + \frac{1}{2} f''(p_t)(dp_t)^2 + \varepsilon$$

and substitute the increment $dp_t$ with the Black-Scholes model:

$$\begin{aligned}
    f(p_{t+dt}) = & f(p_t) + f'(p_t)(\mu p_t dt + \sigma p_t dW_t) +\\ 
                  & \frac{1}{2}f''(p_t)(\mu^2 p_t^2 (dt)^2 + \sigma^2 p_t^2 (dW_t)^2 + 2 \mu \sigma p_t^2 dtdW_t) 
  \end{aligned}$$

Since $E[(dW_t)^2] = dt$, we can assume
$dW_t = \sqrt{dt} = (dt)^\frac{1}{2}$ to have order $\frac{1}{2}$. Let’s
analyze the orders of all the terms in the approximation:

-   $\mu p_t dt$: First order: keep it.

-   $\sigma p_t dW_t$: Order $\frac{1}{2}$: keep it.

-   $\mu^2 p_t^2 (dt)^2$: Second order: discard it.

-   $\sigma^2 p_t^2 (dW_t)^2$: First order, because $(dW_t)^2 = dt$:
    keep it.

-   $2 \mu \sigma p_t^2 dtdW_t$: Order $\frac{3}{2}$ because of
    $dtdW_t$: discard it.

The truncated approximation now states that

$$f(p_{t+dt}) = f(p_t) + f'(p_t)(\mu p_t dt + \sigma p_t dW_t) + 
    \frac{1}{2} f''(p_t)(\sigma^2 p_t^2 dt).$$

The second derivative term of this equation is called *Itō correction
term*. The derivative of the function with respect to time can then be
computed this way:

$$df(p_t) = f(p_{t+dt}) - f(p_t) = f'(p_t)(\mu p_t dt + \sigma p_t dW_t) + 
    \frac{1}{2} f''(p_t)(\sigma^2 p_t^2 dt)$$

Let’s now separate the deterministic terms from the stochastic terms, so
we can identify a *drift* and a *volatility* for the model.

$$df(p_t) = \left[ f'(p_t)\mu p_t + \frac{1}{2}f''(p_t)\sigma^2 p_t^2\right]dt
      + f'(p_t)\sigma p_t dW_t$$

Let $f(p_t) =  \ln(p_t)$ be the price of a derivative instrument with
underlying price $p_t$; the dynamic for the underlying follows the
Black-Scholes model. Apply Itō’s formula to this derivative:

$$\begin{aligned}
      d\ln(p_t) = & \left[ \frac{1}{p_t} \mu p_t + \frac{1}{2}\left( 
        -\frac{1}{p_t^2}\sigma^2 p_t^2\right)\right]dt +
        \frac{1}{p_t}\sigma p_t dW_t = \\
        = & \left[\mu - \frac{1}{2} \sigma^2 \right]dt + \sigma dW_t
    \end{aligned}$$

Considering the time interval $[0,t]$, we observe that

$$d\ln(p_t) = \ln(p_t) - \ln(p_0) = \left( \mu - \frac{1}{2}\sigma^2 \right)
        (t-0) + \sigma (W_t - W_0)$$

and then

$$\ln\left(\frac{p_t}{p_0}\right) = \left(\mu -\frac{1}{2}\sigma^2\right)t + \sigma W_t
      \iff
      \frac{p_t}{p_0} = \mathrm{e}^{\left(\mu - \frac{1}{2}\sigma^2\right)t + \sigma W_t}$$

which yields the solution

$$p_t = p_0 \mathrm{e}^{\left(\mu - \frac{1}{2}\sigma^2\right)t + \sigma W_t}.$$
