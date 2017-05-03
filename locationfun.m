function y = locationfun(x,a,b,c)

EM = [53; 50; 0];
INV = [5; 93; 45];
MRMitte = [33; 50; 45];
MRhr = [0; 0; 45];

y(1) = 20 * log10((sqrt((x(1) - INV(1))^2 + (x(2) - INV(2))^2 + (x(3) - INV(3))^2)) / sqrt((x(1) - EM(1))^2 + (x(2) - EM(2))^2 + (x(3) - EM(3))^2)) - a;
y(2) = 20 * log10((sqrt((x(1) - MRMitte(1))^2 + (x(2) - MRMitte(2))^2 + (x(3) - MRMitte(3))^2)) / sqrt((x(1) - EM(1))^2 + (x(2) - EM(2))^2 + (x(3) - EM(3))^2)) - b;
y(3) = 20 * log10((sqrt((x(1) - MRhr(1))^2 + (x(2) - MRhr(2))^2 + (x(3) - MRhr(3))^2)) / sqrt((x(1) - EM(1))^2 + (x(2) - EM(2))^2 + (x(3) - EM(3))^2)) - c;
end
