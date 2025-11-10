import 'dart:io';
//* Clase que almacena la informacion de la terminal.
class TerminalContext {
  // traemos la cantidad de columnas | de iazquierda a derecha
  int get whith => stdout.terminalColumns;
  // traemos la cantidad de lineas | de ariiba a abajo 
  int get height => stdout.terminalLines;


}