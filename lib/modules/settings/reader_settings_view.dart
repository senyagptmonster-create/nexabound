import 'package:flutter/material.dart';
import '../../common/reading_tokens.dart';

class ReaderSettingsView extends StatelessWidget {
  const ReaderSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reading Targets')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: ReadingTokens.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: ReadingTokens.edge),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Daily Reading Pacing', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(height: 8),
                Text(
                  'Average reading pace ranges from 200 to 250 words per minute. Estimated time badges help you choose suitable reads for micro-breaks.',
                  style: TextStyle(fontSize: 13, color: ReadingTokens.inkMuted, height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
