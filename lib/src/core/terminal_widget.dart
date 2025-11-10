
// clase abstracta 
import 'package:terminal_element/src/core/terminal_context.dart';

abstract class TerminalWidget {
// contrato todos los hijos deben cumplir con el mismo metodo en este caso renderizar 
   String render(TerminalContext context);
}