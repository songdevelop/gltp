function seg_Y = template_segmentation(Y,ind)

% *=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
% Based on joint position segment the original model 
% *=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*

% *=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
% Find the segment index
% Head 
seg_Y.head = Y(ind.head,:);
% Torso
seg_Y.torso = Y(ind.torso,:);
% Lfemur
seg_Y.lfemur = Y(ind.lfemur,:);
% Ltibia
seg_Y.ltibia = Y(ind.ltibia,:);
% Lfoot
seg_Y.lfoot = Y(ind.lfoot,:);
% Ltibia with foot
seg_Y.ltibia_wfoot = Y(ind.ltibia_wfoot,:);
% Rfemur
seg_Y.rfemur = Y(ind.rfemur,:);
% Rtibia
seg_Y.rtibia = Y(ind.rtibia,:);
% Rfoot
seg_Y.rfoot = Y(ind.rfoot,:);
% Rtibia with foot
seg_Y.rtibia_wfoot = Y(ind.rtibia_wfoot,:);
% Lhumerus
seg_Y.lhumerus = Y(ind.lhumerus,:);
% Lradius
seg_Y.lradius = Y(ind.lradius,:);
% Lhand
seg_Y.lhand = Y(ind.lhand,:);
% Lradius with hand
seg_Y.lradius_whand = Y(ind.lradius_whand,:);
% Rhumerus
seg_Y.rhumerus = Y(ind.rhumerus,:);
% Rradius
seg_Y.rradius = Y(ind.rradius,:);
% Rhand
seg_Y.rhand = Y(ind.rhand,:);
% Rradius with hand
seg_Y.rradius_whand = Y(ind.rradius_whand,:);
% *=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*
