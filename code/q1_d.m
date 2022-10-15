rng(1); %setting the seed

N = 10.^7;
x = zeros(N, 1);
y = zeros(N, 1);

for i=1:N(1)
    p = Triangle(); %calling the function
    x(i) = p(1);
    y(i) = p(2);
end

histogram2(x, y, 'DisplayStyle','tile'); %plotting the data
title('Triangular Histogram')

function p = Triangle
    z = rand();
    if z <= 0.33
        x = sqrt(rand())*pi/3;
        y = exp(1)*x*rand();
    else
        x = pi - sqrt(rand())*2*pi/3;
        y = exp(1)*(pi - x)*rand()*3/(2*pi);
    end
    
    p = [x y];
    return
end