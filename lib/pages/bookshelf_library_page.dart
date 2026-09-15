import 'package:flutter/material.dart';
import '../painters/book_spine_painter.dart';
import '../state/bookshelf_state.dart';
import '../theme/nexabound_theme.dart';

class BookshelfLibraryPage extends StatelessWidget {
  const BookshelfLibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = BookshelfScope.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Wooden Shelf with Spines
          SizedBox(
            height: 160,
            child: CustomPaint(
              painter: BookSpinePainter(booksCount: state.books.length),
            ),
          ),
          const SizedBox(height: 16),

          const Text(
            'CURRENTLY READING ROTATION',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.2, color: NexaboundTheme.textSecondary),
          ),
          const SizedBox(height: 12),

          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.books.length,
            separatorBuilder: (context, _) => const SizedBox(height: 10),
            itemBuilder: (ctx, i) {
              final b = state.books[i];
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: NexaboundTheme.surface,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.white10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(b.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: NexaboundTheme.textPrimary)),
                              Text(b.author, style: const TextStyle(fontSize: 12, color: NexaboundTheme.textSecondary)),
                            ],
                          ),
                        ),
                        Text(
                          '${(b.progress * 100).toStringAsFixed(0)}%',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: NexaboundTheme.amber),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    LinearProgressIndicator(
                      value: b.progress,
                      minHeight: 6,
                      backgroundColor: Colors.white10,
                      valueColor: const AlwaysStoppedAnimation<Color>(NexaboundTheme.amber),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Page ${b.currentPage} of ${b.totalPages}', style: const TextStyle(fontSize: 12, color: NexaboundTheme.textSecondary)),
                        TextButton(
                          onPressed: () {
                            state.updatePages(b.id, b.currentPage + 15);
                          },
                          child: const Text('+15 Pages', style: TextStyle(color: NexaboundTheme.gold, fontSize: 12)),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
