import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sports_report/views/reportPage.dart';
import 'provider/sports_modes_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => SportsModeProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sports Report',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Poppins',
          ),
          home:
              //FinalReport())
              const ReportPage()),
    );
  }
}
