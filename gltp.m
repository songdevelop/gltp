function [Transform,C] = gltp(X, Y, opt, W)

% Get the dimension
[M,D]  = size(Y); 
[N,D2] = size(X);

% checking for the possible errors
if D~=D2, error('The dimension of point-sets is not the same.'); end;
if (D>M)||(D>N), disp('The dimensionality is larger than the number of points. Possibly the wrong orientation of X and Y.'); end;
if (M>1e+5)||(N>1e+5) && (opt.fgt==0), disp('The data sets are large. Use opt.fgt=1 to speed up the process.'); end;

% Convert to double type, save Y
X = double(X);  
Y = double(Y); 
Yorig = Y; 

% default mean and scaling
normal.xd = 0; 
normal.yd = 0;
normal.xscale = 1; 
normal.yscale = 1;

% Normalize to zero mean and unit variance
if opt.normalize, [X,Y,normal] = cpd_normalize(X,Y); end;

% disp(['%%%%% Starting point set registration %%%%%' ]); 

% tic;
% Choose the method and start point-set registration
switch lower(opt.case),
    case 'general'
        [C, Yt, sigma2, iter, T] = gltp_general(X, Y, W, opt);
    case 'articulated'
        [C, Yt, sigma2, iter, T] = gltp_articulated(X, Y, W, opt);
    otherwise
        error('The opt.method value is invalid. Supported methods are: rigid, affine, nonrigid, nonrigid_lowrank');
end

% Denormalize transformation parameters
Transform.iter = iter;
Transform.normal = normal;
Transform.Yorig = Yorig;
Transform.T = T;
Transform.sigma2 = sigma2;
if opt.normalize,
     Transform.Yt = Yt*normal.xscale+repmat(normal.xd,M,1);
end 
