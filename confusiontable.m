function confusiontable(ConfusionMat)
%=========================================================================%
%                        ����confusionmat����table��                      %
%=========================================================================%
% Description:
%    �������ǩ��ͳ�����������ռ�Ȳ���ͼ
%-------------------------------------------------------------------------
% ���룺 
%      Y         ��
%      PredictY  Ԥ�����
% �����
% 		

%% ��������Ϣ cell������ ��һ����ID�ڶ���������������ռ��?
conf_mat  = confusionmat(Y,oofLabel);
[ConfRow,~] = size(conf_mat);
conf_mat1 = bsxfun(@rdivide, conf_mat, sum(conf_mat, 2));
Accuracy  = diag(conf_mat);
tab       = tabulate(categorical(Y));     %���ռ��
Class     = tab(:,1);

sz = [ConfRow+1 ConfROW+2];
varTypes = cell(1,ConfRow+1);
varTypes = {'string'}
for ia = 2:ConfRow+1
	varTypes{1,ia} = {'double'};
end

T1 = table('Size',sz,'VariableTypes',varTypes)


end

