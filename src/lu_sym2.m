function [L, U] = lu_sym2(A)
    % Calculates LU factorization of a symmetric and non-singular A, without
    % touching the entries of A below its diagonal until necessary

    [m, m] = size(A);
    U = A; % Initialize U with the matrix A
    L = eye(m); % Initialize L as an identity matrix

    for j = 1:m-1
        % Calculate the multipliers
        l = U(m-j:end,j);
        
        eU = U(j,m-j:end);
        L(m-j:end,m-j:end) = l*eU;
        U = U-L;

        
        
        
        %mult = U(j,j+1:end)/U(j,j) * U(j+1:end,j);
        %L(j,j+1:end) = mult;
        %display(U(j+1:end,j));
        %U = U - L;

        % Update the remaining rows of U above the diagonal
        %for i = j+1:m
            %U(i, j+1:m) = U(i, j+1:m) - L(i, j) * U(j, j+1:m);
        %end

        % Update the elements below the diagonal in U
        %U(j+1:m, j) = L(j+1:m, j) * U(j, j);
    end
end