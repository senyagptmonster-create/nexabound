import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'common/reading_tokens.dart';
import 'modules/shelf_feed/shelf_controller.dart';
import 'modules/shelf_feed/shelf_feed_view.dart';
import 'modules/reader_mode/speed_reader_view.dart';
import 'modules/collections/shelf_collections_view.dart';
import 'modules/settings/reader_settings_view.dart';

class NexaboundApp extends StatelessWidget {
  const NexaboundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ShelfController(),
      child: MaterialApp(
        title: 'Nexabound Shelf',
        debugShowCheckedModeBanner: false,
        theme: ReadingTokens.theme,
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
  int _idx = 0;

  final List<Widget> _pages = const [
    ShelfFeedView(),
    SpeedReaderView(),
    ShelfCollectionsView(),
    ReaderSettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: ReadingTokens.edge),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.collections_bookmark, color: ReadingTokens.accent, size: 40),
                  SizedBox(height: 10),
                  Text('Nexabound Shelf', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('Article Queue & Bookmark Locker', style: TextStyle(fontSize: 12, color: ReadingTokens.inkMuted)),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.bookmark_outline),
              title: const Text('Locker Feed'),
              selected: _idx == 0,
              onTap: () { setState(() => _idx = 0); Navigator.pop(context); },
            ),
            ListTile(
              leading: const Icon(Icons.menu_book),
              title: const Text('Reader Canvas'),
              selected: _idx == 1,
              onTap: () { setState(() => _idx = 1); Navigator.pop(context); },
            ),
            ListTile(
              leading: const Icon(Icons.archive_outlined),
              title: const Text('Archive'),
              selected: _idx == 2,
              onTap: () { setState(() => _idx = 2); Navigator.pop(context); },
            ),
            ListTile(
              leading: const Icon(Icons.tune),
              title: const Text('Settings'),
              selected: _idx == 3,
              onTap: () { setState(() => _idx = 3); Navigator.pop(context); },
            ),
          ],
        ),
      ),
      body: _pages[_idx],
    );
  }
}
