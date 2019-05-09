function Inconsistency = IEPM(Feature,Class,varargin)
%=========================================================================%
%                               ��һ���԰�����                             %
%=========================================================================%
% Description:
% 	���㲻һ�¶��ʣ���һ�°�������/���а�������
%-------------------------------------------------------------------------
% ���룺
%         Name           description        type
%         Feature        ����ʵ��           array
%         Class          ��ʵ��             array
% Output:
%         Inconsistency  ��һ�¶���         array
% Example:
%     >> U = [1 2 3 4 5]'
      
%--------------------------------------------------------------------------
%   'AllPairNum'      - ������ֵ.  Default is ʵʱ����õ�.
%
% version 1.0 -- March/2019
% Implemented by: Liyu Yang
% Contact Info  : yangliyuokn@sina.cn

AllPairNum        = [];
for ia            = 1:length(varargin)
    AllPairNum    = varargin{1};
end
if isempty(AllPairNum)
	[m,~]         = size(Feature);               %  m-ʵ����
    AllPairNum    = sum(sum(tril(ones(m,m),-1)));% �������а�������
end
%  trilȡ��������  triuȡ��������
Fc                = abs(tril(corrcoef(Feature'),-1));% �԰�������������ԱȽ���ͬ��Ϊ1              
[sm,sn]           = find(Fc==1);                 % ȡ������Ӧ������ͬ��index
if isempty(sm)
    Inconsistency = 0;
else % Class(sm) ������Ӧ������ͬ��Ӧ����
    % ����������ͬ��Ϊ0,��ͬΪ������
    Inconsistency = sum(logical(Class(sm)-Class(sn)))/AllPairNum;
end
