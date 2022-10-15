rng(1); %setting the seed

p = Triangle(); %calling the function
disp(p(1) + "," + p(2)); %displaying a random sample

function p = Triangle
    z = rand();
    if z <= 0.33 % 1/3 chance
        x = sqrt(rand())*pi/3;
    else %2/3 chance
        x = pi - sqrt(rand())*2*pi/3;
    end
    y = exp(1)*x*rand();
    p = [x y];
    return
end