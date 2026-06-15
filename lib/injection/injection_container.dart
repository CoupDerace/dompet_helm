import 'package:dompet_helm/core/network/api_client.dart';
import 'package:dompet_helm/data/datasources/local/secure_storage_datasource.dart';
import 'package:dompet_helm/data/datasources/remote/account_remote_datasource.dart';
import 'package:dompet_helm/data/datasources/remote/auth_remote_datasource.dart';
import 'package:dompet_helm/data/datasources/remote/otp_remote_datasource.dart';
import 'package:dompet_helm/data/datasources/remote/payment_remote_datasource.dart';
import 'package:dompet_helm/data/repositories/account_repository_impl.dart';
import 'package:dompet_helm/data/repositories/auth_repository_impl.dart';
import 'package:dompet_helm/data/repositories/otp_repository_impl.dart';
import 'package:dompet_helm/data/repositories/payment_repository_impl.dart';
import 'package:dompet_helm/domain/repositories/account_repository.dart';
import 'package:dompet_helm/domain/repositories/auth_repository.dart';
import 'package:dompet_helm/domain/repositories/otp_repository.dart';
import 'package:dompet_helm/domain/repositories/payment_repository.dart';
import 'package:dompet_helm/domain/usecases/account/get_account_usecase.dart';
import 'package:dompet_helm/domain/usecases/auth/get_me_usecase.dart';
import 'package:dompet_helm/domain/usecases/auth/logout_usecase.dart';
import 'package:dompet_helm/domain/usecases/auth/register_with_otp_usecase.dart';
import 'package:dompet_helm/domain/usecases/auth/send_otp_usecase.dart';
import 'package:dompet_helm/domain/usecases/auth/verify_email_otp_usecase.dart';
import 'package:dompet_helm/domain/usecases/auth/verify_firebase_token_usecase.dart';
import 'package:dompet_helm/domain/usecases/payment/payment_usecase.dart';
import 'package:dompet_helm/presentation/blocs/account/account_bloc.dart';
import 'package:dompet_helm/presentation/blocs/auth/auth_bloc.dart';
import 'package:dompet_helm/presentation/blocs/auth/otp_bloc.dart';
import 'package:dompet_helm/presentation/blocs/payment/payment_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

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

      sl.registerFactory(() => PaymentBloc(
        topup: sl(),
        transfer: sl(),
      ));
}

/// Call this after login to set the JWT token in the API client
void setApiToken(String token) {
  sl<ApiClient>().setAuthToken(token);
}

void clearApiToken() {
  sl<ApiClient>().clearAuthToken();
}