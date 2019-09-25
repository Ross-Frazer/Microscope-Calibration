
mesh_scale = 39.3700787; %bars per mm

data = imread('Calibration Mesh 3.bmp');
[m,n]=size(data);
res_text=['Image resolution is: ', num2str(m),'x',num2str(n)];
disp(res_text)
plainbars = data<25;
f1=figure;
image(data);
f2=figure;
image(plainbars);

xcount = xbarcount(n/2, plainbars);
ycount = ybarcount(m/2, plainbars);
barppx = xcount/n;
barppy = ycount/m;
modifierx = barppx/mesh_scale;
modifiery = barppy/mesh_scale;

ansx = num2str(modifierx);
ansy = num2str(modifiery);
fin_text=['This image has a scaling of ', num2str(modifierx), ' mm per pixel in the x-direction and ', num2str(modifiery), ' mm per pixel in the y-direction.'];
disp(fin_text)


        


    
