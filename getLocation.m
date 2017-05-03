function [ x ] = getLocation( Messdaten )

a = Messdaten(1);
b = Messdaten(2);
c = Messdaten(3);
x0 = getGuess(Messdaten);
% disp(x0);
x = zeros(5,3);

f = @(x)locationfun(x,a,b,c);
options = optimoptions('fsolve','Display','iter','Algorithm','levenberg-marquardt');

for i = 1:5
    x(i,:) = fsolve(f,x0(i,:),options);
end

