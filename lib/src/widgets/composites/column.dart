import 'package:terminal_element/src/core/terminal_context.dart';
import 'package:terminal_element/src/core/terminal_widget.dart';

/// Widget contenedor (composite) que distribuye hijos verticalmente.
/// Similar a Column en Flutter.
/// 
/// ESTUDIO RECOMENDADO:
/// - Diferencia Row vs Column: separadores (espacios vs saltos de línea).
class Column implements TerminalWidget {
  /// Lista de widgets hijos.
  /// Estos se renderizarán uno debajo del otro (verticalmente).
  final List<TerminalWidget> children;

  /// Constructor que recibe los hijos.
  /// 
  /// EJEMPLO:
  /// Column(children: [
  ///   Text(content: "Línea 1"),
  ///   Text(content: "Línea 2"),
  /// ])
  Column({required this.children});

  /// Renderiza todos los hijos con saltos de línea entre ellos.
  /// 
  /// LÓGICA:
  /// 1. Itera sobre cada hijo.
  /// 2. Llama render() en cada uno.
  /// 3. Concatena los resultados con '\n' (saltos de línea).
  /// 
  /// ESTUDIO RECOMENDADO:
  /// - Saltos de línea: \n en strings.
  /// - Consideraciones: largo de línea vs ancho de terminal.
  @override
  String render(TerminalContext context) {
    // TODO: Implementar:
    // 1. final buffer = StringBuffer()
    // 2. for (int i = 0; i < children.length; i++) {
    //      buffer.write(children[i].render(context));
    //      if (i < children.length - 1) buffer.write('\n');
    //    }
    // 3. return buffer.toString()
    // 
    // MEJORAS FUTURAS:
    // - mainAxisSpacing (espacio adicional entre hijos).
    // - crossAxisAlignment (alineación horizontal: left, center, right).
    // - Respetar alto de terminal (context.height).
    
    throw UnimplementedError('Column.render() aún no está implementado');
  }
}

