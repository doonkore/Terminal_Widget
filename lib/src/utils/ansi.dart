import 'dart:io';

/// ESTUDIO RECOMENDADO:
/// - Códigos de escape ANSI: formato \x1B[...m (ESC [ código m)
/// - SGR (Select Graphic Rendition): controla color, estilo, etc.
/// - Tabla de códigos: 0-9 (estilos), 30-37 (colores fg), 40-47 (colores bg)

/// Secuencia de escape ANSI: inicia una instrucción de formato.
const String escapeAnsi = '\x1B[';

/// Código reset: vuelve a los estilos por defecto.
const String resetAnsi = '\x1B[0m';
const String cleanScreen = '\x1B[2J\x1B[0;0H';
const String hideCursor = '\x1B[?25l';
const String showCursor = '\x1B[?25h';
const String saveCursorPos = '\x1B7';
const String restoreCursorPos = '\x1B8';
const String clearLine = '\x1B[2K';
const String moveCursorUp = '\x1B[A';
const String moveCursorDown = '\x1B[B';
const String moveCursorForward = '\x1B[C';
const String moveCursorBackward = '\x1B[D';
const String carriageReturn = '\r';
const String newLine = '\n';

/// Enum de estilos ANSI (bold, italic, underline, etc.)
/// 
/// ESTUDIO RECOMENDADO:
/// - Enums en Dart: permiten valores nombrados y propiedades.
/// - Cada estilo tiene un código SGR único (1, 3, 4, 5, 7, 8, 9).
enum AnsiStyle {
  bold(1),
  italic(3),
  underline(4),
  blink(5),
  reverse(7),
  hidden(8),
  strikethrough(9),
  reset(0);

  /// Código numérico SGR para este estilo.
  final int codigoNumero;

  const AnsiStyle(this.codigoNumero);
}

/// Enum de colores de texto (foreground).
/// 
/// ESTUDIO RECOMENDADO:
/// - Rango 30-37: colores estándar ANSI.
/// - 90-97: colores brillantes (si la terminal lo soporta).
enum Color {
  black(30),
  red(31),
  green(32),
  yellow(33),
  blue(34),
  magenta(35),
  cyan(36),
  white(37);

  final int codigo;

  const Color(this.codigo);
}

/// Enum de colores de fondo (background).
/// 
/// ESTUDIO RECOMENDADO:
/// - Rango 40-47: fondos estándar ANSI.
/// - 100-107: fondos brillantes.
enum BkgColor {
  black(40),
  red(41),
  green(42),
  yellow(43),
  blue(44),
  magenta(45),
  cyan(46),
  white(47);

  final int codigo;

  const BkgColor(this.codigo);
}

// TODO: Futuro - soportar más características:
// - enum BrightColor(90-97) para colores brillantes
// - enum TextAttribute para underline doble, overline, etc.
// - Soporte para colores RGB (38;2;R;G;B para fg, 48;2;R;G;B para bg)



