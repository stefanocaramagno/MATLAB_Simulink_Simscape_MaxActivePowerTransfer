% DOPPI BIPOLI 
% Identificazione della Matrice delle Impedenze Z

% ------------------------------------------------------------------------
% STEP 1

% Implementare il circuito in Simscape (Matlab) scegliendo w se non
% fornita. 

% Ponendo:
%  -> L = Xl/w;
%  -> C = -1/w*Xc;
%  -> M = Xm/w;

% Nel nostro caso:
% 1) dichiaro i dati dell'esercizio in Simscape;
% 2) w non è fornita, quindi la pongo uguale a 2*pigreco sia
%    nel Simscape che nello script a seguire e dichiaro i dati 
%    dell'esercizio.

w = 2*pi;

% ------------------------------------------------------------------------
% STEP 2

% Inserire:
% - un generatore di corrente pari a i1 = cos(w*t) alla porta 1;
% - un circuito aperto (c.a.) alla porta 2.

% ------------------------------------------------------------------------
% STEP 3

% Simulare il circuito, acquisendo la tensione:
% - alla porta 1 (v1)  
% - alla porta 2 (v2).
% Siano Vm1 e tm1 il valore massimo di v1 e l'istante di tempo in cui 
% viene raggiunto, allora Z11 è numericamente (non dimensionalmente!) 
% pari a Vm1*[cos(w*tm1)-jsen(w*tm1)].
% Analogamente, Z21 è numericamente è pari a Vm2*[cos(w*tm2)-jsen(w*tm2)].

% Nel nostro caso, tramite Simscape abbiamo ricavato i seguenti valori:

%Vm1 
Vm11 = 5; 

%tm1 
tm11 = 0.750; 

%Vm2 
Vm21 = 5; 

%tm2 
tm21 = 0.250;

% di conseguenza saremo in grado di calcolare Z11 e Z21 dalle formule
% precedentemente presentate:

Z11 = Vm11*(cos(w*tm11)-j*sin(w*tm11));
Z21 = Vm21*(cos(w*tm21)-j*sin(w*tm21));

% ------------------------------------------------------------------------
% STEP 4

% Modificare il circuito, inserire: 
% - un generatore di corrente pari a i2 = cos(w*t) alla porta 2 
%   (in sostituzione del circuito aperto);
% - un circuito aperto (c.a) alla porta 1 
%   (rimuovendo il generatore inserito al passo 2).

% ------------------------------------------------------------------------
% STEP 5

% Simulare il circuito, acquisendo la tensione:
% - alla porta 1 (v1);
% - alla porta 2 (v2).
% Analogamente a prima, Z22 è numericamente pari 
% a Vm2*[cos(w*tm2)-jsen(w*tm2)].
% Z12 è numericamente pari a Vm1*[cos(w*tm1)-jsen(w*tm1)] (non necessario
% in assenza di generatori controllati, poichè Z12 = Z21).

% Nel nostro caso, tramite Simscape abbiamo ricavato i seguenti valori:

%Vm1
Vm12 = 2.235; 

%tm1
tm12 = 0.926; 

%Vm2  
Vm22 = 2.235;

%tm2
tm22 = 0.426; 

% di conseguenza saremo in grado di calcolare Z22 dalle formula
% precedentemente presentata:

Z22 = Vm22*(cos(w*tm22)-j*sin(w*tm22));

% dato che siamo in presenza di generatori controllati, Z12 è diverso da
% Z22 quindi dovremo calcolarlo dalla formula precedentemente presentata:

Z12 = Vm12*(cos(w*tm12)-j*sin(w*tm12));

% ------------------------------------------------------------------------
% CONCLUSIONE

Z = [f(Vm11,tm11), f(Vm12,tm12);
     f(Vm21,tm21), f(Vm22,tm22)]

function y = f(Vm,tm) 
    y = Vm*(cos(2*pi*tm)-j*sin(2*pi*tm));
end





