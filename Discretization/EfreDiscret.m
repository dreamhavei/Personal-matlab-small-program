function Y = EfreDiscret(X,varargin)
%=========================================================================%
%                            ����Ӧ��Ƶ��ɢ��                              %
%=========================================================================%
% Description:
% 	��ɢ����仯һ���仯�ĳ̶���һ�µ�
%-------------------------------------------------------------------------
% ���룺
%         Name           description        type
%         X              ����               vector
% Output:
%         Y              ������ɢ��������    vector
      
%--------------------------------------------------------------------------
%   'nbins'      - ͳ�Ƽ�����.  Default is 10.
%
% version 1.0 -- March/2019
% Implemented by: Liyu Yang
% Contact Info  : yangliyuokn@sina.cn


nbins                    = [];
for ia                   = 1:length(varargin)
    nbins                = varargin{1};
end
if isempty(nbins)
    nbins                = 10;
end
%%
for ia = 1:size(X,2)
    Intreval             = zeros(size(X,1),1);
    [C,ub,ic]            = unique(X(:,ia));                 % ����ĳһ����ֵ��������
    Num                  = length(C);
%     [countsIc]           = ;
    if Num               > nbins                            % ȡ���ִ�����ʮ��֮һΪ������
        Num              = round(Num/nbins);
        CouCum           = cumsum(hist(ic,Num));              % 
        for ib           = 1:Num
            FirInd(ib)   = find(CouCum >= ib * nbins, 1, 'first');
        end
        if FirInd(end)>length(ub)
            FirInd(end)=length(ub);
        end
        FC               = unique(FirInd);
        Xpos             = X(ub(FC),ia);
        Intreval(X(:,ia) <=Xpos(1))=1;
        for ib           = 1:length(FC)-1
            Intreval(and(Xpos(ib)<X(:,ia),X(:,ia)<=Xpos(ib+1)))=ib+1;
        end
        Intreval(Xpos(end)<X(:,ia)) = length(FC)+1;
        clear FirInd C ub ic CouCum FC Xpos;
    else
        Intreval          = ic;
    end
    Y(:,ia) = Intreval;
end
end