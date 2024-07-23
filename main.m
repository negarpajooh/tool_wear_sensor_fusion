clc;
clear;
close all;
format long
%% Plot Parameters
width = 8;     % Width in inches
height = 4;    % Height in inches
alw = 0.75;    % AxesLineWidth
fsz =20 ;      % Fontsize
lw = 1;      % LineWidth
msz = 8;       % MarkerSize
%% optimal ann
Data = xlsread('table4.xlsx');
X0= Data(:,1:4);
Y0= Data(:,5);
Z0=1:size(X0,1);
%%
XN = X0;
YN = Y0;
MinX = min(X0);
MaxX = max(X0);
%
MinY = min(Y0);
MaxY = max(Y0);
%% normalize
for ii = 1:size(X0,2)
    XN(:,ii) = Normalize_Fcn(X0(:,ii),MinX(ii),MaxX(ii));
end
X=[XN,YN];
%% Apply k-Means (Lloyd's Algorithm)
[IDX C_kmeans]=kmeans(X,3);
%%   xs1=Normalize_Fcn(X(IDX==1,1),MinX(1),MaxX(1));
figure
pos = get(gcf, 'Position');
set(gcf, 'Position', [pos(1) pos(2) width*150, height*200]); %<- Set size
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties

xs1=Normalize_Fcn(X(IDX==1,1),MinX(1),MaxX(1));
cs1=Normalize_Fcn(C_kmeans(1,1),MinX(1),MaxX(1));
%
xs2=Normalize_Fcn(X(IDX==2,1),MinX(1),MaxX(1));
cs2=Normalize_Fcn(C_kmeans(2,1),MinX(1),MaxX(1));
%
xs3=Normalize_Fcn(X(IDX==3,1),MinX(1),MaxX(1));
cs3=Normalize_Fcn(C_kmeans(3,1),MinX(1),MaxX(1));
%
subplot(221);
plot(xs1,X(IDX==1,5),'rs');
hold on;
plot(cs1,C_kmeans(1,5),'s','MarkerEdgeColor','r','MarkerFaceColor','r');
hold on;
plot(xs2,X(IDX==2,5),'bo');
hold on;
plot(cs2,C_kmeans(2,5),'o','MarkerEdgeColor','b','MarkerFaceColor','b');
hold on;
plot(xs3,X(IDX==3,5),'kd');
hold on;
plot(cs3,C_kmeans(3,5),'d','MarkerEdgeColor','k','MarkerFaceColor','k');
xlabel('Surface Texture')
ylabel('Flank Wear (mm)')
title('Sensor 1')
grid minor
legend('low','low center','medium','medium center','high','high center','NonClustering','location','northwest')
%

xs4=Normalize_Fcn(X(IDX==1,2),MinX(1),MaxX(1));
cs4=Normalize_Fcn(C_kmeans(1,2),MinX(1),MaxX(1));
%
xs5=Normalize_Fcn(X(IDX==2,2),MinX(1),MaxX(1));
cs5=Normalize_Fcn(C_kmeans(2,2),MinX(1),MaxX(1));
%
xs6=Normalize_Fcn(X(IDX==3,2),MinX(1),MaxX(1));
cs6=Normalize_Fcn(C_kmeans(3,2),MinX(1),MaxX(1));
%
subplot(222)
plot(xs4,X(IDX==1,5),'rs');
hold on;
plot(cs4,C_kmeans(1,5),'s','MarkerEdgeColor','r','MarkerFaceColor','r');
hold on;
plot(xs5,X(IDX==2,5),'bo');
hold on;
plot(cs5,C_kmeans(2,5),'o','MarkerEdgeColor','b','MarkerFaceColor','b');
hold on;
plot(xs6,X(IDX==3,5),'kd');
hold on;
plot(cs6,C_kmeans(3,5),'d','MarkerEdgeColor','k','MarkerFaceColor','k');
xlabel('Motor Current')
ylabel('Flank Wear (mm)')
title('Sensor 2')
grid minor
legend('low','low center','medium','medium center','high','high center','NonClustering','location','northwest')
%

xs7=Normalize_Fcn(X(IDX==1,3),MinX(1),MaxX(1));
cs7=Normalize_Fcn(C_kmeans(1,3),MinX(1),MaxX(1));
%
xs8=Normalize_Fcn(X(IDX==2,3),MinX(1),MaxX(1));
cs8=Normalize_Fcn(C_kmeans(2,3),MinX(1),MaxX(1));
%
xs9=Normalize_Fcn(X(IDX==3,3),MinX(1),MaxX(1));
cs9=Normalize_Fcn(C_kmeans(3,3),MinX(1),MaxX(1));
%
subplot(223)
plot(xs7,X(IDX==1,5),'rs');
hold on;
plot(cs7,C_kmeans(1,5),'s','MarkerEdgeColor','r','MarkerFaceColor','r');
hold on;
plot(xs8,X(IDX==2,5),'bo');
hold on;
plot(cs8,C_kmeans(2,5),'o','MarkerEdgeColor','b','MarkerFaceColor','b');
hold on;
plot(xs9,X(IDX==3,5),'kd');
hold on;
plot(cs9,C_kmeans(3,5),'d','MarkerEdgeColor','k','MarkerFaceColor','k');
xlabel('Bending Strain')
ylabel('Flank Wear (mm)')
title('Sensor 3')
grid minor
legend('low','low center','medium','medium center','high','high center','NonClustering','location','northwest')
%
xs10=Normalize_Fcn(X(IDX==1,4),MinX(1),MaxX(1));
cs10=Normalize_Fcn(C_kmeans(1,4),MinX(1),MaxX(1));
%
xs11=Normalize_Fcn(X(IDX==2,4),MinX(1),MaxX(1));
cs11=Normalize_Fcn(C_kmeans(2,4),MinX(1),MaxX(1));
%
xs12=Normalize_Fcn(X(IDX==3,4),MinX(1),MaxX(1));
cs12=Normalize_Fcn(C_kmeans(3,4),MinX(1),MaxX(1));
%
subplot(224)
plot(xs10,X(IDX==1,5),'rs');
hold on;
plot(cs10,C_kmeans(1,5),'s','MarkerEdgeColor','r','MarkerFaceColor','r');
hold on;
plot(xs11,X(IDX==2,5),'bo');
hold on;
plot(cs11,C_kmeans(2,5),'o','MarkerEdgeColor','b','MarkerFaceColor','b');
hold on;
plot(xs12,X(IDX==3,5),'kd');
hold on;
plot(cs12,C_kmeans(3,5),'d','MarkerEdgeColor','k','MarkerFaceColor','k');
xlabel('Shannon Vibration')
ylabel('Flank Wear (mm)')
title('Sensor 4')
grid minor
legend('low','low center','medium','medium center','high','high center','NonClustering','location','northwest')
%%
% figure
% wholeclustering=[X(IDX==1,5);X(IDX==2,5);X(IDX==3,5)];
% IDX1=X(IDX==1,5)';
% IDX2=X(IDX==2,5)';
% IDX3=X(IDX==3,5)';
% n1=1:numel(X(IDX==1,5));
% n2=n1(end)+1:n1(end)+numel(X(IDX==2,5));
% n3=n2(end)+1:n2(end)+numel(X(IDX==3,5));
% plot(n1,IDX1,'rs');
% hold on
% plot(n2,IDX2,'bo');
% hold on
% plot(n3,IDX3,'kd');
% xlabel('Part Number')
% ylabel('Value (mm)')
% title('Flank Wear Clustering')
% grid minor
% legend('low','medium','high')
