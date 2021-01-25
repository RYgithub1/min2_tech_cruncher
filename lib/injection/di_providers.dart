import 'package:provider/provider.dart';
import 'package:min2_tech_cruncher/model/api/api_service.dart';  /// [tegaki]
import 'package:min2_tech_cruncher/model/repository/headline_repository.dart';
import 'package:min2_tech_cruncher/model/database/database_dao.dart';
import 'package:min2_tech_cruncher/model/database/database_table.dart';    /// [tegaki]
import 'package:min2_tech_cruncher/viewmodel/headline_viewmodel.dart';
import 'package:provider/single_child_widget.dart';   /// [tegaki]



List<SingleChildWidget> globalProviders = [
    ...independentModels,
    ...dependentModels,
    ...viewModels,
];






/// [依存しないもの、よりprimitiveなLayer、apiやdb。通常provider通り記載]
List<SingleChildWidget> independentModels = [
    Provider<ApiService>(
      create: (_) => ApiService.create(),
      dispose: (_, apiService) => apiService.dispose(),
    ),
    Provider<MyDatabase>(
      create: (_) => MyDatabase(),
      dispose: (_, db) => db.close(),
    ),
];


/// [依存するもの、apiやdbを使いたい側のクラス。ProxyProviderでDI]
List<SingleChildWidget> dependentModels = [
    /// [MyDatabase <- DatabaseDaoが使いたい]
    ProxyProvider<MyDatabase, DatabaseDao>(
      update: (_, db, dao) => DatabaseDao(db),
    ),
    /// [DatabaseDaoとApiService <- HeadlineRepositoryが使いたい]
    ProxyProvider2<DatabaseDao, ApiService, HeadlineRepository>(
      update: (_, dao, apiService, repository) => HeadlineRepository(dao: dao, apiService: apiService),
    ),
];
/// [------------------> Repositoryの設定]




/// [いつも通りViewModelを最後に記載]
List<SingleChildWidget> viewModels = [
    ChangeNotifierProvider<HeadlineViewModel>(
      create: (context) => HeadlineViewModel(
        /// [NewsListViewModel({})でデータをpassしているのでnamed_parameterへconvert]
        /// [DI向けのnamedParaゆえ<TA>=<HeadlineRepository>]
        headlineRepository: Provider.of<HeadlineRepository>(context, listen: false),
      ),
    ),
];
/// [------------------> ViewModelの設定]

