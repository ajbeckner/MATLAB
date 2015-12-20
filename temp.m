total = 0;
for x = linspace(-4/5,4/5,500)
    for y = linspace(-sqrt(32/50 - x^2),sqrt(32/50 - x^2),500)
        z = 32 - 50*(x^2 + y^2);
        total = total + z;
    end
end