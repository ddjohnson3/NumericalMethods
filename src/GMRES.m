function [x] = GMRES(A,b,n)
    % Initialize
    Q = b/norm(b);
    S = [];
    b1 = norm(b);
    
    for j = 1:n
        % Compute new Arnoldi vector
        u = A*Q(:,end);
        
        % Orthogonalize against all previous vectors
        for i = 1:j
            S(i,j) = Q(:,i)'*u;
            u = u - Q(:,i)*S(i,j);
        end
        
        % Add subdiagonal element
        S(j+1,j) = norm(u);
        
        % Add new Q vector
        Q(:,j+1) = u/S(j+1,j);
        
        % Solve least squares problem
        b1(j+1,1) = 0;
        c = S(1:j+1,1:j)\b1;
        x(:,j) = Q(:,1:j)*c;
    end
end