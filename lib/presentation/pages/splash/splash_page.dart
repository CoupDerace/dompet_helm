import 'package:dompet_helm/core/services/deeplink_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_color.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_logo.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthCheckRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          final pending = DeeplinkService.consumePending();

          if (pending != null) {
            context.go('/pay', extra: pending);
          } else {
            context.go('/home');
          }
        } else if (state is AuthUnauthenticated) {
          // Stay on splash to show welcome
        }
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: AppColors.bg, // Abu-abu gelap / dark grey
            image: const DecorationImage(
              image: AssetImage('assets/images/mega_mendung.png'),
              fit: BoxFit.cover,
              opacity: 0.25, // Motif batik mega mendung yang cukup terlihat
            ),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                // Content
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Column(
                    children: [
                      const Spacer(),
                      const AppLogo(size: 92, light: true),
                      const SizedBox(height: 26),
                      const Text(
                        'Helmet Wallet',
                        style: TextStyle(
                          fontFamily: 'PlusJakartaSans',
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Colors.white, // Dikembalikan ke putih
                          letterSpacing: -0.5,
                        ),
                      ),

                      const SizedBox(height: 16),
                      const Text(
                        'Bayar, transfer, dan kelola uang kuliah\ndalam satu aplikasi yang aman.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'PlusJakartaSans',
                          fontSize: 15,
                          color: Colors.white, // Dikembalikan ke putih
                          height: 1.5,
                        ),
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () => context.push('/register'),
                            child: Container(
                              width: double.infinity,
                              height: 54,
                              decoration: BoxDecoration(
                                color: AppColors.amber, // Button amber
                                borderRadius: BorderRadius.circular(16),
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                'Buat Akun Baru',
                                style: TextStyle(
                                  fontFamily: 'PlusJakartaSans',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black, // Teks hitam untuk button ini
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 11),
                          GestureDetector(
                            onTap: () => context.push('/login'),
                            child: Container(
                              width: double.infinity,
                              height: 54,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: AppColors.amber, width: 2), // Outline amber
                                borderRadius: BorderRadius.circular(16),
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                'Masuk ke Akun',
                                style: TextStyle(
                                  fontFamily: 'PlusJakartaSans',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white, // Teks putih sesuai instruksi
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


