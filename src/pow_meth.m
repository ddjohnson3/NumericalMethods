function [lambda,u] = pow_meth(A)
n = size(A,1);
v = ones(n,1);
tol = 0.001;
error = tol + 1;
iter=0;
while error>tol
    u = v;
    v = A*u;
    lambda = dot(v,v)\dot(v,A*v);
    error = norm(A*v-lambda*v,2)/norm(A*v,2);
    iter = iter+1;

end

