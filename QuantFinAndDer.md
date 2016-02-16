---
layout: post
title: Quantitative Finance and Derivatives
...

<span>Quantitative Finance and Derivatives</span>\

<span>  2016, Andrea Venuta</span>

Models for asset pricing
========================

Stochastic Processes
--------------------

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

### From random walk to Brownian motion

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
0$ and in space steps of $\sqrt{\delta}$, and let’s consider the process
in the interval $[0,t],\ t\in\mathbb{R}^+$. Then,

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

Itō Formula
-----------

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
                & \frac{1}{2}f''(p_t)(\mu^2 p_t^2 (dt)^2 + \sigma^2 p_t^2 (dW_t)^2 + 2 \mu \sigma p_t^2 dtdW_t) \end{aligned}$$

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

Black-Scholes model assumes the *spot risk-free interest rate* $r$ to be
constant and independent of maturity. Consider *discounting* as a
function of time and asset price:

$$f(t;p_t) = {\mathrm{e}}^{-rt}p_t$$

The general Itō formula for a function of such a form is

$$\begin{aligned}
    d[f(t;p_t)] = & 
      \frac{\partial f}{\partial p_t} dp_t + 
      \frac{\partial f}{\partial t} dt + 
      \frac{1}{2} \frac{\partial^2 f}{\partial p_t^2} (dp_t)^2 +
      \underbrace{\cancel{\frac{1}{2} \frac{\partial^2 f}{\partial t^2} (dt)^2}}_\text{order 2} +
      \underbrace{\cancel{\frac{1}{2} \frac{\partial^2 f}{\partial p_t \partial t} 2dtdp_t}}_\text{order 3/2}
      \\
      = & 
      \frac{\partial f}{\partial p_t} dp_t + 
      \frac{\partial f}{\partial t} dt + 
      \frac{1}{2} \frac{\partial^2 f}{\partial p_t^2} \sigma^2 p_t^2dt
  \end{aligned}$$

For the discounting function, this means

$$\begin{aligned}
    d[e^{-rt}p_t] = & {\mathrm{e}}^{-rt} \cdot 1 \cdot dp_t + -r{\mathrm{e}}^{-rt}p_tdt +
      \cancelto{0}{\frac{1}{2} \cdot 0 \cdot \sigma^2 p_t^2 dt}
      \\
      = & {\mathrm{e}}^{-rt}\left( \mu p_t dt + \sigma p_t dW_t -r p_t dt \right)
      \\
      = & (\mu - r) {\mathrm{e}}^{-rt} p_tdt + {\mathrm{e}}^{-rt} p_t\sigma dW_t
      \\
    d\tilde{p}_t = & (\mu - r)\tilde{p}_tdt + \sigma \tilde{p}_t dW_t
  \end{aligned}$$

Hence, the distribution for a discounted asset price follows
Black-Scholes model:

$$\begin{aligned}
    \tilde{p}_t = \tilde{p}_0 {\mathrm{e}}^{(\mu - r - \frac{\sigma^2}{2})t + \sigma W_t}
  \end{aligned}$$

Note that the deterministic and stochastic parts were grouped together,
to underline the *risk factor*.

Black-Scholes PDE for option pricing
------------------------------------

In the context of option pricing, Black-Scholes model assumes the
following:

-   $p_t$ is the underlying asset price at time $t$,

-   $r$ is a constant, risk-free interest rate,

-   There are no transaction costs, no taxes, and no arbitrage
    opportunity,

-   The market is liquid, and so all the instruments,

-   $f(t;p_t)$ is the option price.

By Itō’s lemma, we get that the option price is

$$df(t;p_t) = \left[ \frac{\partial f}{\partial t}} + \frac{\partial f}{\partial p_t} \mu p_t +
    \frac{1}{2}\frac{\partial^2 f}{\partial p_t^2} \sigma^2 p_t^2 \right] dt +
    \frac{\partial f}{\partial p_t} \sigma p_t dW_t$$

Construct a *locally* risk-free portfolio, $\Pi_t$, such that

$$\Pi_t = \left\{ 
    \begin{array}{cl}
      -1 & \text{positions in options (short)} \\
      \Delta_t \equiv \frac{\partial f}{\partial p_t} & \text{positions in underlying (long)}
    \end{array}$$

and study the dynamics of the portfolio value by multiplying the number
of positions by the dynamics for each kind of instrument (option and
asset).

$$\begin{aligned}
  d\Pi_t = & -1 \cdot df(t;p_t) + \frac{\partial f}{\partial p_t} dp_t
  \\ = & \underbrace{- \left[
      \frac{\partial f}{\partial t} + \frac{\partial f}{\partial p_t} \mu p_t +
      \frac{1}{2} \frac{\partial^2 f}{\partial p_t^2} \sigma^2 p_t^2 \right] dt -
      \frac{\partial f}{\partial p_t}\sigma p_t dW_t}_\text{option} +
    \underbrace{
      \frac{\partial f}{\partial p_t} \left( \mu p_t dt + \sigma p_t dW_t \right)
    }_\text{asset}
  \\ = & - \left[
      \frac{\partial f}{\partial t} + 
      \frac{1}{2} \frac{\partial^2 f}{\partial p_t^2} \sigma^2 p_t^2 \right] dt -
      \cancel{\frac{\partial f}{\partial p_t} \mu p_t dt} -
      \cancel{\frac{\partial f}{\partial p_t}\sigma p_t dW_t}
      + \cancel{\frac{\partial f}{\partial p_t} \mu p_t dt} + 
      \cancel{\frac{\partial f}{\partial p_t} \sigma p_t dW_t}
  \\ = & - \left( \frac{\partial f}{\partial t} + 
    \frac{1}{2}\frac{\partial^2 f}{\partial p_t^2} \sigma^2 p_t^2 \right) dt\end{aligned}$$

Having removed the Brownian motion, we are left without any risky term.
We impose now the *no arbitrage assumption*, stating that a portfolio is
risk-free if and only if its dynamics is the same of a bond, that is, it
accrues interest at a constant (by assumption) rate over time.

$$d\Pi_t \equiv - \left( \frac{\partial f}{\partial t} + 
    \frac{1}{2}\frac{\partial^2 f}{\partial p_t^2} \sigma^2 p_t^2 \right) dt 
    \stackrel{\text{NAA}}{=} r\Pi_t dt$$

$$-\frac{ {\partial}f}{ {\partial}t} -\frac{1}{2}\frac{ {\partial}^2f}{ {\partial}p_t^2} \sigma^2 p_t^2 =
  -rf(t;p_t) + \frac{ {\partial}f}{ {\partial}p_t} rp_t$$

Finally, we obtain the Black-Scholes PDE by rearranging.

$$rf(t;p_t) = \frac{ {\partial}f}{ {\partial}t} + \frac{ {\partial}f}{ {\partial}p_t} rp_t + \frac{1}{2}\frac{ {\partial}^2 f}{ {\partial}p_t^2} \sigma^2 p_t^2$$

The objective is to establish the *fair* (or *no arbitrage*) price of an
option today, that is, $f(0;p_0)$. A *final condition* can be imposed:
$f(T,p_T)$, which is the *option price at maturity* or, equivalently,
the *payoff*, which is known.

$$f(T;p_T) \stackrel{e.g.}{=}
  \begin{array}{ll}
    (P_T - K)^+ = \max \{ P_T - K, 0 \} & \text{European call option} \\
    (K - P_T)^+ = \max \{ K - P_T, 0 \} & \text{European put option}
  \end{array}$$

European options satisfy Black-Scholes assumptions: the payoff depends
*only* on the price of the underlying at time $T$, and it is not *path
dependent*. The drift term $\mu$ does not appear in Black-Scholes PDE,
and neither does in the payoff function $f(t;p_t)$; this means that the
Black-Scholes option price doesn’t depend on it. The drift term is
strongly linked to investor’s *risk aversion*: this means the option can
be priced *as if* the investor is *risk neutral*.

A *risk neutral* valuation intuitively means that we are pricing in a
world where every investor behaves as if he himself is risk neutral; the
real world is not risk neutral, though, and investors’ risk aversion is
embedded in the *historical* data.

A *risk neutral* valuation of current option price, given payoff
$f(T,p_T)$, is

$$f(0;p_0) = \tilde{\mathbb{E}} \left[ e^{-rT} f(T;p_T)\right]$$

Where $\tilde{\mathbb{E}}$ is the expectation according to the *risk
neutral probability* $\tilde{\mathbb{P}}$. We now have, in fact, two
probability spaces: the first is the *historical probability space*
$(\Omega,\mathcal{F},\mathbb{P})$, the second is the *risk neutral
probability space*
$(\Omega,  \mathcal{F},   \tilde{\mathbb{P}})  \supseteq
(\Omega,\mathcal{F},\mathbb{P})$. To calculate the option price at any
given time $t : 0 <  t < T$ the information in the filtration up to time
$t$ can be used:

$$f(t;p_0) = \tilde{\mathbb{E}} \left[ e^{-r(T-t)} f(T;p_t) \left| \mathcal{F}_t\right]$$

If, in time $t: 0 \leq t \leq T$ the payoff is $(P_T - K)^+$, the price
of an option at time $t$ is

$$C(\tau = T-t, p_t, K, r, \sigma) = f(t;p_t) = p_t \mathcal{N}(d_1) - K{\mathrm{e}}^{-r\tau} \mathcal{N}(d_2)$$

where

$$\begin{aligned}
    d_1 &= \frac{\ln\left(\frac{p_t}{K}\right) + \left(r + \frac{\sigma^2}{2}\right)(T-t)}{\sigma \sqrt{T-t}}
    \\
    d_2 &= \frac{\ln\left(\frac{p_t}{K}\right) + \left(r - \frac{\sigma^2}{2}\right)(T-t)}{\sigma \sqrt{T-t}} = d_1 - \sigma\sqrt{T-t}
  \end{aligned}$$

*Proof*. Suppose we are in a Black-Scholes world: we have one risky
asset with dynamics such that
$dp_t = \mu p_t dt + \sigma p_t d\tilde{W}_t$, a riskless asset with
dynamics such that $dB_t = rB_t  dt$, and no arbitrage opportunities.
Define $\tilde{W}_t  =  W_t  +  \frac{\mu-r}{\sigma}t$ where $\mu-r$ is
the *risk premium* and $\frac{\mu-r}{\sigma}$ is the *market price of
risk*. Hence,

$$\begin{aligned}
  dp_t & = rp_t dt + \sigma p_t \left[ dW_t + \frac{\mu-r}{\sigma}dt \right]
  \\ & = \cancel{rp_tdt} + \sigma p_t dW_t + \mu p_t dt - \cancel{rp_t dt}
  \\ & = \mu p_t dt + \sigma p_t dW_t\end{aligned}$$

Note that
$\tilde{W}_t  \sim \mathcal{N}\left(  \frac{\mu-r}{\sigma}\Delta t;
\Delta t\right)$ is no longer a standard Brownian motion. We want to
know the option price at time $t=0$, considering, for example, the
payoff $f(T;p_T) =
(p_T - K)^+$:

$$\begin{aligned}
  C_0 & = f(0;p_0) = \mathbb{\tilde E}\left[{\mathrm{e}}^{-rT} (p_T - K)^+\right]
  \\ & \stackrel{\text{Markov}}{=} \mathbb{\tilde E}\left[ {\mathrm{e}}^{-rT} \left( 
  p_0 {\mathrm{e}}^{\left(r-\frac{\sigma^2}{2}\right)T + \sigma \tilde{W}_T}
  -K\right)^+\right] = (*)_1\end{aligned}$$

Consider now that, if $X  \sim \mathcal{N}(0,T)$ and
$Y \sim \mathcal{N}(0,1)$ then $X = \sqrt{T}Y$:

$$\begin{aligned}
  (*)_1 & = \mathbb{\tilde E}\left[ {\mathrm{e}}^{-rT} \left(p_0 {\mathrm{e}}^{\left(r-\frac{\sigma^2}{2}\right)T + \sigma\sqrt{T}Y}-K\right)^+\right]
  \\ & = \int_{-\infty}^{+\infty} {\mathrm{e}}^{-rt} \left(p_0 {\mathrm{e}}^{\left(r-\frac{\sigma^2}{2}\right)T + \sigma\sqrt{T}y}-K\right)^+
  \frac{1}{\sqrt{2\pi}} {\mathrm{e}}^{\frac{-y^2}{2}}dy = (*)_2\end{aligned}$$

We compute the integral only where the payoff is positive, that is,
where

$$\begin{aligned}
  p_0 {\mathrm{e}}^{\left(r-\frac{\sigma^2}{2}\right)T + \sigma\sqrt{T}y} \geq K
  & \iff
  {\mathrm{e}}^{\left(r-\frac{\sigma^2}{2}\right)T + \sigma\sqrt{T}y} \geq \frac{K}{p_0}
  \\ & \iff \left(r-\frac{\sigma^2}{2}\right)T + \sigma\sqrt{T}y \geq \ln\frac{K}{p_0}
  \\ & \iff y \geq \frac{-\ln\frac{p_0}{K} -\left(r - \frac{\sigma^2}{2}\right)T}{\sigma\sqrt{T}} = -d_2\end{aligned}$$

$$\begin{aligned}
  (*)_2 & = \int_{-d_2}^{+\infty} {\mathrm{e}}^{-rt} \left( p_0 {\mathrm{e}}^{\left(r-\frac{\sigma^2}{2}\right)T + \sigma y\sqrt{T}}-K\right)
    \frac{1}{\sqrt{2\pi}} {\mathrm{e}}^{-\frac{y^2}{2}} dy
    \\ & = \int_{-d_2}^{+\infty} \frac{p_0 {\mathrm{e}}^{-\frac{\sigma^2}{2} + \sigma y\sqrt{T} -\frac{y^2}{2}}}{\sqrt{2\pi}} dy
    - \int_{-d_2}^{+\infty} \frac{K{\mathrm{e}}^{-rt -\frac{y^2}{2}}}{\sqrt{2\pi}}dy
    \\ & = p_0 \int_{-\infty}^{d_2} \frac{1}{\sqrt{2\pi}} {\mathrm{e}}^{-\frac{(\sigma\sqrt{T}+y)^2}{2}}dy
    - K{\mathrm{e}}^{-rt}\int_{-d2}^{+\infty} \frac{1}{\sqrt{2\pi}} {\mathrm{e}}^{-\frac{y^2}{2}} dy
    \\ & \left(\text{Let } z=y+\sigma\sqrt{T} \text{ s.t. } -\infty\leq z \leq d_2+\sigma\sqrt{T}\right)
    \\ & = p_0 \int_{-\infty}^{d_2+\sigma\sqrt{T}} \frac{1}{\sqrt{2\pi}} {\mathrm{e}}^{-\frac{z^2}{2}} dz
    - K{\mathrm{e}}^{-rt}\int_{-\infty}^{d_2} \frac{1}{\sqrt{2\pi}} {\mathrm{e}}^{-\frac{y^2}{2}} dy
    \\ & = p_0 \mathcal{N}(d_2 + \sigma\sqrt{T}) - K{\mathrm{e}}^{-rt} \mathcal{N}(d_2)
    \\ & = p_0 \mathcal{N}(d_1) - K{\mathrm{e}}^{-rt}\mathcal{N}(d_2).\end{aligned}$$

Cox-Ross-Rubinstein model
-------------------------

This model is the equivalent, in discrete time, of Black-Scholes. CRR
accepts the assumptions of one risky asset, one riskless asset and no
arbitrage. The discrete time implies the underlying is modeled using a
discrete probability distribution: the Binomial model.

### Single period model

In a simple, single period model, the asset can go up in value of a
percentage $u$ with probability $p$ or go down in value of a percentage
$d$ with probability $1-p$.

$$S_0 \left\{ \begin{array}{lc}
      S_1^u = uS_0 & p \\ S_1^d= dS_0 & 1-p
    \end{array}
  \quad\quad
  C_0 \left\{ \begin{array}{lc}
      C_u = (uS_0 -K)^+ & p \\ C_d = (dS_0 - K)^+ & 1-p
    \end{array}$$

The percentages are related like this: $u > 1 + r > 1 > d \geq 0$.

Again, construct a risk-free portfolio using the underlying and the
option. For the portfolio to be risk-free, its payoff must be the same
for each possible state of the world.

$$\begin{aligned}
  \Pi = \left\{ \begin{array}{cl}
      -1 & \text{option (short)} \\
      \Delta & \text{underlying (long)}
    \end{array}\end{aligned}$$

$$\begin{aligned}
  \Pi \text{ is risk-free } \iff -C_u + \Delta uS_0 = -C_d + \Delta dS_0
  \iff \Delta = \frac{C_u-C_d}{S_0(u-d)}\end{aligned}$$

So, $\Delta$ is the quantity of stock to be held so that the portfolio
is risk-free. Now impose the no arbitrage assumption: assert that the
risk-free portfolio in any of the two states of the world after one
period must have the same payoff as the portfolio at initial time
capitalized for the interest rate.

$$\begin{aligned}
  -C_u + \Delta uS_0 \stackrel{NAA}{=} (1 + r)(-C_0 + \Delta S_0)\end{aligned}$$

$$\begin{gathered}
  -C_u + \frac{C_u - C_d}{\cancel{S_0}(u-d)}\cancel{S_0}u =
  (1+r)\left(-C_0 + \frac{C_u - C_d}{\cancel{S_0}(u-d)}\cancel{S_0}\right) \Rightarrow
  \\
  \frac{-C_u(u-d) + (C_u - C_d)u}{u-d} = -C_0(1+r) + \frac{(1+r)(C_u-C_d)}{u-d} \Rightarrow
  \\
  \frac{C_u(u-d)+(C_u-C_d)(1+r-u)}{u-d} = C_0(1+r) \Rightarrow
  \\
  C_0 = \frac{1}{1+r} \left( C_u \frac{1+r-d}{u-d} + C_d \frac{-1-r+u}{u-d} \right) \Rightarrow
  \\
  C_0 = \frac{1}{1+r} \left(C_u p + C_d(1-p)\right) \quad \text{ where } \quad p = \frac{1+r-d}{u-d}\end{gathered}$$

Due to the previously imposed relationships between $u$, $d$ and $r$,
$p$ respects positivity and can be used as a *risk neutral probability*.

$$\begin{gathered}
  \mathbb{\tilde E}[S_1] = (uS_0)p + (dS_0)(1-p) = uS_0 \frac{1+r-d}{u-d} + dS_0 \frac{u-1-r}{u-d} =
  \\ \frac{u + ur - ud + du -d -dr}{u-d}S_0 = \frac{(u-d)(1+r)}{u-d}S_0 = (1+r)S_0\end{gathered}$$

### Two-period model

In a two-period CRR model, we have a *recombining tree*, that is,
up-down and down-up movements yield the same result.

$$\begin{gathered}
  S_0 \left\langle 
    \begin{array}{ll}
      uS_0 & \left\langle 
        \begin{array}{l}
          u^2S_0 \\
          udS_0
        \end{array} 
      \\
      dS_0 & \left\langle
        \begin{array}{l}
          duS_0 \\
          d^2 S_0
        \end{array} 
    \end{array} 
  \quad\quad
  C_0 \left\langle 
    \begin{array}{ll}
      C_u & \left\langle 
        \begin{array}{l}
          C_{uu} = (u^2S_0-K)^+ \\
          C_{ud} = (udS_0-K)^+
        \end{array} 
      \\
      C_d & \left\langle
        \begin{array}{l}
          C_{du} = (duS_0-K)^+ \\
          C_{dd} = (d^2S_0-K)^+
        \end{array} 
    \end{array} \end{gathered}$$

To obtain the option price $C_0$ in this case, the idea is to simply
backtrack from the last period, calculating the discounted $C_u$ and
$C_d$ first.

$$\begin{gathered}
  C_u \left\langle 
    \begin{array}{l}
      C_{uu} = (u^2S_0-K)^+ \\
      C_{ud} = (udS_0-K)^+
    \end{array} 
  \implies
  C_u = \frac{1}{1+r}(C_{uu} p + C_{ud}(1-p))
  \\
  C_d \left\langle
    \begin{array}{l}
      C_{du} = (duS_0-K)^+ \\
      C_{dd} = (d^2S_0-K)^+
    \end{array} 
  \implies
  C_d = \frac{1}{1+r}(C_{du} p + C_{dd}(1-p))\end{gathered}$$

Finally, we compose these results by computing

$$\begin{gathered}
  C_0 \left\langle
    \begin{array}{l}
      C_u \\
      C_d 
    \end{array} 
  \implies
  C_0 = \frac{1}{1+r} (C_up + C_d(1-p)) \\
  = \frac{1}{(1+r)^2} \left( C_{uu}p^2 + C_{ud}p(1-p) + C_{du}p(1-p) + C_{dd}(1-p)^2 \right) \\
  = \frac{1}{(1+r)^2} \left(C_{uu}p^2 + 2C_{ud}p(1-p) + C_{dd}(1-p)^2 \right)\end{gathered}$$

### $n$-period model

Generalizing to $n$ periods, we have a $\sim \mathcal{B}(n,p)$ model;
any given path on the binomial tree over the $n$ periods can have
$j: 0 \leq  j \leq  n$ steps up and $n-j$ steps down for the
underlying’s price, with a payoff of

$$(u^jd^{n-j}S_0 -K)^+$$

for an option on the underlying. Following the same reasoning as per the
two- and one-period model, we compute the option price as

$$\begin{gathered}
  C_0 = \frac{1}{(1+r)^n} \sum_{j=0}^n \left( u^j d^{n-j} S_0 - K \right)^+ \binom{n}{j} p^j(1-p)^{n-j} \\
  \text{(let } a \text{ s.t. } \forall j \geq a \quad u^jd^{n-j}S_0 - K > 0 \text{)} \\
  = \frac{1}{(1+r)^n} \sum_{j=a}^n \left( u^j d^{n-j} S_0 - K \right)^+ \binom{n}{j} p^j(1-p)^{n-j} \\
  = \frac{1}{(1+r)^n} \left[\sum_{j=a}^n \binom{n}{j}p^j(1-p)^{n-j}u^jd^{n-j}S_0 -K\sum_{j=a}^n \binom{n}{j}p^j(1-p)^{n-j}\right] \\
  = \sum_{j=a}^n \binom{n}{j}\left(\frac{pu}{1+r}\right)^j \left(\frac{(1-p)d}{1+r}\right)^{n-j}S_0 - \frac{1}{(1+r)^n}K\mathcal{B}_{(n,p)}(j\geq a) \\
  = S_0 \mathcal{B}_{\left(n, \frac{pu}{1+r}\right)}(j \geq a)- \frac{1}{(1+r)^n}K\mathcal{B}_{(n,p)}(j\geq a).\end{gathered}$$

Note that $\frac{pu}{1+r}$ is a probability because it is positive by no
arbitrage assumption and sums to $1$ with $\frac{(1-p)d}{1+r}$. Note
that the equation looks very similar to Black-Scholes, with the Binomial
distribution instead of the Normal.

Martingale
----------

Let $S_1$ be the stock price tomorrow. Under *risk neutral probability*,
this should be equal to the stock price today capitalized for the given
interest rate:

$$\mathbb{\tilde E} [S_1] = (1+r)S_0$$

Dividing both sides by $(1+r)$, we obtain that the expectation (under
*risk neutral probability*) of the stock price tomorrow ($t=1$) is equal
to the stock price today ($t=0$).

$$\mathbb{\tilde E}\left[ \frac{1}{(1+r)^1} S_1 \right] = \frac{1}{(1+r)^0} S_0 \equiv S_0$$

This is a *martingale*: in such a process, the expectations through time
are constant. A martingale is a *fair game* (in game-theoretic sense),
that is, it has zero drift. The stock market is not a fair game in the
real world, but in a risk neutral world it is.

**(Martingale).** Let $(\Omega,\mathcal{F},\mathbb{P})$ be a probability
space. The process $(M_t)_{t\geq 0}$ is a *martingale* if the
expectation at a future time $t$ given the information up to time $s$ is
equal to the expectation at time $s : 0 \leq s \leq t \leq T$.

$$\mathbb{E}[M_{t} | \mathcal{F}_s] = \mathbb{E}[M_s]$$

Equivalently,

$$\mathbb{E}[M_{s+ds} | \mathcal{F}_s] = M_s 
    \implies
    \mathbb{E}[M_{s+ds}] = \mathbb{E}[M_{s}]$$

The Brownian motion is a martingale.

*Proof*. Let $(W_t)_{t\geq 0}$ be a Brownian Motion in $(\Omega,
  \mathcal{F}, \mathbb{P})$.

$$\mathbb{E}[W_t|\mathcal{F}_s] = W_s,\ s < t \implies
    \mathbb{E}[W_t-W_s|\mathcal{F}_s] = 0$$

From the definition of Brownian motion, and its independent increments
property, follows

$$\mathbb{E}[W_t-W_s|\mathcal{F}_s] = \mathbb{E}[W_t-W_s] \stackrel{\mathcal{N}(0,\sigma)}{=} 0$$

Pricing exotic options
----------------------

The generic process of pricing an option involves discounting the
option’s payoff at maturity given a model for the underlying.

### Digital call option

The payoff for a *digital call option* is $H$ when the option is *in the
money*, $0$ otherwise:

$$D_T = \left\{ \begin{array}{cl}
      H & \text{if } p_t \geq K \\
      0 & \text{otherwise}
    \end{array}$$

Let $dp_t  = (r-q)p_tdt  + \sigma  p_t dW_t$ be the model for the
underlying, $t:0\leq  t\leq T$ the current time and $T$ the maturity.
The price of the digital option at time $t$ under the risk neutral
measure is

$$D_t = \mathbb{\tilde E}\left[ {\mathrm{e}}^{-r(T-t)}H \mathbbm{1}_{(p_T \geq K)} |\mathcal{F}_t \right]
      = {\mathrm{e}}^{-r(T-t)}H \mathbb{E}\left[ \mathbbm{1}_{(p_T \geq K)} | \mathcal{F}_t\right]
      = \cdots$$

Knowing that
$\mathbb{E}[\mathbbm{1}_A] =  1  \cdot  \mathbb{P}(A) +  0  \cdot
\mathbb{P}(A^C) = \mathbb{P}(A)$, we can replace the expectation with
the risk neutral probability; then, for the Markov property of
Black-Scholes model, we replace the filtration with the information
known at time $t$, that is, the underlying price.

$$\cdots = {\mathrm{e}}^{-r(T-t)}H \mathbb{\tilde P}(p_T \geq K | \mathcal{F}_t)
        = {\mathrm{e}}^{-r(T-t)}H \mathbb{\tilde P}(p_T \geq K | p_t) = \cdots$$

By Itō’s lemma, we can express the price at maturity $p_T$ as

$$p_T = p_t {\mathrm{e}}^{\left(r-q-\frac{\sigma^2}{2}\right)(T-t) + \sigma(W_T-W_t)}$$

Also, let $Y : Y\sqrt{T-t} = W_T-W_t$. Then,

$$\begin{aligned}
  \cdots &= {\mathrm{e}}^{-r(T-t)}H \mathbb{\tilde P}\left( p_t {\mathrm{e}}^{\left(r-q-\frac{\sigma^2}{2}\right)(T-t) +\sigma(W_T-W_t)} \geq K\right)
  \\&= {\mathrm{e}}^{-r(T-t)}H \mathbb{\tilde P}\left( p_t {\mathrm{e}}^{\left(r-q-\frac{\sigma^2}{2}\right)(T-t) +\sigma Y\sqrt{T-t}} \geq K\right)
  \\&= {\mathrm{e}}^{-r(T-t)}H \mathbb{\tilde P}\left(Y \geq -\frac{\ln\frac{p_t}{K} + \left(r-q-\frac{\sigma^2}{2}\right)(T-t)}{\sigma\sqrt{T-t}}\right)
  \\&= {\mathrm{e}}^{-r(T-t)}H \mathbb{\tilde P}(Y \geq -d_2) 
  \\&= {\mathrm{e}}^{-r(T-t)}H \mathcal{N}(-d_2)\end{aligned}$$

### Asset-or-nothing call option

The payoff for an *asset-or-nothing* call option is $p_T$ when the
option is *in the money*, $0$ otherwise:

$$A_T = \left\{ \begin{array}{cl}
      p_T & \text{if } p_t \geq K \\
      0 & \text{otherwise}
    \end{array}$$

The *asset-or-nothing* option price at present time $t$ is then computed
as

$$\begin{aligned}
  A_t &= {\mathbb{\tilde E}\left[ { {\mathrm{e}}^{-r(T-t)} p_T \mathbbm{1}(p_T \geq K) | \mathcal{F}_t } \right]}
  \\&= {\mathrm{e}}^{-r(T-t)} {\mathbb{\tilde E}\left[ { p_T \mathbbm{1}(p_T \geq K) | \mathcal{F}_t } \right]}
       \stackrel{\small Markov}{=}
       {\mathrm{e}}^{-r(T-t)} {\mathbb{\tilde E}\left[ { p_T \mathbbm{1}(p_T \geq K) | p_t } \right]} = \cdots\end{aligned}$$

$p_T$ is a *random variable*; its expectation can be computed, knowing
its distribution, by integrating. The indicator function means that the
expectation for $p_T$ can be computed only over the part where
$p_T  \geq K$, that is, past $d_2$.

$$\begin{aligned}
  \cdots &= {\mathrm{e}}^{-r(T-t)} \int_{-d_2}^\infty p_t {\mathrm{e}}^{\left(r-q-\frac{\sigma^2}{2}\right)(T-t)+\sigma (W_T-W_t)} 
            \cdot \frac{ {\mathrm{e}}^{-\frac{y^2}{2}}}{\sqrt{2\pi}} dy
  \\&= \int_{-d_2}^\infty p_t {\mathrm{e}}^{\left(r-r-q-\frac{\sigma^2}{2}\right)(T-t)+\sigma (W_T-W_t)} 
       \cdot \frac{ {\mathrm{e}}^{-\frac{y^2}{2}}}{\sqrt{2\pi}} dy
   \\&= p_t {\mathrm{e}}^{-q(T-t)} \int_{-d_2}^\infty \frac{ {\mathrm{e}}^{-\frac{\sigma^2}{2}+\sigma y\sqrt{T-t}-\frac{y^2}{2}}}{\sqrt{2\pi}} dy
   \\&= p_t {\mathrm{e}}^{-q(T-t)} \int_{-d_2}^\infty \frac{ {\mathrm{e}}^{-\frac{(\sigma\sqrt{T-t} + y)^2}{2}}}{\sqrt{2\pi}} dy = \cdots\end{aligned}$$

Now we flip the integration domain thanks to Normal distribution’s
symmetry property and then integrate by substituting
$z : z(y)  = \sigma\sqrt{T-t} + y$; the new integration domain extremes
are then $z(-\infty) = -\infty$ and $z(d_2)
= d_2 + \sigma\sqrt{T-t} = d_1$.

$$\begin{aligned}
  \cdots &= p_t {\mathrm{e}}^{-q(T-t)} \int_{-\infty}^{d_1} \frac{ {\mathrm{e}}^{-\frac{z^2}{2}}}{\sqrt{2\pi}} dz
  \\&= p_t {\mathrm{e}}^{-q(T-t)} \mathcal{N}(d_1).\end{aligned}$$

Equivalence of PDEs with Risk Neutral Valuation
-----------------------------------------------

Do PDEs and risk neutral valuation yield the same value for the price of
a derivative instrument? Suppose $f(t;p_t)$ satisfies Black-Scholes PDE:

$$\frac{ {\partial}f}{ {\partial}t} + rp_t\frac{ {\partial}f}{ {\partial}p_t} + \frac{1}{2} \frac{ {\partial}^2 f}{ {\partial}p_t^2}\sigma p_t^2 = rf(t;p_t)$$

We need to check if the price arising from risk neutral valuation is the
same:

$$f(t;p_t) = {\mathbb{\tilde E}\left[ {e^{-r(T-t)} \cdot \text{payoff} | \mathcal{F}_t} \right]}$$

Given the option price $f$, apply Itō to get the discounted option
price.

$$\begin{aligned}
  d\left[ f(t;p_t) {\mathrm{e}}^{-rt}\right] &= -r{\mathrm{e}}^{-rt} fdt + {\mathrm{e}}^{-rt} df + 0
  \\&= -r{\mathrm{e}}^{-rt} fdt + {\mathrm{e}}^{-rt} \left( \frac{ {\partial}f}{ {\partial}t} dt + \frac{ {\partial}f}{ {\partial}p_t} rp_tdt+ \frac{ {\partial}f}{ {\partial}p_t} \sigma p_t dW_t + 
       \frac{1}{2}\frac{ {\partial}^2 f}{ {\partial}p_t^2} \sigma^2p_t^2dt \right)
  \\&= {\mathrm{e}}^{-rt}dt \left( \cancel{-rf} + \cancel{\frac{ {\partial}f}{ {\partial}t} + \frac{ {\partial}f}{ {\partial}p_t} rp_t + \frac{1}{2} \frac{ {\partial}^2 f}{ {\partial}p_t^2} \sigma^2 p_t^2}\right)
       + {\mathrm{e}}^{-rt} \frac{ {\partial}f}{ {\partial}p_t}\sigma p_t dW_t
  \\&= {\mathrm{e}}^{-rt} \frac{ {\partial}f}{ {\partial}p_t}\sigma p_t dW_t\end{aligned}$$

We now note that the discounted option price lacks a drift, and is thus
a *martingale*: hence,

$${\mathbb{\tilde E}\left[ { {\mathrm{e}}^{-rT} f(T;p_T)| \mathcal{F}_t} \right]} = {\mathrm{e}}^{-rt}f(t;p_t)$$

and the two approaches give the same result. **TODO not clear!**

Dynamic Hedging: the Greeks
---------------------------

The operation of constructing a locally risk-free portfolio like in
Black-Scholes approach is an *hedging strategy*. The *Greeks* are
quantities, named after the fact that each of them is indicated by a
different greek letter, which convey some information on the sensitivity
of the price of a derivative with respect to some financial component of
the model (for example, the price or the volatility of the underlying,
or some other parameter). Each greek is actually a function of time, and
can thus be computed at any time $t$, hence providing a form of *dynamic
hedging*.

### Delta

The greek *Delta* measures the *sensitivity* of the price of the
derivative with respect to the underlying’s price.

$$\Delta_t = \frac{ {\partial}f(t;S_t)}{ {\partial}S_t}$$

Let’s calculate the Delta for an European call option. The call option
price is
$$C_t = S_t \mathcal{N}(d_1) - K{\mathrm{e}}^{-r(T-t)}\mathcal{N}(d_2)
    \quad
    \text{where} \quad
    \left\{ \begin{array}{c}
        d_1 = \frac{
          \ln\frac{S_t}{K} + \left(r + \frac{\sigma^2}{2}\right)(T-t)
        }{\sigma\sqrt{T-t}} \\
        d_2 = d_1 - \sigma\sqrt{T-t}
      \end{array}$$

The Delta is the quantity of underlying I need at time $t$ to hedge the
risk in a portfolio
$\Pi_t  = \left\{ -1  \text{ option},  \frac{ {\partial}f(t;S_t)}{ {\partial}S_t} \text{ underlying}\right\} $.

$$\Delta^C_t = \frac{ {\partial}C_t}{ {\partial}S_t} = \mathcal{N}(d_1)$$

Notice that the Delta for an European call option is always positive,
which means that in the case of the portfolio $\Pi_t$ the underlying
will always be held in a long position.

*Proof.* $S_t$ also appears in $d_1$ and $d_2$, so we can’t treat
$\mathcal{N}(d_1)$ and $\mathcal{N}(d_2)$ as constants; we must
differentiate them w.r. $S_t$ too. For the chain rule,

$$\frac{ {\partial}S_t\mathcal{N}(d_1)}{ {\partial}S_t} = \cancelto{1}{\frac{ {\partial}S_t}{ {\partial}S_t}} \mathcal{N}(d_1) + S_t \frac{ {\partial}\mathcal{N}(d_1)}{ {\partial}S_t}.$$

So,

$$\Delta^C_t = \mathcal{N}(d_1) + S_t\frac{ {\partial}\mathcal{N}(d_1)}{ {\partial}S_t} - K{\mathrm{e}}^{-r(T-t)} \frac{ {\partial}\mathcal{N}(d_2)}{ {\partial}S_t}$$

Compute the two partial derivatives appearing. First, the one for
${\mathcal{N}}(d_1)$: $$\begin{aligned}
    \frac{ {\partial}{\mathcal{N}}(d_1)}{ {\partial}S_t} &= \frac{ {\partial}}{ {\partial}S_t} \int_{-\infty}^{d_1} \frac{ {\mathrm{e}}^{-\frac{y^2}{2}}}{\sqrt{2\pi}} dy
    = {\mathcal{N}}'(d_1) \frac{ {\partial}d_1}{ {\partial}S_t} - {\mathcal{N}}'(-\infty)\cancelto{0}{\frac{ {\partial}(-\infty)}{ {\partial}S_t}}
    \\&= n(d_1)\frac{ {\partial}d_1}{ {\partial}S_t} = n(d_1) \cdot \frac{1}{\sigma\sqrt{T-t}}\frac{1}{\frac{S_t}{\cancel{K}}} \frac{1}{\cancel{K}}
    = \frac{n(d_1)}{S_t\sigma\sqrt{T-t}}
  \end{aligned}$$

Then, the one for ${\mathcal{N}}(d_2)$: $$\begin{aligned}
    \frac{ {\partial}{\mathcal{N}}(d_2)}{ {\partial}S_t} &= n(d_2)\frac{ {\partial}d_2}{ {\partial}S_t} = n(d_2)\frac{ {\partial}(d_1 - \sigma\sqrt{T-t})}{ {\partial}S_t}
    \\&= n(d_2) \cdot \left( \frac{1}{\sigma\sqrt{T-t}} \frac{1}{\frac{S_t}{\cancel{K}}} \frac{1}{\cancel{K}} \right)
    = \frac{n(d_2)}{S_t\sigma\sqrt{T-t}}
  \end{aligned}$$

Now plug the results in the original equation for Delta:
$$\begin{aligned}
    \Delta^C_t = {\mathcal{N}}(d_1) + S_t \frac{n(d_1)}{S_t\sigma\sqrt{T-t}} - K{\mathrm{e}}^{-r(T-t)}\frac{n(d_2)}{S_t\sigma\sqrt{T-t}}
  \end{aligned}$$

Isolate the two terms multiplying the gaussian density $n$:
$$\begin{aligned}
    & S_t \frac{n(d_1)}{S_t\sigma\sqrt{T-t}} - K{\mathrm{e}}^{-r(T-t)}\frac{n(d_2)}{S_t\sigma\sqrt{T-t}} =
    \\=& \frac{1}{S_t\sigma\sqrt{T-t}} \left( S_t n(d_1) - K{\mathrm{e}}^{-r(T-t)}n(d_2)\right) =
    \\=& \frac{1}{S_t\sigma\sqrt{T-t}} \left( \frac{S_t {\mathrm{e}}^{-\frac{d_1^2}{2}}}{\sqrt{2\pi}} 
    - \frac{K{\mathrm{e}}^{-r(T-t) -\frac{d_2^2}{2}}}{\sqrt{2\pi}}\right) =
    \\=& \frac{1}{S_t\sigma\sqrt{T-t}\sqrt{2\pi}} \left( S_t {\mathrm{e}}^{-\frac{d_1^2}{2}} - K{\mathrm{e}}^{-r(T-t) -\frac{d_2^2}{2}} \right) =
    \\=& \frac{1}{S_t\sigma\sqrt{T-t}\sqrt{2\pi}} \left( S_t {\mathrm{e}}^{-\frac{d_1^2}{2}} - K{\mathrm{e}}^{-r(T-t) - \frac{d_1^2}{2} - \frac{\sigma^2(T-t)}{2} + \frac{2}{2}d_1\sigma\sqrt{T-t}} \right) =
    \\=& \frac{ {\mathrm{e}}^{-\frac{d_1^2}{2}}}{S_t\sigma\sqrt{T-t}\sqrt{2\pi}}\left( S_t - K{\mathrm{e}}^{-r(T-t) -\frac{\sigma^2(T-t)}{2} + d_1\sigma\sqrt{T-t}}\right) =
    \\=& \frac{ {\mathrm{e}}^{-\frac{d_1^2}{2}}}{S_t\sigma\sqrt{T-t}\sqrt{2\pi}}\left( S_t - K{\mathrm{e}}^{\cancel{-r(T-t) -\frac{\sigma^2(T-t)}{2}} + \ln\frac{S_t}{K} + \cancel{\left( r + \frac{\sigma^2}{2}\right)(T-t)}}\right) =
    \\=& \frac{ {\mathrm{e}}^{-\frac{d_1^2}{2}}}{S_t\sigma\sqrt{T-t}\sqrt{2\pi}}\left( S_t - K{\mathrm{e}}^{\ln\frac{S_t}{K}}\right)
    = \frac{ {\mathrm{e}}^{-\frac{d_1^2}{2}}}{S_t\sigma\sqrt{T-t}\sqrt{2\pi}}\left( S_t - K\frac{S_t}{K}\right) =
    \\=& \frac{ {\mathrm{e}}^{-\frac{d_1^2}{2}}}{S_t\sigma\sqrt{T-t}\sqrt{2\pi}}\cancel{\left( S_t - S_t\right)} = 0.
  \end{aligned}$$

We have proven $S_t      \frac{n(d_1)}{S_t\sigma\sqrt{T-t}}     -
  K{\mathrm{e}}^{-r(T-t)}\frac{n(d_2)}{S_t\sigma\sqrt{T-t}} = 0$, so we
finally get

$$\Delta^C_t = {\mathcal{N}}(d_1).$$

Informally, Delta indicates how much to buy or sell to cover your
portfolio.

### Gamma

In approximating the derivative price $f(t+dt;S_{t+dt})$ with a
first-order Taylor expansion, that is, hedging with the Delta, we commit
a *hedging error*, whose quantity is

$$\left(f(t;S_t) + \frac{ {\partial}f(t;S_t)}{ {\partial}S_t}\right) - f(t+dt;S_{t+dt})$$

This represent the quantity that is not covered by the hedging strategy.
The magnitude of the hedging error depends on how much the concavity of
the derivative curve is stressed. By studying the second order
derivative, we can see how long it takes for the hedging error to get
too large, and thus decide how often to buy and sell to rebuild the
locally risk-free portfolio. The second derivative of the derivative
price with respect to the underlying price is the Gamma:

$$\Gamma_t = \frac{ {\partial}^2 f(t;S_t)}{ {\partial}S_t^2} = \frac{ {\partial}\Delta_t}{ {\partial}S_t}$$

For example, for the European call, we have:

$$\Gamma^C_t = \frac{ {\partial}C_t}{ {\partial}S_t^2} = \frac{ {\partial}\Delta^C_t}{ {\partial}S_t} = \frac{ {\partial}{\mathcal{N}}(d_1)}{ {\partial}S_t} =
  \frac{n(d_1)}{S_t\sigma\sqrt{T-t}}.$$

### Other Greeks

Three other important Greeks are the Vega, the Rho and the Theta.

$$\begin{array}{rlr}
    \text{Vega}_t &= \frac{ {\partial}f(t;S_T)}{ {\partial}\sigma} & \text{Sensitivity w.r. to the volatility} \\
    \rho_t &= \frac{ {\partial}f(t;S_T)}{ {\partial}r} & \text{Sensitivity w.r. to the risk-free rate} \\
    \Theta_t &= \frac{ {\partial}f(t;S_T)}{ {\partial}t} & \text{Sensitivity w.r. to time} \\
  \end{array}$$

These three Greeks allow you to hedge against model misspecifications
instead of risk; for example, Black-Scholes’ considers both the
volatility $\sigma$ and the risk-free rate $r$ as constants, and this
tends not to be true in reality.

For European call options, these three Greeks are

$$\text{Vega}^C_t = \frac{ {\partial}C_t}{ {\partial}\sigma} = S_t\sqrt{T-t} \cdot n(d_1)$$
$$\rho^C_t = \frac{ {\partial}C_t}{ {\partial}r} = K(T-t){\mathrm{e}}^{-r(T-t)}{\mathcal{N}}(d_2)$$
$$\Theta^C_t = \frac{ {\partial}C_t}{ {\partial}t} = -\frac{\sigma S_t n(d_1)}{2\sqrt{T-t}} - rK{\mathrm{e}}^{-r(T-t)}{\mathcal{N}}(d_2)$$

### Put-call parity

The Greeks for put options can be calculated by being mindful of the
put-call parity relationship:

$$\forall t \quad C_t + K{\mathrm{e}}^{-r(T-t)} = P_t + S_t$$

Or, equivalently,

$$C_t = P_t + S_t - K{\mathrm{e}}^{-r(T-t)}$$
$$P_t = C_t + K{\mathrm{e}}^{-r(T-t)} - S_t$$

Then, the Greeks for European put options can be calculated as follows.

#### Put Delta

$$\Delta^P_t = \frac{ {\partial}P_t}{ {\partial}S_t} = \frac{ {\partial}C_t}{ {\partial}S_t} - \frac{ {\partial}S_t}{ {\partial}S_t} =
    \Delta^C_t - 1 = {\mathcal{N}}(d_1) - 1 < 0$$

For a put option, the Delta is always negative, this means that the
hedging position should always be short.

#### Put Gamma

For a put option, the Gamma is identical to the case of a call option.

$$\Gamma^P_t = \frac{ {\partial}^2 P_t}{ {\partial}S_t^2} = \frac{ {\partial}\Delta^P_t}{ {\partial}S_t} =
  \frac{ {\partial}\Delta^C_t - 1}{ {\partial}S_t} = \frac{ {\partial}\Delta^C_t}{ {\partial}S_t} = \frac{n(d_1)}{S_t\sigma\sqrt{T-t}} \equiv \Gamma^C_t$$

#### Other Greeks for put options

$$\text{Vega}^P_t = \frac{ {\partial}P_t}{ {\partial}\sigma} = S_t\sqrt{T-t}\cdot n(d_1) \equiv \text{Vega}^C_t$$

$$\rho^P_t = \frac{ {\partial}P_t}{ {\partial}r} = -K(T-t){\mathrm{e}}^{-r(T-t)} {\mathcal{N}}(-d_2)$$

$$\Theta^P_t = \frac{ {\partial}P_t}{ {\partial}t} = -\frac{\sigma S_t n(d_1)}{2\sqrt{T-t}} + rK{\mathrm{e}}^{-r(T-t)}{\mathcal{N}}(-d_2)$$

Suppose you have to sell an European call option whose underlying,
$S_t$, follows a Black-Scholes model. The following is known:

$$S_0 = 8 \quad K = 8 \quad \mu = 20\% \quad \sigma = 40\% \quad r = 4\% \quad T = 1 \text{\ year}$$

**(1)**. Determine the number of underlying to buy/sell to hedge this
short position.

We want to create a *delta-neutral portfolio*, that is, a portfolio
where $\Delta = 0$. This way, risk is removed since the rate of change
of the portfolio value with respect to the price variation of the asset
is zero.

We know that

$$\Delta_0^C = {\mathcal{N}}(d_1) = {\mathcal{N}}\left(\frac{\ln\frac{8}{8} + \left(0.04 + \frac{0.4^2}{2}\right) \cdot 1}{0.4\sqrt{1}}\right)
    = {\mathcal{N}}(0.3) = 0.618$$

We can now impose the Delta for the portfolio
$\pi = -1 \text{\ call option} +
  x \text{ stocks}$ to be zero and solve the resulting equation for $x$
to get the number of stocks the portfolio needs to have.

$$\Delta^\pi = -1\cdot\Delta_0^C + x\cdot\overbrace{\Delta_0^{S}}^{\text{always }1} = 0 \implies
    x = \frac{\Delta^C_0}{\Delta^S_0} = \frac{0.618}{1} = 0.618$$

This means that 0.618 units of stock must be bought to hedge one unit of
short call option. From this, the Delta for the put option with same
strike and maturity as the call can be computed by put-call parity:

$$\Delta_0^P = \Delta_0^C - 1 = 0.618 - 1 = -0.382$$

**(2)**. Having a call option on the same underlying, but with strike
$K'
  = 12$, construct a portfolio which is Delta- and Gamma-neutral.

$$\Delta_0^{C'} = {\mathcal{N}}(d'_1) = {\mathcal{N}}\left(
      \frac{\ln\frac{8}{12} + \left(0.04+\frac{0.4^2}{2}\right)\cdot 1}{0.4\sqrt{1}}
    \right) = {\mathcal{N}}(-0.71) = 0.238$$
$$\Gamma_0^{C} = \frac{n(d_1)}{\sigma S_0\sqrt{T-t}} = 
    \frac{\frac{1}{\sqrt{2\pi}} {\mathrm{e}}^\frac{-(0.3)^2}{2}}{0.4 \cdot 8 \sqrt{1}} = 0.12$$
$$\Gamma_0^{C'} = \frac{n(d'_1)}{\sigma S_0\sqrt{T-t}} = 
    \frac{\frac{1}{\sqrt{2\pi}} {\mathrm{e}}^\frac{-(-0.71)^2}{2}}{0.4 \cdot 8 \sqrt{1}} = 0.097$$

To have a Gamma-neutral portfolio, we must solve for $y$ the equation

$$\Gamma_0^\pi = -1 \cdot \Gamma_0^C + y\Gamma_0^{C'} + 0.618\cdot \overbrace{\Gamma_0^S}^{\text{always }0} = 0
    \implies y = \frac{\Gamma_0^C}{\Gamma_0^{C'}} = 1.237$$

This means we need to buy 1.237 units of the second call option; but,
doing this, the portfolio may no longer be Delta-neutral, since
$\Delta^\pi  =
  1.237\Delta_0^{C'} \neq  0$. At this point, we start from the
Gamma-neutral portfolio of options and make it Delta-neutral again by
imposing

$$-1\cdot\Delta_0^C + 1.237\cdot\Delta_0^{C'} + x\Delta_0^S = 0
    \implies
    x = \Delta_0^C - 1.237\Delta_0^{C'} = 0.324$$

Finally, selling one unit of the first call option, buying 1.237 units
of the second call option and 0.324 units of underlying grants a Delta-
and Gamma-neutral portfolio.

More Exotic options
-------------------

Exotic options are those generally not obeying Black-Scholes rules:
their payoff can be non-smooth and path dependent. Non-smoothness for
the pricing problem is generally not a big problem. For example, the
Digital option having payoff

$$D_T = \begin{cases} H & S_T\geq K \\ 0 & S_T<K \end{cases} = H\mathbbm{1}_{\{S_T\geq K\}}$$

can be priced using risk neutral valuation:

$$D_t = {\mathbb{\tilde E}\left[ { {\mathrm{e}}^{-r(T-t)}D_T\Big|\mathcal{F}_t} \right]} = H{\mathrm{e}}^{-r(T-t)}\mathbb{P}(S_T\geq K|\mathcal{F}_t)
  = H{\mathrm{e}}^{-r(T-t)}{\mathcal{N}}(d_2)$$

The hedging problem, instead, is trickier:

$$\begin{gathered}
  \Delta^D_t = \frac{ {\partial}D_t}{ {\partial}S_t} = H{\mathrm{e}}^{-r(T-t)}\cdot \frac{ {\partial}{\mathcal{N}}(d_2)}{ {\partial}S_t} = (*)\end{gathered}$$

$$\begin{gathered}
  \frac{ {\partial}{\mathcal{N}}(d_2)}{ {\partial}S_t} = \frac{ {\partial}}{ {\partial}S_t}\int_{-\infty}^{d_2} \frac{ {\mathrm{e}}^{-\frac{y^2}{2}}}{\sqrt{2\pi}}dy
  = n(d_2)\frac{ {\partial}d_2}{ {\partial}S_t} = \\
  = \frac{ {\mathrm{e}}^{-\frac{\ln\frac{S_t}{k} + \left(r-\frac{\sigma^2}{2}\right)(T-t)^2}{2\sigma^2(T-t)}}}{\sqrt{2\pi}}
  \cdot \frac{1}{S_t\sigma\sqrt{T-t}}\end{gathered}$$

$$\begin{gathered}
  (*) = \frac{H{\mathrm{e}}^{-r(T-t)}}{S_t\sigma\sqrt{T-t}\sqrt{2\pi}}\cdot{\mathrm{e}}^{-\frac{\ln\frac{S_t}{k} + \left(r-\frac{\sigma^2}{2}\right)(T-t)^2}{2\sigma^2(T-t)}}\end{gathered}$$

As $t \to  T$, $S_t  \to K$ and $\Delta^D_t  \to \infty$ which means
that an infinite amount of underlying should be bought to hedge the
portfolio, and in practice the hedge can’t be done.

### Barrier options

Path dependency means that the payoff depends on the process
$(S_t)_{t \leq T}$. Considering, for example, a payoff depending on the
running minimum/running maximum of the underlying’s price. We must
define two new processes

$$S_*(t) = \min\{S_u : 0 \leq u \leq t\} \quad\quad
  S^*(t) = \max\{S_u : 0 \leq u \leq t\}$$

A *barrier option* is an option that activates or loses value when the
underlying crosses a given price in a certain direction.

              Up                                                   Down
  ----------- ---------------------------------------------------- ----------------------------------------------------
  Knock-in    Activates when underlying price becomes $\geq c$     Activates when underlying price becomes $\leq c$
  Knock-out   Deactivates when underlying price becomes $\geq c$   Deactivates when underlying price becomes $\leq c$

A barrier option can be priced using risk neutral valuation. For
example, consider a barrier in-up call having payoff
$(S_T-K)^+\cdot\mathbbm{1}_{(S_*(t)\leq c)}$:

$$\begin{gathered}
  \text{Bar}_0 = {\mathbb{\tilde E}\left[ {(S_T-K)^+\cdot\mathbbm{1}_{(S_*(t)\leq c)}} \right]}
  = \iint f(S_t,S_*(t)) \cdots \\= \left(\frac{c}{S_0}\right)^{\frac{2r}{\sigma^2}-1}
  C^E\left(\frac{c^2}{S_0},T,K\right)\end{gathered}$$

where $C^E$ is the standard European call.

### Lookback options

A lookback option gives you the right to pay or receive the minimum or
maximum: there is no fixed strike price.

$$L_T\equiv (S_T - S_*(t))$$

This kind of option can be priced using risk neutral valuation.

$$L_0 = {\mathbb{\tilde E}\left[ { {\mathrm{e}}^{-rT}(S_T-S_*(T))} \right]}$$

### Asian options

Asian options’ payoff depends on an average value of the underlying’s
price during the life of the contract. If a simple arithmetic average is
used for the payoff, such as

$$\left(\frac{1}{T} \int_0^T S_tdt - K\right)^+ \approx 
  \left(\frac{1}{n}\sum_{i=1}^{n} S_{t_i} -K\right)^+$$

we don’t have an analytical solution since $S_{t_i} \sim $ lognormal is
unstable. We can use, instead, a geometric average as a proxy for the
arithmetic average, giving a lower bound:

$$\left(\prod_{i=1}^n S_{t_i}\right)^{\frac{1}{n}} \implies$$
$$\ln\left(\prod_{i=1}^n S_{t_i}\right)^{\frac{1}{n}} =
  \frac{1}{n}\ln\left(\prod_{i=1}^n S_{t_i}\right) =\frac{1}{n}\sum_{i=1}^{n} \ln S_{t_i}
  \leq \frac{1}{n}\sum_{i=1}^{n} S_{t_i}$$

### American options

American options are similar to European options but allow early
exercise. Let $\tau$ be the (random) stopping time; for example, the
payoff for an American put option is is $(K -  S_\tau)^+$. This is
difficult to compute using risk neutral valuation:

$${\mathbb{\tilde E}\left[ { {\mathrm{e}}^{-r(T-t)} \max_\tau (K-S_\tau)^+} \right]}$$

Partial differential equations, on the other hand, have no boundary in
this case.

Interest rate models
====================

Black-Scholes asset and derivative pricing models assume the interest
rate for the considered time interval to be constant. In reality,
interest rate is subject to change in a stochastic way, similar to what
happens for underlyings.

### Fundamental models

The following are some of the models used for modeling interest rate
evolution. Generally, the deterministic factor indicates *mean
reversion*, whereas the stochastic factor is a volatility similar to
Bachelier or Black-Scholes models.

  ------------------------------------------------------------------------------------ --------------------------------------------------------------------------------------------------
  <span> **Vašiček model** $$dr_t = a(b - r_t)dt + \sigma dW_t$$ </span>               <span> **Cox-Ingersoll-Ross model** $$dr_t = a(b - r_t)dt + \sigma \sqrt{r_t}dW_t$$ </span>
  <span> **Dothran model** $$dr_t = a r_t dt + \sigma r_t dW_t$$ </span>               <span> **Ho-Lee model** $$dr_t = \Theta (t) dt + \sigma dW_t$$ </span>
  <span> **Hull-White model** $$dr_t = a(t)(b(t) - r_t)dt + \sigma(t) dW_t$$ </span>   <span> **Generalized CIR model** $$dr_t = a(t)(b(t) - r_t)dt + \sigma(t)\sqrt{r_t}dW_t$$ </span>
  ------------------------------------------------------------------------------------ --------------------------------------------------------------------------------------------------

### Vašiček model

<span>**(Vašiček model is Gaussian)**</span>

*Proof.* Use Itō’s Lemma to study the dynamics of ${\mathrm{e}}^{as}r_s$
where $r_s$ follows a Vašiček model. Note that the model can be written
equivalently as $dr_t = -a(r_t-b)dt + \sigma dW_t$.

$$\begin{aligned}
  d({\mathrm{e}}^{as}r_s) &= a{\mathrm{e}}^{as}r_s ds + {\mathrm{e}}^{as}dr_s =
  a{\mathrm{e}}^{as}r_sds + {\mathrm{e}}^{as}\left( -a(r_s-b)ds + \sigma dW_s\right)
  \\&= \underbracket{ {\mathrm{e}}^{as}ab}_\text{determ.}ds + \underbracket{ {\mathrm{e}}^{as}\sigma}_\text{determ.} dW_s\end{aligned}$$

Now compute the value of the function in the increment $[0,t]$ and,
consequently, the value of the process at time $t$.

$$\begin{gathered}
  {\mathrm{e}}^{at}r_t - {\mathrm{e}}^{a\cdot 0}r_0 = \int_0^t ab{\mathrm{e}}^{as}ds + \int_0^t {\mathrm{e}}^{as}\sigma dW_s \implies \\
  {\mathrm{e}}^{at}r_t = r_0 + \left[b{\mathrm{e}}^{as}\right]^t_0 + \int_0^t {\mathrm{e}}^{as}\sigma dW_s \implies \\
  r_t = {\mathrm{e}}^{-at} r_0 + b{\mathrm{e}}^{-at}({\mathrm{e}}^{at}-1) + {\mathrm{e}}^{-at} \int_0^t {\mathrm{e}}^{as}\sigma dW_s\end{gathered}$$

The remaining integral is with respect of a function of time and a
stochastic variable, and is thus a *stochastic integral*; we study its
distribution.

Let $h$ be a deterministic function, such that we can have
$\int_0^t h(s)dW_s$. For example, consider the *step function*

$$h(s) = \sum_{i=0}^{n-1} h_i \mathbbm{1}_{[t_i,t_{i+1}]}(s)
  \quad \text{s.t.} \quad
  \int_0^t h(s)dW_s \approx \sum_{i=0}^{n-1} h_i \left( W_{t_i+1} - W_{t_i} \right)$$

Each of the Brownian motion increments in the summation is thus
distributed like

$$W_{t_{i+1}} - W_{t_i} \sim {\mathcal{N}}(0,t_{i+1}-t_i)} \equiv {\mathcal{N}}(0,h^2_i(t_{i+1}-t_i))$$

From the stability of the Gaussian distribution and the independence of
Brownian increments follows

$$X(W) = \int_0^t h(s)dW_s \sim {\mathcal{N}}\left(0, \sum_{i=0}^{n-1} h^2_i(t_{i+1}-t_i)\right) \approx
  {\mathcal{N}}\left(0, \int_0^t h^2(s)ds\right)$$

### Stochastic interest rates

When interest rates are considered as being stochastic, the zero-coupon
bond price $P(t,T)$ at time $t$ with maturity $T$ becomes a stochastic
process, varying across the *term structure of interest rates*
$\mathcal{T}  =
[T_1,T_2]$:

$$\left( \left(P(t,T)\right)_{t \in [0,T]}\right)_{T\in \mathcal{T}}$$

The zero-coupon bond behaves like a derivative instrument whose
underlying is the spot interest rate. The classical approach to
stochastic bond pricing is to give an exogenous model for the spot
interest rate $(r_t)_{t  \in [0,T]}$ and, under no arbitrage assumption,
derive $\left(P(t,T)\right)_{t  \in [0,T]}$. Two conditions imposed for
this are:

-   $ P(T,T) = 1 $

-   $ P(t_1,T) <P (t_2,T) \quad \text{for all} \quad t_1 < t_2 $

It has been proved that, under no arbitrage assumption, the discounted
stock price and the discounted european option price are *martingales*
with respect to the risk neutral measure in
$(\Omega,\mathcal{F},\mathbb{\tilde P})$:

$$\begin{aligned}
  dS_t &= rS_tdt + \sigma S_t dW_t \implies\\
  d({\mathrm{e}}^{-rt}S_t) &= -r{\mathrm{e}}^{-rt}S_tdt+ {\mathrm{e}}^{-rt}dS_t \\
                    &= -r{\mathrm{e}}^{-rt}S_tdt + {\mathrm{e}}^{-rt}\left(rS_tdt+\sigma S_t dW_t\right) \\
                    &= {\mathrm{e}}^{-rt}S_t\sigma dW_t \\
  d({\mathrm{e}}^{-rt}f(t;S_t)) & = \frac{ {\partial}f}{ {\partial}S_t}{\mathrm{e}}^{-rt}\sigma S_t dW_t\end{aligned}$$

Let now $\hat{P}(t,T)$ and $P(t,T)$ be, respectively, the discounted
bond price and the bond price, assume $(r_t)$ to be such that
$dr_t  = \mu(r_t)dt  +
\sigma(r_t)dW_t$. Hence,

$$\hat{P}(t,T) = {\mathrm{e}}^{-\int_0^T r(s)ds}P(t,T)$$

(Note that, if $r_t$ is supposed constant,
${\mathrm{e}}^{-\int_0^T r(s)ds}  = rt$). Impose now $\hat{P}$ to be a
martingale:

$${\mathbb{\tilde E}\left[ { \hat{P}(T,T) \Big| \mathcal{F}_t} \right]} = \hat{P}(t,T)\quad \forall t<T$$

$${\mathbb{\tilde E}\left[ { {\mathrm{e}}^{-\int_0^T r(s)ds}\hat{P}(T,T) \Big| \mathcal{F}_t} \right]} = {\mathrm{e}}^{-\int_0^T r(s)ds}\hat{P}(t,T)$$

$${\mathrm{e}}^{\int_0^t r(s)ds}{\mathbb{\tilde E}\left[ { {\mathrm{e}}^{-\int_0^T r(s)ds}\hat{P}(T,T) \Big| \mathcal{F}_t} \right]} = \hat{P}(t,T)$$

The part ${\mathrm{e}}^{\int_0^t r(s)ds}$ is known at time $t$, and can
thus be put inside the expectation; moreover, $P(T,T)=1$ by definition:

$$P(t,T) = {\mathbb{\tilde E}\left[ { {\mathrm{e}}^{\int_0^tr(s)ds -\int_0^Tr(s)ds} \cdot 1 \Big| \mathcal{F}_t} \right]}
  = {\mathbb{\tilde E}\left[ { {\mathrm{e}}^{-\int_t^T r(s)ds} \Big| \mathcal{F}_t} \right]}$$

The bond price is the expectation of the payoff $1$ discounted by the
correct factor, given the Brownian filtration at time $t$.

### Variance and covariance for Vašiček model

It has been proved that Vašiček model is
$\sim {\mathcal{N}}(\cdot,\cdot)$, and that the spot rate at time $t$ is
given by

$$r_t = r_0 {\mathrm{e}}^{at}+b(1-{\mathrm{e}}^{-at}) + \sigma {\mathrm{e}}^{-at}\int_0^t{\mathrm{e}}^{as}dW_s$$

It can be proven that the stochastic part is Gaussian:

$$\sigma{\mathrm{e}}^{-at} \int_0^t {\mathrm{e}}^{as}dW_s \sim {\mathcal{N}}\left(0,\int_0^t{\mathrm{e}}^{2as}ds\right).$$

With $h$ deterministic,

$$\int_0^t h(s)dW_s \approx \sum_{i=0}^{n-1} h_i \cdot (W_{t_{i+1}}-W_{t_i})$$

and we can compute the variance as

$$\begin{gathered}
  \mathbb{E}\left[ \left( \sum_{i=0}^{n-1} h_i \left(W_{t_{i+1}} - W_{t_i} \right)\right)^2\right]
  = \\ = \mathbb{E}\left[ \sum_{i=0}^{n-1} h_i^2 \left(W_{t_{i+1}} - W_{t_i} \right)^2 \right]
  + \mathbb{E}\left[ \sum_{i\neq j} h_i h_j\left(W_{t_{i+1}} - W_{t_i} \right) \left(W_{t_{j+1}} - W_{t_j} \right)\right] =
  \\ = \mathbb{E}\left[ \sum_{i=0}^{n-1} h_i^2 \left(W_{t_{i+1}} - W_{t_i} \right)^2 \right]
  + \sum_{i \neq j} h_i h_j \cancelto{0}{\mathbb{E}\left[\left(W_{t_{i+1}} - W_{t_i} \right) \left(W_{t_{j+1}} - W_{t_j} \right)\right]} 
  \\ = \mathbb{E}\left[ \sum_{i=0}^{n-1} h_i^2 \left(W_{t_{i+1}} - W_{t_i} \right)^2 \right]
  =  \sum_{i=0}^{n-1} h_i^2 \mathbb{E}\left[ \left(W_{t_{i+1}} - W_{t_i} \right)^2 \right]
  \\ = \sum_{i=0}^{n-1} h_i^2 (t_{i+1}-t_i) \approx \int_0^t h^2(s)ds\end{gathered}$$

The expectation for the spot rate is

$$\begin{aligned}
  \mathbb{E}\left[ r_t \right] &= \mathbb{E}\left[r_0 {\mathrm{e}}^{at}+b(1-{\mathrm{e}}^{-at}) + \sigma {\mathrm{e}}^{-at}\int_0^t{\mathrm{e}}^{as}dW_s\right]
  \\ &= r_0 {\mathrm{e}}^{at} + b(1-{\mathrm{e}}^{at}) + \cancelto{0}{\mathbb{E}\left[\sigma {\mathrm{e}}^{-at}\int_0^t{\mathrm{e}}^{as}dW_s\right]}
  \\ &= r_0 {\mathrm{e}}^{at} + b(1-{\mathrm{e}}^{at}) \end{aligned}$$

This means Vašiček is
$\sim {\mathcal{N}}(r_0  {\mathrm{e}}^{at}  + b(1-{\mathrm{e}}^{at})  ,
\cdot)$. Now, compute the *autocovariance* (note: $\mathrm{Cov}(X,Y) =
\mathbb{E}[XY] - \mathbb{E}[X]\mathbb{E}[Y]$):

$$\begin{aligned}
  \mathrm{Cov}(r_t,r_{t+h}) &= \mathrm{Cov}\left(
    \sigma {\mathrm{e}}^{-at}\int_0^t{\mathrm{e}}^{as}dW_s,
    \sigma {\mathrm{e}}^{-a(t+h)}\int_0^{t+h}{\mathrm{e}}^{as}dW_s,
  \right)
  \\ &= \mathbb{E}\left[ 
    \sigma{\mathrm{e}}^{-at}\int_0^t{\mathrm{e}}^{as}dW_s \cdot
    \sigma{\mathrm{e}}^{-a(t+h)}\int_0^{t+h}{\mathrm{e}}^{as}dW_s
  \right] - 0
  \\ &= \sigma^2 {\mathrm{e}}^{-at-a(t+h)} \mathbb{E}\left[
    \int_0^t{\mathrm{e}}^{as}dW_s(\omega) \cdot
    \int_0^{t+h}{\mathrm{e}}^{as}dW_s(\omega) \cdot
  \right]
  \\ &= \sigma^2 {\mathrm{e}}^{-at-a(t+h)} \mathbb{E}\left[
    \int_0^t{\mathrm{e}}^{as}dW_s(\omega) \cdot \left(
      \int_0^{t}{\mathrm{e}}^{as}dW_s(\omega) +
      \int_t^{t+h}{\mathrm{e}}^{as}dW_s(\omega)
    \right)
  \right]\end{aligned}$$

$$\begin{aligned}
  &= \sigma^2 {\mathrm{e}}^{-at-a(t+h)} \left(\mathbb{E}\left[
      \int_0^t \left({\mathrm{e}}^{as}dW_s(\omega)\right)^2 
    \right] + \cancelto{0}{\mathbb{E}\left[
      \int_0^{t}{\mathrm{e}}^{as}dW_s(\omega) \cdot
      \int_t^{t+h}{\mathrm{e}}^{as}dW_s(\omega)
    \right]}
  \right)
  \\ &= \sigma^2 {\mathrm{e}}^{-at-a(t+h)} \mathbb{E}\left[
    \int_0^t {\mathrm{e}}^{2as}dW_s(\omega)
  \right] 
  = \sigma^2 {\mathrm{e}}^{-at-a(t+h)} \int_0^t {\mathrm{e}}^{2as}ds
  \\ &= \sigma^2 {\mathrm{e}}^{-2at-ah} \left[\frac{1}{2a}{\mathrm{e}}^{2av}\right]^t_0
  = \sigma^2{\mathrm{e}}^{-2at-ah} \cdot\frac{ {\mathrm{e}}^{2at}-1}{2a}\end{aligned}$$

Finally, we can assert that, with $h  \to  0$, Vašiček model is
distributed like

$$\sim {\mathcal{N}}\left(
    r_0 {\mathrm{e}}^{-at}+b(1-{\mathrm{e}}^{-at}), \frac{\sigma^2{\mathrm{e}}^{-2at}({\mathrm{e}}^{2at}-1)}{2a}
  \right)$$

and the price of a zero-coupon bond depends on the parameters

$$P(t,T;\alpha) \quad \alpha = (a,b,\sigma).$$

The theoretical term structure curve can be fitted with the observed
data:

$$\left( P(0,T;\alpha)\right)_{T\in \mathcal{T}} \stackrel{\text{fit}}{\equiv}
  \left( P^*(0,T;\alpha)\right)_{T\in \mathcal{T}}$$

This is very underdetermined; instead of using a model as simple as
regular Vašiček or Cox-Ingersoll-Ross, we can use the generalization of
models such as Hull-White,

$$dr_t = a(t)(b(t) - r_t)dt +\sigma(t)dW_t$$

where parameters in the vector $\alpha$ are functions of time, yielding
an infinite class of parameters.

### A generic short rate model

We want a generic, risk neutral model for the short rate. Let

$$dr(t) = \tilde{\mu}(t,r_t)dt + \sigma(t,r_t)d\tilde{W}_t$$

be the dynamics for our general model, where $t$ is time and $r_t$ is
state. Then, the zero-coupon bond price is

$$P(t,T) = {\mathbb{\tilde E}\left[ { {\mathrm{e}}^{-\int_t^T r(s)ds} \Big| \mathcal{F}_t} \right]}$$

The objective is to find $\tilde{\mu}$ in the risk neutral world with
the information coming from the real, *historical* world. So, martingale
measures should be derived from the market. Assume there are many
maturities in the market, and there exist two zero-coupon bonds with
maturities $S$ and $T$, whose underlying is the short rate:

$$\begin{gathered}
  P(t,S) \equiv F^S(t,r_t) \\
  P(t,T) \equiv F^T(t,r_t) \\\end{gathered}$$

Now give a model for the interest rate. Note that $\mu$ and $W_t$ are
historical, as opposed to the $\tilde{mu}$ and $\tilde{W}_t$ in the
risk-neutral world, but $\sigma$ is the same in both worlds.

$$dr_t = \mu(t,r_t)dt + \sigma(t,r_t)dW_t$$

Apply Itō’s Lemma:

$$\begin{gathered}
  dF^S = F^S(\alpha_S dt + \sigma_S dW_t), \quad\quad
  dF^T = F^T(\alpha_T dt + \sigma_T dW_t) \\ 
  \text{where} \\
  \alpha_S = \frac{1}{F^S}\left(\frac{ {\partial}F^S}{ {\partial}t} + \frac{ {\partial}F^S}{ {\partial}r}\mu + \frac{1}{2}\frac{ {\partial}^2F^S}{ {\partial}r^2}\sigma^2\right) 
  \quad \text{drift for the bond price} \\
  \sigma_S = \frac{1}{F^S}\left(\frac{ {\partial}F^S}{ {\partial}r}\sigma \right) \quad\text{volatility for the bond price}\end{gathered}$$

Now apply Black-Scholes. Construct a portfolio with $h_S$ positions in
the bond with maturity $S$ and $h_T$ positions in the bond with maturity
$T$:

$$V = h_S F^S + h_T F^T \quad\quad s.t. \quad\quad
  dV = h_S dF^S + h_T dF^T$$

Let now

$$u_S \stackrel{def}{=} h_S \frac{F_S}{V} \quad\quad
  u_T \stackrel{def}{=} h_T \frac{F_T}{V} \quad\quad
  \text{s.t.}\quad\quad
  u_S+u_T = \frac{h_SF^S + h_TF^T}{V} = 1$$

be the percent values of each of the bonds’ positions with respect to
the portfolio $V$. We can rewrite the dynamics for the portfolio as

$$\begin{aligned}
  dV &= V\left( u_S \frac{dF^S}{F^S} + u_T \frac{dF^T}{F^T} \right)
  \\&= V(u_S(\alpha_Sdt + \sigma_S dW_t) + u_T(\alpha_Tdt + \sigma_T dW_t))
  \\&= V((u_S\alpha_S + u_T\alpha_T)dt + (u_S\sigma_S + u_T\sigma_T)dW_t)\end{aligned}$$

Then, impose the no arbitrage assumption to make the portfolio
risk-free:

$$\begin{gathered}
  \begin{cases}
    u_S + u_T = 1 \\ u_S\sigma_S + u_T\sigma_T = 0
  \end{cases}
  \implies
  \begin{cases}
    u_S = 1 - u_T \\
    (1-u_T)\sigma_S + u_T\sigma_t = 0
  \end{cases}
  \implies \\
  \begin{cases}
    \\ \sigma_S - u_T(\sigma_S-\sigma_T) = 0
  \end{cases}
  \implies 
  \begin{cases}
    u_T = -\frac{\sigma_S}{\sigma_T - \sigma_S}\\
    u_S = \frac{\sigma_T}{\sigma_T - \sigma_S}
  \end{cases}\end{gathered}$$

Holding the two bonds in percent quantities of $u_S,u_T$, the portfolio
is now risk free and the variation is deterministic.

$$dV = \cancel{V}(u_S\alpha_S + u_T\alpha_T)\cancel{dt} \stackrel{NAA}{=} r_t\cancel{V}\cancel{dt}$$

This leads to the equation

$$\begin{gathered}
  u_S\alpha_S + u_T\alpha_T = r(t) \implies
  r(t) = \frac{\sigma_T}{\sigma_T - \sigma_S} \alpha_S - \frac{\sigma_S}{\sigma_T - \sigma_S} \alpha_T
  \implies\\
  r(t) = \frac{\sigma_T\alpha_S - \sigma_S\alpha_T}{\sigma_T - \sigma_S}
  \implies
  \sigma_T\alpha_S - \sigma_S\alpha_T = r(t) \cdot (\sigma_T - \sigma_S)
  \implies\\
  \frac{\alpha_S - r}{\sigma_S} = \frac{\alpha_T - r}{\sigma_T}\end{gathered}$$

which means that, under no arbitrage assumption, there is an *exogenous*
coefficient which is invariant with respect to the market, called
*market price of risk*, equal to the excess return divided by the
volatility:

$$\lambda = \frac{\alpha_T - r}{\sigma_T}$$

This coefficient can be estimated by using the *capital asset pricing
model*. Multiplying by $\sigma_T$ we get
$\alpha_S - r(t) = \lambda\sigma_S$ and we can substitute $\alpha_S$ by
its definition, to get

$$\begin{gathered}
  \frac{1}{F^S}\left(\frac{ {\partial}F^S}{ {\partial}t} + \frac{ {\partial}F^S}{ {\partial}r} \mu + 
  \frac{1}{2} \frac{ {\partial}^2 F^S}{ {\partial}r^2} \sigma^2 \right) - r = \lambda\frac{1}{F^S}\left(\frac{ {\partial}F^S}{ {\partial}r}\sigma\right)
  \implies\\
  \frac{ {\partial}F^S}{ {\partial}t} + \frac{ {\partial}F^S}{ {\partial}r}\mu + \frac{1}{2}\frac{ {\partial}^2 F^S}{ {\partial}r^2}\sigma^2 - rF^S = \lambda \frac{ {\partial}F^S}{ {\partial}r}\sigma
  \implies\\
  \frac{ {\partial}F^S}{ {\partial}t} + (\mu - \lambda\sigma)\frac{ {\partial}F^S}{ {\partial}r} + \frac{1}{2} \frac{ {\partial}^2 F^S}{ {\partial}r^2}\sigma^2 = rF^S\end{gathered}$$

which is similar to the boundary-free Black-Scholes partial differential
equation. Imposing the condition $P(S,S)\equiv F^S(S,r_S)=1$ yields

$$dr(t) = (\mu - \lambda\sigma)dt + \sigma dW_t$$

The drift part is exogenous and defines which probability measure we are
using; the drift $\tilde{\mu} =  \mu -  \lambda\sigma$ is the one to be
used in the risk-neutral world.

### Affine term structures

<span>**(Affine short rate model).**</span> A short rate model is
*affine* if the associated term structure is of the form

$$P(t,T) = {\mathrm{e}}^{A(t,T) -B(t,T)r_t}, \quad\quad A,B\quad\text{deterministic}$$

Vašiček, CIR, Ho-Lee and Hull-White are affine models. How to derive A
and B? Let $dr_t = \mu(t,r_t) dt  + \sigma(t,r_t)dW_t$ be a generic
short rate model.

-   If $$\begin{aligned}
          \mu(t,T) = \alpha(t)r_t + \beta(t) &\quad \text{drift is affine} \\
          \sigma(t,T) = \sqrt{\gamma(t)r_t + \delta(t)} &\quad \text{volatility is affine}
        \end{aligned}$$ then $r_t$ is affine.

-   Solve the Riccati equation to get $A$ and $B$. $$\begin{gathered}
          \begin{cases}
            \frac{ {\partial}B}{ {\partial}t} + \alpha(t)B - \frac{1}{2}\gamma(t)B^2(t,T) = -1
            \\
            \frac{ {\partial}A}{ {\partial}t} - \beta(t)B + \frac{1}{2} \delta(t)B^2(t,T) = 0
            \\ B(T,T) = 0
            \\ A(T,T) = 0
          \end{cases}
        \end{gathered}$$ The last two equations are boundaries deriving
    from the fact that

    $$P(T,T) \equiv {\mathrm{e}}^{A(T,T) - B(T,T)r_t} = 1$$

Solution to Ho-Lee model.

$$dr_t = \Theta(t)dt + \sigma dW_t \quad\quad r_t = r_0 \int_0^t \Theta(s)ds + \sigma dW_t$$

First we prove this is an affine model. Let

$$\begin{gathered}
    \alpha = 0 \quad\quad \beta = \Theta(t) \quad\quad \gamma = 0 \quad\quad \delta = \sigma^2
  \end{gathered}$$

that shows Ho-Lee is affine. Now use the Riccati equations to find the
values

$$\begin{gathered}
    \begin{cases}
      \frac{ {\partial}B}{ {\partial}t} + 0 \cdot B -\frac{1}{2}\cdot0\cdot B^2(t,T) = -1 \\
      B(T,T) = 0 \\
      \frac{ {\partial}A}{ {\partial}t} - \Theta(t)B(t,T) + \frac{1}{2}\sigma^2B^2(t,T) = 0\\
      A(T,T) = 0
    \end{cases}
    \begin{cases}
      \frac{ {\partial}B}{ {\partial}t} = -1 \implies B(t,T) = (T-t) \\
      B(T,T) = 0 \\
      \frac{ {\partial}A}{ {\partial}t} - \Theta(t)(T-t) +\frac{1}{2}\sigma^2(T-t)^2 = 0\\
      A(T,T) = 0
    \end{cases} 
    \\
    \implies \frac{ {\partial}A}{ {\partial}t} = \Theta(T-t) - \frac{1}{2}\sigma^2(T-t)^2 \implies \\
    \int_t^T \frac{ {\partial}A}{ {\partial}s}ds = \int_t^T \Theta(T-s) - \frac{1}{2}\sigma^2(T-s)^2 ds \implies\\
    \cancelto{0}{A(T,T)} - A(t,T) = \int_t^T \Theta(T-s) - \frac{1}{2}\sigma^2(T-s)^2 ds \implies\\
    A(t,T) = -\int_t^T \Theta(T-s) - \frac{1}{2}\sigma^2(T-s)^2 ds
  \end{gathered}$$

So, Ho-Lee’s term structure is of the form

$$P(t,T) = {\mathrm{e}}^{-\int_t^T \Theta(T-s) - \frac{1}{2}\sigma^2(T-s)^2 ds -(T-t)r_t}$$

Solution to Vašiček model.

$$dr_t = a(b - r_t)dt + \sigma dW_t = (ab - ar_t)dt + \sigma dW_t$$

The drift and the volatility are in a form such that

$$\alpha(t) = -a \quad\quad \beta(t) = ab \quad\quad \gamma(t) = 0 \quad\quad \delta(t) = \sigma^2$$

The Riccati equation yields

$$\begin{gathered}
    B(t,T) = \frac{1}{a}\left( 1 - {\mathrm{e}}^{-a(T-t)}\right)\\
    A(t,T) = \frac{1}{a^2}\left( B(t,T)-T+t\right)\left(a^2b-\frac{\sigma^2}{2}\right) -\frac{1}{4a}\sigma^2B^2(t,T).
  \end{gathered}$$
