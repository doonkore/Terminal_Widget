import 'package:terminal_element/src/utils/ansi.dart';

class AnsiStyles {
  final bool? bold;
  final bool? italic;
  final bool? underline;
  final bool? blink;
  final bool? reverse;
  final bool? hidden;
  final bool? strikethrough;

  AnsiStyles({this.bold,this.italic,this.blink,this.hidden, this.reverse, this.strikethrough, this.underline});

  String get codesStyle {
    final List<String> codes = [];

    if (bold == true ) {
      codes.add(AnsiStyle.bold.codigoNumero.toString());
    }
    if (italic == true) {
      codes.add(AnsiStyle.italic.codigoNumero);
    }
    if (underline == true) {
      codes.add(AnsiStyle.underline.codigoNumero);
    }
    if (blink == true) {
      codes.add(AnsiStyle.blink.codigoNumero);
    }
    if (reverse == true) {
      codes.add(AnsiStyle.reverse.codigoNumero);
    }
    if (hidden == true) {
      codes.add(AnsiStyle.hidden.codigoNumero);
    }
    if (strikethrough == true) {
      codes.add(AnsiStyle.strikethrough.codigoNumero);
    }
    if (codes.isEmpty){
      return "";
    }


  return codes.join(";");
  }
  
}