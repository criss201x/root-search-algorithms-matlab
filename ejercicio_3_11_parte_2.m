%
%este ejercicio puede resolverse de la misma manera que el ejercicio 3.10 %parte 2, se reutiliza 
% la formula y el algoritmo pero se le cambia la %funcion f(x)
%
%el método de Halley es un algoritmo de búsqueda de raíces que se utiliza para funciones de una 
% variable real con una segunda derivada continua. %es un algoritmo numérico para resolver la 
% ecuación no lineal f ( x ) = 0. En este caso, la función f tiene que ser una función de una 
% variable real. El método consta de una secuencia de iteraciones comenzando con una 
% suposición inicial x 0 Si f es una función continuamente diferenciable tres veces y a es cero de f 
% pero no de su derivada, entonces, en una vecindad de a , las iteraciones x n satisfacen Esto significa 
% que las iteraciones convergen al cero si la estimación inicial es lo suficientemente cercana y 
% que la convergencia es cúbica.

function ejercicio_3_11_parte_2
%algoritmo computacionalmente mas rapido
%el metodo invoca a g(x)

%contador del programa
i = 1;
%valor inicial 
p0 = 0;            
%maximo de iteraciones
N = 100;                
%error aceptable
error = 0.00000001;         

%variable simbolica
syms 'x'
%la función que se le desea encontrar raíz.
f(x) = exp(2*x)*(x^3)-3*exp(2*x)*(x^2)+3*exp(2*x)*x+exp(2*x);     
%primera y segunda derivada de f(x)
dx = diff(f);       
ddx = diff(dx);

while i <= N
    %Implementación del Método Halley (i.s. g (x)).
    p = p0 - (f(p0)/dx(p0))*(1 - (f(p0)*ddx(p0)/dx(p0)^2))^(-1);     
    %criterio de parada cuando la diferencia entre iteraciones está por debajo de la tolerancia
    if (abs(p - p0)/abs(p)) < error                     
        fprintf('la solucion es %.3f \n', double(p))
        return
    end 
    
    i = i + 1;
    %actualizando po
    p0 = p;             
end

%error por no convergencia dentro de N iteraciones
fprintf('La solución no convergió en %d iteraciones con la precisión requerida de %d \n', N, error)     
end

