load('../data/mnist.mat', 'digits_train'); %loading the data
load('../data/mnist.mat', 'labels_train'); %loading the data
X = reshape(digits_train, 784, 60000);
X = cast(X, 'double');
Y = labels_train.';
s_mean = zeros(784, 10); %sum of means
s_mean = cast(s_mean, 'double');
s_cov = zeros(784, 784, 10); %sum of covariances
s_cov = cast(s_cov, 'double');
counter = zeros(1, 10);
for i = 1:60000
    digit = Y(1, i);
    counter(1, digit + 1) = counter(1, digit + 1) + 1;
    s_mean(:, digit + 1) = s_mean(:, digit + 1) + X(:, i);
end
mean = s_mean./counter; %computing mean
for i = 1:60000
    digit = Y(1, i);
    s_cov(:, :, digit + 1) = s_cov(:, :, digit + 1) + (X(:, i)-mean(:, digit + 1))*(X(:, i)-mean(:, digit + 1)).';
end
cov = zeros(784, 784, 10);
vec = zeros(784, 10);
val = zeros(1, 10);
mean = reshape(mean, 28, 28, 10);
for i = 1:10
    cov(:, :, i) = s_cov(:, :, i)./counter(:, i); %computing covariance
    [V, D] = eig(cov(:, :, i));
    [~, ind] = max(sum(D, 2));
    vec(:, i) = V(:, ind); %taking the vector corresponding to the max eigenvalue
    val(:, i) = D(ind, ind); %the max eigenvalue
    figure();
    imagesc(mean(:, :, i)); %visualising the mean image
    title(sprintf('Digit = %i', i - 1));
end
