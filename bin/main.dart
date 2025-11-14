import 'package:terminal_element/src/core/terminal_app.dart';
import 'package:terminal_element/src/utils/ansi.dart';
import 'package:terminal_element/src/utils/ansi_styles.dart';
import 'package:terminal_element/src/widgets/leaf/text.dart';

void main() {
  final app = TerminalApp(
    root: Text(
      content: "¡Hola Mundo!",
      styles: Styles(bold: true),
      color: Color.green,
    ),
  );
  app.run();
}

