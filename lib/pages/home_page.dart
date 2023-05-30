import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var teste = ModalRoute.of(context)!.settings.arguments ??
        'Nao erncontado' as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$teste'),
            ElevatedButton(
                onPressed: () => Navigator.of(context).pushNamed('/cubit'),
                child: const Text('Bloc/Cubit'))
          ],
        ),
      ),
    );
  }
}
