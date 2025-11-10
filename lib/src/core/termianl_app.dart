import 'dart:io';
import 'package:terminal_element/src/core/terminal_context.dart';
import 'package:terminal_element/src/core/terminal_widget.dart';
import 'package:terminal_element/src/utils/ansi.dart';

class TermianlApp {
  final TerminalWidget rootWidget; 
  TermianlApp({required this.rootWidget});

  void run () {
    if (Platform.isMacOS || Platform.isLinux) {
      ProcessSignal.sigwinch.watch().listen((_) {
      _drawScreen();
    } 
    );
    } else {
      //TODO: crear logica para responsividad en windows
    }
    _drawScreen();
  }
    void _drawScreen(){
      final context = TerminalContext();
      final String output = rootWidget.render(context);
      print("$cleanScreen $output $saltoLinea");
    }

  }

