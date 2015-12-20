function [ gx, gy, gz ] = getacceldata( m )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[a t] = accellog(m);

gx = a(length(a),1);
gy = a(length(a),2);
gz = a(length(a),3);

end

