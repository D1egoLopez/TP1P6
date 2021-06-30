program TP1LopezNoelRamirezSaravi;

uses Varios, sysutils;

var
  txt1, txts : text;
  x,y, xt, yt, sdist,cont, dp, lejos, cerca,xl, yl, xc, yc : real;

begin
  Assign(txt1, 'Datos6LopezNoelRamirezSaravi.txt');
  reset(txt1);
  Assign(txts, 'Resultados6LopezNoelRamirezSaravi.txt');
  Rewrite(txts);
  read(txt1, x, y);
  xt:= x;
  yt:=y;
  cont := 0;
  sdist := 0;
  lejos := 0;
  cerca:= distancia(0,0,x, y);
  writeln(txts, 'las distancias entre los puntos son:');
  while not EoF(txt1) do
        begin
        if distancia(0,0,x, y) > lejos then
           begin
                lejos := distancia(0,0,x,y);
                xl := x;
                yl := y;
           end;
        if distancia(0,0,x, y) < cerca then
           begin
                cerca := distancia(0,0,x, y);
                xc := x;
                yc:= y;
           end;
        read(txt1, x, y);
        readln(txt1);
        //writeln( '(', xt:0:0, ',', yt:0:0, ')','-','(', x:0:0, ',', y:0:0, ')','       ',distancia(xt,yt,x, y):0:2);
        writeln(txts, '(', xt:0:0, ',', yt:0:0, ')','-','(', x:0:0, ',', y:0:0, ')','       ',distancia(xt,yt,x, y):0:2);
        sdist := sdist + distancia(xt,yt,x, y);
        xt := x;       yt := y;
        cont := cont + 1;
        //writeln(txts, 'xt/yt','    ',xt:0:0, '  ',yt:0:0);
        end;
  dp := sdist / cont; 
  writeln(txts);
  writeln(txts,'Distancia promedio: ', dp:0:4);
  writeln(txts);
  writeln(txts,'El punto mas cercano al origen es el: ','(', xc:0:0, ',', yc:0:0, ')',' a una distancia de: ', cerca:0:2);
  writeln(txts, 'y se encuentra en el cuadrante #', cuadrante(xc,yc));
  writeln(txts);
  writeln(txts,'El punto mas lejano al origen es el: ','(', xl:0:0, ',', yl:0:0, ')',' a una distancia de: ', lejos:0:2);
  writeln(txts, 'y se encuentra en el cuadrante #', cuadrante(xl,yl));
  //executeprocess('notepad.exe',['Resultados6LopezNoelRamirezSaravi.txt']);
  close(txts);
  close(txt1);
end.

