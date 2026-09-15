import 'package:flutter/material.dart';
import '../theme/nexabound_theme.dart';

class ReadingPaceEstimatorPage extends StatelessWidget {
  const ReadingPaceEstimatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: NexaboundTheme.surface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              children: [
                Text('Average Reading Cadence', style: TextStyle(color: NexaboundTheme.textSecondary)),
                SizedBox(height: 6),
                Text('240 WPM', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w900, color: NexaboundTheme.amber)),
                SizedBox(height: 8),
                Text('~1.2 minutes per standard book page', style: TextStyle(fontSize: 13, color: NexaboundTheme.textPrimary)),
              ],
            ),
          ),
          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: NexaboundTheme.surface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Projected Book Completions', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: NexaboundTheme.textPrimary)),
                SizedBox(height: 12),
                Text('Meditations (72 pages left)  ->  4 days at 20m/day', style: TextStyle(fontSize: 13, color: NexaboundTheme.textSecondary)),
                Divider(color: Colors.white10, height: 20),
                Text('Gödel, Escher, Bach (467 pages left)  ->  28 days at 20m/day', style: TextStyle(fontSize: 13, color: NexaboundTheme.textSecondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
