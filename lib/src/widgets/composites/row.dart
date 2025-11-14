import 'package:terminal_element/src/core/terminal_context.dart';
import 'package:terminal_element/src/core/terminal_widget.dart';

/// Widget contenedor (composite) que distribuye hijos horizontalmente.
/// Similar a Row en Flutter.
/// 
/// ESTUDIO RECOMENDADO:
/// - Patrón Composite: nodos que contienen otros widgets.
/// - Responsabilidad de layout: disponer hijos en el espacio disponible.
/// - Renderizado recursivo: renderiza todos los hijos y los compone.
class Row implements TerminalWidget {
  /// Lista de widgets hijos.
  /// Estos se renderizarán uno al lado del otro (horizontalmente).
  final List<TerminalWidget> children;

  /// Constructor que recibe los hijos.
  /// 
  /// EJEMPLO:
  /// Row(children: [
  ///   Text(content: "Hola "),
  ///   Text(content: "Mundo"),
  /// ])
  Row({required this.children});

  /// Renderiza todos los hijos concatenados horizontalmente.
  /// 
  /// LÓGICA:
  /// 1. Itera sobre cada hijo.
  /// 2. Llama render() en cada uno.
  /// 3. Concatena los resultados (sin saltos de línea = horizontalmente).
  /// 
  /// ESTUDIO RECOMENDADO:
  /// - Recursión: cada hijo puede ser otro composite (árbol).
  /// - StringBuffer: más eficiente que concatenación con +.
  /// - Separadores: considera espacios entre hijos (mainAxisSpacing).
  @override
  String render(TerminalContext context) {
    // TODO: Implementar:
    // 1. final buffer = StringBuffer()
    // 2. for (var child in children) { buffer.write(child.render(context)); }
    // 3. return buffer.toString()
    // 
    // MEJORAS FUTURAS:
    // - Añadir mainAxisSpacing (espacio entre hijos).
    // - Añadir crossAxisAlignment (alineación vertical: top, center, bottom).
    // - Respetar ancho de terminal (context.width).
    
    throw UnimplementedError('Row.render() aún no está implementado');
  }
}