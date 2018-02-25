function y = up_down_sample(x,N,str,varargin)
%UPDOWNSAMPLE Up- or down-sample input signal.
%   UPDOWNSAMPLE(X,N,STR) changes the sample rate of X by a factor
%   of N, as specifiedd by STR ('up' or 'down').
%
%   UPDOWNSAMPLE(X,N,STR,PHASE) specifies an optional sample offset.
%   PHASE must be an integer in the range [0, N-1].

%   Copyright 1988-2010 The MathWorks, Inc.
%   $Revision: 1.4.4.5 $  $Date: 2010/05/20 03:10:22 $

error(nargchk(3,4,nargin,'struct'));

% Shift dimension if necessary
siz = size(x);  % Save original size of x (possibly N-D)
[x,nshift] = shiftdim(x);

[phase, msg] = parseUpDnSample(str,N,varargin{:});
if ~isempty(msg), error(generatemsgid('SigErr'),msg); end

switch lower(str),
case 'down',
    % Perform the downsample
    y = x(phase:N:end, :);
case 'up',
    % Perform the upsample
    % n contains the product of the 2nd through ndims(x) sizes for N-D arrays
    [m,n] = size(x);
    y = x(1);
    y(1:m*N*n) = 0; % Don't use zeros() because it doesn't support fi objects
    y = reshape(y,m*N,n);
    y(phase:N:end, :) = reshape(x,m,n);
end
siz(nshift+1) = size(y,1);  % Update sampled dimension
y = shiftdim(y,-nshift);
if length(siz)>2
    y = reshape(y,siz);  % Restore N-D shape
end

% --------------------------------------------------------
function [phase, msg] = parseUpDnSample(str,N,varargin)
% parseUpDnSample Parse input arguments and perform error checking.

% Initialize output args.
phase = 0;
msg = '';

if ( ~isnumeric(N) || (length(N) ~=1) || (fix(N) ~= N) || (N < 1) ),
   msg = [str,'sample factor must be a positive integer.'];
   return
end

if ~isempty(varargin),
   phase = varargin{1};
end

if ( (~isnumeric(phase)) || (fix(phase) ~= phase) || (phase > N-1) || (phase < 0)),
   msg = 'Offset must be from 0 to N-1.';
   return
end

phase = phase + 1; % Increase phase for 1-based indexing



% [EOF]
