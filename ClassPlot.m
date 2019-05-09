function ClassPlot(Y)
%=========================================================================%
%                           ͳ�ƻ������ռ��ͼ                             %
%=========================================================================%
% Description:
%    �������ǩ��ͳ�����������ռ�Ȳ���ͼ
%-------------------------------------------------------------------------
% ���룺 
%       Y         ��
% �����
% 		ͼ

%% ��������Ϣ cell������ ��һ����ID�ڶ���������������ռ��?
tab        = tabulate(categorical(Y));%
[TabRow,~] = size(tab);

%% ������ɫmap
colr       = colormap;
[CorRow,~] = size(colr);
if TabRow  < CorRow
	Color  = colr(round(linspace(1,CorRow,TabRow)),:);
else
	colr   = repmat(colr,ceil(TabRow/CorRow),1);
	CorRow = CorRow*ceil(TabRow/CorRow);
	Color  = colr(round(linspace(1,CorRow,TabRow)),:);
end

%% ��ͼ
figure;
for ia     = 1:TabRow
	p      = fill([ia-0.5 ia+0.5 ia+0.5 ia-0.5],[0 0 tab{ia,3}*0.01 tab{ia,3}*0.01],Color(ia,:),'facealpha',0.5);p.EdgeColor = 'none';hold on;
end

grid on; axis([0,TabRow+1,-0.05,1.05]);
set(gca,'xtick',1:TabRow,'xticklabel',tab(:,1));xlabel('��');ylabel('����');
% yyaxis right;
% ylabel_str = sprintfc('%g',linspace(0,length(Y),10));
% yticks(ylabel_str);
white_border(gca);hold off;
end

