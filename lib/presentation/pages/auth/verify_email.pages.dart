

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
