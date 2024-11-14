import 'package:flutter/material.dart';

class TelaPersonagensSalvos extends StatelessWidget {
  final List<Map<String, dynamic>> personagens;

  TelaPersonagensSalvos({required this.personagens});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personagens Salvos',
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.green,
          ),
        ),
      ),
      body: personagens.isEmpty
          ? Center(child: Text('Nenhum personagem salvo ainda.'))
          : ListView.builder(
              itemCount: personagens.length,
              itemBuilder: (context, index) {
                final personagem = personagens[index];
                return ListTile(
                  leading: Image.network(personagem['image']),
                  title: Text(personagem['name']),
                  subtitle: Text('Status: ${personagem['status']}'),
                );
              },
            ),
    );
  }
}
