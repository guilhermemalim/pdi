clear all, close all, clc;

% Projeto 1 - PDI
% Guilherme Matheus - 21950880
% José Marcos       - 21953043 
% Vinícius Patrício - 21951799

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
I = imread('pontos.png');
J = zeros(size(I));

[x, y] = size(I);

FIFO_x = zeros(x*y, 1);
FIFO_y = zeros(x*y, 1);
fifo_index = 1;

L = 1;

for i = 1:x
    for j = 1:y
        if I(i, j) == 255 && J(i, j) == 0
            % Adicionar o pixel no FIFO
            FIFO_x(fifo_index) = i;
            FIFO_y(fifo_index) = j;
            fifo_index = fifo_index + 1;
            
            while fifo_index > 1
                % Remover o pixel do FIFO
                fifo_index = fifo_index - 1;
                px = FIFO_x(fifo_index);
                py = FIFO_y(fifo_index);
                FIFO_x(fifo_index) = 0;
                FIFO_y(fifo_index) = 0;
                
                % verificar os elementos vizinhos de p
                if py < y && I(px, py + 1) == 255 && J(px, py + 1) == 0
                    J(px, py + 1) = L;
                    
                    % Adicionar o pixel no FIFO
                    FIFO_x(fifo_index) = px;
                    FIFO_y(fifo_index) = py + 1;
                    fifo_index = fifo_index + 1;
                end
                
                if px < x && py < y && I(px + 1, py + 1) == 255 && J(px + 1, py + 1) == 0
                    J(px + 1, py + 1) = L;
                    
                    % Adicionar o pixel no FIFO
                    FIFO_x(fifo_index) = px + 1;
                    FIFO_y(fifo_index) = py + 1;
                    fifo_index = fifo_index + 1;
                end
                
                if px < x && I(px + 1, py) == 255 && J(px + 1, py) == 0
                    J(px + 1, py) = L;
                    
                    % Adicionar o pixel no FIFO
                    FIFO_x(fifo_index) = px + 1;
                    FIFO_y(fifo_index) = py;
                    fifo_index = fifo_index + 1;
                end
                
                if px < x && py > 1 && I(px + 1, py - 1) == 255 && J(px + 1, py - 1) == 0
                    J(px + 1, py - 1) = L;
                    
                    % Adicionar o pixel no FIFO
                    FIFO_x(fifo_index) = px + 1;
                    FIFO_y(fifo_index) = py - 1;
                    fifo_index = fifo_index + 1;
                end
                
                if py > 1 && I(px, py - 1) == 255 && J(px, py - 1) == 0
                    J(px, py - 1) = L;
                    
                    % Adicionar o pixel no FIFO
                    FIFO_x(fifo_index) = px;
                    FIFO_y(fifo_index) = py - 1;
                    fifo_index = fifo_index + 1;
                end
                
                if px > 1 && py > 1 && I(px - 1, py - 1) == 255 && J(px - 1, py - 1) == 0
                    J(px - 1, py - 1) = L;
                    
                    % Adicionar o pixel no FIFO
                    FIFO_x(fifo_index) = px - 1;
                    FIFO_y(fifo_index) = py - 1;
                    fifo_index = fifo_index + 1;
                end
                
                if px > 1 && I(px - 1, py) == 255  && J(px - 1, py) == 0
                    J(px - 1, py) = L;
                    
                    % Adicionar o pixel no FIFO
                    FIFO_x(fifo_index) = px - 1;
                    FIFO_y(fifo_index) = py;
                    fifo_index = fifo_index + 1;
                end
                
                if px > 1 && py < y && I(px - 1, py + 1) == 255 && J(px - 1, py + 1) == 0
                    J(px - 1, py + 1) = L;
                    
                    % Adicionar o pixel no FIFO
                    FIFO_x(fifo_index) = px - 1;
                    FIFO_y(fifo_index) = py + 1;
                    fifo_index = fifo_index + 1;
                end
            end
            
            L = L + 1;
        end
    end    
end

% Colorindo a imagem

resultado = zeros(x, y, 3);
for i = 1:x
    for j = 1:y
        if J(i,j) == 1
            resultado(i,j,1) = 1;
        elseif J(i,j) == 2
            resultado(i,j,2) = 1;
        end
    end
end

n = 2;
m = 1;

subplot(m, n, 1), imshow(I), title('imagem original');
subplot(m, n, 2), imshow(resultado), title('imagem separada por regiões conectadas');

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

img = imread('gold.tiff');

pixel_50_porcento = 255*50/100;
pixel_25_porcento = 255*25/100;

img_result1 = imadd(img,pixel_50_porcento);
img_result2 = imsubtract(img,pixel_25_porcento);

subplot(1,3,1), imshow(img), title('Entrada');
subplot(1,3,2), imshow(img_result1),title('Incremento de 50% de brilho');
subplot(1,3,3), imshow(img_result2),title('Reducao de 25% de brilho');


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

img = imread('mandrill.tiff');
img_resize = imresize(img, 0.5);

subplot(1, 2, 1), imshow(img), title('Entrada');
subplot(1, 2, 2), imshow(img_resize), title('Saida');
size(img)
size(img_resize)


%% Questão 11

img = imread('peppers.tiff');
img_gray = rgb2gray(img);
[len,larg] = size(img_gray);
mascara = uint8(zeros(len,larg));

mascara(250:712,250:712) = 1;
mascara(690:712,:) = 0;
mascara(:,620:712) = 0;
img_resul = immultiply(img_gray,mascara);
mascara = mascara*255;
n = 3;
m = 1;

subplot(m, n, 1), imshow(img_gray), title('Imagem Original');
subplot(m, n, 2), imshow(mascara), title('Mascara');
subplot(m, n, 3), imshow(img_resul), title('Imagem isolada');

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

% I(:, :, 1)
% I(:, :, 2)
% I(:, :, 3)

