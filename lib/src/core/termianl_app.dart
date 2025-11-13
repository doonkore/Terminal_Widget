import 'dart:async';
import 'dart:io';
import 'package:terminal_element/src/core/terminal_context.dart';
import 'package:terminal_element/src/core/terminal_widget.dart';
import 'package:terminal_element/src/utils/ansi.dart';

class TermianlApp {
  final TerminalWidget rootWidget; 
  TermianlApp({required this.rootWidget});

  void run () {
    if (Platform.isMacOS || Platform.isLinux) {
      ProcessSignal.sigwinch.watch().listen((_) {_drawScreen();});
    } else {
     Timer.periodic(const Duration(milliseconds: 200), (timer) {_drawScreen(); });
    }
    _drawScreen();
  }
    void _drawScreen(){
      final context = TerminalContext();
      final String output = rootWidget.render(context);
      stdout.write(cleanScreen);
      print("$output $saltoLinea");
    }

  }

