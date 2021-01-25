// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_table.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class DatabaseTable extends DataClass implements Insertable<DatabaseTable> {
  final String title;
  final String explanation;
  final String url;
  final String networkImage;
  final String publishedDate;
  final String content;
  DatabaseTable(
      {@required this.title,
      @required this.explanation,
      @required this.url,
      @required this.networkImage,
      @required this.publishedDate,
      @required this.content});
  factory DatabaseTable.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return DatabaseTable(
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      explanation: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}explanation']),
      url: stringType.mapFromDatabaseResponse(data['${effectivePrefix}url']),
      networkImage: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}network_image']),
      publishedDate: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}published_date']),
      content:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}content']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || explanation != null) {
      map['explanation'] = Variable<String>(explanation);
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    if (!nullToAbsent || networkImage != null) {
      map['network_image'] = Variable<String>(networkImage);
    }
    if (!nullToAbsent || publishedDate != null) {
      map['published_date'] = Variable<String>(publishedDate);
    }
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    return map;
  }

  DatabaseTablesCompanion toCompanion(bool nullToAbsent) {
    return DatabaseTablesCompanion(
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      explanation: explanation == null && nullToAbsent
          ? const Value.absent()
          : Value(explanation),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      networkImage: networkImage == null && nullToAbsent
          ? const Value.absent()
          : Value(networkImage),
      publishedDate: publishedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(publishedDate),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
    );
  }

  factory DatabaseTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DatabaseTable(
      title: serializer.fromJson<String>(json['title']),
      explanation: serializer.fromJson<String>(json['explanation']),
      url: serializer.fromJson<String>(json['url']),
      networkImage: serializer.fromJson<String>(json['networkImage']),
      publishedDate: serializer.fromJson<String>(json['publishedDate']),
      content: serializer.fromJson<String>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'title': serializer.toJson<String>(title),
      'explanation': serializer.toJson<String>(explanation),
      'url': serializer.toJson<String>(url),
      'networkImage': serializer.toJson<String>(networkImage),
      'publishedDate': serializer.toJson<String>(publishedDate),
      'content': serializer.toJson<String>(content),
    };
  }

  DatabaseTable copyWith(
          {String title,
          String explanation,
          String url,
          String networkImage,
          String publishedDate,
          String content}) =>
      DatabaseTable(
        title: title ?? this.title,
        explanation: explanation ?? this.explanation,
        url: url ?? this.url,
        networkImage: networkImage ?? this.networkImage,
        publishedDate: publishedDate ?? this.publishedDate,
        content: content ?? this.content,
      );
  @override
  String toString() {
    return (StringBuffer('DatabaseTable(')
          ..write('title: $title, ')
          ..write('explanation: $explanation, ')
          ..write('url: $url, ')
          ..write('networkImage: $networkImage, ')
          ..write('publishedDate: $publishedDate, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      title.hashCode,
      $mrjc(
          explanation.hashCode,
          $mrjc(
              url.hashCode,
              $mrjc(networkImage.hashCode,
                  $mrjc(publishedDate.hashCode, content.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is DatabaseTable &&
          other.title == this.title &&
          other.explanation == this.explanation &&
          other.url == this.url &&
          other.networkImage == this.networkImage &&
          other.publishedDate == this.publishedDate &&
          other.content == this.content);
}

class DatabaseTablesCompanion extends UpdateCompanion<DatabaseTable> {
  final Value<String> title;
  final Value<String> explanation;
  final Value<String> url;
  final Value<String> networkImage;
  final Value<String> publishedDate;
  final Value<String> content;
  const DatabaseTablesCompanion({
    this.title = const Value.absent(),
    this.explanation = const Value.absent(),
    this.url = const Value.absent(),
    this.networkImage = const Value.absent(),
    this.publishedDate = const Value.absent(),
    this.content = const Value.absent(),
  });
  DatabaseTablesCompanion.insert({
    @required String title,
    @required String explanation,
    @required String url,
    @required String networkImage,
    @required String publishedDate,
    @required String content,
  })  : title = Value(title),
        explanation = Value(explanation),
        url = Value(url),
        networkImage = Value(networkImage),
        publishedDate = Value(publishedDate),
        content = Value(content);
  static Insertable<DatabaseTable> custom({
    Expression<String> title,
    Expression<String> explanation,
    Expression<String> url,
    Expression<String> networkImage,
    Expression<String> publishedDate,
    Expression<String> content,
  }) {
    return RawValuesInsertable({
      if (title != null) 'title': title,
      if (explanation != null) 'explanation': explanation,
      if (url != null) 'url': url,
      if (networkImage != null) 'network_image': networkImage,
      if (publishedDate != null) 'published_date': publishedDate,
      if (content != null) 'content': content,
    });
  }

  DatabaseTablesCompanion copyWith(
      {Value<String> title,
      Value<String> explanation,
      Value<String> url,
      Value<String> networkImage,
      Value<String> publishedDate,
      Value<String> content}) {
    return DatabaseTablesCompanion(
      title: title ?? this.title,
      explanation: explanation ?? this.explanation,
      url: url ?? this.url,
      networkImage: networkImage ?? this.networkImage,
      publishedDate: publishedDate ?? this.publishedDate,
      content: content ?? this.content,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (explanation.present) {
      map['explanation'] = Variable<String>(explanation.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (networkImage.present) {
      map['network_image'] = Variable<String>(networkImage.value);
    }
    if (publishedDate.present) {
      map['published_date'] = Variable<String>(publishedDate.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DatabaseTablesCompanion(')
          ..write('title: $title, ')
          ..write('explanation: $explanation, ')
          ..write('url: $url, ')
          ..write('networkImage: $networkImage, ')
          ..write('publishedDate: $publishedDate, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }
}

class $DatabaseTablesTable extends DatabaseTables
    with TableInfo<$DatabaseTablesTable, DatabaseTable> {
  final GeneratedDatabase _db;
  final String _alias;
  $DatabaseTablesTable(this._db, [this._alias]);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _explanationMeta =
      const VerificationMeta('explanation');
  GeneratedTextColumn _explanation;
  @override
  GeneratedTextColumn get explanation =>
      _explanation ??= _constructExplanation();
  GeneratedTextColumn _constructExplanation() {
    return GeneratedTextColumn(
      'explanation',
      $tableName,
      false,
    );
  }

  final VerificationMeta _urlMeta = const VerificationMeta('url');
  GeneratedTextColumn _url;
  @override
  GeneratedTextColumn get url => _url ??= _constructUrl();
  GeneratedTextColumn _constructUrl() {
    return GeneratedTextColumn(
      'url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _networkImageMeta =
      const VerificationMeta('networkImage');
  GeneratedTextColumn _networkImage;
  @override
  GeneratedTextColumn get networkImage =>
      _networkImage ??= _constructNetworkImage();
  GeneratedTextColumn _constructNetworkImage() {
    return GeneratedTextColumn(
      'network_image',
      $tableName,
      false,
    );
  }

  final VerificationMeta _publishedDateMeta =
      const VerificationMeta('publishedDate');
  GeneratedTextColumn _publishedDate;
  @override
  GeneratedTextColumn get publishedDate =>
      _publishedDate ??= _constructPublishedDate();
  GeneratedTextColumn _constructPublishedDate() {
    return GeneratedTextColumn(
      'published_date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _contentMeta = const VerificationMeta('content');
  GeneratedTextColumn _content;
  @override
  GeneratedTextColumn get content => _content ??= _constructContent();
  GeneratedTextColumn _constructContent() {
    return GeneratedTextColumn(
      'content',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [title, explanation, url, networkImage, publishedDate, content];
  @override
  $DatabaseTablesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'database_tables';
  @override
  final String actualTableName = 'database_tables';
  @override
  VerificationContext validateIntegrity(Insertable<DatabaseTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('explanation')) {
      context.handle(
          _explanationMeta,
          explanation.isAcceptableOrUnknown(
              data['explanation'], _explanationMeta));
    } else if (isInserting) {
      context.missing(_explanationMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url'], _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('network_image')) {
      context.handle(
          _networkImageMeta,
          networkImage.isAcceptableOrUnknown(
              data['network_image'], _networkImageMeta));
    } else if (isInserting) {
      context.missing(_networkImageMeta);
    }
    if (data.containsKey('published_date')) {
      context.handle(
          _publishedDateMeta,
          publishedDate.isAcceptableOrUnknown(
              data['published_date'], _publishedDateMeta));
    } else if (isInserting) {
      context.missing(_publishedDateMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content'], _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  DatabaseTable map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DatabaseTable.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DatabaseTablesTable createAlias(String alias) {
    return $DatabaseTablesTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $DatabaseTablesTable _databaseTables;
  $DatabaseTablesTable get databaseTables =>
      _databaseTables ??= $DatabaseTablesTable(this);
  DatabaseDao _databaseDao;
  DatabaseDao get databaseDao =>
      _databaseDao ??= DatabaseDao(this as MyDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [databaseTables];
}
