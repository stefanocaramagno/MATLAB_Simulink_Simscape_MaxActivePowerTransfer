% MASSIMO TRASFERIMENTO DI POTENZA ATTIVA IN REGIME SINUSOIDALE

% ------------------------------------------------------------------------
% STEP 1

%{
Calcolare l'impedenza, Zs = Rs + jXs, "vista" da Z( = R + jx), usando la
procedura "Calcolo impedenza in regime sinusoidale" (porre la rete ad
ingresso zero esclusivamente in questo punto).
Ingresso Zero -> sostituire i generatori indipendenti di corrente con un
circuito aperto e i generatori indipendenti di tensione con un corto
circuito.
%}   

    %{
    SOTTOSTEP 1
    Implementare il circuito in Simscape (Matlab) scegliendo w se non
    fornita. 
    
    Ponendo:
     -> L = XL/w;
     -> C = -1/w*XC;
     -> M = XM/w;
    
    Nel nostro caso:
      1) dichiaro i dati dell'esercizio in Simscape;
      2) w non è fornita, quindi la pongo uguale a 2*pigreco sia
         nel Simscape che nello script a seguire e dichiaro i dati 
         dell'esercizio.
    %}
    
    w = 2*pi;
    
    %{
    SOTTOSTEP 2
    Inserire un generatore indipendente di corrente pari a ig = cos(w*t)
    tra i morsetti in cui deve essere calcolata l'impedenza Z = R + jX.
    %}
    
    %{
    SOTTOSTEP 3
    Acquisire la tensione vg ai capi del generatore di corrente 
    (tensione del generatore di corrente - convenzione del generatore).
    Detto tm il tempo in cui la tensione vg raggiunge il valore massimo
    Vm, porre:
        R = Vm*cos(w*tm);
        X = -Vm*sen(w*tm).
    %}
    
    % Nel nostro caso, tramite Simscape abbiamo ricavato i seguenti valori:
    Vm = 2.151e+01;
    tm = 0.849;

    % di conseguenza saremo in grado di calcolare R e X dalle formule
    % precedentemente presentate:
    R = +Vm*cos(w*tm);
    X = -Vm*sin(w*tm);

%{
L'impedenza del carico affichè sia massimo il trasferimento di potenza
attiva vale: Z = Zs.
Pertanto: R = Rs e X = -Xs.
%}

% Quindi andiamo ad eseguire le dovute uguaglienze:
Rs = R;
Xs = -X;

% di conseguenza saremo in grado di calcolare l'impedenza Zs dalla formula
% precedentemente presentate:
Zs = Rs + j*Xs

% ------------------------------------------------------------------------
% STEP 2

%{
Acquisire la tensione del circuito aperto (c.a.), vth, utilizzando il
"voltometro" ai capi del carico.
Essa può essere espressa come in precedenza nella 
forma vth = Vm*cos(w(t-tm)) dove:
 -> w è pari al valore scelto nello passo 1;
 -> tm è il tempo in cui la tensione acquisita dal voltometro raggiunge il
    valore massimo Vm.
Attenzione: w deve essere usato per "passare" gli ingressi dal dominio dei
            fasori al dominio del tempo.

La massima potenza attiva trasferibile vale: 
Pm = (Vm/sqrt(2))^2/4Rs = Vm^2/8Rs
%}

% Nel nostro caso, tramite Simscape abbiamo ricavato il seguente valore:

%Vm
Vmp = 2.470e+01; 

% di conseguenza saremo in grado di calcolare massima potenza 
% attiva trasferibile:
Pm = (Vmp)^2/(8*Rs)





