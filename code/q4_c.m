vec = reshape(vec, 28, 28, 10); %reshaping, taken from the workspace

for i = 1:10
    img = [mean(:, :, i) - vec(:, :, i).*sqrt(val(1, i)), mean(:, :, i), mean(:, :, i) + vec(:, :, i).*sqrt(val(1, i))];
    figure();
    imagesc(img); %three images side by side, spacing of title was adjusted by spaces
    title(sprintf('Digit = %i\nm - sqrt(lambda)*v              m              m + sqrt(lambda)*v', i - 1));
end