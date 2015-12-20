function [xTranslation, yTranslation, zTranslation] = problem3

% generate the figure window and axes
myAxes = axes('xlim',[-20 20],'ylim',[-20 20], 'zlim',[-20 20]);
view(3)
grid on;
axis equal;
hold on 

% generate sphere
[xsphere, ysphere, zsphere] = sphere;

% 3-D Animation
%+x, +y, -x, +z, +x, -y, -x
xTranslation = [-10 10 0 -10 0 10 0 -10];
yTranslation = [-10 0 10 0 0 0 -1 0];
zTranslation = [-10 0 0 0 10 0 0 0];

shape = surface(xsphere*3, ysphere*3, zsphere*3);
combinedObject = hgtransform('parent',myAxes);
set(shape,'parent',combinedObject);

for i = 1:length(xTranslation)
    translation = makehgtform('translate', [xTranslation(i) yTranslation(i) zTranslation(i)] );
    
    % Combining the individual transformation
    set(combinedObject,'matrix',translation);
    pause(.5)
    hold on
end

end