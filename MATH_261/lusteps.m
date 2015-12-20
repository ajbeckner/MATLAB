function [ L,U ] = lusteps(A)
function [ R ] = eliminate( A, j, k, m )


%ELIMINATE uses row operations to eliminate entry (j,k) in matrix A
% A     -- must be a matrix
% j,k   -- must be the row and column of the entry to be eliminated
% m,k   -- is the row and column of the pivot entry
% Running this function returns a new matrix with the same dimmensions as A
%   where each entry of j has been modified by the operation:
%   A(j,k) - multiplier * A(m,k)
%created by: 
%Beckner, Anthony
%Math 261 - A : Fall 2013
%lab 5



    R = A;%creates R
    p = A(m,k);%sets pivot
    l = A(j,k)/p;%sets l
    for k = k:1:length(A(j,:))%for loop that modifies whole row
        mVal = A(m,k);%takes each entry in row of pivot
        elim = A(j,k);%and each entry in the elimination row


        R(j,k) =  elim - l*mVal;%then subtracts the values appropriately

    end
end

%LUSTEPS takes square matrix A and performs LU factorization, providing all
%of the intermediate steps as output in the process.
%this is ideal for copying and pasting matlab output into LaTeX
% A     -- must be a square m by m matrix
%lusteps(A) yields the steps and U, the upper triangular matrix
%[ L U ] = lusteps(A) yields the steps, and both L and U assigned to
%variables 


    U = A;
    L = zeros(length(U'),length(U));
    limit = 1;%limit serves to count backwards for upper triangular form
    %row operation 
    for c = 1:length(U)
        for r = 0:length(U')
            row = length(U')-r; %row
            col = c; %col
            if row > limit
                m = col;
                L(row,col) = A(row,col)/m;%indexes for L using multipliers 
                U = eliminate(U,row,col,m);%performs elimination step
                disp(U)
            end
        end
        limit = limit +1;%limit serves to count backwards for upper triangular form
    end
end
