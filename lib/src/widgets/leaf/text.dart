import 'package:terminal_element/src/core/terminal_context.dart';
import 'package:terminal_element/src/core/terminal_widget.dart';
import 'package:terminal_element/src/utils/ansi.dart';
import 'package:terminal_element/src/utils/ansi_styles.dart';

/// Widget hoja (sin hijos) que renderiza texto con estilos y colores ANSI.
/// Similar a Text en Flutter, pero para terminal.
/// 
/// ESTUDIO RECOMENDADO:
/// - Widgets leaf: no tienen hijos, son contenido final.
/// - Inmutabilidad: los parámetros no cambian después de construir.
/// - Patrón builder: passar todo en el constructor.
class Text implements TerminalWidget {
  /// Contenido a mostrar.
  final String content;
  
  /// Estilos a aplicar (bold, italic, underline, etc.).
  /// Optional (null = sin estilos).
  final Styles? styles;
  
  /// Color de texto (foreground): red, blue, etc.
  /// Optional (null = color por defecto).
  final Color? color;
  
  /// Color de fondo (background): red, blue, etc.
  /// Optional (null = fondo por defecto).
  final BkgColor? bkgColor;

  /// Constructor con parámetros nombrados.
  /// 
  /// EJEMPLO DE USO:
  /// Text(
  ///   content: "¡Hola!",
  ///   styles: Styles(bold: true, underline: true),
  ///   color: Color.green,
  ///   bkgColor: BkgColor.black,
  /// )
  Text({
    required this.content,
    this.styles,
    this.color,
    this.bkgColor,
  });

  /// Renderiza el texto a una secuencia ANSI.
  /// 
  /// PASOS:
  /// 1. Recolecta todos los códigos (estilos + color + fondo).
  /// 2. Si hay códigos, construye: ESC + códigos.join(";") + "m" + texto + RESET.
  /// 3. Si no hay códigos, devuelve el texto plano.
  /// 
  /// ESTUDIO RECOMENDADO:
  /// - StringBuffer vs concatenación: más eficiente para strings grandes.
  /// - Secuencias ANSI: formato escapeAnsi + códigos + 'm'.
  /// - Reset: importante para que los estilos no "ensucien" lo que viene después.
  @override
  String render(TerminalContext context) {
    // TODO: Implementar la lógica completa:
    // 1. Crear lista de códigos: <String>[]
    // 2. Añadir códigos de estilos (si existen): styles?.codesStyle
    // 3. Añadir código de color (si existe): color?.codigo.toString()
    // 4. Añadir código de fondo (si existe): bkgColor?.codigo.toString()
    // 5. Si la lista está vacía, retornar content directamente.
    // 6. Si no está vacía:
    //    - prefix = escapeAnsi + codes.join(";") + "m"
    //    - suffix = resetAnsi
    //    - return prefix + content + suffix
    
    throw UnimplementedError('Text.render() aún no está implementado');
  }
}