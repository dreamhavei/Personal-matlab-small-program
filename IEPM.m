function Inconsistency = IEPM(Feature,Class,varargin)
%=========================================================================%
%                               不一致性案例对                             %
%=========================================================================%
% Description:
% 	计算不一致对率：不一致案例对数/所有案例对数
%-------------------------------------------------------------------------
% 输入：
%         Name           description        type
%         Feature        特征实例           array
%         Class          类实例             array
% Output:
%         Inconsistency  不一致对率         array
% Example:
%     >> U = [1 2 3 4 5]'
      
%--------------------------------------------------------------------------
%   'AllPairNum'      - 概率阈值.  Default is 实时计算得到.
%
% version 1.0 -- March/2019
% Implemented by: Liyu Yang
% Contact Info  : yangliyuokn@sina.cn

AllPairNum        = [];
for ia            = 1:length(varargin)
    AllPairNum    = varargin{1};
end
if isempty(AllPairNum)
	[m,~]         = size(Feature);               %  m-实例数
    AllPairNum    = sum(sum(tril(ones(m,m),-1)));% 计算所有案例对数
end
%  tril取下三角形  triu取上三角形
Fc                = abs(tril(corrcoef(Feature'),-1));% 对案例数进行相关性比较相同则为1              
[sm,sn]           = find(Fc==1);                 % 取案例对应特征相同的index
if isempty(sm)
    Inconsistency = 0;
else % Class(sm) 案例对应特征相同对应的类
    % 相减如果类相同则为0,不同为非零数
    Inconsistency = sum(logical(Class(sm)-Class(sn)))/AllPairNum;
end
