clear all, close all, clc;

% Projeto 1 - PDI
% Guilherme Matheus - 21950880
% José Marcos       - 21953043 
% Vinícius Patrício - 2195

%% Questão 1

I = imread('lena_cor.bmp');
J = rgb2gray(I);

n = 2;
m = 1;

subplot(m, n, 1), imshow(I);
subplot(m, n, 2), imshow(J);

%% Questão 2
I = imread('lena_gray.bmp');

levels = multithresh(I, 7);
valuesMax = [levels max(I(:))]
I7 = imquantize(I, levels, valuesMax);

levels = multithresh(I, 6);
valuesMax = [levels max(I(:))]
I6 = imquantize(I, levels, valuesMax);

levels = multithresh(I, 5);
valuesMax = [levels max(I(:))]
I5 = imquantize(I, levels, valuesMax);

levels = multithresh(I, 4);
valuesMax = [levels max(I(:))]
I4 = imquantize(I, levels, valuesMax);

levels = multithresh(I, 3);
valuesMax = [levels max(I(:))]
I3 = imquantize(I, levels, valuesMax);

levels = multithresh(I, 2);
valuesMax = [levels max(I(:))]
I2 = imquantize(I, levels, valuesMax);

levels = multithresh(I, 1);
valuesMax = [levels max(I(:))]
I1 = imquantize(I, levels, valuesMax);

    
n = 4;
m = 2;

subplot(m, n, 1), imshow(I);

subplot(m, n, 2), imshow(I7);
subplot(m, n, 3), imshow(I6);
subplot(m, n, 4), imshow(I5);


subplot(m, n, 5), imshow(I4);
subplot(m, n, 6), imshow(I3);
subplot(m, n, 7), imshow(I2);
subplot(m, n, 8), imshow(I1);

%%  Questão 3
% TODO
I = imread('pontos.png');
J = rgb2gray(I);

n = 2;
m = 1;

subplot(m, n, 1), imshow(I);
subplot(m, n, 2), imshow(J);

%% Questão 4
I = imread('forma1.png');
J = imread('forma2.png');

IJ1 = bitand(I, J);
IJ2 = bitor(I, J);
IJ3 = bitxor(I, J);
IJ4 = ~I;
IJ5 = ~J;

n = 4;
m = 2;

subplot(m, n, 1), imshow(I);
subplot(m, n, 2), imshow(J);

subplot(m, n, 3), imshow(IJ1);
subplot(m, n, 4), imshow(IJ2);
subplot(m, n, 5), imshow(IJ3);
subplot(m, n, 6), imshow(IJ4);
subplot(m, n, 7), imshow(IJ5);

%% Questão 5
% TODO
I = imread('pontos.png');
J = rgb2gray(I);

n = 2;
m = 1;

subplot(m, n, 1), imshow(I);
subplot(m, n, 2), imshow(J);

%% Questão 6
% TODO - aplicar o processo para a imagem RDB - canoe.tif
I = imread('barb.tiff');
p = 120; % valor a ser adicionado

% imadd já faz o truncamento
I_trunc = imadd(I, p);

% normalização
I_temp = uint16(I) + uint16(p);
fmax = max(I_temp(:));
fmin = min(I_temp(:));

I_norm = uint8(255.0*double((I_temp-fmin))/double((fmax-fmin)));

% segunda imagem
[J, cmap] = imread('canoe.tif');
RGB = ind2rgb(J,cmap);

p = p/256;


% imadd já faz o truncamento
RGB_trunc = zeros(size(RGB));
RGB_trunc(:,:, 1) = imadd(RGB(:,:,1), p);
RGB_trunc(:,:, 2) = imadd(RGB(:,:,2), p);
RGB_trunc(:,:, 3) = imadd(RGB(:,:,3), p);

% normalização
RGB_temp = zeros(size(RGB));
RGB_temp(:,:, 1) = double(RGB(:,:,1)) + p;
RGB_temp(:,:, 2) = double(RGB(:,:,2)) + p;
RGB_temp(:,:, 3) = double(RGB(:,:,3)) + p;

fmax = zeros(1, 3);
fmin = zeros(1, 3);

R_temp = RGB_temp(:, :, 1);
G_temp = RGB_temp(:, :, 2);
B_temp = RGB_temp(:, :, 3);

fmax(1) = max(R_temp(:));
fmin(1) = min(R_temp(:));

fmax(2) = max(G_temp(:));
fmin(2) = min(G_temp(:));

fmax(3) = max(B_temp(:));
fmin(3) = min(B_temp(:));

RGB_norm = zeros(size(RGB));
RGB_norm(:,:, 1) = double((R_temp-fmin(1)))/double((fmax(1)-fmin(1)));
RGB_norm(:,:, 2) = double((G_temp-fmin(2)))/double((fmax(2)-fmin(2)));
RGB_norm(:,:, 3) = double((B_temp-fmin(3)))/double((fmax(3)-fmin(3)));


n = 3;
m = 2;

subplot(m, n, 1), imshow(I);
subplot(m, n, 2), imshow(I_norm);
subplot(m, n, 3), imshow(I_trunc);

subplot(m, n, 4), imshow(RGB);
subplot(m, n, 5), imshow(RGB_norm);
subplot(m, n, 6), imshow(RGB_trunc);

%% Questão 7
% TODO - aplicar o processo para a imagem RDB - canoe.tif
I = imread('circuit.tif');
p = 120; % valor a ser subtraído

% imsubtract já faz o truncamento
I_trunc = imsubtract(I, p);

% normalização
I_temp = uint16(I) - uint16(p);
fmax = max(I_temp(:));
fmin = min(I_temp(:));

I_norm = uint8(255.0*double((I_temp-fmin))/double((fmax-fmin)));

% segunda imagem
[J, cmap] = imread('forest.tif');
RGB = ind2rgb(J,cmap);

p = p/256;


% imadd já faz o truncamento
RGB_trunc = zeros(size(RGB));
RGB_trunc(:,:, 1) = imsubtract(RGB(:,:,1), p);
RGB_trunc(:,:, 2) = imsubtract(RGB(:,:,2), p);
RGB_trunc(:,:, 3) = imsubtract(RGB(:,:,3), p);

% normalização
RGB_temp = zeros(size(RGB));
RGB_temp(:,:, 1) = double(RGB(:,:,1)) - p;
RGB_temp(:,:, 2) = double(RGB(:,:,2)) - p;
RGB_temp(:,:, 3) = double(RGB(:,:,3)) - p;

fmax = zeros(1, 3);
fmin = zeros(1, 3);

R_temp = RGB_temp(:, :, 1);
G_temp = RGB_temp(:, :, 2);
B_temp = RGB_temp(:, :, 3);

fmax(1) = max(R_temp(:));
fmin(1) = min(R_temp(:));

fmax(2) = max(G_temp(:));
fmin(2) = min(G_temp(:));

fmax(3) = max(B_temp(:));
fmin(3) = min(B_temp(:));

RGB_norm = zeros(size(RGB));
RGB_norm(:,:, 1) = double((R_temp-fmin(1)))/double((fmax(1)-fmin(1)));
RGB_norm(:,:, 2) = double((G_temp-fmin(2)))/double((fmax(2)-fmin(2)));
RGB_norm(:,:, 3) = double((B_temp-fmin(3)))/double((fmax(3)-fmin(3)));

n = 3;
m = 2;

subplot(m, n, 1), imshow(I);
subplot(m, n, 2), imshow(I_norm);
subplot(m, n, 3), imshow(I_trunc);

subplot(m, n, 4), imshow(RGB);
subplot(m, n, 5), imshow(RGB_norm);
subplot(m, n, 6), imshow(RGB_trunc);

%% Questão 8

%% Questão 9
I = imread('Mobile20.tiff');
J = imread('Mobile21.tiff');

K = bitxor(I, J);
    

n = 3;
m = 1;

subplot(m, n, 1), imshow(I);
subplot(m, n, 2), imshow(J);
subplot(m, n, 3), imshow(K);

%% Questão 10

%% Questão 11

%% Questão 12

% para cada camada da matriz, uma distância diferente
% camada 1 -> distância euclidiana
% camada 2 -> distância city block
% camada 3 -> distância chessboard

x_max = 101;
y_max = 101;
I = zeros(x_max, y_max, 3);

x_center = (x_max + 1) / 2.0;
y_center = (y_max + 1) / 2.0;  

% Distância euclidiana
for x = 1:x_max
   for y = 1:x_max
       I(x, y, 1) = sqrt((x - x_center)^2 + (y - y_center)^2);
   end
end
    
% Distância city-block
for x = 1:x_max
   for y = 1:x_max
       I(x, y, 2) = abs(x - x_center) + abs(y - y_center);
   end
end
    
% Distância chessboard
for x = 1:x_max
   for y = 1:x_max
       I(x, y, 3) = max(abs(x - x_center), abs(y - y_center));
   end
end


