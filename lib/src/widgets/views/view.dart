import 'package:terminal_element/src/core/terminal_context.dart';
import 'package:terminal_element/src/core/terminal_widget.dart';

/// Widget raíz que puede contener el árbol completo de widgets.
/// Similar a Scaffold en Flutter: puede añadir estructura común (header, footer, etc).
/// 
/// ESTUDIO RECOMENDADO:
/// - Root widget: punto de entrada del árbol de widgets.
/// - Layout framework: organizar header, body, footer.
class View implements TerminalWidget {
  /// Contenido principal del view.
  final TerminalWidget? body;
  
  /// Encabezado (opcional).
  final TerminalWidget? header;
  
  /// Pie de página (opcional).
  final TerminalWidget? footer;

  /// Constructor con parámetros nombrados.
  /// 
  /// EJEMPLO:
  /// View(
  ///   header: Text(content: "=== Mi App ==="),
  ///   body: Column(children: [...]),
  ///   footer: Text(content: "© 2025"),
  /// )
  View({
    this.body,
    this.header,
    this.footer,
  });

  /// Renderiza el view (header + body + footer).
  /// 
  /// LÓGICA:
  /// 1. Renderizar header (si existe) + salto de línea.
  /// 2. Renderizar body (contenido principal).
  /// 3. Renderizar footer (si existe) + salto de línea.
  /// 
  /// ESTUDIO RECOMENDADO:
  /// - Composición: usar otros widgets renderizados.
  /// - Separadores: saltos de línea entre secciones.
  @override
  String render(TerminalContext context) {
    // TODO: Implementar:
    // 1. final buffer = StringBuffer()
    // 2. if (header != null) { buffer.write(header!.render(context)); buffer.write('\n'); }
    // 3. if (body != null) { buffer.write(body!.render(context)); buffer.write('\n'); }
    // 4. if (footer != null) { buffer.write(footer!.render(context)); buffer.write('\n'); }
    // 5. return buffer.toString()
    
    throw UnimplementedError('View.render() aún no está implementado');
  }
}