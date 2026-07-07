import 'package:flutter/material.dart';
import 'package:travel_expenses/expenses.dart';
import 'package:travel_expenses/providers/expenses_provider.dart';
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
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => ExpenseState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: myDarkColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: myDarkColorScheme.onPrimaryContainer,
            foregroundColor: myDarkColorScheme.primaryContainer,
          ),
          cardTheme: const CardThemeData().copyWith(
            color: myDarkColorScheme.secondaryContainer,
          ),
          textTheme: const TextTheme().copyWith(
            headlineSmall: TextStyle(
              fontSize: 15,
              color: myDarkColorScheme.onSecondaryContainer,
            ),
          ),
        ),
        theme: ThemeData().copyWith(
          colorScheme: myLightColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: myLightColorScheme.onPrimaryContainer,
            foregroundColor: myLightColorScheme.primaryContainer,
          ),
          cardTheme: const CardThemeData().copyWith(
            color: myLightColorScheme.secondaryContainer,
          ),
          textTheme: const TextTheme().copyWith(
            headlineSmall: TextStyle(
              fontSize: 15,
              color: myLightColorScheme.onSecondaryContainer,
            ),
          ),
        ),
        home: Auth(),
      ),
    ),
  );
}
