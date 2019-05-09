function ap = Significance(X1,X2)
%=========================================================================%
%                                 显著性分析                              %
%=========================================================================%
% Description:
%    计算两个序列的显著性值包含参数检验和非参数检验(单因素一元方差分析)
%-------------------------------------------------------------------------
% 输入：
%        X1              序列1
%        X2              序列2
% 输出：
%        ap              显著性 P value
%
% Implemented by: Liyu Yang
% Contact Info  : yangliyuokn@sina.cn

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

%% 加标签
Labelt      = repmat({'E'},row1,1);     %   
Label       = repmat({'N'},row2,1);     %   
Label       = [Labelt;Label];              

%% 参数检验   显著性分析不同目标组合同一指标下
%--------------------------------正态性假设---------------------------------
% h = 0 可以认为数据服从正态分布,h = 1则认为不服从正态分布
% p>0.05可以认为接受原假设,      h = 0则认为服从正态分布
%--------------------------------------------------------------------------
[h1,p1]     = lillietest(X1);
[h2,p2]     = lillietest(X2); 
X           = [X1;X2];                   %cat数据
%------------------------------方差齐次性假设-------------------------------
% p>0.05则说明X中的不同Group是齐次的，也就是方差性齐
%--------------------------------------------------------------------------
vp          = vartestn(X,Label,'off');
if and(and(and(h1 == 0,p1 > 0.05),and(h2 == 0,p2 > 0.05)),vp > 0.05)  
    ap      = anova1(X,Label,'off');     %单因素一元方差分析
%%  非参数检验  
%-----------------Kruskal-Wallis检验(单因素非参数方差分析)-------------------
else
    ap      = kruskalwallis(X,Label,'off');%单因素非参数方差分析
end


