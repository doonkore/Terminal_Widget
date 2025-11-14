import 'package:terminal_element/src/core/terminal_context.dart';
import 'package:terminal_element/src/core/terminal_widget.dart';

/// Widget contenedor que puede envolver un hijo con padding/margen.
/// Similar a Container o Padding en Flutter.
/// 
/// ESTUDIO RECOMENDADO:
/// - Espaciado: padding (interior), margin (exterior).
/// - Decoración: bordes, fondos, sombras (futuro).
class Box implements TerminalWidget {
  /// Widget hijo (el que será envuelto).
  final TerminalWidget? child;
  
  /// Espacio interior desde los bordes.
  final int padding;
  
  /// Espacio exterior alrededor.
  final int margin;

  /// Constructor con parámetros nombrados.
  /// 
  /// EJEMPLO:
  /// Box(
  ///   padding: 2,
  ///   margin: 1,
  ///   child: Text(content: "Contenido"),
  /// )
  Box({
    this.child,
    this.padding = 0,
    this.margin = 0,
  });

  /// Renderiza el hijo rodeado de padding y margen.
  /// 
  /// LÓGICA:
  /// 1. Si no hay hijo, retorna solo padding/margen vacío.
  /// 2. Si hay hijo, renderiza el hijo.
  /// 3. Añade espacios (padding) alrededor del contenido.
  /// 4. Añade saltos de línea (margin) arriba y abajo.
  /// 
  /// ESTUDIO RECOMENDADO:
  /// - Espaciado en terminal: no hay "píxeles", solo caracteres y líneas.
  /// - Cálculo de ancho: espacio disponible = context.width - (padding * 2).
  @override
  String render(TerminalContext context) {
    // TODO: Implementar:
    // 1. Renderizar hijo (si existe).
    // 2. Aplicar padding horizontal (espacios a izq/der).
    // 3. Aplicar padding vertical (líneas arriba/abajo).
    // 4. Aplicar margin (saltos de línea extras).
    // 
    // MEJORAS FUTURAS:
    // - BorderSide: dibujar bordes (╔╗╚╝ si soporta Unicode).
    // - BackgroundColor: color de fondo.
    // - Alineación dentro de la caja.
    
    throw UnimplementedError('Box.render() aún no está implementado');
  }
}