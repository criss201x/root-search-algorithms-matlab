%para esta primera parte del ejercicio se proponen algunos alritmos que permitan buscar la raiz en un 
% intervalo, algunos de estos metodos ya se han trabajado en ejercicios anteriores, pero se van a 
% reutilizar tanto en la teoria como en la practica pero eso si cambiando su respectiva funcion.

%Dada una función f (x) en un número flotante x y dos números 'a' y 'b' tales que f (a) * f (b) <0 
% y f (x) es continua en [a, b]. Aquí f (x) representa una ecuación algebraica o trascendental. 
% Encuentre la raíz de la función en el intervalo [a, b] (O encuentre un valor de x tal que f (x) sea 0). 

%Ejemplo: 
%Entrada: una función de x , por ejemplo, x2 - x + 2. Y dos valores: a = -200 yb = 300 tales que f(a)*f(b)<0,
% es decir, f(a)y f(b) tienen signos opuestos.      
%Salida: El valor de la raíz es: -1,0025 O cualquier otro valor con permitido  desviación de la raíz. 
%El método también se denomina método de reducción a la mitad del intervalo, método de búsqueda binaria o 
% método de dicotomía. Este método se usa para encontrar la raíz de una ecuación en un intervalo dado 
% que es el valor de 'x' para el cual f (x) = 0. El método se basa en el Teorema del valor intermedio 
% que establece que si f (x) es una función continua y hay dos números reales ayb tales que f (a) * f (b) 0 yf (b) <0), 
%entonces se garantiza que tiene al menos una raíz entre ellos.

%procedimiento: Si f (c) == 0, entonces c es la raíz de la solución. de no ser asi F es diferente de 0 Si 
% el valor f (a) * f (c) <0, la raíz se encuentra entre ay c. Entonces recurrimos para a y c %de no ser asi, si f (b) * f (c) <0, 
% la raíz se encuentra entre by c. Entonces recurrimos by c. La otra función dada no sigue una de las suposiciones.
% codigo del ejercicio 3.8
% Limpia la pantalla 
clc;
clear;


% grafico en pantalla
x=0:0.05:4;
f=@(x) (x.^7) - (18*(x.^6)) + (132*(x.^5)) - (520*(x.^4)) + (1.280*(x.^3)) - (2.304*(x.^2)) + (3.072*x) - 2.408;

plot(x,f(x));grid
a=input ('a=');
b=input ('b=');
tol=0.00001;
i=0
while (abs(a-b)> tol);
    fa=f(a);
    fb=f(b);
    c=(a+b)/2;
    fc=f(c);
    fprintf('%13.3f %13.3f %13.3f %13.3f \n',a,b,c,fc)
    if (fa *fc > 0);
        a=c;
    else
        b=c;
    end
    i=i+1;
end



