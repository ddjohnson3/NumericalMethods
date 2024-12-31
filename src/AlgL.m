function [R, W] = AlgL(A)
    m = size(A, 1);
    R = A;
    W = zeros(m);
    
    for i = 1:m
        x = A(1:end, i);
    
        y = x;
        y(i, 1) = norm(x(i:end, 1));
        y((i + 1):end, 1) = 0;
    
        w = (x - y);
        w = w / norm(x - y);
    
        W(1:end, i) = w;

        Hx = x - 2 * (w * w') * x;
        R(:, i) = Hx;
    
        H = eye(m) - 2 * (w * w');
    
        A = H * A;
    end
end