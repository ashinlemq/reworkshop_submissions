import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:travel_expenses/widgets/firebase/auth.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}
class MockUserCredential extends Mock implements UserCredential {}

void main() {
  late MockFirebaseAuth mockAuth;

  setUp(() {
    mockAuth = MockFirebaseAuth();
  });

  Widget buildTestWidget() {
    return MaterialApp(
      home: Auth(auth: mockAuth),
    );
  }

  testWidgets('Verify text fields are present and error displays on malformed email', (WidgetTester tester) async {
    when(() => mockAuth.signInWithEmailAndPassword(
      email: 'brokenemail',
      password: '123456',
    )).thenThrow(FirebaseAuthException(
      code: 'invalid-email',
      message: 'The email address is badly formatted.',
    ));

    await tester.pumpWidget(buildTestWidget());

    // Verify all fields
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Repeat Password'), findsOneWidget);

    // Enter credentials
    await tester.enterText(find.byType(TextField).at(0), 'brokenemail');
    await tester.enterText(find.byType(TextField).at(1), '123456');
    await tester.enterText(find.byType(TextField).at(2), '123456');

    await tester.tap(find.text('Login'));
    await tester.pump();

    expect(find.text('The email address is badly formatted.'), findsOneWidget);
  });
}