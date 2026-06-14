

class TwoFASmtpPage extends StatefulWidget {
  final String mode; // 'login' or 'setup'
  const TwoFASmtpPage({super.key, this.mode = 'login'});
  @override
  State<TwoFASmtpPage> createState() => _TwoFASmtpPageState();
}

class _TwoFASmtpPageState extends State<TwoFASmtpPage> {
  String _code = '';
  bool _hasError = false;
  

