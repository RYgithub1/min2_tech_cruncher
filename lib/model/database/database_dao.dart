import 'package:min2_tech_cruncher/model/database/database_table.dart';
import 'package:moor/moor.dart';


part 'database_dao.g.dart';



@UseDao(tables: [DatabaseTables])
class DatabaseDao extends DatabaseAccessor<MyDatabase> with _$DatabaseDaoMixin {

  DatabaseDao(MyDatabase db) : super(db);



  /// [--- データの整合性: data格納時に、dbを一旦clearにしてから、データ放り込み、読み込む ---]
  /// [(1)delete: DBの既存データを、clear消し込む]
  Future clearDB() => delete(databaseTables).go();

  /// [(2)insert: DBへ新規データを、insert入れ込む]
  Future insertDB(List<DatabaseTable> articles) async {
    await batch((batch) {
      batch.insertAll(databaseTables, articles);
    });
  }

  /// [(3)read: DBの保持データを、読み込む]
  Future<List<DatabaseTable>> get articlesFromDB => select(databaseTables).get();



  /// [(1,2,3)]
  Future<List<DatabaseTable>> insertAndReadNeawsFromDB(List<DatabaseTable> articles)
      => transaction(() async {
          await clearDB();
          await insertDB(articles);
          return await articlesFromDB;
      });

}