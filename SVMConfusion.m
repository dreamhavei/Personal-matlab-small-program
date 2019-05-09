function [ConfTable] = SVMConfusion(NewFeature,NewClass,Decision,Label)

%=========================================================================%
%                           SVM10折交叉验证得到混淆矩阵                    %
%=========================================================================%
% Description:
%    采用标准的SVM分类器对所有特征和特征选择后的特征分类比较分类器的性能
%-------------------------------------------------------------------------
% 输入： 
%       NewClass         类
%       NewFeature       特征
%       Decision         最后一次的决策向量
%       Label            类
% 输出：
% 		ConfTable        混淆矩阵表
rng(1); % For reproducibility  
t            = templateSVM('Standardize',1);                 %创建支持向量机模板,对预测值进行标准化
Mdl          = fitcecoc(NewFeature,NewClass,'Learners',t);
CVMdl        = crossval(Mdl);
oofLabel     = kfoldPredict(CVMdl);                          %10预测标签
conf_mat     = confusionmat(NewClass,oofLabel);
conf_mat1    = bsxfun(@rdivide, conf_mat, sum(conf_mat, 2));
BeforeSelAcc = diag(conf_mat1);
BeforeConf   = conf_mat;

%% 选择后svm
rng(1);
Mdl         = fitcecoc(NewFeature(:,Decision),NewClass,'Learners',t);
CVMdl       = crossval(Mdl);
oofLabel    = kfoldPredict(CVMdl);
conf_mat    = confusionmat(NewClass,oofLabel);
conf_mat1   = bsxfun(@rdivide, conf_mat, sum(conf_mat, 2));
AfterSelAcc = diag(conf_mat1);
AfterConf   = conf_mat;
Repair      = zeros(length(Label)-2,1);                      %当类多时用于填补
FeatureNum  = [length(Decision);sum(Decision);Repair];  %选择特征占比
ConfTable   = table(Label,BeforeConf,AfterConf,BeforeSelAcc,AfterSelAcc,FeatureNum);

