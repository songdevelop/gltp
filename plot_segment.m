function plot_segment(Y,way)

line_width = 2;

switch way
    case 1
        plot3(Y.head(:,1),Y.head(:,2),Y.head(:,3),'ro','LineWidth',line_width);
        hold on
        plot3(Y.torso(:,1),Y.torso(:,2),Y.torso(:,3),'bo','LineWidth',line_width);
        hold on
        plot3(Y.lfemur(:,1),Y.lfemur(:,2),Y.lfemur(:,3),'yo','LineWidth',line_width);
        hold on
        plot3(Y.ltibia(:,1),Y.ltibia(:,2),Y.ltibia(:,3),'co','LineWidth',line_width);
        hold on
        plot3(Y.lfoot(:,1),Y.lfoot(:,2),Y.lfoot(:,3),'mo','LineWidth',line_width);
        hold on
        plot3(Y.rfemur(:,1),Y.rfemur(:,2),Y.rfemur(:,3),'ko','LineWidth',line_width);
        hold on
        plot3(Y.rtibia(:,1),Y.rtibia(:,2),Y.rtibia(:,3),'go','LineWidth',line_width);
        hold on
        plot3(Y.rfoot(:,1),Y.rfoot(:,2),Y.rfoot(:,3),'mo','LineWidth',line_width);
        hold on
        plot3(Y.lhumerus(:,1),Y.lhumerus(:,2),Y.lhumerus(:,3),'yo','LineWidth',line_width);
        hold on
        plot3(Y.lradius(:,1),Y.lradius(:,2),Y.lradius(:,3),'co','LineWidth',line_width);
        hold on
        plot3(Y.lhand(:,1),Y.lhand(:,2),Y.lhand(:,3),'mo','LineWidth',line_width);
        hold on
        plot3(Y.rhumerus(:,1),Y.rhumerus(:,2),Y.rhumerus(:,3),'ko','LineWidth',line_width);
        hold on
        plot3(Y.rradius(:,1),Y.rradius(:,2),Y.rradius(:,3),'go','LineWidth',line_width);
        hold on
        plot3(Y.rhand(:,1),Y.rhand(:,2),Y.rhand(:,3),'mo','LineWidth',line_width);
    case 2
        plot3(Y.head(:,1),Y.head(:,2),Y.head(:,3),'ro','LineWidth',line_width);
        hold on
        plot3(Y.torso(:,1),Y.torso(:,2),Y.torso(:,3),'bo','LineWidth',line_width);
        hold on
        plot3(Y.lfemur(:,1),Y.lfemur(:,2),Y.lfemur(:,3),'yo','LineWidth',line_width);
        hold on
        plot3(Y.ltibia_wfoot(:,1),Y.ltibia_wfoot(:,2),Y.ltibia_wfoot(:,3),'co','LineWidth',line_width);
        hold on
        plot3(Y.rfemur(:,1),Y.rfemur(:,2),Y.rfemur(:,3),'ko','LineWidth',line_width);
        hold on
        plot3(Y.rtibia_wfoot(:,1),Y.rtibia_wfoot(:,2),Y.rtibia_wfoot(:,3),'go','LineWidth',line_width);
        hold on
        plot3(Y.lhumerus(:,1),Y.lhumerus(:,2),Y.lhumerus(:,3),'yo','LineWidth',line_width);
        hold on
        plot3(Y.lradius_whand(:,1),Y.lradius_whand(:,2),Y.lradius_whand(:,3),'co','LineWidth',line_width);
        hold on
        plot3(Y.rhumerus(:,1),Y.rhumerus(:,2),Y.rhumerus(:,3),'ko','LineWidth',line_width);
        hold on
        plot3(Y.rradius_whand(:,1),Y.rradius_whand(:,2),Y.rradius_whand(:,3),'go','LineWidth',line_width);
end

set(gca,'Color',[1,1,1]);
axis equal;
axis([-100 100 -120 120 -100 100]);
axis off;
cameramenu;
view([0,0,1]);