import 'package:flutter/material.dart';

/*
Nós podemos receber os parametros de forma
dinamica!!

Primeiro, utilizamos a palavra chave "final"
Depois o tipo de dado: String, int, ...
Por ~ultimo o nome que queremos dar


final String nome;
 */

class Mycard extends StatelessWidget {
  const Mycard({
    Key? key,
    this.nome,
    this.email,
    this.telefone,
  }) : super(key: key);

  final String? nome;
  final String? email;
  final String? telefone;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.network(
                "https://i.gifer.com/X2Q.gif",
                scale: 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nome: " + nome!,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "Email: " + email!,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "Telefone: " + telefone!,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.black,
            thickness: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Icon(
                Icons.favorite,
                size: 50,
              ),
              Icon(
                Icons.edit,
                size: 50,
              ),
              Icon(
                Icons.man,
                size: 50,
              ),
              Icon(
                Icons.delete,
                size: 50,
              ),
            ],
          )
        ],
      ),
    );
  }
}
