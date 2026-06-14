

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