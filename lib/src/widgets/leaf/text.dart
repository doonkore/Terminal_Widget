import 'package:terminal_element/src/core/terminal_context.dart';
import 'package:terminal_element/src/core/terminal_widget.dart';
import 'package:terminal_element/src/utils/ansi.dart';
import 'package:terminal_element/src/utils/ansi_styles.dart';


class Text implements TerminalWidget {
  final String? content;
  final Color? color;
  final BkgColor? bkgColor;
  final AnsiStyle? style;
  
  

  Text({required this.content, this.color, this.bkgColor, this.style});

  

  @override
  String render (TerminalContext context) {
    
    final List? codesStyle = AnsiStyles().codesStyle;
    
    final List codes = [];
    
   
    if (content != null ) {
      return content.toString();
    }
    if (color != null) {
      codes.add(Color.values.toString());
    }
    if (bkgColor != null) {
      codes.add(BkgColor.values.toString());
    }
    if ( style != null) {
      codes.add(codesStyle);
    }
    
    return "${codes.join(";")}$content";


}
}