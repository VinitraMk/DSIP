pkg load image;
pkg load communications;
img=imread('sunfl.jpg');
a=rgb2gray(img);
a=uint8(a);
figure();
subplot(4,1,1);
imshow(a);
title('Original Image');
enc=a;
message='hellokira';

ax=subplot(4,1,2);
text(0.5,0.5,message);
set(ax,'visible','off');
title('Message');

ml=length(message);
ascii=uint8(message);
ascii
binstr=transpose(dec2bin(ascii,8));
binstr=binstr(:);
len=length(binstr);
bn=zeros(len,1);
for i=1:len
  if(binstr(i)=='1')
    bn(i)=1;
  else
    bn(i)=0;
  end
end
row=rows(a);
col=columns(a);
r=72;
c=20;
k=1;
d=0;
for i=r:r+ml-1
  for j=c:c+7
    lsb=bitget(a(i,j),1);
    if(lsb==bn(k))
      enc(i,j)=a(i,j);
    else
      if(lsb==1)
        enc(i,j)=a(i,j)-1;
      else
        enc(i,j)=a(i,j)+1;
      end
    end
    k=k+1;
  end
end

subplot(4,1,3);
imshow(enc);
imwrite(enc,'end.bmp');
z=double(imread('end.bmp'));
title('Encoded image');
decbn=zeros(len,1);
k=1;
for i=r:r+ml-1
  kl=k*8;
  for j=c:c+7
    decbn(kl)=bitget(z(i,j),1);
    kl=kl-1;
  end
  k=k+1;
end
str=[];
for i=1:8:len
  transpose(decbn(i:i+7))
  arr=transpose(decbn(i:i+7));
  bd=bi2de(arr);
  bd
  str=[str bd];
end

ax=subplot(4,1,4);
text(0.5,0.5,char(str));
set(ax,'visible','off');
title('Decoded message');
  
    


        
        
      