%  Nonrigid Example1. Coherent Point Drift (CPD).
%  Registration of 2D fish point sets without noise and outliers.

clear all; close all; clc;

% Load template model 
template = load('data/template.mat');
Y = template.points; % point sets
ind = template.segment_label; % body segment label for results visualization 
%plot_point(Y,'g',1); % visualize the template model

% Load target model
target = load('data/target_1.mat');
X = target.points;
%plot_point(X,'r',1);

% Perform gltp registration
opt.lambda    = 5000000;     % regularization LLE weight
opt.viz       = 1;           % show every iteration if viz = 1
opt.outliers  = 0.0;         % use 0.7 noise weight
opt.fgt       = 0;           % use FGT to compute matrix-vector products (2 means to switch to truncated version at the end, see cpd_register)
opt.normalize = 1;           % normalize to unit variance and zero mean before registering (default)
opt.corresp   = 1;           % compute correspondence vector at the end of registration (not being estimated by default)
opt.max_it    = 150;         % max number of iterations
opt.tol       = 1e-10;       % tolerance
opt.beta      = sqrt(2.5);   % regularization CPD kernel weight
opt.alpha     = 100;         % regularization CPD weight
opt.case    = 'articulated';

% Compute LLE neighborhood matrix W
W = neighbour_preserve(Y,15);

% Perform registration
[T,C] = gltp(X, Y, opt, W);

% Visualize the results
figure()
seg_X = template_segmentation(X(C,:),ind); % Passing the segment label to target model by estimated correspondences               
plot_segment(seg_X,1); % Visualize the segment label passing results
X_down = up_down_sample(X,6,'down'); % Down sample the target points for quick visualization
figure()
plot_point(T.Yt,'g',1);
hold on;
plot_point(X_down,'r',1);
