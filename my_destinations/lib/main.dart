import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_destinations/UI/screens/login_screen.dart';
import 'package:my_destinations/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Flutter Demo Home Page!',
            style: TextStyle(color: Colors.black87),
          ),
        ),
        body: LoginScreen(),
      ),
    );
  }
}
