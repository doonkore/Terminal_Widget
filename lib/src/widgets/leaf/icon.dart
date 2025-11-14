import 'package:terminal_element/src/core/terminal_context.dart';
import 'package:terminal_element/src/core/terminal_widget.dart';

/// Widget hoja que renderiza un ícono/símbolo.
/// Podría ser Unicode, caracteres especiales, etc.
/// 
/// ESTUDIO RECOMENDADO:
/// - Caracteres Unicode: cómo representar símbolos (✓, ✗, ▶, etc).
/// - Codificación UTF-8: necesaria para símbolos especiales.
class Icon implements TerminalWidget {
  /// Símbolo/carácter a mostrar.
  final String symbol;

  /// Constructor simple.
  Icon({required this.symbol});

  /// Renderiza el ícono.
  /// 
  /// NOTA: Similar a Text, pero más simple (sin estilos por defecto).
  @override
  String render(TerminalContext context) {
    // TODO: Implementar (muy similar a Text pero sin estilos/colores):
    // return symbol;
    // 
    // MEJORAS FUTURAS:
    // - Añadir estilos y colores (similar a Text).
    // - Validar que symbol no sea vacío.
    
    throw UnimplementedError('Icon.render() aún no está implementado');
  }
}