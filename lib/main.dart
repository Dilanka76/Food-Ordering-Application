import 'package:flutter/material.dart';
import 'package:food_ordering_application/providers/card_provider.dart';
import 'package:food_ordering_application/providers/home_page_provider.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => CardProvider(),
          ),
          ChangeNotifierProvider(
              create: (context) => HomePageProvider(),
          ),
        ],
          child: const MyApp()

      ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Ordering application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: Consumer<HomePageProvider>(
          builder: (context,pageProvider,child){
            return pageProvider.currentPage;
          }
      )
    );
  }
}
