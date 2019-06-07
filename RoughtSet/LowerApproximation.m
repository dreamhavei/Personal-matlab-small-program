function lowAppSet = LowerApproximation(U,U_C_cell,X)
% ����X��R�½��ƣ���R_(X)
% Input:  Name   description         type
%          U        ����             array
%        U_C_cell  ��������index      array
%          X        ��index          array
% Output: Name   description         tpye
%       lowAppSet  �½���            array

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
    if (all(ismember(U_C_cell{i},X))) % �жϼ���A�Ƿ��Ǽ���B���Ӽ�
        lowAppSet  = [lowAppSet;U_C_cell{i}]; 
    end
end
lowAppSet          = unique(lowAppSet);
end
