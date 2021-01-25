

import 'dart:io';
// import 'package:flutter/material.dart';   /// [importすると依存関係が変わりエラー]
import 'package:min2_tech_cruncher/model/database/database_dao.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as pathPath;   /// [tegaki]


part 'database_table.g.dart';




class DatabaseTables extends Table {
  TextColumn get title => text()();
  TextColumn get explanation => text()();
  TextColumn get url => text()();
  TextColumn get networkImage => text()();
  TextColumn get publishedDate => text()();
  TextColumn get content => text()();
}




// @UseMoor(tables: [DatabaseTables])
@UseMoor(tables: [DatabaseTables], daos: [DatabaseDao])
class MyDatabase extends _$MyDatabase{
  MyDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(pathPath.join(dbFolder.path, 'news.db'));
      return VmDatabase(file);
  });
}

