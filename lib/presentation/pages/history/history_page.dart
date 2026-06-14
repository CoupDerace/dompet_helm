

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});
  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  String _tab = 'all';

  @override
  void initState() {
    super.initState();
    context.read<AccountBloc>().add(AccountLoadRequested());
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).padding.top + 12, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Riwayat',
                    style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: AppColors.ink,
                      letterSpacing: -0.3,
                    )),
                const SizedBox(height: 16),
                Row(
                  children: [['all', 'Semua'], ['out', 'Pengeluaran'], ['in', 'Pemasukan']]
                      .map((t) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: GestureDetector(
                              onTap: () => setState(() => _tab = t[0]),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 150),
                                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                                decoration: BoxDecoration(
                                  color: _tab == t[0] ? AppColors.primary : AppColors.bg,
                                  borderRadius: BorderRadius.circular(20),
                                ),
  }