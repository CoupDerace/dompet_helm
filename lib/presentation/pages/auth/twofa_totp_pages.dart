

class TwoFATotpPage extends StatefulWidget {
  final String mode;
  const TwoFATotpPage({super.key, this.mode = 'login'});
  @override
  State<TwoFATotpPage> createState() => _TwoFATotpPageState();
}

class _TwoFATotpPageState extends State<TwoFATotpPage> {
  String _step = 'loading'; // loading, scan, code
  String _code = '';
  bool _hasError = false;
  bool _copied = false;
  int _ttl = 30;
  Timer? _ticker;

  @override
  void initState() {
    super.initState();
    if (widget.mode == 'setup') {
      context.read<OtpBloc>().add(OtpRegisterTotp());
    } else {
      setState(() => _step = 'code');
    }
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() => _ttl = _ttl <= 1 ? 30 : _ttl - 1);
    });
  }