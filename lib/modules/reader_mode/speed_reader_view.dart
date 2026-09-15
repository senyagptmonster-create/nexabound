import 'package:flutter/material.dart';
import '../../common/reading_tokens.dart';

class SpeedReaderView extends StatelessWidget {
  const SpeedReaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Focus Reader Simulation')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: ReadingTokens.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: ReadingTokens.edge),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Distraction-Free Reading Canvas',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 12),
              Text(
                'High typography clarity with balanced line heights (1.6x) and high contrast edge margins. Ideal for rapid technical absorption and bookmarked article skimming.',
                style: TextStyle(fontSize: 15, height: 1.6, color: ReadingTokens.ink),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
