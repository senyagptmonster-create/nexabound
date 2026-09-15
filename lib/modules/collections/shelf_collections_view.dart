import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../shelf_feed/shelf_controller.dart';
import '../../common/reading_tokens.dart';

class ShelfCollectionsView extends StatelessWidget {
  const ShelfCollectionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<ShelfController>();
    final archived = ctrl.archived;

    return Scaffold(
      appBar: AppBar(title: const Text('Archived Locker')),
      body: archived.isEmpty
          ? const Center(child: Text('No archived bookmarks', style: TextStyle(color: ReadingTokens.inkMuted)))
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: archived.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, idx) {
                final a = archived[idx];
                return Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: ReadingTokens.surface,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: ReadingTokens.edge),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(a.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                            Text('${a.estMinutes} min read • ${a.collection}', style: const TextStyle(fontSize: 12, color: ReadingTokens.inkMuted)),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.unarchive_outlined, color: ReadingTokens.accent),
                        onPressed: () => ctrl.toggleArchive(a.id),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
