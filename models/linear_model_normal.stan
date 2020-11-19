data {
  int<lower=0> N;
  vector[N] x;
  vector[N] y;
}
parameters {
  real alpha;
  real beta;
  real<lower=0> sigma;
}
model {
  alpha ~ normal(0, 10);
  beta ~ student_t(1, 0, 2);
  sigma ~ normal(0, 10);
  y ~ normal(alpha + beta * x, sigma);
}
generated quantities{
  vector[N] log_lik;
  
  for (i in 1:N){
    log_lik[i] = normal_lpdf(y[i] | alpha + beta * x[i], sigma);
  }
}
