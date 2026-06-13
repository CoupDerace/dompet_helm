final sl = GetIt.instance;

Future<void> init() async {
  // External
  const secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  // Core
  sl.registerLazySingleton<ApiClient>(() => ApiClient());

  // Local Data Source
  sl.registerLazySingleton<SecureStorageDatasource>(
    () => SecureStorageDatasourceImpl(secureStorage),
  );

  // Remote Data Source
  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(sl()),
  );
  sl.registerLazySingleton<OtpRemoteDatasource>(
    () => OtpRemoteDatasourceImpl(sl()),
  );
  sl.registerLazySingleton<AccountRemoteDatasource>(
    () => AccountRemoteDatasourceImpl(sl()),
  );
  sl.registerLazySingleton<PaymentRemoteDatasource>(
    () => PaymentRemoteDatasourceImpl(sl()),
  );

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl(), sl()),
  );
  sl.registerLazySingleton<OtpRepository>(() => OtpRepositoryImpl(sl(), sl()));
  sl.registerLazySingleton<AccountRepository>(
    () => AccountRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<PaymentRepository>(
    () => PaymentRepositoryImpl(sl()),
  );

  // Usecase - Auth
  sl.registerLazySingleton(() => VerifyFirebaseTokenUsecase(sl()));
  sl.registerLazySingleton(() => RegisterWithOtpUsecase(sl()));
  sl.registerLazySingleton(() => VerifyEmailOtpUsecase(sl()));
  sl.registerLazySingleton(() => GetMeUsecase(sl()));
  sl.registerLazySingleton(() => LogoutUsecase(sl()));
  sl.registerLazySingleton(() => SendOtpFirebaseUsecase(sl()));
  sl.registerLazySingleton(() => SendOtpEmailUsecase(sl()));
  sl.registerLazySingleton(() => ConfirmOtpUsecase(sl()));
  sl.registerLazySingleton(() => RegisterTotpUsecase(sl()));
  sl.registerLazySingleton(() => VerifyTotpUsecase(sl()));

  // Use Cases — Account
  sl.registerLazySingleton(() => GetAccountUsecase(sl()));
  sl.registerLazySingleton(() => GetTransactionsUsecase(sl()));

  // Use Cases — Payment
  sl.registerLazySingleton(() => TopupUsecase(sl()));
  sl.registerLazySingleton(() => TransferUsecase(sl()));

  // BLoCs
  sl.registerFactory(() => AuthBloc(
        verifyToken: sl(),
        getMe: sl(),
        logout: sl(),
        authRepo: sl(),
      ));

      sl.registerFactory(() => OtpBloc(
        sendFirebase: sl(),
        sendEmail: sl(),
        confirm: sl(),
        registerTotp: sl(),
        verifyTotp: sl(),
      ));

      sl.registerFactory(() => AccountBloc(
        getAccount: sl(),
        getTransactions: sl(),
      ));
}
