import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _investimentoMensal = 0;
  int _anosInvestindo = 0;
  double _resultado = 0;
  double _rentabilidadeAnual = 0;
  double _valorInvestido = 0;
  TextStyle _textStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  static final NumberFormat formatoDoReal =
      NumberFormat.simpleCurrency(locale: 'pt_BR');

  atualizardResultado() {
    setState(() {
      _resultado = (_investimentoMensal *
              (pow(1 + (_rentabilidadeAnual / 12 / 100),
                      (_anosInvestindo * 12)) -
                  1)) /
          (_rentabilidadeAnual / 12 / 100);
    });
  }

  atualizarValorInvestido() {
    setState(() {
      _valorInvestido = _investimentoMensal * (_anosInvestindo * 12);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            margin: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Investido mensal',
                        style: _textStyle,
                      ),
                      Spacer(),
                      Text(
                        '${formatoDoReal.format(_investimentoMensal)}',
                        style: _textStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Slider(
                    value: _investimentoMensal,
                    min: 0,
                    max: 1000,
                    activeColor: Colors.blue,
                    inactiveColor: Colors.blue.shade50,
                    divisions: 20,
                    onChanged: (value) {
                      setState(() {
                        _investimentoMensal = value;
                      });
                      atualizardResultado();
                      atualizarValorInvestido();
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            margin: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Tempo investindo',
                        style: _textStyle,
                      ),
                      Spacer(),
                      Text(
                        '$_anosInvestindo Anos',
                        style: _textStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Slider(
                    min: 0,
                    max: 50,
                    value: _anosInvestindo.toDouble(),
                    activeColor: Colors.blue,
                    inactiveColor: Colors.blue.shade50,
                    divisions: 25,
                    onChanged: (value) {
                      setState(
                        () {
                          _anosInvestindo = value.toInt();
                        },
                      );
                      atualizardResultado();
                      atualizarValorInvestido();
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            margin: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Rentabilidade anual',
                        style: _textStyle,
                      ),
                      Spacer(),
                      Text(
                        '$_rentabilidadeAnual %',
                        style: _textStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Slider(
                    min: 0,
                    max: 20,
                    divisions: 20,
                    activeColor: Colors.blue,
                    inactiveColor: Colors.blue.shade50,
                    value: _rentabilidadeAnual,
                    onChanged: (value) {
                      setState(
                        () {
                          _rentabilidadeAnual = value;
                        },
                      );
                      atualizardResultado();
                      atualizarValorInvestido();
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            margin: EdgeInsets.symmetric(horizontal: 14, vertical: 30),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Resultado', style: _textStyle),
                      Text('${formatoDoReal.format(_resultado)}',
                          style: _textStyle),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Valor Investido',
                      ),
                      Text(
                        '${formatoDoReal.format(_valorInvestido)}',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
