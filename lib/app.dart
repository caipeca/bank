import 'package:bank/features/auth/presentation/login_pages.dart';
import 'package:bank/shared/themes/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: BankTheme.lightTheme,
      darkTheme: BankTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: LoginPage(),
    );
  }
}
