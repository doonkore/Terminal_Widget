import 'package:terminal_element/src/core/terminal_context.dart';
import 'package:terminal_element/src/core/terminal_widget.dart';

/// Widget hoja para entrada de texto interactiva.
/// Lee input del usuario desde stdin.
/// 
/// ESTUDIO RECOMENDADO:
/// - stdin: lectura desde la terminal.
/// - Eventos de teclado: para capturar Enter, Escape, etc.
/// - Estado mutable: a diferencia de otros widgets, puede cambiar (input del usuario).
class InputText implements TerminalWidget {
  /// Texto de prompt (p.ej. "Ingrese su nombre: ").
  final String prompt;
  
  /// Valor actual capturado (mutable).
  String value = '';

  /// Constructor.
  InputText({required this.prompt});

  /// Renderiza el prompt y captura input.
  /// 
  /// LÓGICA:
  /// 1. Imprime el prompt.
  /// 2. Lee línea desde stdin.
  /// 3. Guarda en value.
  /// 4. Retorna el prompt + input (para renderizado visual).
  /// 
  /// ESTUDIO RECOMENDADO:
  /// - stdin.readLineSync(): bloquea hasta recibir input.
  /// - Validación: verificar que el input sea válido.
  /// - Manejo de errores: qué pasa si stdin está cerrado.
  @override
  String render(TerminalContext context) {
    // TODO: Implementar:
    // 1. stdout.write(prompt);
    // 2. final input = stdin.readLineSync();
    // 3. if (input != null) value = input;
    // 4. return prompt + value;
    // 
    // MEJORAS FUTURAS:
    // - Mascarar input (para contraseñas).
    // - Validación en tiempo real.
    // - Limitar longitud.
    // - Teclas especiales (flecha arriba/abajo para historial, etc).
    
    throw UnimplementedError('InputText.render() aún no está implementado');
  }
}