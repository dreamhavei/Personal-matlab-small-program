function DisFeature = EquDiscret(Feature,varargin)
%=========================================================================%
%                               �ȼ����ɢ��                               %
%=========================================================================%
% Description:
% 	�ȼ����ɢ��
%-------------------------------------------------------------------------
% ���룺
%         Name           description        type
%         Feature        ����ʵ��           array
% Output:
%         DisFeature     ��ɢ������         array
      
%--------------------------------------------------------------------------
%   'Num'                - ��ɢ�������� .  Default is 5.
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
%% ��Range
Max                         = max(Feature);
Min                         = min(Feature);
%% ��ȡ�� (Max - Min)/Num->1/Num���䷶Χ bsxfun(@minus,Feature,Min)->���㿪ʼ fix(bsxfun(@rdivide,bsxfun(@minus,Feature,Min),(Max - Min)/5)��->���ȡ��������
DisFeature                  = fix(bsxfun(@rdivide,bsxfun(@minus,Feature,Min),(Max - Min)/Num));
DisFeature(DisFeature==Num) = Num - 1;     % rank4=[4,5];                              
