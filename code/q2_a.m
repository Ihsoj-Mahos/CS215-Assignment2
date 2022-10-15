rng(1); %setting the seed

m = [1; 2];
c = [1.6250 -1.9486; -1.9486 3.8750];
p = Gaussian(m, c); %calling the function
disp(p(1) + "," + p(2)); %displaying a random sample

function p = Gaussian(m, c)
    [V, D] = eig(c);
    A = V * sqrt(D); %used Cholesky decomposition
    a = A(1, 1);
    b = A(1, 2);
    c = A(2, 1);
    d = A(2, 2);
    w1 = randn(); %random sample from the gaussian
    w2 = randn(); %random sample from the gaussian
    x = a*w1 + b*w2;
    y = c*w1 + d*w2;
    p = [x; y] + m;
    return
end