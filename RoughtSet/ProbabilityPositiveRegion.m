function ProPosSet = ProbabilityPositiveRegion(U,C,U_D_cell,alpha)
%=========================================================================%
%                             ���ʴֲڼ�����                              %
%=========================================================================%
% Description:
% 	����D��C���򣬼�pos_C(D)
%-------------------------------------------------------------------------
% ���룺
%         Name       description            type
%         U          ����                   array
%         C          ��������(����)          array
%         U_D_cell   ��������(��)������Ļ��� cell
%         alpha      ������ֵ
% Output:
%         ProPosSet  ��������pos_C(D)  array
% Example:
%     >> U = [1 2 3 4 5]'
%     >> C = [0 1 2;2 1 0; 3 2 4;2 2 1; 3 2 4]
%     >> D = [0 2 2 1 1 ]'
%     >> pos = PositiveRegion(U,C,D)      
%-------------------------------------------------------------------------2
%
% version 1.0 -- January/2019
% Implemented by: Liyu Yang
% Contact Info  : yangliyuokn@sina.cn

ProPosSet     = [];
U_C_cell      = EquivalentClassSet(U,C);   % ����������ʵ�����л���
for i         = 1:length(U_D_cell)
    X         = U_D_cell{i};
    ProPosSet = [ProPosSet;ProbabilityLowerApproximation(U,U_C_cell,X,alpha)];
end
ProPosSet     = unique(ProPosSet);
end