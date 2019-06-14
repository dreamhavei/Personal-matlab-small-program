function DisFeature = AutEquDisc(Feature)
%=========================================================================%
%                           自适应等间隔区间离散化                         %
%=========================================================================%
% Description:
% 	等间隔离散化的间隔宽度是根据出现值的种类数来确定
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
%   2011
%

%
for ia               = 1:size(Feature,2)
    [C,~,ic]         = unique(Feature(:,ia));          % 计算某一特征值出现种类
    Num              = length(C);
    %% 求Range
    if Num                      > 10   
        Num                     = round(Num/10);
        Max                     = max(Feature(:,ia));
        Min                     = min(Feature(:,ia));
        %% 除取余 (Max - Min)/Num->1/Num区间范围 bsxfun(@minus,Feature,Min)->从零开始 fix(bsxfun(@rdivide,bsxfun(@minus,Feature,Min),(Max - Min)/5)）->相除取整数部分
        Intreval                = fix(bsxfun(@rdivide,bsxfun(@minus,Feature(:,ia),Min),(Max - Min)/Num));
        Intreval(Intreval==Num) = Num - 1;        % rank4=[4,5];     
    else
        Intreval                = ic';
    end
    DisFeature(:,ia)            = Intreval';
end