import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mensajeria/config/apptheme.dart';
import 'package:mensajeria/presentacion/chat/chat_screen.dart';
import 'package:mensajeria/presentacion/provider/chat_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // control. whrap whit widget 
    return MultiProvider(
      providers: [
        //no asignar el argumento
        ChangeNotifierProvider (create:(_) => ChatProvider())
      ],
      child: MaterialApp(
        title: 'Si o no APP',
        debugShowCheckedModeBanner: false,
        theme: Apptheme(selectedColor: 1).theme(),
        home: const ChatScreen()
            ),
    ); 
  }
}
