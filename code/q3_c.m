load('data/points2D_Set2.mat', 'x'); %loading the data
load('data/points2D_Set2.mat', 'y'); %loading the data
m_x = sum(x)/length(x); %mean of 'y' values
m_y = sum(y)/length(y); %mean of 'y' values
X = x - m_x;
Y = y - m_y;
v = [X.'; Y.'];
C = v*v.'/length(X); %getting the covariance matrix
[V, D] = eig(C);
[~, i] = max(sum(D, 2));
V_max = V(:, i); %getting the eigenvector corresponsing to the maximum eigenvalue
figure();
xlim = [min(X) max(X)];
m = V_max(2)/V_max(1); %slope of the line
n = m_y - m_x*m; %'y' intercept of the line
y1 = m*xlim(1) + n;
y2 = m*xlim(2) + n;
hold on
scatter(x, y, 2);
line([xlim(1) xlim(2)],[y1 y2], 'color', 'r')
title('Best-fit Line')
hold off