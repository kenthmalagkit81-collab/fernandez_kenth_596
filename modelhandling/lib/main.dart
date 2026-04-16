import 'package:flutter/material.dart';
import 'package:modelhandling/screen/dashboard_screen.dart';
import 'package:modelhandling/screen/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screen/dashboard_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://dxueoxriwuphanxqnhla.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImR4dWVveHJpd3VwaGFueHFuaGxhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzA4ODQ1NjksImV4cCI6MjA4NjQ2MDU2OX0.1Nv8XJVP4Zr7lfndmQpoEm_I38JCi6R9jN76-nINkks",
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Grade Calculator',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: LoginPage(),
    );
  }
}
