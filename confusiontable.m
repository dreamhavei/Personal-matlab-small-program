function confusiontable(ConfusionMat)
%=========================================================================%
%                        根据confusionmat绘制table表                      %
%=========================================================================%
% Description:
%    根据类标签，统计类的数量和占比并绘图
%-------------------------------------------------------------------------
% 输入： 
%      Y         类
%      PredictY  预测的类
% 输出：
% 		

%% 生成类信息 cell型数据 第一行类ID第二行类数第三行类占比?
conf_mat  = confusionmat(Y,oofLabel);
[ConfRow,~] = size(conf_mat);
conf_mat1 = bsxfun(@rdivide, conf_mat, sum(conf_mat, 2));
Accuracy  = diag(conf_mat);
tab       = tabulate(categorical(Y));     %类别占比
Class     = tab(:,1);

sz = [ConfRow+1 ConfROW+2];
varTypes = cell(1,ConfRow+1);
varTypes = {'string'}
for ia = 2:ConfRow+1
	varTypes{1,ia} = {'double'};
end

T1 = table('Size',sz,'VariableTypes',varTypes)


end

