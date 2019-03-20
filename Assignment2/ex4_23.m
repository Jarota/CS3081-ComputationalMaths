M = [
    4, -1, 3, 2;
    -8, 0 ,-3, -3.5;
    2, -3.5, 10, 3.75;
    -8, -4, 1, -0.5
];

[L,U] = LUdecompGauss(M);
A = L*U;

disp(M);
disp(L);
disp(U);
disp(A);

function [L, U] = LUdecompGauss(A)
% Decomposes A into lower triangular and upper triangular
% matrices (L and U) using Gauss elemination, without
% pivoting, such that [A] = [L][U]

    [m,n] = size(A);
    if m ~= n
        disp('The matrix must be square.');
        L = 0;
        U = 0;
        return
    end
    
    L = eye(n);     % start with Identity matrix for L
    U = A;          % copy of A for U
    for i = 1:n-1       % for every row (but the last)...
        for j = i+1:n   % do the following for all remaining rows:
            L(j,i) = U(j,i)/U(i,i); % Calculate L(j,i) ( U(i,i) is the pivot coefficient )
            for k = 1:n
                U(j,k) = U(j,k) - (L(j,i)*U(i,k));  % subtract the pivot equation times L(i,j)
            end                                     % from U(j,k) -> U(i,j) becomes zero
        end
    end
end

