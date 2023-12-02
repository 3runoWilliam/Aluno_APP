import 'package:flutter/material.dart';
import 'package:prova_aluno_pdm/domain/Aluno.dart';
import 'package:prova_aluno_pdm/helpers/Aluno_helper.dart';
import 'package:prova_aluno_pdm/ui/Cadastro_page.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text("Meus alunos"),
    ),
    body: Column(
      children: [
        const ListBody(),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CadastroPage(),
            ),
          ),
          child: Text("Cadastrar Livro"),
          style: TextButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            minimumSize: const Size(150, 50),
          ),
        ),
      ],
    ),
    backgroundColor: Theme.of(context).colorScheme.background,
  );
  }
}


class ListBody extends StatefulWidget {
  const ListBody({super.key});

  @override
  State<ListBody> createState() => _ListBodyState();
}

class _ListBodyState extends State<ListBody> {
  final alunoHelper = AlunoHelper();
  late Future<List> aluno;

  @override
  void initState() {
    super.initState();
    aluno = alunoHelper.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: aluno,
      builder: (context, snapshot) {
        return snapshot.hasData  ? ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, i) {
                  return ListItem(aluno: snapshot.data![i]);
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}

class ListItem extends StatelessWidget {
  final Aluno aluno;
  const ListItem({super.key, required this.aluno});

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Single Tap"),
          ));
        },
        onLongPress: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Long Press"),
          ));
        },
        child: ListTile(
        title: Text(aluno.nome),
    ),
      );;
  }
}
