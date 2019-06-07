function posSet = PositiveRegion(U,C,D)
% PositiveRegion 返回D的C正域，即pos_C(D)
% Input:  Name   description         type
%          U        论域             array
%          C       条件属性(特征)     array
%          D       决策属性(类)       array
% Output: Name   description         tpye
%        posSet  正域pos_C(D)        array
% Example:
%     >> U = [1 2 3 4 5]'
%     >> C = [0 1 2;2 1 0; 3 2 4;2 2 1; 3 2 4]
%     >> D = [0 2 2 1 1 ]'
%     >> pos = PositiveRegion(U,C,D)      

% Author: Neptune_zx 
% Email:  553680533@qq.com
% Time:   2011/5/19
%=========================================================================2

posSet     = [];
U_D_cell   = EquivalentClassSet(U,D);   %对类进行划分
U_C_cell   = EquivalentClassSet(U,C);
for i      = 1:length(U_D_cell)
    X      = U_D_cell{i};
    posSet = [posSet;LowerApproximation(U,U_C_cell,X)];
end
posSet     = unique(posSet);
end