import 'package:flutter/material.dart';
import 'package:hotel_clean/di_container.dart';
import 'package:hotel_clean/features/hotel/presentation/screens/hotel_screen.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HotelScreen(),
    );
  }
}
