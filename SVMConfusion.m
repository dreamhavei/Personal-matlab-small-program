function [ConfTable] = SVMConfusion(NewFeature,NewClass,Decision,Label)

%=========================================================================%
%                           SVM10�۽�����֤�õ���������                    %
%=========================================================================%
% Description:
%    ���ñ�׼��SVM����������������������ѡ������������ȽϷ�����������
%-------------------------------------------------------------------------
% ���룺 
%       NewClass         ��
%       NewFeature       ����
%       Decision         ���һ�εľ�������
%       Label            ��
% �����
% 		ConfTable        ���������
rng(1); % For reproducibility  
t            = templateSVM('Standardize',1);                 %����֧��������ģ��,��Ԥ��ֵ���б�׼��
Mdl          = fitcecoc(NewFeature,NewClass,'Learners',t);
CVMdl        = crossval(Mdl);
oofLabel     = kfoldPredict(CVMdl);                          %10Ԥ���ǩ
conf_mat     = confusionmat(NewClass,oofLabel);
conf_mat1    = bsxfun(@rdivide, conf_mat, sum(conf_mat, 2));
BeforeSelAcc = diag(conf_mat1);
BeforeConf   = conf_mat;

%% ѡ���svm
rng(1);
Mdl         = fitcecoc(NewFeature(:,Decision),NewClass,'Learners',t);
CVMdl       = crossval(Mdl);
oofLabel    = kfoldPredict(CVMdl);
conf_mat    = confusionmat(NewClass,oofLabel);
conf_mat1   = bsxfun(@rdivide, conf_mat, sum(conf_mat, 2));
AfterSelAcc = diag(conf_mat1);
AfterConf   = conf_mat;
Repair      = zeros(length(Label)-2,1);                      %�����ʱ�����
FeatureNum  = [length(Decision);sum(Decision);Repair];  %ѡ������ռ��
ConfTable   = table(Label,BeforeConf,AfterConf,BeforeSelAcc,AfterSelAcc,FeatureNum);

