import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MainPage()));

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _totalContaController = TextEditingController();
  final _totalPessoasController = TextEditingController();
  final _gorjetaController = TextEditingController();
  double gorjeta = 0, totalPorPessoa = 0, totalContaFinal = 0;

  void calcular() {
    double conta = double.tryParse(_totalContaController.text) ?? 0;
    int pessoas = int.tryParse(_totalPessoasController.text) ?? 1;
    double percGorjeta = double.tryParse(_gorjetaController.text) ?? 0;

    setState(() {
      gorjeta = conta * (percGorjeta / 100);
      totalContaFinal = conta + gorjeta;
      totalPorPessoa = totalContaFinal / pessoas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BoraRachar')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _totalContaController, decoration: InputDecoration(labelText: 'Total da conta (R\$)')),
            TextField(controller: _totalPessoasController, decoration: InputDecoration(labelText: 'Total de pessoas')),
            TextField(controller: _gorjetaController, decoration: InputDecoration(labelText: 'Gorjeta (%)')),
            SizedBox(height: 20),
            ElevatedButton(onPressed: calcular, child: Text('Calcular')),
            SizedBox(height: 20),
            Text('Gorjeta: R\$ ${gorjeta.toStringAsFixed(2)}'),
            Text('Por pessoa: R\$ ${totalPorPessoa.toStringAsFixed(2)}'),
            Text('Total: R\$ ${totalContaFinal.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
