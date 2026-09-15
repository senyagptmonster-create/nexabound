import 'package:flutter/material.dart';
import '../theme/nexabound_theme.dart';

class QuotePassagesVaultPage extends StatelessWidget {
  const QuotePassagesVaultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final quotes = [
      {'quote': 'You have power over your mind - not outside events. Realize this, and you will find strength.', 'book': 'Meditations', 'author': 'Marcus Aurelius'},
      {'quote': 'Meaning is not something you stumble across, like an answer to a riddle. It is something you build into your life.', 'book': 'Thinking, Fast and Slow', 'author': 'John Gardner / Kahneman'},
      {'quote': 'Manuscripts do not burn.', 'book': 'The Master and Margarita', 'author': 'Mikhail Bulgakov'},
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(18),
      itemCount: quotes.length,
      separatorBuilder: (context, _) => const SizedBox(height: 12),
      itemBuilder: (ctx, i) {
        final q = quotes[i];
        return Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: NexaboundTheme.surface,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('"${q['quote']!}"', style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic, height: 1.4, color: NexaboundTheme.textPrimary)),
              const SizedBox(height: 10),
              Text('- ${q['author']!}, ${q['book']!}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: NexaboundTheme.amber)),
            ],
          ),
        );
      },
    );
  }
}
