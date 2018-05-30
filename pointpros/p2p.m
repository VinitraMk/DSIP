pkg load image;
pkg load signal;

%image negative
a=imread('sunfl.jpg');
b=rgb2gray(a);
b=uint8(b);
figure();
subplot(1,3,1);
imshow(b);
title('Original');

[r,c]=size(b);
d=255.-b;
subplot(1,3,2);
imshow(d);
title('Negative');

%Threshold
t=input('Enter threshold: ');
for i=1:r
  for j=1:c
    if(b(i,j)>=t)
      d(i,j)=255;
    else
      d(i,j)=0;
    end
  end
end
subplot(1,3,3);
imshow(d);
title('Threshold');