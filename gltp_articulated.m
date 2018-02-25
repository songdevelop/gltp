function  [C, Yt, sigma2, iter, T] = gltp_articulated(X, Y, W, opt) 

% -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-
% Get data dimension
[N, D] = size(X); 
[M, D] = size(Y);
% -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-

% -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-
% Initialization
lambda = opt.lambda;
beta = opt.beta;
alpha = opt.alpha;
max_it = opt.max_it;
viz    = opt.viz;
outliers = opt.outliers;
fgt = opt.fgt;
corresp = opt.corresp;
Yt = Y; 
T = zeros(M,D);
sigma2 = (M*trace(X'*X)+N*trace(Y'*Y)-2*sum(X)*sum(Y)')/(M*N*D);
sigma2_init = sigma2;
iter = 0; 
G = cpd_G(Y,Y,beta);
tol = opt.tol;
ntol = tol+10;
L = 0;
% -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-

% -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-
while (iter < max_it) && (ntol > tol) && (sigma2 > 10*eps)
    L_old = L; 
    % Set the lambda value during different stage of the iteration
    if iter > 30 && lambda > 30
        lambda = lambda*0.50;
    end
    % The minimal value of lambda is 30
    if lambda < 30
        lambda = 30;
    end
    % Set the alpha value during different stage of the iteration
    if iter > 60 && iter < 101
        alpha = 10;
    end
    % The minimal value of alpha is 2
    if iter > 100
        alpha = 2;
    end
    
    % Check wheather we want to use the Fast Gauss Transform
    if (fgt == 0)  % no FGT
        [P1,Pt1, PX, L] = cpd_P(X,Yt, sigma2 ,outliers); st='';
    else         % FGT
        [P1, Pt1, PX, L, sigma2, st] = cpd_Pfast(X, Yt, sigma2, outliers, sigma2_init, fgt);
    end
    ntol = abs((L-L_old)/L);
    % Visualize result for each iteration
    disp(['gltp articulated registration ' st ' : iter = ' num2str(iter) ' sigma2 = ' num2str(sigma2)]);
    % precompute diag(P)
    dP = spdiags(P1,0,M,M);
    if iter < 136
        T = (dP*G+alpha*sigma2*eye(M)+sigma2*lambda*W*G)\(PX-dP*Y-sigma2*lambda*W*Y);
        % update Y postions
        Yt = Y+G*T;
    else 
        T = (dP + sigma2*lambda*W)\(PX-(dP*Y+sigma2*lambda*W*Y)); % Remove the cpd constraint at the last 15 iterations
        % update Y postions
        Yt = Y+T;
    end 
 
    Np = sum(P1);
    sigma2save = sigma2;
    sigma2 = abs((sum(sum(X.^2.*repmat(Pt1,1,D)))+sum(sum(Yt.^2.*repmat(P1,1,D))) -2*trace(PX'*Yt))/(Np*D));    
    % Plot the result on current iteration
    if viz, 
        plot_comparison(X,Yt); 
    end
    iter = iter+1;
end

disp('Registration succesfully completed.');

%Find the correspondence, such that Y corresponds to X(C,:)
if corresp 
    C = cpd_Pcorrespondence(X,Yt,sigma2save,outliers); 
else
    C=0; 
end;
% -.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-
