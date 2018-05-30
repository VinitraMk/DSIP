pkg load image;
a=imread('sunfl.jpg');
a=rgb2gray(a);
%imshow(a);
r=size(a,1);
c=size(a,2);
img=zeros(rows(a)+2,columns(a)+2);
outsb=img;
outrb=zeros(rows(a),columns(a));
outpr=img;
outlp=img;

for i=2:r+1
  for j=2:c+1
    img(i,j)=a(i-1,j-1);
  end
end

img=uint8(img); 
dimg=double(img);
rbimg=double(a);

soble=[-2,-2,0;-2,0,2;0,2,2];
prewitt=[-2,-1,0;-1,0,1;0,1,2];
laplace=[-1,2,-1;2,-4,2;-1,2,-1];
rob1=[1,0;0,-1];
rob2=[0,1;-1,0];

for i=1:r
  for j=1:c
    n=i+2;
    m=j+2;
    temp=dimg(i:n,j:m);
    tempsb=temp.*soble;
    tempr=temp.*prewitt;
    templp=temp.*laplace;
    sb=tempsb(:);
    pr=tempr(:);
    lp=templp(:);
    slp=0;
    spr=0;
    ssb=0;
    for k=1:size(sb,1)
      slp=slp+lp(k);
      spr=spr+pr(k);
      ssb=ssb+sb(k);    
    end
    outsb(i+1,j+1)=ssb;
    outpr(i+1,j+1)=spr;
    outlp(i+1,j+1)=slp;
    
    if(i<=r-1 && j<=c-1)
      n=i+1;
      m=j+1;
      temp=rbimg(i:n,j:m);
      temprb1=temp.*rob1;
      temprb2=temp.*rob2;
      r1=temprb1(:);
      r2=temprb2(:);
      sr1=0;
      sr2=0;
      for k=1:size(r1,1)
        sr1=sr1+r1(k);
        sr2=sr2+r2(k);
      end
      outrb(i,j)=outrb(i,j)+sr1;
      outrb(i,j+1)=outrb(i,j+1)+sr2;
    end
  end
end



figure();
subplot(1,1,1);
imshow(img);
title('Original image');
figure();
subplot(2,2,1);
imshow(uint8(outsb));
title('Sobel Operator');
subplot(2,2,2);
imshow(uint8(outpr));
title('Prewitt Operator');
subplot(2,2,3);
imshow(uint8(outlp));
title('Laplacian');
subplot(2,2,4);
imshow(uint8(outrb));
title('Robert operator');
