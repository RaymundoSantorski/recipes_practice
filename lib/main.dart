import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_practice/screens/main_screen.dart';
import 'package:recipes_practice/services/recipe_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  RecipeService.init();
  runApp(
    ChangeNotifierProvider(
      create: (context) => RecipeService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Recipes App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(children: [Text(widget.title), TextField()]),
        backgroundColor: Colors.blue,
        toolbarHeight: 100,
      ),
      body: MainScreen(),
    );
  }
}
