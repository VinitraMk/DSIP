pkg load image;
pkg load signal;

%image negative
a=imread('sunfl.jpg');
b=rgb2gray(a);
b=uint8(b);
[r,c]=size(b);

t1=input('Enter t1: ');
t2=input('Enter t2: ');
e=b;
for i=1:r
  for j=1:c
    if(b(i,j)<=t2 && b(i,j)>=t1)
      d(i,j)=255;
      e(i,j)=255;
    else
      d(i,j)=0;
    end
  end
end

subplot(2,2,1);
imshow(b);
title('original image');

subplot(2,2,3);
imshow(d);
title('GLS without bg');

subplot(2,2,4);
imshow(e);
title('GLS With Bg');
