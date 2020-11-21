data {
  int<lower=0> N;
  vector[N] x_1;
  vector[N] x_2;
  vector[N] x_3;
  vector[N] x_4;
  vector[N] x_5;
  vector[N] x_6;
  int<lower=0,upper=1> y[N];
}
parameters {
  real alpha;
  real beta_1;
  real beta_2;
  real beta_3;
  real beta_4;
  real beta_5;
  real beta_6;
}
model {
  alpha ~ normal(0, 10);
  beta_1 ~ student_t(1, 0, 2);
  beta_2 ~ student_t(1, 0, 2);
  beta_3 ~ student_t(1, 0, 2);
  beta_4 ~ student_t(1, 0, 2);
  beta_5 ~ student_t(1, 0, 2);
  beta_6 ~ student_t(1, 0, 2);
  y ~ bernoulli_logit(alpha + beta_1*x_1 + beta_2*x_2 + beta_3*x_3
                      + beta_4*x_4 + beta_5*x_5 + beta_6*x_6); //bernoulli_logit for binary outcome
}
generated quantities{
  //vector[N] log_lik;
  int<lower=0,upper=1> y_sim[N]; //simulated data from posterior
  
  for (i in 1:N){
    //log_lik[i] = bernoulli_logit_lpmf(y[i] | alpha + beta * x[i]);
    y_sim[i] = bernoulli_logit_rng(alpha + beta_1*x_1[i] + beta_2*x_2[i] + beta_3*x_3[i]
                                   + beta_4*x_4[i] + beta_5*x_5[i] + beta_6*x_6[i]);
  }
}
