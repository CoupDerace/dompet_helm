class AppTheme{
   static ThemeData get light {
    const fontFamily = 'PlusJakartaSans';
    return ThemeData(
        useMaterial3: true,
        fontFamily: fontFamily,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        onPrimary: Colors.white,
        secondary: AppColors.green,
        surface: AppColors.white,
        background: AppColors.bg,
        error: AppColors.red,
      ),
      scaffoldBackgroundColor: AppColors.bg,
    )
  }
}