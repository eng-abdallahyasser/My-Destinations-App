import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_destinations/app_router.dart';
import 'package:my_destinations/constants/my_colors.dart';
import 'package:my_destinations/constants/strings.dart';

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
      title: 'My Destinations',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.myTeal),
        useMaterial3: true,
      ),
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: loginScreen,
    );
  }
}
