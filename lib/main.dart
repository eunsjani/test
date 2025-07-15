import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'widgets/bottom_navigation_widget.dart';

void main() {
  // 웹에서 텍스트 렌더링 개선
  if (kIsWeb) {
    // 웹에서 Canvas Kit을 사용하여 텍스트 렌더링 개선
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test1 App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF009C38)),
        fontFamily: 'Pretendard',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700, // Bold
          ),
          displayMedium: TextStyle(
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700, // Bold
          ),
          displaySmall: TextStyle(
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600, // SemiBold
          ),
          headlineLarge: TextStyle(
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700, // Bold
          ),
          headlineMedium: TextStyle(
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600, // SemiBold
          ),
          headlineSmall: TextStyle(
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600, // SemiBold
          ),
          titleLarge: TextStyle(
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600, // SemiBold
          ),
          titleMedium: TextStyle(
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500, // Medium
          ),
          titleSmall: TextStyle(
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500, // Medium
          ),
          bodyLarge: TextStyle(
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500, // Medium
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500, // Medium
          ),
          bodySmall: TextStyle(
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500, // Medium
          ),
          labelLarge: TextStyle(
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500, // Medium
          ),
          labelMedium: TextStyle(
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500, // Medium
          ),
          labelSmall: TextStyle(
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500, // Medium
          ),
        ),
      ),
      home: const BottomNavigationWidget(),
    );
  }
}
