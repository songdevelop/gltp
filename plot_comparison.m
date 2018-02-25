function plot_comparison(X,Y,C)

if nargin<2, error(' Not enough input parameters.'); end;

[m, d]=size(Y);

if d>3, error('Supported dimension for visualizations are only 2D and 3D.'); end;
if d<2, error('Supported dimension for visualizations are only 2D and 3D.'); end;

% figure('Color',[1 1 1]);

% for 2D case
if d==2,
   plot(X(:,1), X(:,2),'r*', Y(:,1), Y(:,2),'go'); %axis off; axis([-1.5 2 -1.5 2]);
else
% for 3D case
   plot3(X(:,1),X(:,2),X(:,3),'r.',Y(:,1),Y(:,2),Y(:,3),'go'); % title('X data (red). Y GMM centroids (blue)');set(gca,'CameraPosition',[15 -50 8]);
end

% plot correspondences
if nargin>2,
    hold on;
    if d==2,
        for i=1:m,
            plot([X(C(i),1) Y(i,1)],[X(C(i),2) Y(i,2)]);
        end
    else
        for i=1:m,
            plot3([X(C(i),1) Y(i,1)],[X(C(i),2) Y(i,2)],[X(C(i),3) Y(i,3)]);
        end
    end
    hold off;
end
set(gca,'Color',[1,1,1]);
axis square;
axis on;
cameramenu;
axis equal;
axis off;
view([0,0,1]);
drawnow;