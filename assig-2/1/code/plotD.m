function [] = plotD(d1,d2,d3,d4)

figure;
plot(abs(d1),'g');
hold on
plot(abs(d2),'b');
hold on
plot(abs(d4),'c');
hold on
plot(abs(d3),'r');
legend('d1','d2','d3','d4')
title('||D|| vs iteration');

figure;
plot(real(d1),'g');
hold on
plot(real(d2),'b');
hold on
plot(real(d4),'c');
hold on
plot(real(d3),'r');
legend('d1','d2','d3','d4')
title('Re(D) vs iteration');

figure;
plot(imag(d1),'g');
hold on
plot(imag(d2),'b');
hold on
plot(imag(d4),'c');
hold on
plot(imag(d3),'r');
legend('d1','d2','d3','d4')
title('Im(D) vs iteration');