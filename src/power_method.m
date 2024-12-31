function [num_iter] = power_method(A, v0, tol)

    v = v0 / norm(v0);

    % Iterate until convergence
    for num_iter = 1:1000
        % Compute the next vector
        v_new = A * v;
        v_new = v_new / norm(v_new);

        % Calculate the relative error
        error = norm(v - v_new) / norm(v);

        % Check for convergence
        if error < tol
            return
        end

        % Update the vector
        v = v_new;
    end

    % If we reach this point, the method did not converge within 1000 iterations
    num_iter = -1;
end