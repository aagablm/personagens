import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'salvo.dart';

void main() => runApp(MeuApp());

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personagem Aleatório Rick and Morty',
      theme: ThemeData(primarySwatch: Colors.green),
      home: TelaPersonagemAleatorio(),
    );
  }
}

class TelaPersonagemAleatorio extends StatefulWidget {
  @override
  _TelaPersonagemAleatorioState createState() =>
      _TelaPersonagemAleatorioState();
}

class _TelaPersonagemAleatorioState extends State<TelaPersonagemAleatorio> {
  Map<String, dynamic>? personagem;
  List<Map<String, dynamic>> personagensSalvos = [];

  Future<void> buscarPersonagemAleatorio() async {
    final idAleatorio = Random().nextInt(826) + 1;
    final url =
        Uri.parse('https://rickandmortyapi.com/api/character/$idAleatorio');

    try {
      final resposta = await http.get(url);

      if (resposta.statusCode == 200) {
        setState(() {
          personagem = json.decode(resposta.body);
        });
      } else {
        throw Exception('Falha ao carregar o personagem');
      }
    } catch (e) {
      print(e);
    }
  }

  // Função para salvar o personagem
  void salvarPersonagem() {
    if (personagem != null && !personagensSalvos.contains(personagem)) {
      setState(() {
        personagensSalvos.add(personagem!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personagem Aleatório Rick and Morty',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaPersonagensSalvos(
                    personagens: personagensSalvos,
                  ),
                ),
              );
            },
            tooltip: 'Acessar Salvos',
          ),
        ],
      ),
      body: Center(
        child: personagem == null
            ? Text('Clique no botão para gerar um personagem!')
            : CartaoPersonagem(personagem: personagem!),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: buscarPersonagemAleatorio,
            child: Icon(
              Icons.refresh,
              color: Colors.green[800],
            ),
            tooltip: 'Gerar Personagem',
            backgroundColor: const Color.fromARGB(255, 171, 232, 173),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: salvarPersonagem,
            child: Container(
              margin: EdgeInsets.all(8.0),
              child: Image.asset('assets/icons/star_icon.png'),
            ),
            tooltip: 'Salvar Personagem',
            backgroundColor: const Color.fromARGB(255, 171, 232, 173),
          )
        ],
      ),
    );
  }
}

class CartaoPersonagem extends StatelessWidget {
  final Map<String, dynamic> personagem;

  CartaoPersonagem({required this.personagem});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(personagem['image']),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              personagem['name'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Text('Status: ${personagem['status']}'),
          Text('Espécie: ${personagem['species']}'),
          Text('Gênero: ${personagem['gender']}'),
        ],
      ),
    );
  }
}
