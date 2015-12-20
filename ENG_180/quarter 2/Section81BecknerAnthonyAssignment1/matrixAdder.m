function [ S ] = matrixAdder( X,Y,M,D )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

matrix = M + D*randn(X,Y);
S = sum(sum(matrix));

end

