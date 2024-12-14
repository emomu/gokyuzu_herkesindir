import 'package:flutter/material.dart';
import 'package:gokyuzu_herkesindir/config/routes/routes.dart';
import 'package:gokyuzu_herkesindir/screens/splash/splash_screen.dart';
import 'package:gokyuzu_herkesindir/utils/scale_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        ScaleConfig.init(context);
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: AppRoutes.splash,
          onGenerateRoute: AppRoutes.generateRoute,
        );
      },
    );
  }
}
