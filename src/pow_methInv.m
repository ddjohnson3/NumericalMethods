function [lambda, v] = pow_methInv(A, tol, maxiter, v0)
    %   A       - square matrix
    %   tol     - tolerance (default: 1e-6)
    %   maxiter - maximum iterations (default: 1000)
    %   v0      - initial guess vector (default: ones)
    % Output:
    %   lambda  - smallest eigenvalue approximation
    %   v       - corresponding eigenvector
    n = size(A,1);
    if nargin < 2 || isempty(tol)
        tol = 1e-6;
    end
    if nargin < 3 || isempty(maxiter)
        maxiter = 1000;
    end
    if nargin < 4 || isempty(v0)
        v0 = ones(n,1);
    end
    
    % Verify matrix is square
    if size(A,1) ~= size(A,2)
        error('Matrix must be square');
    end
    
    % Initialize variables
    v = v0 / norm(v0);
    error = tol + 1;
    iter = 0;
    
    % Main iteration loop
    while error > tol && iter < maxiter
        % Solve linear system instead of explicit inverse
        u = v;
        v = A \ u;  % More stable than inv(A)*u
        
        % Normalize the vector
        v = v / norm(v);
        
        % Compute Rayleigh quotient for eigenvalue
        lambda = (v' * A * v) / (v' * v);
        
        % Compute error using relative residual
        error = norm(A*v - lambda*v) / norm(A*v);
        
        iter = iter + 1;
    end
    
    % Warning if not converged
    if iter >= maxiter && error > tol
        warning('maximum iterations reached without convergence');
    end
    
    % Return the reciprocal of lambda since we found largest eigenvalue of A^(-1)
    lambda = lambda;
end