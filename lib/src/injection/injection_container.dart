import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quickdrop/src/data/datasource/favorite_datasource.dart';
import 'package:quickdrop/src/data/datasource/financial_information_datasource.dart';
import 'package:quickdrop/src/feature/auth/data/datasource/auth_datasource.dart';
import 'package:quickdrop/src/feature/home/data/datasource/home_datasource.dart';
import 'package:quickdrop/src/data/datasource/my_purchases_datasource.dart';
import 'package:quickdrop/src/feature/productDetail/data/datasource/produt_datasource.dart';
import 'package:quickdrop/src/data/datasource/purchase_datasource.dart';
import 'package:quickdrop/src/data/datasource/purchase_detail_datasource.dart';
import 'package:quickdrop/src/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:quickdrop/src/data/repository/favorite_repository_impl.dart';
import 'package:quickdrop/src/data/repository/financial_information_repository_impl.dart';
import 'package:quickdrop/src/feature/home/data/repository/home_data_repository_impl.dart';
import 'package:quickdrop/src/data/repository/my_purchases_repository_impl.dart';
import 'package:quickdrop/src/feature/productDetail/data/repository/product_detail_repository_impl.dart';
import 'package:quickdrop/src/data/repository/purchase_detail_repository_impl.dart';
import 'package:quickdrop/src/data/repository/purchase_repository_impl.dart';
import 'package:quickdrop/src/feature/auth/domain/repository/auth_repository.dart';
import 'package:quickdrop/src/domain/repository/favorite_repository.dart';
import 'package:quickdrop/src/domain/repository/financial_information_repository.dart';
import 'package:quickdrop/src/feature/home/domain/repository/home_data_repository.dart';
import 'package:quickdrop/src/domain/repository/my_purchases_repository.dart';
import 'package:quickdrop/src/feature/productDetail/domain/repository/product_detail_repository.dart';
import 'package:quickdrop/src/domain/repository/purchase_detail_repository.dart';
import 'package:quickdrop/src/domain/repository/purchase_repository.dart';
import 'package:quickdrop/src/feature/auth/domain/usecase/auth_usecase.dart';
import 'package:quickdrop/src/domain/usecase/favorite_usecase.dart';
import 'package:quickdrop/src/domain/usecase/financial_information_usecase.dart';
import 'package:quickdrop/src/feature/home/domain/usecase/home_data_usecase.dart';
import 'package:quickdrop/src/domain/usecase/my_purchases_usecase.dart';
import 'package:quickdrop/src/feature/productDetail/domain/usecase/produc_detail_usecase.dart';
import 'package:quickdrop/src/domain/usecase/purchase_detail_usecase.dart';
import 'package:quickdrop/src/domain/usecase/purshase_usecase.dart';
import 'package:quickdrop/src/presentation/app/cubit/app_cubit.dart';
import 'package:quickdrop/src/presentation/favorites/cubit/favorites_cubit.dart';
import 'package:quickdrop/src/presentation/financial_information/cubit/financial_information_cubit.dart';
import 'package:quickdrop/src/feature/home/presentation/cubit/home_cubit.dart';
import 'package:quickdrop/src/feature/home/presentation/widgets/products/widgets/favorite/cubit/add_favorite_cubit.dart';
import 'package:quickdrop/src/feature/auth/presentation/login/cubit/login_cubit.dart';
import 'package:quickdrop/src/presentation/my_purchases/cubit/my_purchases_cubit.dart';
import 'package:quickdrop/src/feature/productDetail/presentation/cubit/product_cubit.dart';
import 'package:quickdrop/src/presentation/purchase_detail/cubit/purchase_detail_cubit.dart';
import 'package:quickdrop/src/feature/auth/presentation/signup/cubit/signup_cubit.dart';

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
}
