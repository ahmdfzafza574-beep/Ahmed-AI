import 'package:flutter/material.dart';

void main() {
  runApp(const NoorAlQuranApp());
}

const Color greenDark = Color(0xFF103D2D);
const Color greenMain = Color(0xFF176447);
const Color greenLight = Color(0xFFEAF4ED);
const Color gold = Color(0xFFD8B56D);
const Color background = Color(0xFFF8F7F0);
const Color textDark = Color(0xFF18392B);

class NoorAlQuranApp extends StatelessWidget {
  const NoorAlQuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'نور القرآن al',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: greenMain,
          primary: greenMain,
          secondary: gold,
          surface: Colors.white,
        ),
        fontFamily: 'Cairo',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<String> titles = [
    'الرئيسية',
    'المصحف الشريف',
    'التفسير الذكي',
    'المفضلة',
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: selectedIndex,
            children: [
              buildHome(),
              const QuranScreen(),
              const TafsirScreen(),
              const FavoritesScreen(),
            ],
          ),
        ),
        bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.white,
          indicatorColor: greenLight,
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'الرئيسية',
            ),
            NavigationDestination(
              icon: Icon(Icons.menu_book_outlined),
              selectedIcon: Icon(Icons.menu_book),
              label: 'المصحف',
            ),
            NavigationDestination(
              icon: Icon(Icons.auto_awesome_outlined),
              selectedIcon: Icon(Icons.auto_awesome),
              label: 'التفسير',
            ),
            NavigationDestination(
              icon: Icon(Icons.bookmark_border),
              selectedIcon: Icon(Icons.bookmark),
              label: 'المفضلة',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHome() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(),
          const SizedBox(height: 24),
          buildWelcomeCard(),
          const SizedBox(height: 26),
          const SectionTitle(
            title: 'ابدأ رحلتك مع القرآن',
            subtitle: 'اجعل لروحك نصيبًا من نور القرآن',
          ),
          const SizedBox(height: 16),
          buildFeatureGrid(),
          const SizedBox(height: 26),
          buildLastReadingCard(),
          const SizedBox(height: 26),
          const SectionTitle(
            title: 'آية للتدبر',
            subtitle: 'تذكير يومي بنور القرآن',
          ),
          const SizedBox(height: 14),
          buildVerseCard(),
          const SizedBox(height: 24),
          const Center(
            child: Text(
              'اللهم اجعل القرآن ربيع قلوبنا',
              style: TextStyle(
                color: greenMain,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Row(
      children: [
        Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            color: greenDark,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: gold, width: 1.5),
          ),
          child: const Icon(
            Icons.menu_book_rounded,
            color: gold,
            size: 30,
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'نور القرآن DI',
                style: TextStyle(
                  color: greenDark,
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 3),
              Text(
                'رفيقك في تلاوة القرآن وتدبره',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            showMessage('ستتوفر الإعدادات في مرحلة قادمة');
          },
          icon: const Icon(
            Icons.settings_outlined,
            color: greenDark,
          ),
          tooltip: 'الإعدادات',
        ),
      ],
    );
  }

  Widget buildWelcomeCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [greenDark, greenMain],
        ),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: gold.withValues(alpha: 0.7)),
        boxShadow: [
          BoxShadow(
            color: greenDark.withValues(alpha: 0.13),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.auto_awesome, color: gold, size: 21),
              SizedBox(width: 8),
              Text(
                'نورٌ لقلبك',
                style: TextStyle(
                  color: gold,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'بسم الله الرحمن الرحيم',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'اقرأ، وتدبر، وتعلّم معاني آيات القرآن الكريم.',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.85),
              fontSize: 14,
              height: 1.8,
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  selectedIndex = 1;
                });
              },
              icon: const Icon(Icons.menu_book_rounded),
              label: const Text('ابدأ القراءة'),
              style: ElevatedButton.styleFrom(
                backgroundColor: gold,
                foregroundColor: greenDark,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFeatureGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.18,
      children: [
        FeatureCard(
          icon: Icons.menu_book_rounded,
          title: 'المصحف الشريف',
          subtitle: 'قراءة وتدبر',
          onTap: () {
            setState(() => selectedIndex = 1);
          },
        ),
        FeatureCard(
          icon: Icons.auto_awesome,
          title: 'التفسير الذكي',
          subtitle: 'افهم معاني الآيات',
          onTap: () {
            setState(() => selectedIndex = 2);
          },
        ),
        FeatureCard(
          icon: Icons.search_rounded,
          title: 'البحث القرآني',
          subtitle: 'ابحث عن آية أو كلمة',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const SearchScreen(),
              ),
            );
          },
        ),
        FeatureCard(
          icon: Icons.bookmark_rounded,
          title: 'آياتي المفضلة',
          subtitle: 'آيات تريد تذكرها',
          onTap: () {
            setState(() => selectedIndex = 3);
          },
        ),
      ],
    );
  }

  Widget buildLastReadingCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFE7E7DD)),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: greenLight,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.history_rounded,
              color: greenMain,
              size: 28,
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'آخر قراءة',
                  style: TextStyle(
                    color: textDark,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'لم تبدأ القراءة بعد',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: greenMain,
            size: 18,
          ),
        ],
      ),
    );
  }

  Widget buildVerseCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFCF3),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: gold.withValues(alpha: 0.65)),
      ),
      child: const Column(
        children: [
          Icon(
            Icons.auto_awesome,
            color: gold,
            size: 28,
          ),
          SizedBox(height: 12),
          Text(
            '﴿ إِنَّ مَعَ الْعُسْرِ يُسْرًا ﴾',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: greenDark,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              height: 1.8,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'سورة الشرح • الآية ٦',
            style: TextStyle(
              color: greenMain,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const SectionTitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: greenDark,
            fontSize: 19,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          subtitle,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: const Color(0xFFE8E8DF)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: greenLight,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  icon,
                  color: greenMain,
                  size: 25,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  color: greenDark,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderScreen(
      icon: Icons.menu_book_rounded,
      title: 'المصحف الشريف',
      subtitle: 'سيُضاف نص القرآن الكريم كاملًا من مصدر موثوق.',
    );
  }
}

class TafsirScreen extends StatelessWidget {
  const TafsirScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderScreen(
      icon: Icons.auto_awesome,
      title: 'التفسير الذكي',
      subtitle: 'سيتيح لك هذا القسم فهم معاني الآيات والرجوع إلى مصادر التفسير.',
    );
  }
}

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderScreen(
      icon: Icons.bookmark_rounded,
      title: 'آياتي المفضلة',
      subtitle: 'ستظهر هنا الآيات التي تحفظها للرجوع إليها لاحقًا.',
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('البحث في القرآن الكريم'),
          backgroundColor: background,
          foregroundColor: greenDark,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                  hintText: 'اكتب كلمة أو عبارة للبحث',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
                onSubmitted: (_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'سيُفعّل البحث القرآني بعد إضافة بيانات المصحف.',
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              const Icon(
                Icons.manage_search_rounded,
                size: 65,
                color: greenMain,
              ),
              const SizedBox(height: 12),
              const Text(
                'ابحث عن آيات القرآن الكريم',
                style: TextStyle(
                  color: greenDark,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'ستظهر نتائج البحث هنا بعد إضافة نص القرآن.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const PlaceholderScreen({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: greenLight,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: gold, width: 1.5),
              ),
              child: Icon(
                icon,
                color: greenMain,
                size: 48,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: greenDark,
                fontSize: 25,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 15,
                height: 1.9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}