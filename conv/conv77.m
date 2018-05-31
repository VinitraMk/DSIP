x = input('Enter Signal 1: ');
nx = input('Enter Sample numbers for Signal1: ');
h = input('Enter Signal 2: ');
nh = input('Enter Sample numbers for Signal2: ');
n1=length(x);
n2=length(h);
z= h' *x;
disp(z);
n= n1 + n2 - 1;
ncl = nx(1) + nh(1);
ncu = nx(length(x)) + nh(length(h));

subplot(3,1,1);
stem(nx,x);
xlabel("n");
ylabel("x(n)");
title("Signal #1");

subplot(3,1,2);
stem(nh,h);
xlabel("n");
ylabel("h(n)");
title("Signal #2");

nc = (ncl:1:ncu);
for k=1:n
  c(k)= 0;
end;

for i=1:n1
  for j=1:n2
    c(i+j-1) = c(i+j-1)+ z(i,j);
  end;
end;

disp(c);
disp(nc);

subplot(3,1,3);
stem(nc,c);
xlabel("n");
ylabel("y(n)");
title("Convolution");