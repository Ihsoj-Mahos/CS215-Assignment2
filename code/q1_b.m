rng(1); % setting the seed

N = 10.^7;
a = 2;
b = 1;
x = zeros(N, 1);
y = zeros(N, 1);

for i=1:N(1)
    p = Ellipse(a, b); %calling the function
    x(i) = p(1);
    y(i) = p(2);
end

figure();
histogram2(x, y, 'DisplayStyle','tile'); %plotting the data
title('Elliptical Histogram');
axis equal;

function p = Ellipse(a, b)
    theta = 2*pi*rand();
    if (a > b)
        r = sqrt(rand())*a;
        x = r*cos(theta);
        y = r*b*sin(theta)/a;
    else
        r = sqrt(rand())*b;
        x = r*a*cos(theta)/b;
        y = r*sin(theta);
    end
    p = [x y];
    return
end