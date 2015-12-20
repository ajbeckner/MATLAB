function [ xTranslation, zTranslation ] =test
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
close all
ax = axes('XLim',[-25 25],'YLim',[-25 25],'ZLim',[-25 100]);
view(3)
grid on;
axis equal;
hold on 
shg

[x,y,z] = ellipsoid(0,0,0,2,1,1,20);
h(1) = surface(x,y,z,'FaceColor','b');
%h(2) = surface(x,y,-z,'FaceColor','green');
%h(2) = surface(z,x,y,'FaceColor','blue');
%h(4) = surface(-z,x,y,'FaceColor','cyan');
%h(3) = surface(y,z,x,'FaceColor','magenta');
%h(6) = surface(y,-z,x,'FaceColor','yellow');

t = hgtransform('Parent',ax);
set(h,'Parent',t)

set(gcf,'Renderer','opengl')
drawnow

Rz = eye(4);
Sxy = Rz;


%% 
% setup
velocity = 50;
angle = 35;
vx = velocity*cosd(angle);
vy = velocity*sind(angle);
tmax = 2*vy/9.8;

xTranslation = linspace(0,tmax,500);
yTranslation = 0*xTranslation;
zTranslation = -xTranslation.^2 + 20*xTranslation;

%%
for i = 1:length(xTranslation)
    translation = makehgtform('translate', [xTranslation(i) yTranslation(i) zTranslation(i)] );
    
    % Combining the individual transformation
    disp(i)
    set(t,'matrix',translation);
    pause(.05)
    hold on
end

% for r = 1:.1:2*pi
%  % Z-axis rotation matrix 
% Rz = makehgtform('zrotate',r);
%  % Scaling matrix
% 	%Sxy = makehgtform('scale',r/4);
%     Sxy = 1;
%  % Concatenate the transforms and
%  % set the hgtransform Matrix property
%     set(t,'Matrix',Rz*Sxy)
%     drawnow
% end
pause(.1)

end

