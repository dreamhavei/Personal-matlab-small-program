function DisFeature = FcmDiscret(Feature)
%=========================================================================%
%                               FCM离散化                                 %
%=========================================================================%
% Description:
% 	模糊C均值聚类离散化
%-------------------------------------------------------------------------
% 输入：
%         Name           description        type
%         Feature        特征实例           array
% Output:
%         DisFeature     离散化特征         array 
%--------------------------------------------------------------------------
%
% version 1.0 -- March/2019
% Implemented by: Liyu Yang
% Contact Info  : yangliyuokn@sina.cn
%
% Reference:
%   2014-Novel algorithm of attribute reduction with variable precision 
% rough set model

%% FCM离散化
options              = [NaN 1000 NaN 0];               % 增加迭代次数为1000代不显示
for ia               = 1:size(Feature,2)
    [C,~,ic]         = unique(Feature(:,ia));          % 计算某一特征值出现种类
    Num              = length(C);
    if Num           > 10                              % 取出现次数的十分之一为分类间隔
        Num          = round(Num/10);
        [~,U]        = fcm(Feature(:,ia),Num,options); % U是对应隶属度值行表示不同的隶属度函数，列表示不同的实例
        [~,Intreval] = max(U);                         % Intreal离散化后的值 从1开始
    else
        Intreval     = ic';
    end
    DisFeature(:,ia) = Intreval';
end        
