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
  alpha ~ normal(0, 2);
  beta ~ student_t(1, 0, 2);
  y ~ bernoulli_logit(alpha + beta * x); //bernoulli_logit for binary outcome
}
generated quantities{
  vector[N] log_lik;
  int<lower=0,upper=1> y_sim[N]; //simulated data from posterior
  
  for (i in 1:N){
    log_lik[i] = bernoulli_logit_lpmf(y[i] | alpha + beta * x[i]);
    y_sim[i] = bernoulli_logit_rng(alpha + beta * x[i]);
  }
}
