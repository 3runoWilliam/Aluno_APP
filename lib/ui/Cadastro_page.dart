import 'package:flutter/material.dart';
import 'package:prova_aluno_pdm/widgets/CustomRatingBar.dart';
import 'package:prova_aluno_pdm/domain/Aluno.dart';
import 'package:prova_aluno_pdm/helpers/Aluno_helper.dart';
import 'package:prova_aluno_pdm/widgets/CustomFormField.dart';

class CadastroPage extends StatelessWidget {
  const CadastroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("MEUS ALUNOS"),
      ),
      body: FormAlunoBody(),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}

class FormAlunoBody extends StatefulWidget {
  const FormAlunoBody({
    super.key,
  });

  @override
  State<FormAlunoBody> createState() => _FormAlunoBodyState();
}

class _FormAlunoBodyState extends State<FormAlunoBody> {
  final _formKey = GlobalKey<FormState>();

  // final alunoIdController = TextEditingController();
  final aNomeController = TextEditingController();
  final aIdadeController = TextEditingController();
  final aEnderecoController = TextEditingController();
  final aNotasController = TextEditingController();
  final aSituacaoController = TextEditingController();

  double rating = 0.0;

  final alunoHelper = AlunoHelper();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Cadastro de alunos",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            CustomFormField(
              controller: aNomeController,
              labelText: "Nome",
              validate_function: (value) {
                if (value == null || value.isEmpty) {
                  return 'Adicione seu nome';
                }
                return null;
              },
            ),
            CustomFormField(
              controller: aIdadeController,
              labelText: "Idade",
              validate_function: (value) {
                if (value == null || value.isEmpty) {
                  return 'Adicione sua idade';
                }
                return null;
              },
            ),
            CustomFormField(
              controller: aEnderecoController,
              labelText: "Endereco",
              keyboard_type: TextInputType.number,
              validate_function: (value) {
                if (value == null || value.isEmpty) {
                  return 'Adicione seu endereco';
                }
                return null;
              },
            ),
            CustomFormField(
              controller: aEnderecoController,
              labelText: "Endereco",
              keyboard_type: TextInputType.number,
              validate_function: (value) {
                if (value == null || value.isEmpty) {
                  return 'Adicione seu endereco';
                }
                return null;
              },
            ),
            CustomFormField(
              controller: aNotasController,
              labelText: "Notas",
              keyboard_type: TextInputType.number,
              validate_function: (value) {
                if (value == null || value.isEmpty) {
                  return 'Adicione suas notas';
                }
                return null;
              },
            ),
            CustomFormField(
              controller: aSituacaoController,
              labelText: "Situacao",
              keyboard_type: TextInputType.number,
              validate_function: (value) {
                if (value == null || value.isEmpty) {
                  return 'Adicione sua situação';
                }
                return null;
              },
            ),
            TextButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  Aluno A = Aluno(
                              aNomeController.text,
                              int.parse(aIdadeController.text).toString(),
                              aEnderecoController.text,
                              int.parse(aNotasController.text).toString(),
                              aSituacaoController.text.toLowerCase() == 'true' ? 1 : 0,
                              rating as bool,
                            );
                    alunoHelper.saveAluno(A);
                  Navigator.pop(context);
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                "Cadastrar",
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
  aNomeController
  aIdadeController
  aEnderecoController
  aNotasController
  aSituacaoController
*/