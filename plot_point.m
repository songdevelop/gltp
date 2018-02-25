function plot_point(Y,color,width)

plot3(Y(:,1),Y(:,2),Y(:,3),'o','color',color,'LineWidth',width);


set(gca,'Color',[1,1,1]);
axis equal;
axis([-100 100 -120 120 -100 100])
axis off;
cameramenu;
view([0,0,1]);