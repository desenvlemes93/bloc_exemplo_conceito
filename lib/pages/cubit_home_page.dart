import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_bloc_examplo/pages/cubit/controller/home_cubit_controller.dart';
import 'package:projeto_bloc_examplo/pages/cubit/controller/home_cubit_state.dart';

class CubitHomePage extends StatefulWidget {
  const CubitHomePage({super.key});

  @override
  State<CubitHomePage> createState() => _CubitHomePageState();
}

class _CubitHomePageState extends State<CubitHomePage> {
  var _loading = false;
  bool testeBoll = false;
  DateTime? dateInicio;
  DateTime? dateFinal;
  int? totalHoras;
  void showLoader() {
    if (!_loading) {
      _loading = true;
      showDialog(
        context: context,
        builder: (context) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.red,
          ));
        },
      );
    }
  }

  void hideLoader() {
    if (_loading) {
      _loading = false;
      Navigator.of(context).pop();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeCubitController>().alterarDados();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: BlocConsumer<HomeCubitController, HomeCubitState>(
        listener: (context, state) {
          if (state is HomeStateLoading) {
            showLoader();
            return;
          } else {
            hideLoader();
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              Center(
                child: switch (state) {
                  HomeStateIntial(name: final String nameInicial) =>
                    Text(nameInicial),
                  HomeStateSucess(name: final namedLoad) => Text(namedLoad),
                  _ => const SizedBox.shrink(),
                },
              ),
              GestureDetector(
                onDoubleTap: () {
                  testeBoll = true;
                  dateInicio = DateTime.timestamp();

                  setState(() {});
                },
                onDoubleTapCancel: () {
                  testeBoll = false;
                  dateFinal = DateTime.timestamp();

                  setState(() {});
                },
                child: Card(
                  color: testeBoll == true ? Colors.green : Colors.red,
                  elevation: 20,
                  shadowColor: Colors.grey.shade800,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ListTile(
                        leading: Icon(Icons.car_crash),
                        title: Text(
                            'Vaga ${testeBoll == true ? 'Disponivel' : 'ocupado'}'),
                        subtitle: Text('Teste do Card ${testeBoll}'),
                      ),
                      Wrap(
                        runSpacing: 5,
                        direction: Axis.horizontal,
                        children: [
                          Icon(Icons.access_alarm),
                          Text('${dateInicio}'),
                          SizedBox(
                            height: 20,
                          ),
                          Text('${dateFinal}'),
                          Text('Total de horas ficadas ${dateFinal}'),
                          SizedBox(
                            height: 50,
                            width: 250,
                          ),
                          Icon(Icons.add_comment),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
