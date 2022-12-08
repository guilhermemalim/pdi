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


