import 'package:terminal_element/src/core/terminal_context.dart';
import 'package:terminal_element/src/core/terminal_widget.dart';

class View extends TerminalWidget {
    final TerminalWidget? header;
    final TerminalWidget? body;
    final TerminalWidget? footer;

    View({this.header, this.body, this.footer});
  @override
  String render(TerminalContext context) {
    // TODO: implement render
    throw UnimplementedError();
  }

} 