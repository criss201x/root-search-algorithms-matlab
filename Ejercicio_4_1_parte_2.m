%para esta segunda parte del ejercicio se proponen algunos algoritmos que permitan buscar la raiz en un intervalo, 
% algunos de estos metodos ya se han trabajado en ejercicios anteriores, pero se van a reutilizar tanto en la teoria 
% como en la practica pero eso si cambiando su respectiva funcion. en este
% caso se reutilizara el metodo de newton mejorado 

%El metodo de newton funcionaba bien para el ejercicio anterior. Sin embargo, para un uso más general, 
% existen algunos errores que deberían corregirse en una versión mejorada del código. Un ejemplo puede 
% ilustrar cuál es el problema: resolvamos tanh (x) = 0, que tiene la solución x = 0. Con | x0 | ≤1.08 todo funciona bien. 
% Por ejemplo, x0 conduce a seis iteraciones si ϵ = 0.001: (error)

%El problema subyacente, que lleva a la división por cero en el ejemplo anterior, es que el método de Newton diverge: 
% las aproximaciones se alejan cada vez más de x = 0. Si no hubiera sido por la división por cero, la condición en el 
% ciclo while siempre sería verdadera y el ciclo se ejecutaría para siempre. Ocasionalmente ocurre divergencia del 
% método de Newton, y el remedio es abortar el método cuando se alcanza un número máximo de iteraciones.

%Otra desventaja de la función de Newton es que llama a la función f (x) el doble de veces que es necesario. Este trabajo 
% adicional no es de importancia cuando f (x) es rápido de evaluar, pero en el software industrial a gran escala, 
% una llamada af (x) puede llevar horas o días, y luego es importante eliminar las llamadas innecesarias. La solución 
% en nuestra función es almacenar la llamada f (x) en una variable (valor_f) y reutilizar el valor en lugar de hacer 
% una nueva llamada f (x).

%Para resumir, queremos escribir una función mejorada para implementar el método de Newton donde: se pueda evitar la división 
% por cero, ademas permitir un número máximo de iteraciones evite la evaluación adicional de f (x) A continuación se enumera 
% una versión más robusta y eficiente de la función, insertada en un programa completo Newtons_method.m para resolver 
% exp(2*x)*(x^3)-3*exp(2*x)*(x^2)+3*exp(2*x)*x+exp(2*x) = 0.

function Ejercicio_4_1_parte_2()
    %(x.^7) - (18*(x.^6)) + (132*(x.^5)) - (520*(x.^4)) + (1.280*(x.^3)) - (2.304*(x.^2)) + (3.072*x) - 2.408;
    f = @(x) (x.^7) - (18*(x.^6)) + (132*(x.^5)) - (520*(x.^4)) + (1.280*(x.^3)) - (2.304*(x.^2)) + (3.072*x) - 2.408;
    dfdx = @(x) (7*(x.^6))-(108*(x.^5))+(660*(x.^4))-(2080*(x.^3))+(3.84*(x.^2))-(4.608*x)+3.072;
    eps = 1e-6;
    x0 = 0;
    [solucion,n_iteraciones] = Newton(f, dfdx, x0, eps);
    if n_iteraciones > 0   % si encuenta solucion
        fprintf('Numero de iteraciones: %d\n', 1 + 2*n_iteraciones);
        fprintf('Una solucion es: %.3f\n', solucion)
    else
        fprintf('Error.\n')
    end
end

function [solucion, n_iteraciones] = Newton(f, dfdx, x0, eps)
    x = x0;
    valor_f = f(x);
    contador_programa = 0;
    while abs(valor_f) > eps && contador_programa < 100
        try
            x = x - (valor_f)/dfdx(x);
        catch
            fprintf('Error! - derivada por 0 en x = \n', x)
            exit(1)
        end
        valor_f = f(x);
        contador_programa = contador_programa + 1;
    end
    % Aquí, se encuentra una solución o demasiadas iteraciones
    if abs(valor_f) > eps
        contador_programa = -1;
    end
    solucion = x;
    n_iteraciones = contador_programa;
end
