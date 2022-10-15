[V, D] = eigs(cov, 4); %getting the top 4 eigenvalues and the corresponding eigenvectors
vec = V;
vec = reshape(vec, 19200, 4);
for i = 1:16 %adding the projections taken over the eigenvectors
    reg = vec*((X(:, i)-reshape(mean, 19200, 1)).'*vec).' + reshape(mean, 19200, 1);
    figure(); %two images side by side
    subplot(1, 2, 1);
    image(rescale(reshape(X(:, i), 80, 80, 3))); %the original one
    title('Original');
    subplot(1, 2, 2);
    image(rescale(reshape(reg, 80, 80, 3))); %reconstructed
    title('Reconstructed');
end