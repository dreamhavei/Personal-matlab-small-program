function gama = FuzzyDependencyDegree(indI,Feature,cls)
% DependencyDegree 返回D对C的依赖度gama
% Input:  Name     description         type
%          U           论域            array
%          C         条件属性          array
%          D         决策属性          array
% Output: Name     description         tpye
%         gama        依赖度           double


%=========================================================================%
%                               计算模糊依赖度                            %
%=========================================================================%
% Description:
% 	根据模糊-粗糙集理论计算依赖度
%-------------------------------------------------------------------------
% 输入：
%         Name           description        type
%         indI                              array
%         Feature        特征实例            array
%         cls                               array
% Output:
%         gama           依赖度             double
%--------------------------------------------------------------------------
%
% version 1.0 -- March/2019
% Implemented by: Liyu Yang
% Contact Info  : yangliyuokn@sina.cn
%
% Reference:
%   2015-Novel Improvements on the Fuzzy-Rough QuickReduct Algorithm


[r, ~]                   = size(Feature);
%====================Calculating Indiscernibilities=======================
tmp                      = zeros(1, length(cls));
v                        = std(Feature, 1);      % 15个特征v标准差
supMat                   = zeros(1, r);
for x                    = 1:r                   % 遍历所有案例
    s                    = 1;
    for nCls             = 1:length(cls)
        md               = zeros(r, 3);          % 归零
        md(:, 1)         = indI;        % 第一列为U
        part             = indI(s:cls(nCls));    % U/IND(output)
        md(:, 2)         = ismember(indI,part);
        for y            = 1:r                   % 遍历所有案例
            fTerm1       = (Feature(y,:)-(Feature(x,:)-v))./(Feature(x,:)-(Feature(x,:)-v)); % 
            fTerm2       = ((Feature(x,:)+v)-Feature(y,:))./((Feature(x,:)+v)-Feature(x,:)); %
            moRmF        = max(min(fTerm1, fTerm2), 0);
            if (length(moRmF) > 1)
                outM     = max(moRmF(1) + moRmF(2) - 1, 0);
                for nMoRmF = 3:length(moRmF)
                    outM = max(outM + moRmF(nMoRmF) - 1, 0);
                end
            else
                outM     = min(moRmF);
            end
            md(y, 3)     = min(1-outM + md(y, 2), 1);
            clear moRmF;
        end
        tmp(nCls)        = min(md(:, 3));
        s                = cls(nCls) + 1;
    end
    supMat(x)            = max(tmp);
end
gama                     = sum(supMat) / r;        % 特征子集下逼近和除以全域数