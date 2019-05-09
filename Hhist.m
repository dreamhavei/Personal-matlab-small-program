function [Y] = Hhist(varargin)

%=========================================================================%
%                               对数据进行归一化                           %
%=========================================================================%
% Description:
%    
%-------------------------------------------------------------------------
% 输入： 
%       X       要归一化数据 对向量进行归一化
%       nbins   需要划分的区间个数
% 输出：
% 		Y       归一化后的向量
% operator --- EAbinary

% args:输入元素cell  nargs:输入元素数double
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








