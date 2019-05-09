function [coef] = MulCorr(x, varargin)
%=========================================================================%
%                                �������ϵ��                              %
%=========================================================================%
% Description: 
%    �����������ĵ������������ϵ��
%-------------------------------------------------------------------------
% ���룺 
%       x         ����(y,x1,...,xn) x1��yΪ������
% �����
%       coef      ��������뵥�����������ϵ��
%-------------------------------------------------------------------------
%   'center'      - �Ƿ�ִ�����Ļ�.  Default is 0.
%   'norm'        - �Ƿ�ִ�й�һ��.  Default is 0.
%
% version 1.0 --December/2018
% Implemented by: Liyu Yang
% Contact Info  : yangliyuokn@sina.cn

%% ���Ļ��͹�һ��
pnames                   = {'center' 'norm'};
dflts                    = {    []       []};
[eid,errmsg,center,Norm] = getargs(pnames, dflts, varargin{:});

if ~isempty(eid)
    error(sprintf('GenCorr:%s',eid),errmsg);
end

% ���Ļ�
if isempty(center)
    center  = 0;
end
if center
	x       = bsxfun(@minus,x,mean(x,1));
end

% ��һ��
if isempty(Norm)
    Norm    = 0;
end
if Norm
	normX   = mapminmax(x',0,1);
	x       = normX';
end

%% �������ϵ������
Xcorr       = corr(x);
a21         = Xcorr(1,2:end);          % ������ 1��xn-1
a22         = Xcorr(2:end,2:end);      %
coef        = sqrt(a21*inv(a22)*a21');

