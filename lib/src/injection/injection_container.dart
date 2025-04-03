part of 'injection_barrel.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<GoogleSignIn>(
    () => GoogleSignIn(
      scopes: <String>[
        'email',
        'https://www.googleapis.com/auth/userinfo.profile',
      ],
    ),
  );
  // Data sources
  sl.registerLazySingleton<FirebaseLoginDatasource>(
    () => FirebaseLoginDatasource(
      googleSigin: sl<GoogleSignIn>(),
    ),
  );
  sl.registerLazySingleton<IHomeDatasource>(
    () => IHomeDatasource(),
  );
  sl.registerLazySingleton<AddToFavoriteDatasource>(
    () => AddToFavoriteDatasource(),
  );
  sl.registerLazySingleton<ProductDetailDatasource>(
    () => ProductDetailDatasource(),
  );
  sl.registerLazySingleton<PurchaseDatasource>(
    () => PurchaseDatasource(),
  );
  sl.registerLazySingleton<FinancialInformationDatasource>(
    () => FinancialInformationDatasource(),
  );
  sl.registerLazySingleton<MyPurchasesDatasource>(
    () => MyPurchasesDatasource(),
  );
  sl.registerLazySingleton<SearchDatasourceRepository>(
    () => ISearchDatasource(),
  );
  sl.registerLazySingleton<LocationDatasourceRepository>(
    () => ILocationDatasource(),
  );
  sl.registerLazySingleton<AddressLocationRepository>(
    () => IAddressLocationDatasource(),
  );
  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => IAuthRepository(
      datasource: sl<FirebaseLoginDatasource>(),
    ),
  );
  sl.registerLazySingleton<HomeDataRepository>(
    () => IHomeDataRepository(
      datasource: sl<IHomeDatasource>(),
    ),
  );
  sl.registerLazySingleton<FavoriteRepository>(
    () => IFavoriteRepository(datasource: sl<AddToFavoriteDatasource>()),
  );
  sl.registerLazySingleton<ProductDetailRepository>(
    () => IProductDetailRepository(
      datasource: sl<ProductDetailDatasource>(),
    ),
  );
  sl.registerLazySingleton<PurchaseRepository>(
    () => IPurchaseRepository(
      datasource: sl<PurchaseDatasource>(),
    ),
  );
  sl.registerLazySingleton<FinancialInformationRepository>(
    () => IFinancialInformationRepository(
      datasource: sl<FinancialInformationDatasource>(),
    ),
  );
  sl.registerLazySingleton<MyPurchasesRepository>(
    () => IMyPurchasesRepository(
      datasource: sl<MyPurchasesDatasource>(),
    ),
  );
  sl.registerLazySingleton<PurchaseDetailRepository>(
    () => IPurchaseDetailRepository(
      datasource: sl<PurchaseDetailDatasource>(),
    ),
  );
  sl.registerLazySingleton<PurchaseDetailDatasource>(
    () => PurchaseDetailDatasource(),
  );

  sl.registerLazySingleton<SearchRepository>(
    () => ISearchRepository(
      datasource: sl<SearchDatasourceRepository>(),
    ),
  );

  sl.registerLazySingleton<LocationRepository>(
    () => ILocationRespository(
      locationDatasource: sl<LocationDatasourceRepository>(),
      addressDatasource: sl<AddressLocationRepository>(),
    ),
  );

  //use case
  sl.registerLazySingleton<AuthUseCase>(
    () => AuthUseCase(
      repository: sl<AuthRepository>(),
    ),
  );
  sl.registerLazySingleton<HomeDataUsecase>(
    () => HomeDataUsecase(
      repository: sl<HomeDataRepository>(),
    ),
  );
  sl.registerLazySingleton<FavoritesUsecase>(
    () => FavoritesUsecase(
      repository: sl<FavoriteRepository>(),
    ),
  );
  sl.registerLazySingleton<ProducDetailUsecase>(
    () => ProducDetailUsecase(
      repository: sl<ProductDetailRepository>(),
    ),
  );
  sl.registerLazySingleton<PurchaseUsecase>(
    () => PurchaseUsecase(
      repository: sl<PurchaseRepository>(),
    ),
  );
  sl.registerLazySingleton<FinancialInformationUsecase>(
    () => FinancialInformationUsecase(
      repository: sl<FinancialInformationRepository>(),
    ),
  );
  sl.registerLazySingleton<MyPurchasesUsecase>(
    () => MyPurchasesUsecase(
      repository: sl<MyPurchasesRepository>(),
    ),
  );

  sl.registerLazySingleton<PurchaseDetailUsecase>(
    () => PurchaseDetailUsecase(
      repository: sl<PurchaseDetailRepository>(),
    ),
  );

  sl.registerLazySingleton<SearchUsecase>(
    () => SearchUsecase(
      repository: sl<SearchRepository>(),
    ),
  );
  sl.registerLazySingleton<LocationUsecase>(
    () => LocationUsecase(
      repository: sl<LocationRepository>(),
    ),
  );

  //cubits
  sl.registerLazySingleton<AppCubit>(
    () => AppCubit(
      authUseCase: sl<AuthUseCase>(),
    ),
  );
  sl.registerFactory<LoginCubit>(
    () => LoginCubit(
      useCase: sl<AuthUseCase>(),
    ),
  );
  sl.registerFactory<SignupCubit>(
    () => SignupCubit(
      useCase: sl<AuthUseCase>(),
    ),
  );
  sl.registerFactory<HomeCubit>(
    () => HomeCubit(
      usecase: sl<HomeDataUsecase>(),
    ),
  );
  sl.registerFactory<ProductDetailCubit>(
    () => ProductDetailCubit(
      usecase: sl<ProducDetailUsecase>(),
    ),
  );
  sl.registerFactory<AddToFavoriteCubit>(
    () => AddToFavoriteCubit(
      usecase: sl<FavoritesUsecase>(),
    ),
  );
  sl.registerFactory<FavoritesCubit>(
    () => FavoritesCubit(
      usecase: sl<FavoritesUsecase>(),
    ),
  );
  sl.registerFactory<FinancialInformationCubit>(
    () => FinancialInformationCubit(
      usecase: sl<FinancialInformationUsecase>(),
    ),
  );
  sl.registerFactory(
    () => MyPurchasesCubit(
      usecase: sl<MyPurchasesUsecase>(),
    ),
  );

  sl.registerFactory(
    () => PurchaseDetailCubit(
      usecase: sl<PurchaseDetailUsecase>(),
    ),
  );
  sl.registerFactory<SearchCubit>(
    () => SearchCubit(
      usecase: sl<SearchUsecase>(),
    ),
  );
  sl.registerFactory<LocationCubit>(
    () => LocationCubit(
      usecase: sl<LocationUsecase>(),
    ),
  );
  sl.registerFactory<MyLocationsCubit>(
    () => MyLocationsCubit(),
  );
}
