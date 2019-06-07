function gama = ProbabilityDependencyDegree(U,C,U_D_cell,varargin)
%=========================================================================%
%                                概率粗糙集依赖度                         %
%=========================================================================%
% Description:
%   计算D对C的依赖度gama
%-------------------------------------------------------------------------
% Input:  Name     description     type
%         U        论域            array
%         C        条件属性        array
%         U_D_cell 决策属性对类划分 cell
% Output: 
%         gama     依赖度          double
%-------------------------------------------------------------------------1
%   'alpha'      - 概率阈值.  Default is 0.75.
%
% version 1.0 -- January/2019
% Implemented by: Liyu Yang
% Contact Info  : yangliyuokn@sina.cn

alpha             = [];
for ia            = 1:length(varargin)
    alpha         = varargin{1};
end
if isempty(alpha)
    alpha         = 0.75;
end

if(isempty(C))
    gama           = 0;
    return;
end
ProposCD           = ProbabilityPositiveRegion(U,C,U_D_cell,alpha);  % 计算概率正域
gama               = length(ProposCD)/length(U);
end