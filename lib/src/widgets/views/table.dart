import 'package:terminal_element/src/core/terminal_context.dart';
import 'package:terminal_element/src/core/terminal_widget.dart';

/// Widget compuesto que renderiza una tabla (filas y columnas).
/// Similar a DataTable en Flutter, pero para terminal.
/// 
/// ESTUDIO RECOMENDADO:
/// - Estructuras de datos: List<List<String>> para matriz.
/// - Alineación de columnas: calcular anchos automáticos.
/// - Bordes: usar caracteres Unicode (┌─┐ │ └─┘ etc).
class Table implements TerminalWidget {
  /// Datos de la tabla: cada fila es una lista de celdas (strings).
  final List<List<String>> rows;
  
  /// Títulos de columnas (opcional).
  final List<String>? headers;

  /// Constructor.
  /// 
  /// EJEMPLO:
  /// Table(
  ///   headers: ["Nombre", "Edad"],
  ///   rows: [
  ///     ["Juan", "25"],
  ///     ["María", "30"],
  ///   ],
  /// )
  Table({required this.rows, this.headers});

  /// Renderiza la tabla formateada.
  /// 
  /// LÓGICA:
  /// 1. Calcular ancho de cada columna (máximo de todas las filas).
  /// 2. Renderizar headers (si existen) con bordes.
  /// 3. Renderizar cada fila alineada a los anchos calculados.
  /// 4. Añadir bordes/separadores.
  /// 
  /// ESTUDIO RECOMENDADO:
  /// - Cálculo de anchos: max() en listas.
  /// - Padding de strings: '${text.padRight(width)}'.
  /// - Bordes Unicode: ┌ ─ ┐ │ ├ ┼ ┤ └ ┘ etc.
  @override
  String render(TerminalContext context) {
    // TODO: Implementar:
    // 1. Calcular anchos de columnas.
    // 2. Renderizar header (si existe).
    // 3. Renderizar separador.
    // 4. Renderizar cada fila.
    // 5. Retornar tabla completa como string.
    // 
    // EJEMPLO SALIDA:
    // ┌─────────┬─────┐
    // │ Nombre  │ Edad│
    // ├─────────┼─────┤
    // │ Juan    │ 25  │
    // │ María   │ 30  │
    // └─────────┴─────┘
    // 
    // MEJORAS FUTURAS:
    // - Alineación: izq, centro, der.
    // - Colores por columna.
    // - Seleccionable (resaltar fila).
    
    throw UnimplementedError('Table.render() aún no está implementado');
  }
}