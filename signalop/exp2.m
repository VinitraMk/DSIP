x=[-10:10];
y=[zeros(1,10),1,ones(1,10)];
subplot(2,3,1)
stem(x,y)      
title('unit step');
ylabel('amplitude');
xlabel('no of samples');

x=[-10:10];
y=[zeros(1,10),1,zeros(1,10)];
subplot(2,3,2);
stem(x,y);
title('Unit Impulse');
ylabel('amplitude');
xlabel('no of samples');

x=[-10:10];
y=[zeros(1,10),(0:10)];
subplot(2,3,3);
stem(x,y);
title('Unit Ramp');
ylabel('amplitude');
xlabel('no of samples');

a=2;
y=[zeros(1,10),((0:10).^a)];
subplot(2,3,4);
stem(x,y);
title('Exponential');
ylabel('amplitude');
xlabel('no of samples');

x=[0:0.01:2];
f=2;
y=10*sin(2*pi*f*x);
subplot(2,3,5);
stem(x,y);
title('Sinusoidal');
ylabel('amplitude');
xlabel('no of samples');

y=10*cos(2*pi*f*x);
subplot(2,3,6);
stem(x,y);
title('Cosine');
ylabel('amplitude');
xlabel('no of samples');

