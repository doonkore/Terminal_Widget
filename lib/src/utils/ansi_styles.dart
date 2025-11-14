import 'package:terminal_element/src/utils/ansi.dart';

/// Clase inmutable para combinar múltiples estilos ANSI.
/// Solo se usa en widgets leaf como Text.
/// NO se hereda entre contenedores (eso lo manejan colores por separado).
/// 
/// ESTUDIO RECOMENDADO:
/// - Immutabilidad: objetos que no cambian = más seguros y predecibles.
/// - Getters computed: calcular valores basados en estado al acceder.
/// - const constructor: permite instancias compile-time (optimización).
class Styles {
  /// Bandera: aplicar bold (1 en SGR).
  final bool bold;
  
  /// Bandera: aplicar italic (3 en SGR).
  final bool italic;
  
  /// Bandera: aplicar underline (4 en SGR).
  final bool underline;
  
  /// Bandera: aplicar blink/parpadeo (5 en SGR).
  final bool blink;
  
  /// Bandera: aplicar reverse/invertir colores (7 en SGR).
  final bool reverse;
  
  /// Bandera: aplicar hidden/oculto (8 en SGR).
  final bool hidden;
  
  /// Bandera: aplicar strikethrough/tachado (9 en SGR).
  final bool strikethrough;

  /// Constructor const: permite crear instancias inmutables.
  /// 
  /// ESTUDIO RECOMENDADO:
  /// - Parámetros nombrados: claridad en el call site.
  /// - Valores por defecto: false = no aplicar ese estilo.
  /// - const: habilita optimización del compilador.
  const Styles({
    this.bold = false,
    this.italic = false,
    this.underline = false,
    this.blink = false,
    this.reverse = false,
    this.hidden = false,
    this.strikethrough = false,
  });

  /// Retorna lista de códigos SGR como strings.
  /// 
  /// LÓGICA:
  /// - Si un flag es true, añade su código a la lista.
  /// - Si la lista está vacía, devuelve lista vacía (no códigos por defecto).
  /// 
  /// ESTUDIO RECOMENDADO:
  /// - List<String>: tipo consistente, fácil de iterar y combinar.
  /// - .toString() en int: convierte códigos numéricos a strings para SGR.
  /// - Getter lazy: solo se calcula cuando se accede (get codesStyle).
  List<String> get codesStyle {
    final codes = <String>[];

    if (bold) {
      codes.add(AnsiStyle.bold.codigoNumero.toString());
    }
    if (italic) {
      codes.add(AnsiStyle.italic.codigoNumero.toString());
    }
    if (underline) {
      codes.add(AnsiStyle.underline.codigoNumero.toString());
    }
    if (blink) {
      codes.add(AnsiStyle.blink.codigoNumero.toString());
    }
    if (reverse) {
      codes.add(AnsiStyle.reverse.codigoNumero.toString());
    }
    if (hidden) {
      codes.add(AnsiStyle.hidden.codigoNumero.toString());
    }
    if (strikethrough) {
      codes.add(AnsiStyle.strikethrough.codigoNumero.toString());
    }

    return codes;
  }

  /// Alias de codesStyle (mantener compatibilidad).
  List<String> get codes => codesStyle;

  /// Indica si hay al menos un estilo activo.
  /// 
  /// UTILIDAD: Evita construir secuencias ANSI innecesarias.
  bool get hasStyles => codesStyle.isNotEmpty;

  // TODO: En el futuro:
  // - merge(Styles other): combinar dos estilos (uno sobrescribe otro).
  // - copyWith(): crear una copia con cambios específicos.
  // - toEscape(): devolver la secuencia ANSI completa (\x1B[1;4m, etc).
}

