# Assignment 1
#### Ex2.31

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


#### Ex3.2  
$f(x)=x-2e^{-x}$

a) Bisection Method  

$$
a=0, b=1\\
x_1=\frac{a+b}{2}=0.5\\
f(a)=f(0)=0-2e^0=-2\\
f(0.5)=0.5-2e^{-0.5}=-0.71\\
-2*-0.71=positive
$$

$$
a=0.5, b=1\\
x_2=0.75\\
f(0.75)=0.75-2e^{-0.75}=-0.19\\
-0.71*-0.19=positive
$$

$$
a=0.75, b=1\\
x_3=0.875\\
f(0.875)=0.875-2e^{-0.875}=0.04
$$

b) Secant Method

$$
x_{i+1}=x_i-\frac{f(x_i)(x_{i-1}-x_i)}{f(x_{i-1})-f(x_i)}
$$

$$
x_1=0,x_2=1\\
f(0)=-2, f(1)=0.26\\
x_3=1-\frac{0.26(0-1)}{-2-0.26}=0.88\\
f(0.88)=0.05\\
x_4=0.88-\frac{0.05(1-0.88)}{0.26-0.05}=0.85\\
f(0.85)=-0.005\\
x_5=0.85-\frac{-0.005(0.88-0.85)}{0.05+0.005}=0.85
$$

c) Newton's Method

$$
x_{i+1}=x_i-\frac{f(x_i)}{f'(x_i)}
$$

$$
f'(x)=-2(\frac{d}{dx}e^{-x})+\frac{d}{dx}x\\
f'(x)=-2(e^{-x})(\frac{d}{dx}-x)+1\\
f'(x)=2e^{-x}+1\\
$$

$$
x_1=1\\
x_2=1-\frac{0.26}{1.74}=0.85\\
x_3=0.85-\frac{-0.005}{1.85}=0.85\\
x_4=0.85
$$

#### Ex4.24

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
