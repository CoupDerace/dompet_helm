import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../domain/entities/transaction_entity.dart';
import '../../blocs/account/account_bloc.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../../widgets/app_avatar.dart';
import '../../widgets/app_logo.dart';
import '../../widgets/feature_icon.dart';
import '../../widgets/transaction_row.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _hideBalance = false;

  @override
  void initState() {
    super.initState();
    context.read<AccountBloc>().add(AccountLoadRequested());
    context.read<AuthBloc>().add(AuthCheckRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        final user = authState is AuthAuthenticated ? authState.user : null;
        final firstName = user?.firstName ?? 'Kamu';
        final fullName = user?.name ?? 'User';

        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            decoration: const BoxDecoration(
              color: AppColors.bg,
            ),
            child: BlocBuilder<AccountBloc, AccountState>(
              builder: (context, accountState) {
                final balance = accountState is AccountLoaded
                    ? accountState.account.balance
                    : 0.0;
                final txns = accountState is AccountLoaded
                    ? accountState.transactions
                    : <TransactionEntity>[];
                final loading = accountState is AccountLoading;

                return RefreshIndicator(
                  onRefresh: () async => context.read<AccountBloc>().add(
                    AccountRefreshRequested(),
                  ),
                  color: AppColors.primary,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        // Gradient header
                        _buildHeader(fullName, firstName, balance, loading),

                        // Body - grouped for translation
                        Transform.translate(
                          offset: const Offset(0, -32),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: _buildMainActions(),
                              ),
                              const SizedBox(height: 24),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: _buildFeatureGrid(),
                              ),
                              const SizedBox(height: 24),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: _buildPointsRow(),
                              ),
                              const SizedBox(height: 16),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: _buildDeeplinkBanner(),
                              ),
                              const SizedBox(height: 24),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: _buildTransactions(txns),
                              ),
                              const SizedBox(height: 24),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(
    String fullName,
    String firstName,
    double balance,
    bool loading,
  ) {
    return Stack(
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(36),
              bottomRight: Radius.circular(36),
            ),
            child: Container(
              color: AppColors.bg,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/mega_mendung.png',
                    fit: BoxFit.cover,
                    opacity: const AlwaysStoppedAnimation(0.25),
                  ),
                  Positioned(
                    right: -30,
                    top: -20,
                    child: Transform.rotate(
                      angle: -0.25,
                      child: Icon(
                        Icons.sports_motorsports_rounded,
                        color: AppColors.amber.withValues(alpha: 0.15),
                        size: 260,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(
            20,
            MediaQuery.of(context).padding.top + 12,
            20,
            68,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Helmet Wallet',
                style: TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: -0.5,
                ),
              ),
              Stack(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.white.withValues(alpha: 0.18),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.notifications_outlined,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 11,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: AppColors.amber,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.white, width: 2),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              AppAvatar(
                name: fullName,
                size: 48,
                bg: Colors.white.withValues(alpha: 0.25),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Selamat datang,',
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontSize: 13,
                        color: Colors.white70,
                      ),
                    ),
                    Text(
                      firstName,
                      style: const TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Total Saldo',
            style: TextStyle(
              fontFamily: 'PlusJakartaSans',
              fontSize: 13.5,
              color: Colors.white70,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _hideBalance
                    ? CurrencyFormatter.maskBalance()
                    : CurrencyFormatter.format(balance),
                style: const TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: -1.0,
                ),
              ),
              const SizedBox(width: 14),
              GestureDetector(
                onTap: () => setState(() => _hideBalance = !_hideBalance),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    _hideBalance
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ],
);
}

  Widget _buildMainActions() {
    final actions = [
      {
        'icon': Icons.account_balance_wallet_outlined,
        'label': 'Top Up',
        'tone': 'amber',
        'route': '/topup',
      },
      {
        'icon': Icons.swap_horiz_rounded,
        'label': 'Transfer',
        'tone': 'amber',
        'route': '/transfer',
      },
      {
        'icon': Icons.qr_code_scanner_rounded,
        'label': 'Bayar',
        'tone': 'amber',
        'route': '/payment',
      },
      {
        'icon': Icons.payments_outlined,
        'label': 'Tarik',
        'tone': 'amber',
        'route': '/topup',
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: AppColors.shadowCard,
      ),
      child: Row(
        children: actions.map((a) {
          return Expanded(
            child: GestureDetector(
              onTap: () => context.go(a['route'] as String),
              child: Column(
                children: [
                  FeatureIcon(
                    icon: a['icon'] as IconData,
                    tone: a['tone'] as String,
                    size: 54,
                    iconSize: 26,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    a['label'] as String,
                    style: const TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: AppColors.ink,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildFeatureGrid() {
    final features = [
      {'icon': Icons.local_parking_rounded, 'label': 'Parkir', 'tone': 'amber'},
      {'icon': Icons.local_gas_station_rounded, 'label': 'Bensin', 'tone': 'amber'},
      {'icon': Icons.handyman_rounded, 'label': 'Servis', 'tone': 'amber'},
      {'icon': Icons.local_car_wash_rounded, 'label': 'Cuci Motor', 'tone': 'amber'},
      {'icon': Icons.health_and_safety_outlined, 'label': 'Asuransi', 'tone': 'amber'},
      {'icon': Icons.two_wheeler_rounded, 'label': 'Apparel', 'tone': 'amber'},
      {'icon': Icons.toll_rounded, 'label': 'E-Toll', 'tone': 'amber'},
      {'icon': Icons.more_horiz_rounded, 'label': 'Lainnya', 'tone': 'amber'},
    ];

    return GridView.count(
      padding: EdgeInsets.zero,
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 14,
      crossAxisSpacing: 14,
      childAspectRatio: 1.05,
      children: features.map((f) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(22),
              boxShadow: AppColors.shadowSoft,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FeatureIcon(
                  icon: f['icon'] as IconData,
                  tone: f['tone'] as String,
                  size: 46,
                  iconSize: 22,
                ),
                const SizedBox(height: 10),
                Text(
                  f['label'] as String,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                    color: AppColors.slate400,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPointsRow() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: AppColors.shadowSoft,
            ),
            child: Row(
              children: [
                const FeatureIcon(
                  icon: Icons.star_outline_rounded,
                  tone: 'amber',
                  size: 40,
                  iconSize: 20,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Helmet Poin',
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontSize: 12,
                        color: AppColors.slate500,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      '1.250',
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontSize: 15.5,
                        fontWeight: FontWeight.w800,
                        color: AppColors.ink,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: AppColors.shadowSoft,
            ),
            child: Row(
              children: [
                const FeatureIcon(
                  icon: Icons.badge_outlined,
                  tone: 'amber',
                  size: 40,
                  iconSize: 20,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'SIM Digital',
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontSize: 12,
                        color: AppColors.slate500,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Aktif',
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontSize: 15.5,
                        fontWeight: FontWeight.w800,
                        color: AppColors.ink,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDeeplinkBanner() {
    return GestureDetector(
      onTap: () => context.go('/merchant'),
      child: Container(
        height: 104,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          image: const DecorationImage(
            image: AssetImage('assets/images/banner_merchant.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
          ),
        ),
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.white.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.link_rounded,
                size: 24,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Coba bayar dari toko online',
                    style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Simulasi checkout via DKG',
                    style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontSize: 13,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              size: 22,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactions(List<TransactionEntity> txns) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Transaksi terakhir',
              style: TextStyle(
                fontFamily: 'PlusJakartaSans',
                fontSize: 16.5,
                fontWeight: FontWeight.w700,
                color: AppColors.ink,
              ),
            ),
            GestureDetector(
              onTap: () => context.go('/history'),
              child: const Text(
                'Lihat semua',
                style: TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: AppColors.shadowSoft,
          ),
          child: txns.isEmpty
              ? Padding(
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    children: [
                      Image.asset('assets/images/empty_tx.png', height: 110),
                      const SizedBox(height: 16),
                      const Text(
                        'Belum ada transaksi',
                        style: TextStyle(
                          color: AppColors.slate500,
                          fontSize: 15,
                          fontFamily: 'PlusJakartaSans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Lakukan transaksi pertamamu sekarang',
                        style: TextStyle(
                          color: AppColors.slate400,
                          fontSize: 13,
                          fontFamily: 'PlusJakartaSans',
                        ),
                      ),
                    ],
                  ),
                )
              : Column(
                  children: txns
                      .take(4)
                      .toList()
                      .asMap()
                      .entries
                      .map(
                        (e) => TransactionRow(txn: e.value, divider: e.key > 0),
                      )
                      .toList(),
                ),
        ),
      ],
    );
  }
}
