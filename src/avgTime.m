function avg_time = avgTime(A)
    num_trials = 100; % Number of times to run the function
    elapsed_times = zeros(num_trials, 1); % Array to store elapsed times
    
    for i = 1:num_trials
        % Start the timer
        tic;

        % Call your function here (replace 'lu_sym3' with your function name)
        lu_sym3(A);  % Assuming lu_sym3 takes matrix A as an argument

        % Stop the timer and store the elapsed time
        elapsed_times(i) = toc;
    end
    
    % Calculate the average elapsed time
    avg_time = mean(elapsed_times);
end
