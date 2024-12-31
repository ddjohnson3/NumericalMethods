function deflate(A, dom_v)
    % A: input matrix
    % dom_v: initial vector for power method
    
    n = size(A,1);
    j = 0;
    new_A = A;
    
    while j < n-1
        [lam] = pow_meth(new_A, 1000, dom_v);
        
        % Setup e1
        e1 = zeros(n-j, 1);
        e1(1) = 1;
        
        % Calculate A1
        w = (lam-e1)/norm(lam-e1);
        H1 = eye(n-j) - 2*(w*w');
        A1 = H1*new_A*H1;
        A1(2:end,1) = 0;
        A1(1,1) = lam;
        B1 = A1(2:end,2:end);
        
        % Get mu
        [D,V] = eig(B1);
        dom_v2 = D(:,1);
        [mu] = pow_meth(B1, 1000, dom_v2);
        
        % Get w tilde
        wt = zeros(length(w)+1, 1);
        wt(2:end) = w;
        if lam == mu
            wt(1) = 0;
        else
            wt(1) = dot(A1(1,2:end),w) / (mu-lam);
        end
        
        e_vector = H1*wt;
        
        % Display eigenvalue-eigenvector pair
        disp(['Eigenvalue: ', num2str(mu)]);
        disp('Eigenvector:');
        disp(e_vector);
        
        j = j + 1;
        new_A = B1;
        dom_v = e_vector;
    end
end