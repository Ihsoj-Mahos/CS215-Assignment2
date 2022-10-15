rng(1); %setting the seed

N = [10 100 1000 10000 100000];
trials = 100;
m = [1; 2];
c = [1.6250 -1.9486; -1.9486 3.8750];
err = zeros(trials, length(N));

for i = 1:length(N)
    for j = 1:trials
        sum = zeros(2, 1);
        for k = 1:N(i)
            sum = sum + Gaussian(m, c); %taking the sum of samples
        end
        sum = sum./N(i); %taking the mean
        sum = m - sum;
        err(j, i) = norm(sum)/norm(m);
    end
end

boxplot(err, log10(N)); %plotting the box-plot
xlabel('log(N)')
ylabel('Error')
title('Deviation of Mean')

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