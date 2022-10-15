rng(1); %setting the seed

a = 2;
b = 1;
p = Ellipse(a, b);
disp(p(1) + "," + p(2)); %printing the data

function p = Ellipse(a, b)
    theta = 2*pi*rand(); % choosing theta randomly
    if (a > b)
        r = sqrt(rand())*a; %sqrt(rand()) does the job
        x = r*cos(theta);
        y = r*b*sin(theta)/a;
    else
        r = sqrt(rand())*b; %sqrt(rand()) does the job
        x = r*a*cos(theta)/b;
        y = r*sin(theta);
    end
    p = [x y];
    return
end