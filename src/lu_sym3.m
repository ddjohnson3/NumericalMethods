function [L, U] = lu_sym3(A)
    [m, n] = size(A);
    if m ~= n
        error('Matrix must be square');
    end
    
    U = A;
    L = eye(m);
    
    for j = 1:(m-1)
        if U(j,j) == 0
            error('Zero pivot encountered');
        end
        
        %compute multipliers
        L(j+1:m,j) = U(j+1:m,j) / U(j,j);
        
        % Update remaining submatrix
        U(j+1:m,j+1:m) = U(j+1:m,j+1:m) - L(j+1:m,j) * U(j,j+1:m);
        
        U(j+1:m,j) = 0;
    end
end



