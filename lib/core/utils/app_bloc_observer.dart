class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    debugPrint('[BLoC] CREATE  ${bloc.runtimeType}');
  }

   @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    debugPrint('[BLoC] EVENT   ${bloc.runtimeType} → $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onC
    hange(bloc, change);
    debugPrint('[BLoC] STATE   ${bloc.runtimeType}\n'
        '         current : ${change.currentState.runtimeType}\n'
        '         next    : ${change.nextState.runtimeType}');
  }

  
}
