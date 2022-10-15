img = zeros(80, 80, 3, 16);
for i = 1:16 %loading the data
    img(:, :, :, i) = imread(sprintf('%s_%d%s','../data/data_fruit/image', i, '.png'));
end
X = reshape(img, 19200, 16);
X = cast(X, 'double');
s_mean = sum(X, 2);
mean = s_mean./16; %computing mean
s_cov = (X-mean)*(X-mean).';
cov = s_cov./16; %computing covariance
[V, D] = eigs(cov, 4); %getting only the top 4 eigenvalues and their corresponding eigenvectors
vec = V;
val = sum(D, 1);
mean = reshape(mean, 80, 80, 3);
vec = reshape(vec, 80, 80, 3, 4);
figure();
subplot(1, 5, 1);
image(rescale(mean)); %plotting the mean
title('Mean Fruit');
for i = 1:4
    subplot(1, 5, i + 1);
    image(rescale(vec(:, :, :, i))); %plotting the eigenvectors
    title('Eigenvectors');
end
[V, D] = eigs(cov, 10);
v = sum(D, 1);
figure();
plot(v); %plotting the top 10 eigenvalues
title('Top 10 eigenvalues')
xlabel('Index')
ylabel('Value')