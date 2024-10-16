import 'package:flutter/material.dart'; // Importa la biblioteca principal de Flutter para crear interfaces de usuario.
import 'package:provider/provider.dart'; // Importa la biblioteca Provider para la gestión del estado.
import 'package:mensajeria/config/apptheme.dart'; // Importa el archivo que contiene la configuración del tema de la aplicación.
import 'package:mensajeria/presentacion/chat/chat_screen.dart'; // Importa la pantalla del chat que se mostrará como página principal.
import 'package:mensajeria/presentacion/provider/chat_provider.dart'; // Importa el proveedor que gestiona el estado del chat.

void main() {
  // La función main es el punto de entrada de la aplicación.
  runApp(const MyApp()); // Ejecuta la aplicación, que usa la clase MyApp como widget principal.
}

class MyApp extends StatelessWidget {
  // MyApp es el widget principal de la aplicación, que extiende StatelessWidget porque no tiene estado propio.
  const MyApp({super.key}); // Constructor de la clase MyApp. 'super.key' permite pasar el identificador del widget a la clase padre.

  @override
  Widget build(BuildContext context) {
    // El método build se encarga de construir la interfaz de usuario del widget.
    
    return MultiProvider(
      // MultiProvider permite gestionar varios providers, aunque en este caso solo tenemos uno.
      providers: [
        // Aquí se define un provider que usará la clase ChatProvider para manejar el estado del chat.
        ChangeNotifierProvider (create: (_) => ChatProvider())
        // ChangeNotifierProvider crea una instancia de ChatProvider. El guion bajo (_) indica que no se utiliza el contexto en la creación.
      ],
      child: MaterialApp(
        // MaterialApp es el widget base que configura la app con soporte de Material Design.
        title: 'Si o no APP', // Título de la aplicación.
        debugShowCheckedModeBanner: false, // Oculta el banner de "debug" en la esquina superior derecha.
        theme: Apptheme(selectedColor: 1).theme(), 
        // Aplica el tema personalizado definido en Apptheme, con un color seleccionado.
        home: const ChatScreen(), 
        // Define la pantalla principal de la aplicación, en este caso ChatScreen.
      ),
    ); 
  }
}
