rng(1); %setting the seed

load('../data/mnist.mat', 'digits_train');
load('../data/mnist.mat', 'labels_train');
X = reshape(digits_train, 784, 60000);
X = cast(X, 'double');
X = normalize(X);
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
    s_cov(:, :, digit + 1) = s_cov(:, :, digit + 1) + X(:, i)*X(:, i).';
end
mean = s_mean./counter; %computing mean
cov = zeros(784, 784, 10);
vec = zeros(784, 84, 10);
val = zeros(1, 84, 10);
mean = reshape(mean, 28, 28, 10);
for i = 1:10
    cov(:, :, i) = s_cov(:, :, i)./counter(:, i); %computing covariance
    [V, D] = eig(cov(:, :, i));
    [~, ind] = maxk(sum(D, 2), 84);
    for j = 1:84
        val(:, j, i) = D(ind(j), ind(j)); %the max 84 eigenvalues
        vec(:, j, i) = V(:, ind(j)); % the corresponding eigenvectors
    end
end

i = ceil(rand() * 10); %choosing an image at random
disp(reduceimg(mean(:, :, i), i - 1, vec));

function c = reduceimg(image, label, vec1) %the desired function
    tmp = image;
    image = reshape(image, 784, 1);
    c = zeros(1, 84);
    for i = 1:84
        c(i) = dot(image, vec1(:, i, label))/norm(vec1(:, i, label)); %taking projections
    end
    image = tmp;
    return
end