function gama = ProbabilityDependencyDegree(U,C,U_D_cell,varargin)
%=========================================================================%
%                                ���ʴֲڼ�������                         %
%=========================================================================%
% Description:
%   ����D��C��������gama
%-------------------------------------------------------------------------
% Input:  Name     description     type
%         U        ����            array
%         C        ��������        array
%         U_D_cell �������Զ��໮�� cell
% Output: 
%         gama     ������          double
%-------------------------------------------------------------------------1
%   'alpha'      - ������ֵ.  Default is 0.75.
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
ProposCD           = ProbabilityPositiveRegion(U,C,U_D_cell,alpha);  % �����������
gama               = length(ProposCD)/length(U);
end