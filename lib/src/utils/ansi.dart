
const String escapeAnsi = "\x1B[";
const String resetAnsi = "m\x1B[0m";
const String cleanScreen = '\x1b[2J\x1b[H'; 
const String saltoLinea = "\n";


enum Color {
  // Códigos de color de texto (Foreground)
  negro('30'),
  rojo('31'),
  verde('32'),
  amarillo('33'),
  azul('34'),
  magenta('35'),
  cyan('36'),
  blanco('37');

  // El código ANSI como una cadena que contiene solo el número.
  final String codigoNumero;

  const Color(this.codigoNumero);

  // Sobreescribe el método toString() para devolver la cadena del código numérico
  @override
  String toString()=> codigoNumero;

 }
  enum BkgColor {
  // Códigos de color de fondo (Background)
  negro('40'),
  rojo('41'),
  verde('42'),
  amarillo('43'),
  azul('44'),
  magenta('45'),
  cyan('46'),
  blanco('47');

  // El código ANSI como una cadena que contiene solo el número.
  final String codigoNumero;

  const BkgColor(this.codigoNumero);

  // Sobreescribe toString() para que al concatenar solo devuelva "40", "41", etc.
  @override
  String toString() {
    return codigoNumero;
  }
}
  enum AnsiStyle {
  // Códigos de color de fondo (Background)
  reset('0'),
  bold('1'),
  faint('2'),
  italic('3'),
  underline('4'),
  blink('5'),
  reverse('7'),
  hidden('8'),
  strikethrough('9');

  // El código ANSI como una cadena que contiene solo el número.
  final String codigoNumero;

  const AnsiStyle(this.codigoNumero);

  // Sobreescribe toString() para que al concatenar solo devuelva "40", "41", etc.
  @override
  String toString() {
    return codigoNumero;
  }
}

enum AnsiStyleOff {
  boldOff('22'),
  italicOff('23'),
  underlineOff('24'),
  blinkOff('25'),
  reverseOff('27'),
  hiddenOff('28'),
  strikethroughOff('29'); 

  final String codigoNumero;

  const AnsiStyleOff(this.codigoNumero);

  @override
  String toString() {
    return codigoNumero;
  }
}



