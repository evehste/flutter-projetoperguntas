import 'package:flutter/material.dart';
import './resposta.dart';
import './questão.dart';

void main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final _perguntas = const [
    {
      "texto": "Qual é a sua cor favorita ?",
      "respostas": ["Preto", "Vermelho", "Verde", "Branco"],
    },
    {
      "texto": "Qual é o seu animal favorito ?",
      "respostas": ["Coelho", "Cobra", "Elefante", "Leão"],
    },
    {
      "texto": "Qual é a sua tecnologia favorita ?",
      "respostas": ["ReactJs", "ReactNative", "Flutter", "Angular"],
    }
  ];

  void _responder() {
    if(temPerguntaSelecionada){
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada ? _perguntas[_perguntaSelecionada]["respostas"] : null;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: temPerguntaSelecionada ? Column(
          children: <Widget>[
            Questao(_perguntas[_perguntaSelecionada]['texto']),
            ...respostas.map((t) => Resposta(t, _responder)).toList(),
          ],
        ) : null,
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
