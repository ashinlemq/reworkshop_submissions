import 'package:flutter/material.dart';
import 'package:travel_expenses/expenses.dart';
import 'package:travel_expenses/providers/expenses_provider.dart';
import 'package:provider/provider.dart';

var myLightColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 161, 109, 170),
);

var myDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 25, 93, 86),
  brightness: Brightness.dark,
);

void main() {
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
        home: const Expenses(),
      ),
    ),
  );
}
