function p = Significance2(X1,X2)
%                          ** 函数功能 **
% 显著性分析:计算两组序列的显著性值
% 1. 正态分布和方差齐性检验
%   Shapiro-Wilk test(p>=0.05正态分布|p<0.05非正态分布)(lillietest)
%   Levene's test      (p>=0.05方差齐|p<0.05方差不齐)
% 2.1 参数检验法(正态分布且方差齐)
%   T-test
% 2.2 非参数检验法(非正态分布，或者方差不齐)
%   Mann-Whitney U-test
%   Wilcoxon rank sum test 
%   Metasts Welch's test
%   White's non parametric test
% 备注：独立样本还是配对样本,配对同一个对象;独立样本不同对象
% 独立样本:Studengt's t-test
%==========================================================================
%                        ** 函数输入输出 **
% **输入：
%        X1              序列1
%        X2              序列2
% **输出：
%        ap              显著性 P value

%% 使输入序列规范化 为列向量
[row1,col1] = size(X1);
[row2,col2] = size(X2);
if row1     < col1
    X1      = X1';
    Trc     = row1;
    row1    = col1;
    col1    = Trc;                      %#ok
end
if row2     < col2
    X2      = X2';
    Trc     = row2;
    row2    = col2;
    col2    = Trc;                      %#ok
end

%% 1. 正态分布和方差齐性检验
%--------------------------------正态性假设---------------------------------
% h = 0 可以认为数据服从正态分布,h = 1则认为不服从正态分布
% p>0.05可以认为接受原假设,      h = 0则认为服从正态分布
%--------------------------------------------------------------------------
LiH1     = lillietest(X1);
LiH2     = lillietest(X2); 

%% 2.1 参数检验法(正态分布且方差齐)
if and(LiH1==0,LiH2==0)
    [h,p] = ttest2(X1,X2);     % t-test
%%  2.2 非参数检验法(非正态分布，或者方差不齐) 
 else
    [p,h] = ranksum(X1,X2);   % Wilcoxon rank sum test
 end

% 第一步
