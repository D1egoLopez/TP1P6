program TP1LopezNoelRamirezSaravi;

uses Varios, sysutils, Classes, LCLIntf;

type
  cuadrantes = (origen=0,Primer_Cuadrante,Segundo_Cuadrante, Tercer_Cuadrante, Cuarto_Cuadrante, Eje_X, Eje_Y);

var
  txt1, txts : text;
  x,y, xt, yt, sdist,cont, dp, lejos, cerca,xl, yl, xc, yc : real;
  cuadc, cuadl : cuadrantes;

begin
        //  asignacion de archivos
  Assign(txt1, 'Datos6LopezNoelRamirezSaravi.txt');
  Assign(txts, 'Resultados6LopezNoelRamirezSaravi.txt');
  reset(txt1);
  rewrite(txts);
        // inicializacion de variables
  read(txt1, x, y);
  reset(txt1);
  cerca:= distancia(0,0,x, y);  // inicializo el valor mas cercano al (0,0) con el primer punto para poder comparar mas adelante
  xc := x;
  yc:= y;
  repeat             // ciclo para chequear esas distancias al (0,0) de manera estrapolante
        read(txt1, x, y);
        readln(txt1);
        if distancia(0,0,x,y) > lejos then
           begin
                lejos := distancia(0,0,x,y);
                xl := x;
                yl := y;
           end;                                    // chequeo de distancias al origen de cada punto a partir del segundo
        if distancia(0,0,x, y) < cerca then
           begin
                cerca := distancia(0,0,x, y);
                xc := x;
                yc:= y;
           end;
  until Eof(txt1);
  reset(txt1);
  read(txt1, x, y);  // lectura del primer punto
  xt:= x;
  yt:=y;
  readln(txt1);
  writeln(txts, 'las distancias entre los puntos son:');
  while not EoF(txt1) do              // ciclo principal del txt1
        begin
        read(txt1, x, y);
        readln(txt1);
          writeln(txts, '(', xt:0:0, ',', yt:0:0, ')','-','(', x:0:0, ',', y:0:0, ')','       ' ,distancia(xt,yt,x, y):0:2);  // printeo cada par de puntos y la distancia entre ellos
        sdist := sdist + distancia(xt,yt,x, y);   // sumatoria de distancia total entre puntos
        xt := x;       yt := y;  // guardo el ultimo punto leido en una temp
        cont := cont + 1;
        end;
  dp := sdist / cont;   // calculo de distancia promedio
  cuadc := cuadrantes(cuadrante(xc,yc));
  cuadl := cuadrantes(cuadrante(xl,yl));
  writeln(txts); // estos son writres esteticos para dejar mas espacio entre los printeos principales del programa
  writeln(txts,'Distancia promedio: ', dp:0:4);
  writeln(txts);
  writeln(txts,'El pal origen es el ','(', xc:0:0, ',', yc:0:0, ')',' a una distancia de: ', cerca:0:2);
  writeln(txts,'en el plano lo  mas cercano  en el ', cuadc);
  writeln(txts);
  writeln(txts,'El punto mas lejano al origen es el ','(', xl:0:0, ',', yl:0:0, ')',' a una distancia de: ', lejos:0:2);
  writeln(txts, 'y se encuentra en el ', cuadl);
  close(txts);
  close(txt1);
  //readln();
  OpenDocument('Resultados6LopezNoelRamirezSaravi.txt');  // ejecuta el archivo de resultados al finalizar sin abrir la consola
end.
