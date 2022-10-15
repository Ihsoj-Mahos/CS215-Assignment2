rng(1); %setting the seed

expl = zeros(1, 10);
expl = expl + 10;
id = 1;
while true %selecting 10 images of different digits randomly
    if not(any(expl(:) == 10))
        break;
    end
    jump = ceil(rand()*100);
    id = mod(id + jump, 60000) + 1;
    if any(expl(:) == Y(1, id))
        continue;
    else
        expl(Y(1, id) + 1) = Y(1, id);
        coord = reduceimg(X(:, id), Y(1, id), vec); %taking the 84 coordinates
        img1 = reshape(X(:, id), 28, 28);
        s = sum(vec(:, :, Y(1, id) + 1).*coord, 2); %reconstruction of image
        img2 = reshape(s, 28, 28);
        arr = [img1, img2]; %plotting the two images side by side
        figure();
        imagesc(arr);
        title(sprintf('Digit = %i\n Original                            Reconstructed', Y(1, id)));
    end
end

function c = reduceimg(image, label, vec1)
    c = zeros(1, 84);
    for i = 1:84
        c(i) = dot(image, vec1(:, i, label + 1))/norm(vec1(:, i, label + 1));
    end
    return
end