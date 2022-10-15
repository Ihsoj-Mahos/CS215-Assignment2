rng(5); %setting the seed

y1 = gen_fruit(vec, mean, val); %generating images
y2 = gen_fruit(vec, mean, val); %generating images
y3 = gen_fruit(vec, mean, val); %generating images
figure(); %plotting three such images side by side
subplot(1, 3, 1);
image(rescale(reshape(y1, 80, 80, 3)));
title('First');
subplot(1, 3, 2);
image(rescale(reshape(y2, 80, 80, 3)));
title('Second');    
subplot(1, 3, 3);
image(rescale(reshape(y3, 80, 80, 3)));
title('Third');

function y = gen_fruit(vec, mean, val) %the desired function
    d = diag(val);
    A = vec * sqrt(d); %cholesky's decomposition
    W = randn(4, 1); %sampling values from the gaussian
    y = A * W + reshape(mean, 19200, 1);
    return
end