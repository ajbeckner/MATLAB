
% do not modify the function line below
function [v, square] = problem2 

% coordinates of square under one variable
square = ;

% generate animation window
figure
xmin = -pi;
xmax = 7*pi;
ymin = -8;
ymax = 8;
axis equal
axis([xmin xmax ymin ymax])
grid on
hold on

%setting your trajectory
t = ; % independent variable of your function
trajectory = ; % represents y in y = cos(t)

plot(t,trajectory,':')
    for i = 1:length(t)
         h = fill( , ,'r'); 
         % do not change below 2 lines, should follow your fill command
         v.x(i,:)=get(h,'xdata')';
         v.y(i,:)=get(h,'ydata')';
         
        % add anything below
    end
end
