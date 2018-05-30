pkg load image
a=imread('sunfl.jpg');
b=rgb2gray(a);
x=rows(b);
y=columns(b);


for i=1:x
  for j=1:y
    for k=1:8
      c(i,j,k) = bitget(b(i,j),k);
    end
  end
end


for i=1:8
  d=255.*c(:,:,i);
  subplot(2,4,i);
  imshow(d);
end

   
