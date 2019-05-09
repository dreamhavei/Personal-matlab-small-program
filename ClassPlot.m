function ClassPlot(Y)
%=========================================================================%
%                           统计绘制类的占比图                             %
%=========================================================================%
% Description:
%    根据类标签，统计类的数量和占比并绘图
%-------------------------------------------------------------------------
% 输入： 
%       Y         类
% 输出：
% 		图

%% 生成类信息 cell型数据 第一行类ID第二行类数第三行类占比?
tab        = tabulate(categorical(Y));%
[TabRow,~] = size(tab);

%% 生成颜色map
colr       = colormap;
[CorRow,~] = size(colr);
if TabRow  < CorRow
	Color  = colr(round(linspace(1,CorRow,TabRow)),:);
else
	colr   = repmat(colr,ceil(TabRow/CorRow),1);
	CorRow = CorRow*ceil(TabRow/CorRow);
	Color  = colr(round(linspace(1,CorRow,TabRow)),:);
end

%% 绘图
figure;
for ia     = 1:TabRow
	p      = fill([ia-0.5 ia+0.5 ia+0.5 ia-0.5],[0 0 tab{ia,3}*0.01 tab{ia,3}*0.01],Color(ia,:),'facealpha',0.5);p.EdgeColor = 'none';hold on;
end

grid on; axis([0,TabRow+1,-0.05,1.05]);
set(gca,'xtick',1:TabRow,'xticklabel',tab(:,1));xlabel('类');ylabel('数量');
% yyaxis right;
% ylabel_str = sprintfc('%g',linspace(0,length(Y),10));
% yticks(ylabel_str);
white_border(gca);hold off;
end

