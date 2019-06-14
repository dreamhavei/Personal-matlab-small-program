function DisFeature = FcmDiscret(Feature)
%=========================================================================%
%                               FCM��ɢ��                                 %
%=========================================================================%
% Description:
% 	ģ��C��ֵ������ɢ��
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
%   2014-Novel algorithm of attribute reduction with variable precision 
% rough set model

%% FCM��ɢ��
options              = [NaN 1000 NaN 0];               % ���ӵ�������Ϊ1000������ʾ
for ia               = 1:size(Feature,2)
    [C,~,ic]         = unique(Feature(:,ia));          % ����ĳһ����ֵ��������
    Num              = length(C);
    if Num           > 10                              % ȡ���ִ�����ʮ��֮һΪ������
        Num          = round(Num/10);
        [~,U]        = fcm(Feature(:,ia),Num,options); % U�Ƕ�Ӧ������ֵ�б�ʾ��ͬ�������Ⱥ������б�ʾ��ͬ��ʵ��
        [~,Intreval] = max(U);                         % Intreal��ɢ�����ֵ ��1��ʼ
    else
        Intreval     = ic';
    end
    DisFeature(:,ia) = Intreval';
end        
