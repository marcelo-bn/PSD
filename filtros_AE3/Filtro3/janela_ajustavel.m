clc
close all
clear all

% Filtro BP FIR (Janela Fixa)

% Dados iniciais
f1 = 1200; 
f2 = 2000; 
f3 = 3000;
f4 = 3800;
fa = 8000;
fN = fa/2;
Ap = 3; 
Apa = Ap/2;
As = 40;
Gtopo = 20;
Gp = 17;
Gs = -20;

fs1 = f1;
fp1 = f2;
fp2 = f3;
fs2 = f4;
ws1 = fs1/fN;
wp1 = fp1/fN;
wp2 = fp2/fN;
ws2 = fs2/fN;

fv = [0 ws1 ws1 ws2 ws2 1 1 wp2 wp2 wp1 wp1];
Amin = As+100;
mv = [-As -As Ap/2 Ap/2 -As -As -Amin -Amin -Ap/2 -Ap/2 -Amin];

%% Primeira etapa: Estimativa do filtro.

fcuts = [fs1 fp1 fp2 fs2];
a = [0 1 0];
dev = [10^(-As/20) (10^(Apa/20)-1)/(10^(Apa/20)+1) 10^(-As/20)];

[n,Wn,beta,ftype] = kaiserord(fcuts,a,dev,fa);
L = n+1;
b = fir1(n,Wn,ftype,kaiser(L,beta),'noscale');
fvtool(b)
title(['Filtro de ordem estimada BP FIR com janela de Kaiser de ordem ', num2str(n)]);

%% Segunda etapa: Ajuste da ordem
n = n+1;
L = n+1;
b = fir1(n,Wn,ftype,kaiser(L,beta),'noscale');
fvtool(b)
title(['Filtro BP FIR com janela de Kaiser de ordem ', num2str(n)]);

%% Terceira etapa: Ajuste do ganho de topo e nova mascara

fva = [0 ws1 ws1 ws2 ws2 1 1 wp2 wp2 wp1 wp1];
Amin_a = -Gs+100;
mva = [Gs Gs Gtopo Gtopo Gs Gs -Amin_a -Amin_a Gp Gp -Amin_a];

b = b/(10^(0.06/20));
b_ajustado = b*10^(Gtopo/20);
fvtool(b_ajustado)
title(['Filtro com ajuste de ganho de topo BP FIR com janela de Kaiser de ordem ', num2str(n)]);



