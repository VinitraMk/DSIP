img=imread('babyincradle.png');
np=size(img,1)*size(img,2);

him=uint8(zeros(size(img,1),size(img,2)));
freq=zeros(256,1);
probf=zeros(256,1);
probc=zeros(256,1);
cum=zeros(256,1);
output=zeros(256,1);

for i=1:size(img,1)
    for j=1:size(img,2)
        value=img(i,j);
        freq(value+1)=freq(value+1)+1;
        %probf(value+1)=freq(value+1)/np;
    end
end

sum=0;
nb=255;

for i=1:size(probf)
   sum=sum+freq(i);
   cum(i)=sum;
   probc(i)=cum(i)/np;
   output(i)=round(probc(i)*nb);
end

for i=1:size(img,1)
    for j=1:size(img,2)
        him(i,j)=output(img(i,j)+1);
    end
end

freq1=zeros(256,1);

for i=1:size(him,1)
    for j=1:size(him,2)
        value=him(i,j);
        freq1(value+1)=freq1(value+1)+1;
    end
end

figure()
subplot(1,2,1)
imshow(img);
title('Original Image');
subplot(1,2,2)
imshow(him);
title('Histogram equalization');

figure()
subplot(2,1,1);
stem(1:256,freq);
subplot(2,1,2);
stem(1:256,freq1);