function [Y] = Hhist(varargin)

%=========================================================================%
%                               �����ݽ��й�һ��                           %
%=========================================================================%
% Description:
%    
%-------------------------------------------------------------------------
% ���룺 
%       X       Ҫ��һ������ ���������й�һ��
%       nbins   ��Ҫ���ֵ��������
% �����
% 		Y       ��һ���������
% operator --- EAbinary

% args:����Ԫ��cell  nargs:����Ԫ����double
[~,args,nargs] = axescheck(varargin{:});
X              = args{1};
if nargs       == 1
    nbins      = 10;
else
    nbins      = args{2};
end

[MaxValue,~]   = max(X);
[MinValue,~]   = min(X);
Interval       = linspace(MinValue,MaxValue,nbins+1);

Y              = X;
for ia         = 1:nbins
    Y(and(Interval(ia)<=X,X<Interval(ia+1))) = ia;
end
Y(X==Interval(nbins+1)) = nbins;
end








