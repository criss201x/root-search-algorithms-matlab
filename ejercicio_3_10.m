%El método de Newton-Raphson, que lleva el nombre de Isaac Newton y Joseph Raphson , 
% es un método iterativo popular para encontrar la raíz de una ecuación polinomial. 
% También se conoce como método de Newton y se considera un caso límite de método secante.

%el metodo consiste en hallar la aproximación de la función dada por la línea tangente 
% con la ayuda de la derivada, después de elegir un valor aproximado de raíz que esté 
% razonablemente cerca de la raíz real. La intersección con el eje x de la tangente se 
% calcula usando álgebra elemental, y esta intersección con el eje x calculada es típicamente 
% una mejor aproximación a la raíz de la función. Este procedimiento se repite hasta que se 
% encuentra la raíz de la precisión deseada.
%Pasos para encontrar la raíz usando el método de Newton:
% 1 Compruebe si la función dada es diferenciable o no. Si la función no es diferenciable, 
%   no se puede aplicar el método de Newton.
% 2 Encuentre la primera derivada f '(x) de la función dada f (x).
% 3 Calcula la raíz inicial de la función, digamos x 1.
% 4 Use la fórmula de iteración de Newton para obtener una nueva aproximación mejor de la raíz, 
%   digamos x 2
% 5 Repita el proceso para x 3 , x 4 … hasta que se obtenga la raíz real de la función, 
%   cumpliendo con la tolerancia de error.


%---------------------------------------------------codigo----------------------------------------------------------------------

% limpia pantalla
clc

% define x como variable simbolica 
syms x;

% Entradas
%y = input('Enter non-linear equations: '); % defina la ecuacion por
%teclado
% la funcion f(x) es predefinida
y = sin(x)-2/(1+x.^2)
% valore de x0
a = input('valor inicial: ');
e = input('Error permitido: ');
N = input('maximo de iteraciones: ');
% contador del programa
step = 1;

% encontrando la derivada de la función dada
g = diff(y,x);

% encontrando valor funcional
fa = eval(subs(y,x,a));

while abs(fa)> e
    fa = eval(subs(y,x,a));
    ga = eval(subs(g,x,a));
    if ga == 0
        disp('division por 0');
        break;
    end
    
    b = a - fa/ga;
    fprintf('iteracion=%d\ta=%f\tf(a)=%f\n',step,a,fa);
    a = b;
    
    if step>N
       disp('No es convergente'); 
       break;
    end
    step = step + 1;
end

fprintf('la raiz es: %.3f\n', a);