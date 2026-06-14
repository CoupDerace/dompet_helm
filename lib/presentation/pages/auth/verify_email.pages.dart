

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});
  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  String _code = '';
  int _timer = 60;
  bool _hasError = false;
  bool _loading = false;
  String? _errorMessage;
  Timer? _countdown;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _countdown?.cancel();
    setState(() => _timer = 60);
    _countdown = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_timer <= 0) {
        t.cancel();
      } else {
        setState(() => _timer--);
      }
    });
  }

  @override
  void dispose() {
    _countdown?.cancel();
    super.dispose();
  }