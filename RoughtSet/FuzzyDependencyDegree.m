function gama = FuzzyDependencyDegree(indI,Feature,cls)
% DependencyDegree ����D��C��������gama
% Input:  Name     description         type
%          U           ����            array
%          C         ��������          array
%          D         ��������          array
% Output: Name     description         tpye
%         gama        ������           double


%=========================================================================%
%                               ����ģ��������                            %
%=========================================================================%
% Description:
% 	����ģ��-�ֲڼ����ۼ���������
%-------------------------------------------------------------------------
% ���룺
%         Name           description        type
%         indI                              array
%         Feature        ����ʵ��            array
%         cls                               array
% Output:
%         gama           ������             double
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
v                        = std(Feature, 1);      % 15������v��׼��
supMat                   = zeros(1, r);
for x                    = 1:r                   % �������а���
    s                    = 1;
    for nCls             = 1:length(cls)
        md               = zeros(r, 3);          % ����
        md(:, 1)         = indI;        % ��һ��ΪU
        part             = indI(s:cls(nCls));    % U/IND(output)
        md(:, 2)         = ismember(indI,part);
        for y            = 1:r                   % �������а���
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
gama                     = sum(supMat) / r;        % �����Ӽ��±ƽ��ͳ���ȫ����