import 'dart:async';
import 'dart:io';
import 'package:terminal_element/src/core/terminal_context.dart';
import 'package:terminal_element/src/core/terminal_widget.dart';
import 'package:terminal_element/src/utils/ansi.dart';

/// TerminalApp
///
/// Propósito:
/// - Punto de entrada / orquestador de la aplicación terminal.
/// - Similar a runApp() en Flutter: se encarga de crear el contexto y
///   dibujar el árbol de widgets periódicamente o cuando la terminal cambia de tamaño.
///
/// Qué hace cada campo (brief):
/// - final TerminalWidget root:
///   - Widget raíz del árbol (puede ser View, Column, Text, etc).
///   - Es la única fuente de contenido que TerminalApp renderiza.
/// 
/// Métodos principales:
/// - run():
///   - Inicia el mecanismo que redibuja la pantalla:
///     - En Unix (macOS/Linux) se suscribe a la señal SIGWINCH (redimensionamiento).
///     - En otras plataformas usa un Timer periódico para refrescar cada 200ms.
///     - Llama inmediatamente a _drawScreen() para el primer render.
/// - _drawScreen():
///   - Crea un TerminalContext con ancho/alto actuales.
///   - Llama a root.render(context) para obtener la representación textual ANSI.
///   - Limpia la pantalla (usa cleanScreen desde ansi.dart) y escribe la salida.
/// 
/// Qué hace root.render(context) (paso a paso, explicado):
/// 1. Se pasa el TerminalContext (info de ancho/alto) al widget raíz.
/// 2. El widget raíz y sus hijos ejecutan sus implementaciones de render():
///    - Cada hoja (Text, Icon, etc.) construye su propio string, incluyendo
///      códigos ANSI si corresponde.
///    - Cada composite (Row, Column, Box, View) compone las salidas de sus hijos
///      (concatenación, saltos de línea, padding, etc).
/// 3. El resultado final es una única cadena que representa la "pantalla" completa:
///    - Puede contener escape sequences, saltos de línea y espacios.
/// 4. TerminalApp toma ese string y lo imprime en stdout después de limpiar la pantalla.
///
/// Qué deberías estudiar sobre esto:
/// - Señales del sistema y ProcessSignal.sigwinch en Dart (cómo detectar resize en Unix).
/// - Diferencias entre stdout.write() y print() (control de saltos de línea).
/// - Cómo construir representaciones ANSI (escape sequences y reset).
/// - Patrones de ciclo de vida (setup, loop, cleanup) para aplicaciones terminales.
/// - Manejo de timers y recursos (cancelar Timer, cerrar listeners) para evitar leaks.
///
/// Qué está sin implementar / TODO:
/// - Gestión de recursos:
///   - Actualmente no se almacena ni se cancela el StreamSubscription de sigwinch ni el Timer.
///   - TODO: guardar la suscripción/Timer y cancelarlos en un método stop()/dispose().
/// - Setup/cleanup más completo:
///   - Guardar/restaurar estado del terminal (mostrar/ocultar cursor, modo crudo si se usa input).
/// - Control más fino del refresco:
///   - Evitar redraw completo si el output no cambió (diffing).
///   - Optimizaciones para evitar parpadeo (double-buffering conceptual).
/// - Manejo de errores:
///   - Capturar excepciones durante root.render(context) y evitar que el loop muera.
/// - Soporte cross-platform:
///   - En Windows el enfoque actual usa Timer; revisar si hay señales equivalentes o mejores APIs.
///
/// Notas operativas rápidas:
/// - cleanScreen y newLine vienen de ansi.dart; asegúrate que cleanScreen hace lo esperado
///   (limpiar pantalla y reposicionar el cursor) y que newLine es el separador deseado.
/// - Evita imprimir demasiadas cosas desde dentro de _drawScreen (log/debug), usar un logger separado.
///
/// RESPONSABILIDADES:
/// 1. Recibe el widget raíz (root).
/// 2. Crea un TerminalContext con la terminal actual.
/// 3. Renderiza el widget y lo imprime.
/// 4. (Futuro) Manejar eventos de teclado, loops, limpiar pantalla.
/// 
/// ESTUDIO RECOMENDADO:
/// - Patrón Builder/Factory: construcción de objetos complejos.
/// - Métodos de ciclo de vida: setup, run, cleanup.
class TerminalApp {
  /// Widget raíz que será renderizado y mostrado.
  final TerminalWidget root;

  /// Constructor que recibe el widget que se ejecutará.
  TerminalApp({required this.root});

  /// Ejecuta la aplicación terminal.
  /// 
  /// Comportamiento:
  /// - En macOS/Linux: escucha SIGWINCH y redibuja al cambiar tamaño.
  /// - En otras plataformas: redibuja periódicamente cada 200ms.
  void run () {
    if (Platform.isMacOS || Platform.isLinux) {
      ProcessSignal.sigwinch.watch().listen((_) {_drawScreen();});
    } else {
     Timer.periodic(const Duration(milliseconds: 200), (timer) {_drawScreen(); });
    }
    _drawScreen();
  }

  /// Dibuja la pantalla una vez.
  /// 
  /// Paso a paso:
  /// 1. Crea TerminalContext (lee ancho/alto).
  /// 2. Pide al widget raíz la representación con root.render(context).
  /// 3. Limpia la pantalla y escribe el output final.
  /// 
  /// NOTA: actualmente no captura excepciones; si render falla, puede interrumpir el loop.
  void _drawScreen(){
    final context = TerminalContext();
    final String output = root.render(context);
    stdout.write(cleanScreen);
    print("$output $newLine");
  }

}

