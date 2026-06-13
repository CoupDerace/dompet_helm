

const _twoFaMethods = [
  _TwoFaMethod(
    key: 'smtp',
    icon: DkgIcons.mail,
    tone: 'blue',
    title: 'Email OTP (SMTP)',
    desc: 'Kode 6 digit dikirim ke email kamu setiap kali masuk.',
    route: '/2fa/smtp',
  ),
  _TwoFaMethod(
    key: 'totp',
    icon: DkgIcons.smartphone,
    tone: 'violet',
    title: 'Authenticator (TOTP)',
    desc: 'Kode berubah tiap 30 detik di Google Authenticator / Authy.',
    route: '/2fa/totp',
    badge: 'Paling aman',
  ),
  _TwoFaMethod(
    key: 'notif',
    icon: DkgIcons.bell,
    tone: 'green',
    title: 'Notifikasi OTP',
    desc: 'Setujui permintaan masuk lewat notifikasi di HP kamu.',
    route: '/2fa/notif',
  ),
];

class _TwoFaMethod {
  final String key;
  final IconData icon;
  final String tone;
  final String title;
  final String desc;
  final String route;
  final String? badge;
  const _TwoFaMethod({
    required this.key,
    required this.icon,
    required this.tone,
    required this.title,
    required this.desc,
    required this.route,
    this.badge,
  });
}

