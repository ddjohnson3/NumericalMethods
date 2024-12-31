function result = find_points(m, n, s)
   
    
    [J, K] = meshgrid(1:m, 1:n);
    X = s \ [J(:)';K(:)'];
    
    valid_indices = all((X-round(X)) == 0);
    result(1,:) = J(valid_indices);
    result(2,:) = K(valid_indices);

end
