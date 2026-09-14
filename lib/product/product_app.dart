import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'nexabound_store.dart';
import 'screens.dart';

class ProductApp extends StatelessWidget {
  const ProductApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NexaboundStore()),
      ],
      child: MaterialApp(
        title: 'Nexabound Reader',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark),
        home: const NexaboundHome(),
      ),
    );
  }
}
