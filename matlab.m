

disp('Start recording')

recObj=audiorecorder;
disp('Start') 

recordblocking(recObj,10);

disp('End ')

O=getaudiodata(recObj);


Fs=20000;%sampling frequency
file='recorded.wave';
audiowrite(file,O,Fs);


clear Fs
[y,Fs]=audioread('recorded.wave');

t=linspace(0,0.01,10000);


%plot for message signal
subplot(4,1,1)
plot(y)
  title('Input signal')
  
 Fc=4000;%carrier frequency
  subplot(4,1,2)
  C= sin(2*pi*Fc*t); %carrier signal
  plot(t,C)
  title('Carrier signal')
 
 
 
  subplot(4,1,3)  
   l=modulate(y,Fc,Fs,'am'); %modulated signal
  plot(l)
 title('Modulated signal') 
 
 
 
 
  subplot(4,1,4) 
  d=demod(l,Fc,Fs,'am'); %Demodulated signal
  plot(d)
  title('Demodulated  signal')
  
  
  
  
  pause(5)
  
  sound(d)
  
