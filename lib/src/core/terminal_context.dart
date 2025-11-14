import 'dart:io';

/// Contexto que proporciona información de la terminal actual.
/// 
/// PROPÓSITO:
/// Actúa como contenedor de datos del entorno terminal.
/// Similar a BuildContext en Flutter: proporciona acceso a información
/// que los widgets necesitan para adaptarse al entorno (ancho, alto, etc).
/// Permite que los widgets sepan en qué "espacio" se renderizarán.
/// 
/// ANALOGÍA:
/// Si los widgets son actores en un escenario, TerminalContext es el "escenario"
/// que le dice a cada actor: "tienes X caracteres de ancho y Y líneas de alto".
/// 
/// PATRÓN UTILIZADO: Context/Environment
/// - No es un widget, es información que SE PASA a los widgets.
/// - Se instancia una sola vez (en TerminalApp.run()) y se propaga a todo el árbol.
/// 
/// ESTUDIO RECOMENDADO:
/// - Patrón Context/Environment: pasar datos a través de una jerarquía sin
///   tener que pasar parámetros en cada nivel.
/// - stdout en Dart: propiedades terminalColumns y terminalLines que dan info
///   del terminal actual.
/// - Lazy evaluation: los getters calculan el valor cada vez que se accede
///   (no se cachea), útil si el usuario redimensiona la terminal.
class TerminalContext {
  /// Obtiene el ancho actual de la terminal en caracteres (columnas).
  /// 
  /// RETORNO:
  /// int: número de columnas disponibles. Ejemplo: 80, 120, 200, etc.
  /// 
  /// CÓMO FUNCIONA:
  /// Lee directamente de stdout.terminalColumns (propiedad del sistema operativo).
  /// Refleja el tamaño ACTUAL de la terminal en el momento de acceso.
  /// 
  /// USO TÍPICO:
  /// - Layouts (Row, Column) para calcular cuánto espacio hay disponible.
  /// - Truncar o envolver texto que sea muy largo.
  /// - Centrar contenido horizontalmente.
  /// 
  /// EJEMPLO:
  /// final context = TerminalContext();
  /// print(context.width); // p. ej. imprime: 120
  /// 
  /// ESTUDIO RECOMENDADO:
  /// - Getters en Dart: métodos sin parámetros que se leen como propiedades.
  ///   Sintaxis: int get width => valor;
  /// - Lazy evaluation: cada acceso a width calcula stdout.terminalColumns
  ///   (no se cachea; si el usuario redimensiona, obtienes el nuevo valor).
  int get width => stdout.terminalColumns;

  /// Obtiene el alto actual de la terminal en líneas.
  /// 
  /// RETORNO:
  /// int: número de líneas disponibles. Ejemplo: 24, 30, 50, etc.
  /// 
  /// CÓMO FUNCIONA:
  /// Lee directamente de stdout.terminalLines (propiedad del sistema operativo).
  /// Refleja el tamaño ACTUAL de la terminal en el momento de acceso.
  /// 
  /// USO TÍPICO:
  /// - Layouts verticales para saber cuántas líneas pueden ocupar.
  /// - Paginar contenido (mostrar 10 líneas, esperar input, mostrar más).
  /// - Centrar contenido verticalmente.
  /// 
  /// EJEMPLO:
  /// final context = TerminalContext();
  /// print(context.height); // p. ej. imprime: 30
  /// 
  /// ESTUDIO RECOMENDADO:
  /// - Similar a width: getter que accede a stdout.terminalLines.
  /// - Responsivo: si el usuario redimensiona, refleja el nuevo valor.
  int get height => stdout.terminalLines;
}