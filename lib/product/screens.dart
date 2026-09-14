import 'package:flutter/material.dart';
import '../app/theme.dart';
import '../app/brand.dart';

class NexaboundHome extends StatefulWidget {
  const NexaboundHome({super.key});

  @override
  State<NexaboundHome> createState() => _NexaboundHomeState();
}

class _NexaboundHomeState extends State<NexaboundHome> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const ShelfFeedScreen(),
    const ActiveReaderScreen(),
    const ReadingStatsScreen(),
    const BookmarksArchiveScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cBg,
      appBar: AppBar(
        title: Text('Nexabound', style: AppTheme.display(cAccent)),
        backgroundColor: cSurface,
      ),
      drawer: Drawer(
        backgroundColor: cSurface,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: cBg),
              child: Text('Menu', style: AppTheme.display(cAccent)),
            ),
            _DrawerItem(icon: Icons.book, title: 'Shelf Feed', onTap: () => _setScreen(0)),
            _DrawerItem(icon: Icons.chrome_reader_mode, title: 'Active Reader', onTap: () => _setScreen(1)),
            _DrawerItem(icon: Icons.insert_chart, title: 'Reading Stats', onTap: () => _setScreen(2)),
            _DrawerItem(icon: Icons.archive, title: 'Archive', onTap: () => _setScreen(3)),
          ],
        ),
      ),
      body: _screens[_currentIndex],
    );
  }

  void _setScreen(int index) {
    setState(() => _currentIndex = index);
    Navigator.pop(context);
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  const _DrawerItem({required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: cAccent),
      title: Text(title, style: AppTheme.text(cInk)),
      onTap: onTap,
    );
  }
}

class ShelfFeedScreen extends StatelessWidget {
  const ShelfFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(color: cSurface, child: ListTile(title: Text('The Future of AI', style: AppTheme.text(cInk)), subtitle: Text('10 min read', style: AppTheme.text(cInk.withValues(alpha: 0.7))))),
      ],
    );
  }
}

class ActiveReaderScreen extends StatelessWidget {
  const ActiveReaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Text('This is the content of the article. Minimalist reader mode enabled.', style: AppTheme.text(cInk).copyWith(fontSize: 18, height: 1.5)),
    );
  }
}

class ReadingStatsScreen extends StatelessWidget {
  const ReadingStatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Articles Read: 42', style: AppTheme.display(cInk)));
  }
}

class BookmarksArchiveScreen extends StatelessWidget {
  const BookmarksArchiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(color: cSurface, child: ListTile(title: Text('Old Article', style: AppTheme.text(cInk)))),
      ],
    );
  }
}
