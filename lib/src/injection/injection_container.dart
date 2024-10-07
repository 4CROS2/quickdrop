import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:quickdrop/src/data/datasource/backend.dart';
import 'package:quickdrop/src/data/datasource/firebase_login_datasource.dart';
import 'package:quickdrop/src/data/datasource/home_datasource.dart';
import 'package:quickdrop/src/data/repository/home_data_repository_impl.dart';
import 'package:quickdrop/src/data/repository/login_repository_impl.dart';
import 'package:quickdrop/src/domain/repository/auth_repository.dart';
import 'package:quickdrop/src/domain/repository/home_data_repository.dart';
import 'package:quickdrop/src/domain/usecase/auth_usecase.dart';
import 'package:quickdrop/src/domain/usecase/home_data_usecase.dart';
import 'package:quickdrop/src/prensentation/app/cubit/app_cubit.dart';
import 'package:quickdrop/src/prensentation/home/cubit/home_cubit.dart';
import 'package:quickdrop/src/prensentation/login/cubit/login_cubit.dart';
import 'package:quickdrop/src/prensentation/product/productCubit/product_cubit.dart';
import 'package:quickdrop/src/prensentation/product/purchaseCubit/purchase_cubit.dart';
import 'package:quickdrop/src/prensentation/signup/cubit/signup_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // Firebase
  sl.registerLazySingleton<FirebaseAuth>(
    () => FirebaseAuth.instance,
  );
  sl.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );
  // Data sources
  sl.registerLazySingleton<FirebaseLoginDatasource>(
    () => FirebaseLoginDatasource(
      firebaseAuth: sl<FirebaseAuth>(),
      firestore: sl<FirebaseFirestore>(),
    ),
  );
  sl.registerLazySingleton<Backend>(
    () => Backend(
      firebaseAuth: sl<FirebaseAuth>(),
    ),
  );
  sl.registerLazySingleton<HomeDatasource>(
    () => HomeDatasource(),
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
  //cubits
  sl.registerFactory<AppCubit>(
    () => AppCubit(
      firebaseAuth: sl<FirebaseAuth>(),
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
  sl.registerFactory<ProductCubit>(
    () => ProductCubit(),
  );
  sl.registerFactory<PurchaseCubit>(
    () => PurchaseCubit(),
  );
}
