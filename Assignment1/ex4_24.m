m1 = [
    -1, 2,  1;
    2,  2, -4;
    0.2,1,0.5
];

m2 = [
     -1,-2,1,2;
     1,1,-4,-2;
     1,-2,-4,-2;
     2,-4,1,-2
];

i = Inverse(m1);
disp(i)
%disp(inv(m1));
i = Inverse(m2);
disp(i)
%disp(inv(m2));

function Ainv = Inverse(A)
%Inverse uses GaussJordan method to find the inverse of A

    [m,n] = size(A);
    if m ~= n
        Ainv = 'The matrix must be square.';
        return
    end
    
    Ainv = eye(m); %identity matrix to be transformed into inverse

    for j = 1:m
        temp = 1/A(j,j);
        for k = 1:m
            A(j,k) = temp * A(j,k);        %run through row j and divide by A(j,j) so diagonal becomes ones
            Ainv(j,k) = temp * Ainv(j,k);  %all operations done to A are also done to Ainv
        end
        for L = 1:m
            if L ~= j                   %for all elements in column j NOT on the diagonal:
                temp = -A(L,j);         %subtract A(L,j)A(j,k) from A(L,k) so that eventually
                for k = 1:m             %non diagonal becomes zeros
                    A(L,k) = A(L,k) + temp * A(j,k);
                    Ainv(L,k) = Ainv(L,k) + temp * Ainv(j,k);   %again, execute ops on both A and Ainv
                end
            end
        end
    end
end

