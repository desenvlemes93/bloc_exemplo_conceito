import 'package:flutter/material.dart';

class TelaCadastroPage extends StatelessWidget {
  const TelaCadastroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          child: Padding(
        padding: const EdgeInsets.only(top: 100, bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Unidade',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
            TextFormField(),
            SizedBox(
              width: double.infinity,
              
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Salvar'),
              ),
            )
          ],
        ),
      )),
    );
  }
}
