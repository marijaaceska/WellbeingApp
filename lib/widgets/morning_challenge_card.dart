import 'package:flutter/material.dart';

class MorningChallengeCard extends StatelessWidget {
  final List<String> challenges = [
    'Drink a glass of water 💧',
    'Do 5 minutes of stretching 🧘‍♂️',
    'Write down 3 things you are grateful for 🙏',
    'Take 10 deep breaths 🌬️',
    'Eat a healthy breakfast 🍎',
    'Spend 5 minutes outside in nature 🌿',
    'Set your top 3 goals for today 🎯',
    'Avoid screens for the first 30 minutes after waking up 📵',
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      elevation: 12,
      shadowColor: Colors.orangeAccent.withOpacity(0.6),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange.shade300, Colors.orange.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.wb_sunny, color: Colors.deepOrange, size: 32),
                SizedBox(width: 12),
                Text(
                  'Morning Challenges',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange.shade900,
                    shadows: [
                      Shadow(
                        blurRadius: 3,
                        color: Colors.deepOrange.shade200,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ...challenges.map(
                  (challenge) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    Icon(Icons.check_circle_outline, color: Colors.deepOrange),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        challenge,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.deepOrange.shade800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
