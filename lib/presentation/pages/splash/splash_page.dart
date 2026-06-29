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
          decoration: const BoxDecoration(color: AppColors.bg), // Abu-abu gelap / dark grey
          child: SafeArea(
            child: Stack(
              children: [
                // Glowing Ambient Motif
                Positioned(
                  top: -150,
                  right: -100,
                  child: Container(
                    width: 400,
                    height: 400,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          AppColors.primary.withValues(alpha: 0.15),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -100,
                  left: -150,
                  child: Container(
                    width: 500,
                    height: 500,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          AppColors.primary.withValues(alpha: 0.10),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
                // Decorative circles / Geometric pattern
                Positioned(
                  top: 80,
                  left: -40,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.white.withValues(alpha: 0.3),
                        width: 2,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 250,
                  right: -50,
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primary.withValues(alpha: 0.2),
                        width: 1,
                      ),
                    ),
                  ),
                ),
                // Content
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Column(
                    children: [
                      const Spacer(),
                      const AppLogo(size: 92, light: true),
                      const SizedBox(height: 26),
                      const Text(
                        'Dompet Kampus',
                        style: TextStyle(
                          fontFamily: 'PlusJakartaSans',
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Colors.white, // Dikembalikan ke putih
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        'GLOBAL',
                        style: TextStyle(
                          fontFamily: 'PlusJakartaSans',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white, // Dikembalikan ke putih
                          letterSpacing: 3,
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


