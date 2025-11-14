# term_widget

Pequeño framework de UI para terminales en Dart, orientado a aprendizaje. Implementa un patrón Composite de widgets (hojas y contenedores) y utilidades ANSI para estilos y colores.

## Estado actual (resumen)
- Core: `TerminalWidget` (contrato), `TerminalContext` (width/height), `TerminalApp` (orquestador).
- Utils: `ansi.dart` (constantes y enums ANSI), `ansi_styles.dart` (`Styles`) — listo.
- Widgets: hojas y composites organizados; muchos `render()` están documentados pero pendientes de implementar.  
  El archivo `lib/src/widgets/leaf/text.dart` contiene la definición del widget `Text` con la interfaz y TODOs.

---

## Documentación importante: Widget Text (resumen para README)

Propósito
- `Text` es un widget hoja que renderiza contenido textual con estilos y colores ANSI. Equivalente a `Text` en Flutter pero para terminal.

Campos (brief)
- `content` (String, required): texto a mostrar.
- `styles` (Styles?, optional): flags de estilo (bold, italic, underline, etc.).
- `color` (Color?, optional): color de primer plano.
- `bkgColor` (BkgColor?, optional): color de fondo.

Cómo debe funcionar `render()` (paso a paso)
1. Recolectar códigos SGR en una lista (desde `styles.codesStyle`, `color.codigo`, `bkgColor.codigo`).
2. Si la lista está vacía: devolver `content` tal cual (texto plano).
3. Si hay códigos:
   - Construir el prefijo: `escapeAnsi + codes.join(";") + 'm'`.
   - Construir el sufijo: `resetAnsi`.
   - Devolver: `prefix + content + suffix`.
4. `render()` debe ser puro: no hacer I/O ni efectos secundarios (eso lo hace `TerminalApp`).

Qué estudiar / recursos
- ANSI SGR (escape sequences): significado de códigos 0,1,3,4,30-37,40-47.
- Manipulación de strings en Dart (StringBuffer).
- Inmutabilidad y uso de `const` en constructores.
- Patrones: Composite (widgets), separación de responsabilidades (render vs I/O).

Qué está pendiente / TODO
- Implementar `Text.render()` en `lib/src/widgets/leaf/text.dart`.
- Añadir `bin/main.dart` con ejemplo "Hola Mundo" usando `TerminalApp(root: Text(...)).run()`.
- Implementar composites básicos: `Row.render()`, `Column.render()`.
- Añadir tests para:
  - `Styles.codesStyle` (casos: ninguno, uno, varios).
  - `Text.render()` con combinaciones de estilos y colores.

Ejemplo de uso esperado (concepto)
```dart
final app = TerminalApp(
  root: Text(
    content: "¡Hola Mundo!",
    styles: Styles(bold: true),
    color: Color.green,
  ),
);
app.run();
```

---

## Próximos pasos sugeridos (para aprendizaje)
1. Implementar `Text.render()` y verificar salida en terminal.
2. Crear `bin/main.dart` con ejemplo simple y ejecutar.
3. Implementar `Row` y `Column` para componer múltiples `Text`.
4. Agregar tests unitarios pequeños para `Styles` y `Text`.
5. Investigar double-buffering y optimizaciones de redraw en terminales.

Si quieres, implemento el contenido del README en el repo o sigo y te implemento `Text.render()`+`bin/main.dart`.
