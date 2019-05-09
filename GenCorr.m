function [coef] = GenCorr(x, varargin)
%=========================================================================%
%                                �������ϵ��                              %
%=========================================================================%
% Description:
%    ���������������ϵ��
%-------------------------------------------------------------------------
% ���룺 
%       x         ����(x1,x2,...,xn) x1��������
% �����
%       coef      ������������ϵ��
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
[~,xn]                   = size(x);

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

%% ����Gram����
for ia       = 1:xn
    part     = repmat(x(:,ia)',xn,1);
    b        = mtimes(part,x);
    mb       = mean(b(1,:));              %��Ҫ���
    G(ia,:)  = b(1,:)./mb;
end
NormT        = prod(diag(G));
%% ���������ϵ��
delta        = det(G)./NormT;
coef         = sqrt(1-delta);
