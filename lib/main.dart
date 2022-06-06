import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './models/http_provider.dart';
import './pages/home_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => HttpProvider(),
        child: const HomeProvider(),
      ),
    );
  }
}
