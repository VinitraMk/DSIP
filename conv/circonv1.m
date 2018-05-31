x = input('Enter x: ');
h = input('Enter h: ');
[r,c]=size(x);
[r1,c1]=size(h);
if(c>c1) 
  h=[h,zeros(c-c1)];
end
if (c1>c)  
  x=[x,zeros(c1-c)];
end
[r,n]=size(x);
n
oh = h;
hs = zeros(n,n);

for i=1:n
  for j=1:n
    hs(i,j)=h(j);
  end
  ths(2:n)=h(1:n-1);
  ths(1)=h(n);
  h=ths;
end

hs=hs';
x=x'
circonv=hs*x;

subplot(3,1,1);
stem(0:1:n-1,x);
xlabel("No of samples");
ylabel("Amplitude");
title("Signal X");

subplot(3,1,2);
stem(0:1:n-1,h);
xlabel("No of samples");
ylabel("Amplitude");
title("Signal h");

subplot(3,1,3);
stem(0:1:n-1,circonv);
xlabel('No of samples');
ylabel('Amplitude');
title('Circular Convolution');