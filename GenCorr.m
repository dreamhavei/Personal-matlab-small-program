function [coef] = GenCorr(x, varargin)
%=========================================================================%
%                                广义相关系数                              %
%=========================================================================%
% Description:
%    计算多个变量的相关系数
%-------------------------------------------------------------------------
% 输入： 
%       x         变量(x1,x2,...,xn) x1是列向量
% 输出：
%       coef      多个变量的相关系数
%-------------------------------------------------------------------------
%   'center'      - 是否执行中心化.  Default is 0.
%   'norm'        - 是否执行归一化.  Default is 0.
%
% version 1.0 --December/2018
% Implemented by: Liyu Yang
% Contact Info  : yangliyuokn@sina.cn

%% 中心化和归一化
pnames                   = {'center' 'norm'};
dflts                    = {    []       []};
[eid,errmsg,center,Norm] = getargs(pnames, dflts, varargin{:});
[~,xn]                   = size(x);

if ~isempty(eid)
    error(sprintf('GenCorr:%s',eid),errmsg);
end

% 中心化
if isempty(center)
    center  = 0;
end
if center
	x       = bsxfun(@minus,x,mean(x,1));
end

% 归一化
if isempty(Norm)
    Norm    = 0;
end
if Norm
	normX   = mapminmax(x',0,1);
	x       = normX';
end

%% 计算Gram矩阵
for ia       = 1:xn
    part     = repmat(x(:,ia)',xn,1);
    b        = mtimes(part,x);
    mb       = mean(b(1,:));              %不要溢出
    G(ia,:)  = b(1,:)./mb;
end
NormT        = prod(diag(G));
%% 计算相关性系数
delta        = det(G)./NormT;
coef         = sqrt(1-delta);
