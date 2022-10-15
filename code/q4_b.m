for i = 1:10
    [V, D] = eig(cov(:, :, i)); %used the covariance matrix from the workspace
    figure();
    d = sum(D, 2);
    d = sort(d);
    d = flip(d);
    plot(d); %plotting the eigenvalues after sorting
    xlabel('Index')
    ylabel('Eigenvalue')
    title(sprintf('Digit = %i', i - 1));
end