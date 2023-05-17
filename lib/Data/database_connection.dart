
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'data_constantes.dart';

class DatabaseConnection {
  static Future<Database> getDatabase() async {
    // await deleteDatabase(
    //   join(await getDatabasesPath(),DATABASE_NAME),
    // );
    return openDatabase(
      join(await getDatabasesPath(), DATABASE_NAME),
      onCreate: (db, version) async {
        await db.execute(CREATE_SENHA_TABLE_SCRIPT);
        await db.execute(CREATE_PERFIL_TABLE_SCRIPT);
        await db.execute(CREATE_CARTAO_TABLE_SCRIPT);
        await db.rawInsert(''' insert into $PERFIL_TABLE_NAME (
          $PERFIL_COLUMN_NOME,
          $PERFIL_COLUMN_EMAIL,
          $PERFIL_COLUMN_SENHA)

        VALUES(
          'admin', 'admin@admin', '123'  
        )''');
      },
      version: 1,
    );
  }
}
