

class TwoFANotifPage extends StatefulWidget {
  final String mode;
  const TwoFANotifPage({super.key, this.mode = 'login'});
  @override
  State<TwoFANotifPage> createState() => _TwoFANotifPageState();
}

class _TwoFANotifPageState extends State<TwoFANotifPage> {
  String _phase = 'waiting'; // waiting, approved

  @override
  void initState() {
    super.initState();
    context.read<OtpBloc>().add(OtpSendFirebase());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OtpBloc, OtpState>(
      listener: (context, state) {
        if (state is OtpVerified) {
          setState(() => _phase = 'approved');
          Future.delayed(const Duration(milliseconds: 900), () {
            if (mounted) context.go('/home');
          });
        } else if (state is OtpError) {
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
                  icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.ink),
                  onPressed: () => context.go(widget.mode == 'setup' ? '/setup-2fa' : '/login'),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(28, 8, 28, 28),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      FeatureIcon(
                        icon: _phase == 'approved'
                            ? Icons.verified_user_outlined
                            : Icons.notifications_outlined,
                        tone: 'green',
                        size: 82,
                        iconSize: 40,
                      ),
                      const SizedBox(height: 26),
                      Text(
                        _phase == 'approved' ? 'Disetujui!' : 'Cek notifikasi kamu',
                        style: const TextStyle(
                          fontFamily: 'PlusJakartaSans',
                          fontSize: 23,
                          fontWeight: FontWeight.w800,
                          color: AppColors.ink,
                          letterSpacing: -0.3,
                        ),
                        textAlign: TextAlign.center,
                      ),