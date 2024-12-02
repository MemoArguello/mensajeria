import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mensajeria/config/apptheme.dart';
import 'package:mensajeria/presentacion/chat/chat_screen.dart';
import 'package:mensajeria/screen/Counter_functions_screen.dart';
import 'package:mensajeria/presentacion/provider/chat_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      child: MaterialApp(
        title: 'Si o no APP',
        debugShowCheckedModeBanner: false,
        theme: Apptheme(selectedColor: 1).theme(),
        home: const HomeSelector(),  // Cambiamos la pantalla inicial a HomeSelector.
      ),
    );
  }
}

class HomeSelector extends StatelessWidget {
  const HomeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecciona una opción'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Selecciona a qué pantalla deseas ir:',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Navegar a ChatScreen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ChatScreen()),
                );
              },
              child: const Text('Chat'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navegar a CounterScreen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const CounterScreen()),
                );
              },
              child: const Text('Contador'),
            ),
          ],
        ),
      ),
    );
  }
}
