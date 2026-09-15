import 'package:flutter/material.dart';
import '../state/bookshelf_state.dart';
import '../theme/nexabound_theme.dart';

class ReadingGoalTrackerPage extends StatelessWidget {
  const ReadingGoalTrackerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = BookshelfScope.of(context);
    final pct = (state.annualCompleted / state.annualGoal).clamp(0.0, 1.0);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: NexaboundTheme.surface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                const Text('Annual 2026 Reading Milestone', style: TextStyle(color: NexaboundTheme.textSecondary)),
                const SizedBox(height: 10),
                Text(
                  '${state.annualCompleted} / ${state.annualGoal} Books',
                  style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: NexaboundTheme.amber),
                ),
                const SizedBox(height: 16),
                LinearProgressIndicator(
                  value: pct,
                  minHeight: 10,
                  backgroundColor: Colors.white10,
                  valueColor: const AlwaysStoppedAnimation<Color>(NexaboundTheme.amber),
                  borderRadius: BorderRadius.circular(5),
                ),
                const SizedBox(height: 10),
                Text(
                  '${(pct * 100).toStringAsFixed(0)}% of goal achieved * 2 books ahead of schedule',
                  style: const TextStyle(fontSize: 12, color: NexaboundTheme.textSecondary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
