function DisFeature = AutEquDisc(Feature)
%=========================================================================%
%                           ����Ӧ�ȼ��������ɢ��                         %
%=========================================================================%
% Description:
% 	�ȼ����ɢ���ļ������Ǹ��ݳ���ֵ����������ȷ��
%-------------------------------------------------------------------------
% ���룺
%         Name           description        type
%         Feature        ����ʵ��           array
% Output:
%         DisFeature     ��ɢ������         array
      
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
    [C,~,ic]         = unique(Feature(:,ia));          % ����ĳһ����ֵ��������
    Num              = length(C);
    %% ��Range
    if Num                      > 10   
        Num                     = round(Num/10);
        Max                     = max(Feature(:,ia));
        Min                     = min(Feature(:,ia));
        %% ��ȡ�� (Max - Min)/Num->1/Num���䷶Χ bsxfun(@minus,Feature,Min)->���㿪ʼ fix(bsxfun(@rdivide,bsxfun(@minus,Feature,Min),(Max - Min)/5)��->���ȡ��������
        Intreval                = fix(bsxfun(@rdivide,bsxfun(@minus,Feature(:,ia),Min),(Max - Min)/Num));
        Intreval(Intreval==Num) = Num - 1;        % rank4=[4,5];     
    else
        Intreval                = ic';
    end
    DisFeature(:,ia)            = Intreval';
end