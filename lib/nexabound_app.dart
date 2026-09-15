import 'package:flutter/material.dart';
import 'pages/bookshelf_library_page.dart';
import 'pages/quote_passages_vault_page.dart';
import 'pages/reading_goal_tracker_page.dart';
import 'pages/reading_pace_estimator_page.dart';
import 'state/bookshelf_state.dart';
import 'theme/nexabound_theme.dart';

class NexaboundApp extends StatefulWidget {
  const NexaboundApp({super.key});

  @override
  State<NexaboundApp> createState() => _NexaboundAppState();
}

class _NexaboundAppState extends State<NexaboundApp> {
  final BookshelfState _state = BookshelfState();

  @override
  void dispose() {
    _state.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BookshelfScope(
      notifier: _state,
      child: MaterialApp(
        title: 'Nexabound Bookshelf',
        debugShowCheckedModeBanner: false,
        theme: NexaboundTheme.themeData,
        home: const _NexaboundShell(),
      ),
    );
  }
}

class _NexaboundShell extends StatefulWidget {
  const _NexaboundShell();

  @override
  State<_NexaboundShell> createState() => _NexaboundShellState();
}

class _NexaboundShellState extends State<_NexaboundShell> {
  int _pageIndex = 0;

  final List<Widget> _pages = const [
    BookshelfLibraryPage(),
    ReadingPaceEstimatorPage(),
    QuotePassagesVaultPage(),
    ReadingGoalTrackerPage(),
  ];

  final List<String> _titles = const [
    'Nexabound Bookshelf',
    'Pace & Estimations',
    'Passages Vault',
    'Annual Reading Goals',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_pageIndex]),
      ),
      drawer: Drawer(
        backgroundColor: NexaboundTheme.surface,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: NexaboundTheme.card),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.auto_stories_rounded, color: NexaboundTheme.amber, size: 40),
                  SizedBox(height: 10),
                  Text('Nexabound Books', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('Personal Library Sanctuary', style: TextStyle(fontSize: 12, color: NexaboundTheme.textSecondary)),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.shelves),
              title: const Text('Bookshelf Library'),
              selected: _pageIndex == 0,
              selectedColor: NexaboundTheme.amber,
              onTap: () {
                setState(() => _pageIndex = 0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.speed_rounded),
              title: const Text('Reading Pace'),
              selected: _pageIndex == 1,
              selectedColor: NexaboundTheme.amber,
              onTap: () {
                setState(() => _pageIndex = 1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.format_quote_rounded),
              title: const Text('Quotes & Passages'),
              selected: _pageIndex == 2,
              selectedColor: NexaboundTheme.amber,
              onTap: () {
                setState(() => _pageIndex = 2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.emoji_events_rounded),
              title: const Text('Reading Milestones'),
              selected: _pageIndex == 3,
              selectedColor: NexaboundTheme.amber,
              onTap: () {
                setState(() => _pageIndex = 3);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _pages[_pageIndex],
    );
  }
}
