function DisFeature = EquDiscret(Feature,varargin)
%=========================================================================%
%                               等间隔离散化                               %
%=========================================================================%
% Description:
% 	等间隔离散化
%-------------------------------------------------------------------------
% 输入：
%         Name           description        type
%         Feature        特征实例           array
% Output:
%         DisFeature     离散化特征         array
      
%--------------------------------------------------------------------------
%   'Num'                - 离散化区间数 .  Default is 5.
%
% version 1.0 -- March/2019
% Implemented by: Liyu Yang
% Contact Info  : yangliyuokn@sina.cn
%
% Reference:
%   2011-Consistency measures for feature selection A formal definition,  
%   relative sensitivity comparison, and a fast algorithm


Num                         = [];
for ia                      = 1:length(varargin)
    Num                     = varargin{1};
end
if isempty(Num)
    Num                     = 5;
end
%% 求Range
Max                         = max(Feature);
Min                         = min(Feature);
%% 除取余 (Max - Min)/Num->1/Num区间范围 bsxfun(@minus,Feature,Min)->从零开始 fix(bsxfun(@rdivide,bsxfun(@minus,Feature,Min),(Max - Min)/5)）->相除取整数部分
DisFeature                  = fix(bsxfun(@rdivide,bsxfun(@minus,Feature,Min),(Max - Min)/Num));
DisFeature(DisFeature==Num) = Num - 1;     % rank4=[4,5];                              
