import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple.shade100, Colors.purple.shade200],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.self_improvement, size: 120, color: Colors.purple[700]),
              SizedBox(height: 24),
              Text(
                'Welcome to Your Vibrant Wellbeing App!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple[900],
                  shadows: [
                    Shadow(
                      blurRadius: 5,
                      color: Colors.teal.shade300,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Track your habits, challenges, and feelings with a colorful touch to keep your mind and body happy.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.teal[800]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
