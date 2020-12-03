data {
  int<lower=0> N;
  vector[N] x;
  int<lower=0,upper=1> y[N];
}
parameters {
  real alpha;
  real beta;
}
model {
  alpha ~ normal(0, 1);
  beta ~ student_t(3, 0, 1);
  y ~ bernoulli_logit(alpha + beta * x);
}
generated quantities{
  vector[N] log_lik;
  int<lower=0,upper=1> y_sim[N];
  
  for (i in 1:N){
    log_lik[i] = bernoulli_logit_lpmf(y[i] | alpha + beta * x[i]);
    y_sim[i] = bernoulli_logit_rng(alpha + beta * x[i]);
  }
}
