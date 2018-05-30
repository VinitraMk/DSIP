pkg load image;
a=imread('sunfl.jpg');
a=rgb2gray(a);
figure();
a=uint8(imresize(a,[256,256]));
subplot(1,3,1);
imshow(a);
title('Original Resized image');
d=zeros(256,256);
omega=((-i)*2*pi/256);
for k=0:255
  for j=0:255
    d(k+1,j+1)=exp(omega*k*j);
  end
end 

ad=double(a);
b=zeros(256,256);
b=(d*ad)*d;
subplot(1,3,2);
imshow(b);
title('DFT'); 
id=zeros(256,256);
omega=(i*2*pi/256);
for k=0:255
  for j=0:255
    id(k+1,j+1)=exp(omega*k*j);
  end
end

%c=zeros(256,256);
c=(id*b)*id;
c=c./(256*256);
f=real(c);
subplot(1,3,3);
imshow(uint8(f));
title('IDFT');




