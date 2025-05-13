L = 0.12; % Comprimento do Rio.
N = input ('Número de pontos ao longo do Rio? ');
dt = input ('dt? ');
tt = input ('Tempos a serem plotados? Escreva entre colchetes, ex: [3 4 8] ');
nt=size(tt,2)+1;
tt = [0 tt]; % Aqui estamos incluindo t=0 como o primeiro tempo plotado.
% Inicializacao:
dx = L/(N-1);
x = 0:dx:L; % Grade espacial
S = 0.0117*ones(size(x)); % Valores iniciais de S;
subplot(211)
%Plot para t=0
plot(x,S)
axis([0 L 0 0.6]);
hold on
c = dt/dx;
jt = 1;
for it = 1:nt-1
% Loop entre os plots;
for  t = tt(it):dt:tt(it+1)
S(2:N) = S(2:N)-c*S(2:N).*(S(2:N)-S(1:N-1));
S(1) = 0.0117 + 0.1*(t<7)*(1-cos (2*pi*t/7)); % dados a montante
ts(jt)=t;
Ssum(jt)=dx*sum(S); % Volume total de água no rio. 
jt=jt+1;
end

% Grafico para t=tt(it+1)
plot(x, S)
end

xlabel('x')
ylabel('S')

title('Propagação das Ondas de Enchentes')

hold off

% Segunda figura: Volume total da água no rio
figure;
plot(ts, Ssum)
xlabel('t')
ylabel('vol')
title('Volume total da agua no rio')

