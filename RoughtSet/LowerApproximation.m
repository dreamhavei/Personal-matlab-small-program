function lowAppSet = LowerApproximation(U,U_C_cell,X)
% 返回X的R下近似，即R_(X)
% Input:  Name   description         type
%          U        论域             array
%        U_C_cell  特征划分index      array
%          X        类index          array
% Output: Name   description         tpye
%       lowAppSet  下近似            array

% Author: Neptune_zx
% Email:  553680533@qq.com
% Time:   2011/5/19
% ========================================================================3
lowAppSet          = [];
if(~IsSub(X,U))
    warning('RS:warning','set X is not sub set of U.');
return;
end

for i              =1:length(U_C_cell)
    if (all(ismember(U_C_cell{i},X))) % 判断集合A是否是集合B的子集
        lowAppSet  = [lowAppSet;U_C_cell{i}]; 
    end
end
lowAppSet          = unique(lowAppSet);
end
