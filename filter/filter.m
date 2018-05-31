pkg load image;
a=imread('sunfl.jpg');
a=rgb2gray(a);
%imshow(a);
r=size(a,1);
c=size(a,2);
img=zeros(rows(a)+2,columns(a)+2);
outlf=img;
outhf=img;
outmf=img;

for i=2:r+1
  for j=2:c+1
    img(i,j)=a(i-1,j-1);
  end
end
img=uint8(img); 
limg=img;
himg=double(img);
mimg=img;
limg=imnoise(img,'salt and pepper'); 
mimg=imnoise(img,'gaussian'); 
low_filter=[1/9,1/9,1/9;1/9,1/9,1/9;1/9,1/9,1/9];
high_filter=[-1,-1,-1;-1,8,-1;-1,-1,-1];

for i=1:r
  for j=1:c
    n=i+2;
    m=j+2;
    templf=limg(i:n,j:m);
    temphf=himg(i:n,j:m);
    templf=templf.*low_filter;
    temphf=temphf.*high_filter;
    gl=templf(:);
    gh=temphf(:);
    sl=0;
    sh=0;
    for k=1:size(gl,1)
      sl=sl+gl(k);
      sh=sh+gh(k);      
    end
    outlf(i+1,j+1)=sl;
    if(sh<0)
      outhf(i+1,j+1)=0;
    else
      outhf(i+1,j+1)=sh;
    end
      
  end
end

for i=1:r
  for j=1:c
    n=i+2;
    m=j+2;
    med=mimg(i:n,j:m);
    outmf(i+1,j+1)=median(med(:));
  end
end

figure();
subplot(2,3,1);
imshow(img);
title('Original image');
subplot(2,3,2);
imshow(limg);
title('Salt and Pepper noise');
subplot(2,3,3);
imshow(mimg);
title('Guassian noise');
subplot(2,3,4);
imshow(uint8(outhf));
title('High Pass Filter');
subplot(2,3,5);
imshow(uint8(outlf));
title('Low Pass Filter');
subplot(2,3,6);
imshow(uint8(outmf));
title('Median Filter'); 
