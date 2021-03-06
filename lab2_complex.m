%?????????? ??????? t^p ? ??????????? ??? ?????
%? ?????????????????? ???? ?? ????????? [0,T]

clc;
T=4; 
N=128; %?????????? ???????? ??????? ?? ????????? [0,T]
M=32; %?????????? ?????? ???? ?????
p=2; %?????????? ??????? ??????? x^p 
kp=2.4;%?????????? ???????? ?????????????? ???????
C0=0;
for i=1:N+1 %????????? ????????? ???????
  % f(i)=sin(2*pi*kp*(i-1)/N); % ????????????? ??????? 
   x(i)= 2*T*(((i-1-N/2))/N);%??? ????????? ?? -? ?? ?
  % x(i)=T*(((i-1))/N); %??? ????????? ?? 0 ?? ?
   f(i)= (x(i))^p; %??????? t^p  
    C0=C0+f(i);
end
C0=C0*(2/N);
for k=1:M
   C(k)=0; 
end   
for i=1:N+1
    for k=1:M
    C(k)=C(k)+f(i)*exp(-j*2*pi*k*(i-1)/N);     
    end
end
for k=1:M
C(k)=C(k)*(2/N);
end 
%?????????? ? ??????????? ??????? ???????? (??????)
for k=1:M 
Cab(k)=abs(C(k));%???????????? Cab(k)- ??????????? ????? ???? a+jb, 
%??????? abs ????????? sqrt(a^2+b^2 )
end
k=1:M;
figure 
plot(k,Cab);
stem(Cab(1:M)); %????? ???????  ?????????? ?????????????????? ??????
axis([1 8 -0.2 1.2]);%??????? ????: [xmin xmax ymin ymax]
title('????????? ????????? ???????????? ???????');
xlabel('?????????? ????????')
axis tight;
%?????????? ? ??????????? ??????? ???????? (?????) 
for i=1:N+1
    y(i)=0;
    %f3(i)=0;
    for k=1:M    
    y(i)=y(i)+C(k)*exp(j*2*pi*k*(i-1)/N);   
    end
    y(i)=C0/2+y(i);
end 
i=1:N+1;
figure
plot(i,f);
axis tight;
title('???????? ? ??????????????? ???????')
xlabel('????? ???????? ???????')
hold on;
plot(i,real(y),'r-');
axis tight;
hold off;



for i=2:N
  dy(i)=real(y(i))-f(i);%?????????? ??????????? ??????????????
end
dy_proc=dy/(max(f)-min(f))*100;
CKO=std(dy);
CKO_proc=std(dy_proc)%??? ? ?????????

pause
close all;
clear;