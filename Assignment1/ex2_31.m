m1 = [
    1,5,4;
    2,3,6;
    1,1,1
];

m2 = [
     1, 2, 3, 4;
     5, 6, 7, 8;
     9,10,11,12;
    13,14,15,16
];

d = Determinant(m1);
disp(d)
d = Determinant(m2);
disp(d)


function D = Determinant(A)
%Determinant returns the determinant of the square matrix A
    %Check input is square
    [m,n] = size(A);
    if m ~= n
        D = 'The matrix must be square.';
    end
    %If A is 2x2, simply calculate the determinant
    if m == 2
        D = A(1,1)*A(2,2) - A(1,2)*A(2,1);
    %Otherwise for nxn matrices,
    %recursively find the determinants
    %of each minor, multiplied by the
    %corresponding element of the top row
    %of A. Flip between adding and subtracting
    %each one.
    else
        for i = 1:m
            B = A;      %minor of A
            B(1,:) = [];%clear top row
            B(:,i) = [];%and ith column
            if i == 1
                D = (A(1,i)*Determinant(B));
            else
                D = D + (A(1,i)*((-1)^(i-1))*Determinant(B));
            end
        end
    end
end
