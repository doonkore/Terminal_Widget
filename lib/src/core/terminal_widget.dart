import 'package:terminal_element/src/core/terminal_context.dart';

/// Interfaz base para todos los widgets en la terminal.
/// 
/// PROPÓSITO:
/// Define el contrato que TODOS los widgets deben cumplir.
/// Similar a Widget en Flutter: es el tipo base de la jerarquía.
/// Permite que cualquier widget (Text, Row, Column, Box, etc.) se trate
/// de forma uniforme sin importar su implementación específica.
/// 
/// PATRÓN UTILIZADO: Composite
/// - Los widgets pueden ser simples (hojas: Text, Icon) o complejos (contenedores: Row, Column).
/// - Todos comparten la misma interfaz render(), lo que permite composición flexible.
/// 
/// ESTUDIO RECOMENDADO:
/// - Interfaces abstractas en Dart: define contratos sin implementación.
///   Sintaxis: abstract class NombreInterface { }
/// - Patrón Composite: estructura de árbol donde componentes y contenedores
///   comparten la misma interfaz. Permite trabajar con árboles de objetos.
/// - Principio de sustitución de Liskov: cualquier implementación de TerminalWidget
///   puede usarse donde se espere TerminalWidget.
/// - Polimorfismo: un método que acepta TerminalWidget funciona con Text, Row, Column, etc.
abstract class TerminalWidget {
  /// Renderiza el widget a una cadena de texto con códigos ANSI.
  /// 
  /// RESPONSABILIDAD:
  /// Convertir el widget a su representación en texto (string) que se puede
  /// imprimir en la terminal. Este string puede incluir:
  /// - Contenido textual (p. ej. "Hola Mundo").
  /// - Códigos ANSI para estilos (bold, color, etc).
  /// - Saltos de línea y espacios para layout.
  /// 
  /// PARÁMETRO - context (TerminalContext):
  /// Proporciona información del entorno de ejecución:
  /// - context.width: ancho actual de la terminal en caracteres.
  /// - context.height: alto actual de la terminal en líneas.
  /// Así los widgets pueden adaptar su renderizado al tamaño disponible.
  /// 
  /// RETORNO - String:
  /// Cadena de texto lista para imprimir en stdout.
  /// Ejemplo: "\x1B[1;32mHola\x1B[0m" (Hola en bold y verde).
  /// 
  /// NOTA IMPORTANTE:
  /// Este método es PURO: no tiene efectos secundarios.
  /// - No imprime directamente (eso lo hace TerminalApp).
  /// - No modifica estado externo.
  /// - Solo transforma datos de entrada a salida.
  /// 
  /// ESTUDIO RECOMENDADO:
  /// - Métodos abstractos: definen qué debe implementarse, no cómo.
  /// - Parámetros polimórficos: context es TerminalContext, pero subclases
  ///   pueden usar sus propiedades (width, height) según necesiten.
  /// - Funciones puras: render() no tiene side-effects; predictible y testeable.
  /// 
  /// EJEMPLO DE IMPLEMENTACIÓN (en Text):
  /// 1. Obtener parámetro context.
  /// 2. Construir lista de códigos ANSI (si hay estilos/color).
  /// 3. Si hay códigos: return '\x1B[' + códigos + 'm' + content + '\x1B[0m'
  ///    Si no hay códigos: return content (texto plano).
  /// 
  /// TODO: Futuro
  /// - Consideración: ¿debería render() devolver también metadata (ancho usado, alto)?
  ///   Probablemente no; eso es responsabilidad del layout.
  /// - Consideración: ¿debería haber render() async para widgets interactivos?
  ///   Probablemente en una versión futura con event loop.
  String render(TerminalContext context);
}