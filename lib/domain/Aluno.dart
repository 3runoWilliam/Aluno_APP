
class Aluno {

  static const String alunoTable = "aluno_Table";
  static const String alunoid = "id";
  static const String aNome = "nome";
  static const String aIdade = "idade";
  static const String aCurso = "curso";
  static const String aEndereco = "endereco";
  static const String aNotas = "notas";
  static const String aSituacao = "situacao";

  int id = 0;
  String nome = '';
  String curso = '';
  String idade = '';
  String endereco = '';
  int notas = 0;
  bool situacao = false;

  Aluno(this.nome, this.curso, this.idade, this.endereco, this.notas, this.situacao);

  Aluno.fromMap(Map map) {
    id = map[alunoid];
    nome = map[aNome];
    idade = map[aIdade];
    curso = map[aCurso];
    endereco = map[aEndereco];
    notas = map[aNotas];
    situacao = map[aSituacao];
  }

  Map<String, dynamic> toMap() {
    return {
      aNome: nome,
      aIdade: idade,
      aCurso: curso,
      aEndereco: endereco,
      aNotas: notas,
      aSituacao: situacao ? 1 : 0
    };
  }

  @override
  String toString() {
    return 'Aluno(nome: $nome, curso: $curso, idade: $idade, endereco: $endereco, notas: $notas, situacao: $situacao)';
  }
}
