import 'package:flutter/material.dart';
import 'package:travel_expenses/expenses.dart';
import 'package:travel_expenses/providers/expenses_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:travel_expenses/widgets/firebase/auth.dart';
import 'firebase_options.dart';

var myLightColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 161, 109, 170),
);

var myDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 25, 93, 86),
  brightness: Brightness.dark,
);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final ThemeData baseLightTheme = ThemeData(colorScheme: myLightColorScheme);
  final ThemeData baseDarkTheme = ThemeData(colorScheme: myDarkColorScheme);

  runApp(
    ChangeNotifierProvider(
      create: (context) => ExpenseState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,

        theme: baseLightTheme.copyWith(
          appBarTheme: AppBarTheme(
            backgroundColor: myLightColorScheme.onPrimaryContainer,
            foregroundColor: myLightColorScheme.primaryContainer,
          ),
          cardTheme: CardThemeData(
            color: myLightColorScheme.secondaryContainer,
          ),
          textTheme: baseLightTheme.textTheme.copyWith(
            headlineSmall: TextStyle(
              fontSize: 15,
              color: myLightColorScheme.onSecondaryContainer,
            ),
          ),
        ),

        darkTheme: baseDarkTheme.copyWith(
            appBarTheme: AppBarTheme(
              backgroundColor: myDarkColorScheme.onPrimaryContainer,
              foregroundColor: myDarkColorScheme.primaryContainer,
            ),
            cardTheme: CardThemeData(color: myDarkColorScheme.secondaryContainer),
            textTheme: baseDarkTheme.textTheme.copyWith(
              headlineSmall: TextStyle(
                fontSize: 15,
                color: myDarkColorScheme.onSecondaryContainer,
              ),
            ),
          ),
            home: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (snapshot.hasData) {
                  return const Expenses();
                }
                return Auth();
              },
            ),
      ),
    ),
  );
}
