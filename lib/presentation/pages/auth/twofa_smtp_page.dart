

class TwoFASmtpPage extends StatefulWidget {
  final String mode; // 'login' or 'setup'
  const TwoFASmtpPage({super.key, this.mode = 'login'});
  @override
  State<TwoFASmtpPage> createState() => _TwoFASmtpPageState();
}

class _TwoFASmtpPageState extends State<TwoFASmtpPage> {
  String _code = '';
  bool _hasError = false;
  int _timer = AppConstants.otpResendSeconds;
  Timer? _countdown;

  @override
  void initState() {
    super.initState();
    context.read<OtpBloc>().add(OtpSendEmail());
    _startTimer();
  }

  void _startTimer() {
    _countdown?.cancel();
    setState(() => _timer = AppConstants.otpResendSeconds);
    _countdown = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_timer <= 0) t.cancel();
      else setState(() => _timer--);
    });
  }

  @override
  void dispose() {
    _countdown?.cancel();
    super.dispose();
  }

  void _onCodeChanged(String v) {
    setState(() { _code = v; _hasError = false; });
    if (v.length == 6) {
      context.read<OtpBloc>().add(OtpConfirm(code: v, otpType: AppConstants.otpTypeEmail));
    }
  }

  override
  Widget build(BuildContext context) {
    return BlocListener<OtpBloc, OtpState>(
      listener: (context, state) {
        if (state is OtpVerified) {
          if (widget.mode == 'setup') {
            context.go('/home');
          } else {
            context.read<AuthBloc>().add(AuthCheckRequested());
            context.go('/home');
          }
    )}