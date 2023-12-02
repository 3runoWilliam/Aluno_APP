import 'package:path/path.dart';
import 'package:prova_aluno_pdm/domain/Aluno.dart';
import 'package:sqflite/sqflite.dart';

class AlunoHelper {
  static final AlunoHelper _instance = AlunoHelper.internal();
  factory AlunoHelper() => _instance;

  AlunoHelper.internal();

  Database? _db;

  Future<Database?> get db async {
    if (_db == null) _db = await initDb();
    return _db;
  }

  Future<Database> initDb() async {
    String? databasesPath = await getDatabasesPath();
    if (databasesPath == null) databasesPath = "";
    String path = join(databasesPath, "aluno.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
          await db.execute(
              "CREATE TABLE ${Aluno.alunoTable}(${Aluno.alunoid} INTEGER PRIMARY KEY AUTOINCREMENT, "
                  "                             ${Aluno.aNome} TEXT, "
                  "                             ${Aluno.aIdade} INTEGER, "
                  "                             ${Aluno.aCurso} TEXT, "
                  "                             ${Aluno.aEndereco} TEXT, "
                  "                             ${Aluno.aNotas} INTEGER, "
                  "                             ${Aluno.aSituacao} INTEGER) ");
        });
  }

  Future<Aluno> saveAluno(Aluno A) async {
    Database? dbAluno = await db;
    if (dbAluno != null) {
      A.id = await dbAluno.insert(Aluno.alunoTable, A.toMap());
    }
    return A;
  }

  Future<Aluno?> getAluno(int id) async {
    Database? dbAluno = await db;
    if (dbAluno != null) {
      List<Map> maps = await dbAluno.query(Aluno.alunoTable,
          columns: [
            Aluno.alunoid,
            Aluno.aNome,
            Aluno.aIdade,
            Aluno.aCurso,
            Aluno.aEndereco,
            Aluno.aNotas,
            Aluno.aSituacao            
          ],
          where: "${Aluno.alunoid} = ?",
          whereArgs: [id]);
      if (maps.length > 0) {
        return Aluno.fromMap(maps.first);
      } else {
        return null;
      }
    }
    return null;
  }

  Future<int> deleteAluno(int id) async {
    Database? dbAluno = await db;
    if (dbAluno!= null) {
      return await dbAluno.delete(Aluno.alunoTable,
          where: "${Aluno.alunoid} = ?", whereArgs: [id]);
    } else {
      return 0;
    }
  }

  Future<int> updateAluno(Aluno A) async {
    Database? dbAluno = await db;
    if (dbAluno != null) {
      return await dbAluno.update(Aluno.alunoTable, A.toMap(),
          where: "${Aluno.alunoid} = ?", whereArgs: [A.id]);
    } else {
      return 0;
    }
  }

  Future<List> getAll() async {
    Database? dbAluno = await db;
    if (dbAluno != null) {
      List listMap = await dbAluno.query(Aluno.alunoTable);
      List<Aluno> listAluno = [];

      for (Map m in listMap) {
        listAluno.add(Aluno.fromMap(m));
      }
      return listAluno;
    } else {
      return [];
    }
  }
}