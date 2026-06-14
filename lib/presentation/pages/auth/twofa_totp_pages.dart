

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

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }

   void _onCodeChanged(String v) {
    setState(() { _code = v; _hasError = false; });
    if (v.length == 6) {
      context.read<OtpBloc>().add(OtpVerifyTotp(v));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OtpBloc, OtpState>(
      listener: (context, state) {
        if (state is OtpTotpSetup) {
          setState(() => _step = 'scan');
        } else if (state is OtpTotpEnabled || state is OtpVerified) {
          context.go('/home');
        } else if (state is OtpInvalid) {
          setState(() => _hasError = true);
          Future.delayed(const Duration(milliseconds: 650), () {
            if (mounted) setState(() { _code = ''; _hasError = false; });
          });
        } else if (state is OtpError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: AppColors.red),
          );
        }
      },

      @override
  Widget build(BuildContext context) {
    return BlocListener<OtpBloc, OtpState>(
      listener: (context, state) {
        if (state is OtpTotpSetup) {
          setState(() => _step = 'scan');
        } else if (state is OtpTotpEnabled || state is OtpVerified) {
          context.go('/home');
        } else if (state is OtpInvalid) {
          setState(() => _hasError = true);
          Future.delayed(const Duration(milliseconds: 650), () {
            if (mounted) setState(() { _code = ''; _hasError = false; });
          });
        else if (state is OtpError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: AppColors.red),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(DkgIcons.arrowLeft, color: AppColors.ink),
                  onPressed: () {
                    if (_step == 'code' && widget.mode == 'setup') {
                      setState(() => _step = 'scan');
                    } else {
                      context.go(widget.mode == 'setup' ? '/setup-2fa' : '/login');
                    }
                  },
                ),
              ),
              Expanded(
                child: BlocBuilder<OtpBloc, OtpState>(
                  builder: (context, state) {
                    if (state is OtpLoading && _step == 'loading') {
                      return const Center(child: CircularProgressIndicator(color: AppColors.primary));
                    }
                    if (_step == 'scan' && state is OtpTotpSetup) {
                      return _buildScanStep(state, context);
                    }
                    return _buildCodeStep(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
    );
  }

  Widget _buildScanStep(OtpTotpSetup state, BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(28, 8, 28, 24),
      child: Column(
        children: [
          const FeatureIcon(icon: DkgIcons.smartphone, tone: 'violet', size: 74, iconSize: 36),
          const SizedBox(height: 18),
          const Text('Hubungkan Authenticator',
              style: TextStyle(
                fontFamily: 'PlusJakartaSans',
                fontSize: 23,
                fontWeight: FontWeight.w800,
                color: AppColors.ink,
                letterSpacing: -0.3,
              )),
          const SizedBox(height: 8),
          const Text(
            'Pindai QR ini dengan Google Authenticator, Authy, atau aplikasi sejenis.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.5, color: AppColors.slate500, height: 1.55),
          ),
          const SizedBox(height: 22),
          // QR code from base64
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: AppColors.shadowCard,
              border: Border.all(color: AppColors.line),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.memory(
                Uri.parse(state.entity.qrCode).data!.contentAsBytes(),
                width: 172,
                height: 172,
                errorBuilder: (_, __, ___) => Container(
                  width: 172,
                  height: 172,
                  color: AppColors.bg,
                  child: const Center(child: Icon(Icons.qr_code_rounded, size: 80, color: AppColors.slate400)),
                ),
              ),
            ),
          ),
},