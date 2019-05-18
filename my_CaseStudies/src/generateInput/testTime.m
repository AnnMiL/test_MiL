function [EXET] = testTime(ifFast,  TM, tslp, tact, varargin)
% the order of cores in tslp and tact is
% the same with that in TM.
% the time unit is second!
global EXET;

tc = tic;
if ifFast
    if nargin ~= 5
        error('error');
    end
    Timp = varargin{1};
    validateattributes(Timp.M, {'CellImpulse'},{'size',[TM.n, TM.n]});
else
    
% 
N               = TM.N;
p               = TM.p;
n               = TM.n;
fftLength       = TM.fftLength;
coreIdx         = TM.coreIdx;

pp              = inputParser;
defaultScope    = 'global';
defaultNodeidx  = find(TM.isCore == 1, 1);
defaultTimp     = ImpulsePeriod2dMat(n, n);
validScopes     = {'global', 'single','self'};
checkScope      = @(x) any( validatestring( x, validScopes));
checktime       = @(x) validateattributes(x, {'double', 'single'}, {'size',...
    [1, n], 'nonnegative'});
checkTimp       = @(x) validateattributes(x.M, {'CellImpulse'},{'size',[n,n]});
checkid         = @(x) validateattributes(x, {'double', 'single'}, ...
    {'scalar', 'positive', 'integer', '<=', N});
checkStatus     = @(x) validateattributes(x, {'logical'}, ...
    {'size', [1, n]});

addRequired(pp, 'ifFast', @islogical);

addRequired(pp, 'TM', @isstruct);
addRequired(pp, 'tslp', checktime);
addRequired(pp, 'tact', checktime);
addOptional(pp, 'scope', defaultScope, checkScope);
addOptional(pp, 'nodeIdx', defaultNodeidx, @(x)checkid(x));
addOptional(pp, 'Timp', defaultTimp, checkTimp);
addOptional(pp, 'isAct', true(1, n), checkStatus);
pp.KeepUnmatched = true;
parse(pp,TM, tslp, tact, varargin{:});

scope           = pp.Results.scope;
nodeIdx         = pp.Results.nodeIdx;
Timp            = pp.Results.Timp;
isAct           = pp.Results.isAct;

end
t1 = toc(tc);
if isempty(EXET)
    EXET = zeros(1,4);
end
EXET = EXET + [t1,0,0,1];

