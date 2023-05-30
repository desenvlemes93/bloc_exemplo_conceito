import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_bloc_examplo/pages/cubit/controller/home_cubit_controller.dart';
import 'package:projeto_bloc_examplo/pages/cubit_home_page.dart';
import 'package:projeto_bloc_examplo/pages/home_page.dart';
import 'package:projeto_bloc_examplo/pages/tela_cadastro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/cubit': (_) => BlocProvider(
              create: (_) => HomeCubitController(),
              child: const CubitHomePage(),
            ),
        '/': (_) => HomePage(),
        '/cadastro': (_) => const TelaCadastroPage(),
      },
    );
  }
}
