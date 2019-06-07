function ProPosSet = ProbabilityPositiveRegion(U,C,U_D_cell,alpha)
%=========================================================================%
%                             概率粗糙集正域                              %
%=========================================================================%
% Description:
% 	返回D的C正域，即pos_C(D)
%-------------------------------------------------------------------------
% 输入：
%         Name       description            type
%         U          论域                   array
%         C          条件属性(特征)          array
%         U_D_cell   决策属性(类)对论域的划分 cell
%         alpha      概率阈值
% Output:
%         ProPosSet  概率正域pos_C(D)  array
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
U_C_cell      = EquivalentClassSet(U,C);   % 根据特征对实例进行划分
for i         = 1:length(U_D_cell)
    X         = U_D_cell{i};
    ProPosSet = [ProPosSet;ProbabilityLowerApproximation(U,U_C_cell,X,alpha)];
end
ProPosSet     = unique(ProPosSet);
end