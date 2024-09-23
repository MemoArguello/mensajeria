import 'package:flutter/material.dart'; // Importa la librería de Flutter para poder usar widgets y temas.

const Color _customColor = Color.fromARGB(108, 60, 255, 0); 
// Define un color personalizado usando el formato ARGB (Alpha, Red, Green, Blue).
// El valor "Alpha" controla la transparencia y los valores RGB controlan el color.

const List<Color> _colorThemes = [ 
  // Crea una lista con varios colores, incluyendo el personalizado que se definió antes.
  _customColor,   // Primer color es el personalizado.
  Colors.blue,    // Azul predeterminado de Flutter.
  Colors.teal,    // Verde azulado predeterminado de Flutter.
  Colors.green,   // Verde predeterminado de Flutter.
  Colors.yellow,  // Amarillo predeterminado de Flutter.
  Colors.orange,  // Naranja predeterminado de Flutter.
  Colors.pink,    // Rosa predeterminado de Flutter.
];

class Apptheme { 
  // Esta clase maneja el tema de la app, permitiendo que el usuarÑio elija un color de la lista.

  final int selectedColor; 
  // Variable que almacena el color seleccionado, representado como un índice (número) en la lista de colores.

  Apptheme({this.selectedColor = 0}) 
  // Constructor de la clase Apptheme. Permite pasar un valor al crear el tema para seleccionar un color. 
  // Si no se pasa ningún valor, el color seleccionado será el primero (índice 0).
  
      : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1, 
        //asegura que el valor de selectedColor esté dentro del rango de la lista de colores.
        // Si no es válido, muestra un mensaje de error.
        'Los Colores solo se pueden seleccionar hasta ${_colorThemes.length}');

  ThemeData theme() {
    // Este método crea y devuelve un tema que se puede aplicar a la app.

    return ThemeData(
      useMaterial3: true, 
      // Activa el uso del nuevo diseño de Material 3, una actualización de diseño de Google.
      brightness: Brightness.dark,  
      // Fuerza el tema oscuro en toda la app.

      colorSchemeSeed: _colorThemes[selectedColor], 
      // Usa el color seleccionado de la lista como base para generar un esquema de colores 
      // que afectará a los componentes de la interfaz.
    );
  }

  // Método para obtener directamente el color seleccionado de la lista.
  Color get selectedThemeColor => _colorThemes[selectedColor];
  // Esta función permite acceder al color exacto seleccionado en la lista para usarlo donde sea necesario.
}
