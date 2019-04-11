M = [
        -2, 1, 0;
        1, -2, 1;
        0, 1, -1.5
    ];

N = InfinityNorm(M);
disp(N);

M = [
        4, -1, 0, 1, 0;
        -1, 4, -1, 0, 1;
        0, -1, 4, -1, 0;
        1, 0, -1, 4, -1;
        0, 1, 0, -1, 4
    ];

N = InfinityNorm(M);
disp(N);

function [ N ] = InfinityNorm( A )
    N = 0;
    [m, n] = size(A);
    for i = 1:m
        sum = 0;
        for j = 1:n
            sum = sum + abs(A(i,j));
        end;
        if sum > N
            N = sum;
        end;
    end;
end

