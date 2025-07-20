
import 'package:flutter/material.dart';

class BankTheme {
BankTheme._();

static ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFF003366), // Azul escuro para o saldo
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    headlineMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    titleMedium: TextStyle(color: Colors.grey[600]),
    bodyMedium: TextStyle(color: Colors.black87),
    ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFF003366), // Botões em azul
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Color(0xFF003366),
    unselectedItemColor: Colors.grey[500],
    showUnselectedLabels: false,
    backgroundColor: Colors.white,
  ),
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    elevation: 2,
    color: Colors.white,
  ),
);
}