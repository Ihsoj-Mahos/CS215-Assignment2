rng(1); %setting the seed

N = [10 100 1000 10000 100000];
m = [1; 2];
c = [1.6250 -1.9486; -1.9486 3.8750];

for i = 1:length(N)
    mean = zeros(2, 1);
    cov = zeros(2, 2);
    x = zeros(N(i), 1);
    y = zeros(N(i), 1);
    for k = 1:N(i)
        P = Gaussian(m, c);
        x(k) = P(1);
        y(k) = P(2);
        mean = mean + P;
        cov = cov + (P - m)*transpose(P - m);
    end
    mean = mean./N(i); %calculating the mean
    cov = cov./N(i); %calculating the covariance
    [V, D] = eig(cov);
    figure();
    scatter(x, y, 1, "green");
    line([mean(1) mean(1); mean(1) + sqrt(D(1, 1))*V(1, 1) mean(1) + sqrt(D(2, 2))*V(1, 2)], [mean(2) mean(2); mean(2) + sqrt(D(1, 1))*V(2, 1) mean(2) + sqrt(D(2, 2))*V(2, 2)]);
    xlim([-8 12]); %choosing the limits
    ylim([-8 12]); %choosing the limits
    title(sprintf('N=%i', N(i)))
end

function p = Gaussian(m, c)
    [V, D] = eig(c);
    A = V * sqrt(D);
    a = A(1, 1);
    b = A(1, 2);
    c = A(2, 1);
    d = A(2, 2);
    w1 = randn();
    w2 = randn();
    x = a*w1 + b*w2;
    y = c*w1 + d*w2;
    p = [x; y] + m;
    return
end