import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'shelf_controller.dart';
import '../../common/reading_tokens.dart';

class ShelfFeedView extends StatelessWidget {
  const ShelfFeedView({super.key});

  void _showAddBookmark(BuildContext context) {
    final titleCtrl = TextEditingController();
    final urlCtrl = TextEditingController();
    int min = 5;
    String col = 'Tech';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: ReadingTokens.surface,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) => StatefulBuilder(
        builder: (context, setModal) => Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: MediaQuery.of(context).viewInsets.bottom + 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Add Reading Bookmark', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 12),
              TextField(controller: titleCtrl, decoration: const InputDecoration(hintText: 'Article Title', border: OutlineInputBorder())),
              const SizedBox(height: 12),
              TextField(controller: urlCtrl, decoration: const InputDecoration(hintText: 'Source URL or Domain', border: OutlineInputBorder())),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<int>(
                      value: min,
                      decoration: const InputDecoration(labelText: 'Read Time', border: OutlineInputBorder()),
                      items: [3, 5, 7, 10, 15, 20].map((m) => DropdownMenuItem(value: m, child: Text('$m min read'))).toList(),
                      onChanged: (v) { if (v != null) setModal(() => min = v); },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: col,
                      decoration: const InputDecoration(labelText: 'Shelf', border: OutlineInputBorder()),
                      items: ['Tech', 'Design', 'Culinary', 'General'].map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
                      onChanged: (v) { if (v != null) setModal(() => col = v); },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: ReadingTokens.accent, foregroundColor: Colors.white),
                  onPressed: () {
                    if (titleCtrl.text.trim().isNotEmpty) {
                      context.read<ShelfController>().addArticle(titleCtrl.text.trim(), urlCtrl.text.trim(), min, col);
                      Navigator.pop(ctx);
                    }
                  },
                  child: const Text('Save to Locker'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<ShelfController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Reading Locker')),
      body: ctrl.articles.isEmpty
          ? const Center(child: Text('Shelf is clear', style: TextStyle(color: ReadingTokens.inkMuted)))
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: ctrl.articles.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, idx) {
                final a = ctrl.articles[idx];
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: ReadingTokens.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: ReadingTokens.edge),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(color: ReadingTokens.edge, borderRadius: BorderRadius.circular(8)),
                            child: Text(a.collection, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: ReadingTokens.accent)),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.schedule, size: 14, color: ReadingTokens.inkMuted),
                              const SizedBox(width: 4),
                              Text('${a.estMinutes} min', style: const TextStyle(fontSize: 12, color: ReadingTokens.inkMuted)),
                              const SizedBox(width: 8),
                              IconButton(
                                icon: const Icon(Icons.archive_outlined, size: 18, color: ReadingTokens.inkMuted),
                                onPressed: () => ctrl.toggleArchive(a.id),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(a.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 4),
                      Text(a.url, style: const TextStyle(fontSize: 12, color: ReadingTokens.inkMuted)),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: ReadingTokens.accent,
        foregroundColor: Colors.white,
        onPressed: () => _showAddBookmark(context),
        icon: const Icon(Icons.bookmark_add_outlined),
        label: const Text('Add Bookmark'),
      ),
    );
  }
}
