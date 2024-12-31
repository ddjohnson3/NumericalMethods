 % Filename: ssolve.m
function x = ssolve(a,b,n);
A = eye(n);
A(1,2) = a;
A(end, 1) = b;
A(end, 2) = b;
A(end, end) = 1;
A(end, end-1) = b;

r = zeros(n,1);
r(1) = 1;
r(2) = 2;
r(end-2) = n-2;
r(end-1) = 0;
r(end) = n;

x = A\r;
end