function white_border(gca)
%--------------------------------------------------------------------------
% Description:
% 	去白边
%--------------------------------------------------------------------------
%
% Version 2016b
% Implemented by: Liyu Yang
% Contact Info  : yangliyuokn@sina.cn
ax = gca;outerpos = ax.OuterPosition;ti = ax.TightInset;
left = outerpos(1) + ti(1);bottom = outerpos(2) + ti(2);
ax_width = outerpos(3) - ti(1) - ti(3);
ax_height = outerpos(4) - ti(2) - ti(4);
ax.Position = [left bottom ax_width ax_height];
end

