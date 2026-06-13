class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    debugPrint('[BLoC] CREATE  ${bloc.runtimeType}');
  }

  
}
