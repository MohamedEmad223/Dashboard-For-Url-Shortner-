import 'package:dashboard_for_url_shortner/config/cache/cache_helper.dart';
import 'package:dashboard_for_url_shortner/config/router/app_router.dart';
import 'package:dashboard_for_url_shortner/config/router/routes.dart';
import 'package:dashboard_for_url_shortner/core/dependancy_injection/di.dart';
import 'package:dashboard_for_url_shortner/core/networking/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features/home/presentation/screens/home_screen.dart';
import 'features/links/presentation/screens/links_screen.dart';
import 'features/qr/presentation/screen/qr_screen.dart';
import 'features/settings/presentation/screens/settings_screen.dart';
import 'features/states/presentation/screens/states_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  final token =
      await CacheHelper.getSecureData(key: ApiConstants.accessToken);

  final initialRoute =
      token != null ? Routes.botNavBar : Routes.loginScreen;
  runApp(JocApp(initialRoute: initialRoute));
}

class JocApp extends StatelessWidget {
  const JocApp({super.key, this.initialRoute});

  final String? initialRoute;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // Design canvas = 390 × 844 (iPhone 14 logical pixels)
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        title: 'جو أكاديمي',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter().generateRoute,
        theme: ThemeData(
          useMaterial3: true,
          textTheme: GoogleFonts.cairoTextTheme(),
          scaffoldBackgroundColor: const Color(0xFFF4F7FA),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF0B8A9A),
            brightness: Brightness.light,
          ),
        ),
        initialRoute: initialRoute,
        home: child,
      ),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  Widget _buildScreen(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const LinksScreen();
      case 2:
        return const QrScreen();
      case 3:
        return const StatsScreen();
      case 4:
        return const SettingsScreen();
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreen(_currentIndex),
      bottomNavigationBar: _BottomNav(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
      ),
    );
  }
}



class _BottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _BottomNav({required this.currentIndex, required this.onTap});

  static const _items = [
    {'icon': Icons.home_rounded, 'label': 'Home'},
    {'icon': Icons.link_rounded, 'label': 'Links'},
    {'icon': Icons.qr_code_rounded, 'label': 'QR'},
    {'icon': Icons.bar_chart_rounded, 'label': 'Stats'},
    {'icon': Icons.settings_rounded, 'label': 'Settings'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 20.r,
            offset: const Offset(0, -4),
          ),
        ],
        borderRadius:  BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _items.asMap().entries.map((e) {
              final i = e.key;
              final item = e.value;
              return _NavItem(
                icon: item['icon'] as IconData,
                label: item['label'] as String,
                isSelected: currentIndex == i,
                onTap: () => onTap(i),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 180));
    _scale = Tween<double>(begin: 1.0, end: 1.18).animate(
        CurvedAnimation(parent: _ctrl, curve: Curves.elasticOut));

    if (widget.isSelected) _ctrl.forward();
  }

  @override
  void didUpdateWidget(_NavItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSelected && !oldWidget.isSelected) {
      _ctrl.forward(from: 0);
    } else if (!widget.isSelected && oldWidget.isSelected) {
      _ctrl.reverse();
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const teal = Color(0xFF0B8A9A);
    const gray = Color(0xFF8A94A6);

    return InkWell(
      onTap: widget.onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      child: SizedBox(
        width: 72.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ScaleTransition(
              scale: _scale,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOutCubic,
                padding:
                 EdgeInsets.symmetric(horizontal: 16.w, vertical: 7.h),
                decoration: BoxDecoration(
                  color: widget.isSelected
                      ? const Color(0xFFE0F5F7)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Icon(
                  widget.icon,
                  size: 22.r,
                  color: widget.isSelected ? teal : gray,
                ),
              ),
            ),
             SizedBox(height: 3.h),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: GoogleFonts.cairo(
                fontSize: 11.sp,
                fontWeight: widget.isSelected
                    ? FontWeight.w700
                    : FontWeight.w400,
                color: widget.isSelected ? teal : gray,
              ),
              child: Text(widget.label),
            ),
          ],
        ),
      ),
    );
  }
}