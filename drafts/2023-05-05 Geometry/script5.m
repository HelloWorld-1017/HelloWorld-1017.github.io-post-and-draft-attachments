clc,clear,close all

rng(17)
% Create a symmetric matrix
A = [2,-2,0;-2,1,-2;0,-2,0];

% Find eigenvalues and corresponding eigenvectors
[u,lambda] = eig(A);
u_1 = u(:,1);
u_2 = u(:,2);
u_3 = u(:,3);

% Create a random vector and applying spectral decomposition
x = rand(3,1);
proj_1 = dot(u_1,x)/dot(u_1,u_1)*u_1;
proj_2 = dot(u_2,x)/dot(u_2,u_2)*u_2;
proj_3 = dot(u_3,x)/dot(u_3,u_3)*u_3;
Ax = lambda(1,1)*proj_1+lambda(2,2)*proj_2+lambda(3,3)*proj_3;

%% Figure 1
figure("Position",[602.33,200,856.67,634])
ax = axes("DataAspectRatio",[1,1,1]);
view(ax,[-11.92,10.93])
legend("Interpreter","latex","FontSize",15,"Position",[0.609521115582204,0.194156154239967,0.336228281184852,0.198738164706185])
markerSize = 20;
lineWidth = 1.5;
fontSize = 17;
hold(gca,"on"),box(gca,"on"),grid(gca,"on")

% Plot eigenvectors
plot3([0,u_1(1)],[0,u_1(2)],[0,u_1(3)], ...
    "Color","b","LineWidth",lineWidth,"Marker",".","MarkerSize",markerSize, ...
    "DisplayName","Eigenvectors")
plot3([0,u_2(1)],[0,u_2(2)],[0,u_2(3)], ...
    "Color","b","LineWidth",lineWidth,"Marker",".","MarkerSize",markerSize, ...
    "HandleVisibility","off")
plot3([0,u_3(1)],[0,u_3(2)],[0,u_3(3)], ...
    "Color","b","LineWidth",lineWidth,"Marker",".","MarkerSize",markerSize, ...
    "HandleVisibility","off")
text(-0.28,-0.70,-0.64,"$u_1$","FontSize",fontSize,"Color","b","Interpreter","latex")
text(0.69,0.31,-0.67,"$u_2$","FontSize",fontSize,"Color","b","Interpreter","latex")
text(-0.66,0.65,-0.39,"$u_3$","FontSize",fontSize,"Color","b","Interpreter","latex")

% Plot the random vector, x
plot3([0,x(1)],[0,x(2)],[0,x(3)], ...
    "Color",[0,0.545,0],"LineWidth",lineWidth,"Marker",".","MarkerSize",markerSize, ...
    "DisplayName","A random vector")
text(0.32,0.51,0.20,"$x$","FontSize",fontSize,"Color",[0,0.545,0],"Interpreter","latex")

% Plot Ax
plot3([0,Ax(1)],[0,Ax(2)],[0,Ax(3)], ...
    "Color","k","LineWidth",lineWidth,"Marker",".","MarkerSize",markerSize, ...
    "DisplayName","$A$ works on $x$")
text(-0.47,-0.46,-1.10,"$Ax$","FontSize",fontSize,"Color","k","Interpreter","latex")

% Plot vector projection (x on u_i)
plot3([0,proj_1(1)],[0,proj_1(2)],[0,proj_1(3)], ...
    "Color","r","LineWidth",lineWidth,"Marker",".","MarkerSize",markerSize, ...
    "DisplayName","Vector projection ($x$ on $u_i$)")
plot3([0,proj_2(1)],[0,proj_2(2)],[0,proj_2(3)], ...
    "Color","r","LineWidth",lineWidth,"Marker",".","MarkerSize",markerSize, ...
    "HandleVisibility","off")
plot3([0,proj_3(1)],[0,proj_3(2)],[0,proj_3(3)], ...
    "Color","r","LineWidth",lineWidth,"Marker",".","MarkerSize",markerSize, ...
    "HandleVisibility","off")
text(-0.33188142784709,0.068857451234152,0.452217272205683,"$Proj_{u_1}(x)$", ...
    "FontSize",fontSize,"Color","r","Interpreter","latex")
text(0.164537846716412,-0.142149742645778,-0.102476304632832,"$Proj_{u_2}(x)$", ...
    "FontSize",fontSize,"Color","r","Interpreter","latex")
text(-0.44,0.43,-0.03,"$Proj_{u_3}(x)$", ...
    "FontSize",fontSize,"Color","r","Interpreter","latex")

% Plot vector rejection (x on u_i)
plot3([x(1),proj_1(1)],[x(2),proj_1(2)],[x(3),proj_1(3)], ...
    "Color",[0.5,0.5,0.5],"LineWidth",lineWidth,"LineStyle","--", ...
    "DisplayName","Vector rejection ($x$ on $u_i$)")
plot3([x(1),proj_2(1)],[x(2),proj_2(2)],[x(3),proj_2(3)], ...
    "Color",[0.5,0.5,0.5],"LineWidth",lineWidth,"LineStyle","--", ...
    "HandleVisibility","off")
plot3([x(1),proj_3(1)],[x(2),proj_3(2)],[x(3),proj_3(3)], ...
    "Color",[0.5,0.5,0.5],"LineWidth",lineWidth,"LineStyle","--", ...
    "HandleVisibility","off")

% Export graph
exportgraphics(gcf,"pic-1.jpg","Resolution",600)

%% Figure 2
figure("Position",[602.33,200,856.67,634])
ax = axes("DataAspectRatio",[1,1,1]);
view(ax,[-11.92,10.93])
legend("Interpreter","latex","FontSize",15,"Position",[0.620529088363842,0.195733441306213,0.353731233425858,0.198738164706185])
markerSize = 20;
lineWidth = 1.5;
fontSize = 17;
hold(gca,"on"),box(gca,"on"),grid(gca,"on")

% Plot eigenvectors
plot3([0,u_1(1)],[0,u_1(2)],[0,u_1(3)], ...
    "Color","b","LineWidth",lineWidth,"Marker",".","MarkerSize",markerSize, ...
    "DisplayName","Eigenvectors")
plot3([0,u_2(1)],[0,u_2(2)],[0,u_2(3)], ...
    "Color","b","LineWidth",lineWidth,"Marker",".","MarkerSize",markerSize, ...
    "HandleVisibility","off")
plot3([0,u_3(1)],[0,u_3(2)],[0,u_3(3)], ...
    "Color","b","LineWidth",lineWidth,"Marker",".","MarkerSize",markerSize, ...
    "HandleVisibility","off")
text(-0.28,-0.70,-0.64,"$u_1$","FontSize",fontSize,"Color","b","Interpreter","latex")
text(0.69,0.31,-0.67,"$u_2$","FontSize",fontSize,"Color","b","Interpreter","latex")
text(-0.66,0.65,-0.39,"$u_3$","FontSize",fontSize,"Color","b","Interpreter","latex")

% Plot the random vector, x
plot3([0,x(1)],[0,x(2)],[0,x(3)], ...
    "Color",[0,0.545,0],"LineWidth",lineWidth,"Marker",".","MarkerSize",markerSize, ...
    "DisplayName","A random vector")
text(0.32,0.51,0.20,"$x$","FontSize",fontSize,"Color",[0,0.545,0],"Interpreter","latex")

% Plot Ax
plot3([0,Ax(1)],[0,Ax(2)],[0,Ax(3)], ...
    "Color","k","LineWidth",lineWidth,"Marker",".","MarkerSize",markerSize, ...
    "DisplayName","$A$ works on $x$")
text(-0.47,-0.46,-1.10,"$Ax$","FontSize",fontSize,"Color","k","Interpreter","latex")

% Plot vector projection (Ax on u_i)
plot3(lambda(1,1)*[0,proj_1(1)],lambda(1,1)*[0,proj_1(2)],lambda(1,1)*[0,proj_1(3)], ...
    "Color","r","LineWidth",lineWidth,"Marker",".","MarkerSize",markerSize, ...
    "DisplayName","Vector projection ($Ax$ on $u_i$)")
plot3(lambda(2,2)*[0,proj_2(1)],lambda(2,2)*[0,proj_2(2)],lambda(2,2)*[0,proj_2(3)], ...
    "Color","r","LineWidth",lineWidth,"Marker",".","MarkerSize",markerSize, ...
    "HandleVisibility","off")
plot3(lambda(3,3)*[0,proj_3(1)],lambda(3,3)*[0,proj_3(2)],lambda(3,3)*[0,proj_3(3)], ...
    "Color","r","LineWidth",lineWidth,"Marker",".","MarkerSize",markerSize, ...
    "HandleVisibility","off")
text(-0.218998853914199,-0.218068949398294,-0.880847442870728,"$\lambda_1Proj_{u_1}(x)$", ...
    "FontSize",fontSize,"Color","r","Interpreter","latex")
text(0.164537846716412,-0.142149742645778,-0.102476304632832,"$\lambda_2Proj_{u_2}(x)$", ...
    "FontSize",fontSize,"Color","r","Interpreter","latex")
text(-0.44,0.43,-0.03,"$\lambda_3Proj_{u_3}(x)$", ...
    "FontSize",fontSize,"Color","r","Interpreter","latex")

% Plot vector rejection (Ax on u_i)
plot3([Ax(1),lambda(1,1)*proj_1(1)],[Ax(2),lambda(1,1)*proj_1(2)],[Ax(3),lambda(1,1)*proj_1(3)], ...
    "Color",[0.5,0.5,0.5],"LineWidth",lineWidth,"LineStyle","--", ...
    "DisplayName","Vector rejection ($Ax$ on $u_i$)")
plot3([Ax(1),lambda(2,2)*proj_2(1)],[Ax(2),lambda(2,2)*proj_2(2)],[Ax(3),lambda(2,2)*proj_2(3)], ...
    "Color",[0.5,0.5,0.5],"LineWidth",lineWidth,"LineStyle","--", ...
    "HandleVisibility","off")
plot3([Ax(1),lambda(3,3)*proj_3(1)],[Ax(2),lambda(3,3)*proj_3(2)],[Ax(3),lambda(3,3)*proj_3(3)], ...
    "Color",[0.5,0.5,0.5],"LineWidth",lineWidth,"LineStyle","--", ...
    "HandleVisibility","off")

% Export graph
exportgraphics(gcf,"pic-2.jpg","Resolution",600)




