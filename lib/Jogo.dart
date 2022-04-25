import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imageApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  _opcaoSelecionado(String escolhaUsuario) {

    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt( opcoes.length );
    var escolhaApp = opcoes[numero];


    // Alguns logs
    print("Você escolheu: $escolhaUsuario");
    print("A Maquina escolheu: ${opcoes[numero]}");

    setState(() {
      _imageApp = AssetImage("images/${opcoes[numero]}.png");
    });

    if (
        ( escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        ( escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        ( escolhaUsuario == "papel" && escolhaApp == "pedra")
    ){
      setState(() {
        this._mensagem = "Você ganhou!";
      });
    } else if ( escolhaUsuario == escolhaApp ) {
      setState(() {
        this._mensagem = "Nós empatamos!";
      });
    } else {
      setState(() {
        this._mensagem = "Você perdeu!";
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokenpo"),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(top: 32, bottom: 16),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                  "Escolha do App"
              ),
              Image(image: this._imageApp,),
              Text(_mensagem),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => _opcaoSelecionado("pedra"),
                    child: Image.asset("images/pedra.png", width: 100),
                  ),
                  GestureDetector(
                    onTap: () => _opcaoSelecionado("papel"),
                    child: Image.asset("images/papel.png", width: 100),
                  ),
                  GestureDetector(
                    onTap: () => _opcaoSelecionado("tesoura"),
                    child: Image.asset("images/tesoura.png", width: 100),
                  )
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}
