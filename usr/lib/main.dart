import 'package:flutter/material.dart';

void main() {
  runApp(const PresentationApp());
}

class PresentationApp extends StatelessWidget {
  const PresentationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amrop & Demirbank Presentation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD32F2F), // Demirbank Red
          primary: const Color(0xFFD32F2F),
          background: Colors.white,
          surface: const Color(0xFFF5F5F5),
        ),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Helvetica',
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PresentationDeck(),
      },
    );
  }
}

class PresentationDeck extends StatefulWidget {
  const PresentationDeck({super.key});

  @override
  State<PresentationDeck> createState() => _PresentationDeckState();
}

class _PresentationDeckState extends State<PresentationDeck> {
  int _currentSlide = 0;

  late final List<Widget> _slides;

  @override
  void initState() {
    super.initState();
    _slides = [
      const Slide1(),
      const PlaceholderSlide(title: 'Giriş', content: 'Ümumi Məlumatlar'),
      const PlaceholderSlide(title: 'Bazar Analizi', content: 'Bank Sektoru'),
      const PlaceholderSlide(title: 'Strategiya', content: 'Gələcək Planlar'),
      const PlaceholderSlide(title: 'Maliyyə Göstəriciləri', content: 'Hesabatlar'),
      const PlaceholderSlide(title: 'Risklərin İdarəedilməsi', content: 'Təhlillər'),
      const PlaceholderSlide(title: 'Layihələr', content: 'Yeni Layihələr'),
      const Slide8(), // Compensation
      const PlaceholderSlide(title: 'Gözləntilər', content: 'Növbəti Addımlar'),
      const Slide10(), // Profiles
      const ContactSlide(), // Last slide
    ];
  }

  void _nextSlide() {
    if (_currentSlide < _slides.length - 1) {
      setState(() {
        _currentSlide++;
      });
    }
  }

  void _prevSlide() {
    if (_currentSlide > 0) {
      setState(() {
        _currentSlide--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _slides[_currentSlide],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            color: Colors.grey.shade100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: _currentSlide > 0 ? _prevSlide : null,
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Geri'),
                ),
                Text(
                  'Slayd ${_currentSlide + 1} / ${_slides.length}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                ElevatedButton.icon(
                  onPressed: _currentSlide < _slides.length - 1 ? _nextSlide : null,
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('İrəli'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Slide1 extends StatelessWidget {
  const Slide1({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Placeholder for Demirbank Logo
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFD32F2F), width: 3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'DemirBank',
                  style: TextStyle(
                    color: Color(0xFFD32F2F),
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 40),
              const Icon(Icons.close, size: 24, color: Colors.grey),
              const SizedBox(width: 40),
              // Placeholder for Amrop Logo
              Container(
                padding: const EdgeInsets.all(16),
                child: const Text(
                  'Amrop',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 32,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),
          const Text(
            'Strateji Əməkdaşlıq Təqdimatı',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'İşıqlı dizayn, qısa və məzmunlu məlumatlar',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}

class Slide8 extends StatelessWidget {
  const Slide8({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(48.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Compensation (Kompensasiya)',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFFD32F2F),
            ),
          ),
          const Divider(color: Color(0xFFD32F2F), thickness: 2),
          const SizedBox(height: 40),
          Expanded(
            child: GridView.count(
              crossAxisCount: MediaQuery.of(context).size.width > 800 ? 3 : 1,
              childAspectRatio: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: [
                _buildCard('Baza Əmək Haqqı', 'Bazar standartlarına uyğun rəqabətədavamlı maaş.', Icons.money),
                _buildCard('Bonuslar', 'Performansa əsaslanan illik və rüblük bonuslar.', Icons.trending_up),
                _buildCard('Sığorta Paketi', 'Genişləndirilmiş tibbi və həyat sığortası.', Icons.health_and_safety),
                _buildCard('Təlim & İnkişaf', 'Davamlı peşəkar inkişaf dəstəyi.', Icons.school),
                _buildCard('Məzuniyyət', 'Əlavə ödənişli məzuniyyət günləri.', Icons.beach_access),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String desc, IconData icon) {
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: const Color(0xFFD32F2F)),
            const SizedBox(height: 12),
            Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(desc, style: TextStyle(color: Colors.grey.shade700)),
          ],
        ),
      ),
    );
  }
}

class Slide10 extends StatelessWidget {
  const Slide10({super.key});

  @override
  Widget build(BuildContext context) {
    bool isWide = MediaQuery.of(context).size.width > 800;
    return Padding(
      padding: const EdgeInsets.all(48.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Komandamız',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFFD32F2F),
            ),
          ),
          const Divider(color: Color(0xFFD32F2F), thickness: 2),
          const SizedBox(height: 40),
          Expanded(
            child: Flex(
              direction: isWide ? Axis.horizontal : Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildProfile('Dəyanət', 'Managing Partner', Icons.person),
                _buildProfile('Orxan Məmmədov', 'Senior Consultant', Icons.person),
                _buildProfile('Səbinə', 'Consultant', Icons.person_3),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfile(String name, String role, IconData icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: Colors.grey.shade200,
          child: Icon(icon, size: 60, color: const Color(0xFFD32F2F)),
        ),
        const SizedBox(height: 20),
        Text(name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text(role, style: TextStyle(fontSize: 18, color: Colors.grey.shade700)),
      ],
    );
  }
}

class ContactSlide extends StatelessWidget {
  const ContactSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Təşəkkürlər!',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD32F2F),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Əlaqə üçün:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildContactInfo(Icons.email, 'baku@amrop.com'),
            const SizedBox(height: 12),
            _buildContactInfo(Icons.phone, '+994 12 345 67 89'),
            const SizedBox(height: 12),
            _buildContactInfo(Icons.location_on, 'Bakı şəhəri, Azərbaycan'),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('DemirBank', style: TextStyle(color: Color(0xFFD32F2F), fontWeight: FontWeight.bold, fontSize: 20)),
                const SizedBox(width: 20),
                Container(height: 24, width: 2, color: Colors.grey),
                const SizedBox(width: 20),
                const Text('Amrop', style: TextStyle(fontSize: 20, letterSpacing: 1.5)),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: const Color(0xFFD32F2F)),
        const SizedBox(width: 12),
        Text(text, style: const TextStyle(fontSize: 20)),
      ],
    );
  }
}

class PlaceholderSlide extends StatelessWidget {
  final String title;
  final String content;

  const PlaceholderSlide({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(48.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFFD32F2F),
            ),
          ),
          const Divider(color: Color(0xFFD32F2F), thickness: 2),
          const SizedBox(height: 40),
          Expanded(
            child: Center(
              child: Text(
                content,
                style: TextStyle(fontSize: 24, color: Colors.grey.shade600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
