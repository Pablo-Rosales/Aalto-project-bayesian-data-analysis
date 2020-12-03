data {
  int<lower=1> N_obs;
  real x_obs[N_obs];
  int<lower=0, upper=1> y_obs[N_obs];
  int<lower=1> N_predict;
  real x_predict[N_predict];
}
transformed data {
  real delta = 1e-9;
  int<lower=1> N = N_obs + N_predict;
  real x[N];
  for (n_obs in 1:N_obs) x[n_obs] = x_obs[n_obs];
  for (n_predict in 1:N_predict) x[N_obs + n_predict] = x_predict[n_predict];
}
parameters {
  real<lower=0> rho;
  real<lower=0> alpha;
  real a;
  vector[N] eta;
}
transformed parameters {
  vector[N] f;
  {
    matrix[N, N] L_K;
    matrix[N, N] K = cov_exp_quad(x, alpha, rho);

    // diagonal elements
    for (n in 1:N)
      K[n, n] = K[n, n] + delta;

    L_K = cholesky_decompose(K);
    f = L_K * eta;
  }
}
model {
  rho ~ inv_gamma(1, 1);
  alpha ~ std_normal();
  a ~ std_normal();
  eta ~ std_normal();

  y_obs ~ bernoulli_logit(a + f[1:N_obs]);
}
generated quantities {
  int y_predict[N_predict];
  vector[N_predict] log_lik;
  for (n_predict in 1:N_predict){
    y_predict[n_predict] = bernoulli_logit_rng(a + f[N_obs + n_predict]);
    log_lik[n_predict] = bernoulli_logit_lpmf(y_obs[n_predict] | a + f[N_obs + n_predict]);
  }
}
