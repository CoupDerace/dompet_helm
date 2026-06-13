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


}
