[filename,filepath]=uigetfile({'*.*'},'Select and image');
z = imread([filepath filename]);
Quantization(rgb2gray(z),8);