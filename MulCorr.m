function [coef] = MulCorr(x, varargin)
%=========================================================================%
%                                多重相关系数                              %
%=========================================================================%
% Description: 
%    计算多个变量的单个变量的相关系数
%-------------------------------------------------------------------------
% 输入： 
%       x         变量(y,x1,...,xn) x1和y为列向量
% 输出：
%       coef      多个变量与单个变量的相关系数
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

%% 计算相关系数矩阵
Xcorr       = corr(x);
a21         = Xcorr(1,2:end);          % 行向量 1×xn-1
a22         = Xcorr(2:end,2:end);      %
coef        = sqrt(a21*inv(a22)*a21');

