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

