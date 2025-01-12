import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quickdrop/src/data/datasource/favorite_datasource.dart';
import 'package:quickdrop/src/data/datasource/firebase_auth_datasource.dart';
import 'package:quickdrop/src/data/datasource/home_datasource.dart';
import 'package:quickdrop/src/data/datasource/produt_datasource.dart';
import 'package:quickdrop/src/data/datasource/purchase_datasource.dart';
import 'package:quickdrop/src/data/repository/auth_repository_impl.dart';
import 'package:quickdrop/src/data/repository/favorite_repository_impl.dart';
import 'package:quickdrop/src/data/repository/home_data_repository_impl.dart';
import 'package:quickdrop/src/data/repository/product_detail_repository_impl.dart';
import 'package:quickdrop/src/data/repository/purchase_repository_impl.dart';
import 'package:quickdrop/src/domain/repository/auth_repository.dart';
import 'package:quickdrop/src/domain/repository/favorite_repository.dart';
import 'package:quickdrop/src/domain/repository/home_data_repository.dart';
import 'package:quickdrop/src/domain/repository/product_detail_repository.dart';
import 'package:quickdrop/src/domain/repository/purchase_repository.dart';
import 'package:quickdrop/src/domain/usecase/auth_usecase.dart';
import 'package:quickdrop/src/domain/usecase/favorite_usecase.dart';
import 'package:quickdrop/src/domain/usecase/home_data_usecase.dart';
import 'package:quickdrop/src/domain/usecase/produc_detail_usecase.dart';
import 'package:quickdrop/src/domain/usecase/purshase_usecase.dart';
import 'package:quickdrop/src/presentation/app/cubit/app_cubit.dart';
import 'package:quickdrop/src/presentation/favorites/cubit/favorites_cubit.dart';
import 'package:quickdrop/src/presentation/home/cubit/home_cubit.dart';
import 'package:quickdrop/src/presentation/home/widgets/products/widgets/favorite/cubit/add_favorite_cubit.dart';
import 'package:quickdrop/src/presentation/login/cubit/login_cubit.dart';
import 'package:quickdrop/src/presentation/product/productCubit/product_cubit.dart';
import 'package:quickdrop/src/presentation/signup/cubit/signup_cubit.dart';

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
  sl.registerLazySingleton<HomeDatasource>(
    () => HomeDatasource(),
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
  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => IAuthRepository(
      datasource: sl<FirebaseLoginDatasource>(),
    ),
  );
  sl.registerLazySingleton<HomeDataRepository>(
    () => IHomeDataRepository(
      datasource: sl<HomeDatasource>(),
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
}
