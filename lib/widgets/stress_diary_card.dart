import 'package:flutter/material.dart';

class StressDiaryCard extends StatefulWidget {
  @override
  _StressDiaryCardState createState() => _StressDiaryCardState();
}

class _StressDiaryCardState extends State<StressDiaryCard> {
  final TextEditingController _controller = TextEditingController();

  void _saveEntry() {
    if (_controller.text.trim().isEmpty) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Diary entry saved!'),
        backgroundColor: Colors.blueAccent,
        duration: Duration(seconds: 2),
      ),
    );

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      elevation: 12,
      shadowColor: Colors.blueAccent.withOpacity(0.6),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade300, Colors.blue.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Icon(Icons.edit_note, color: Colors.blue.shade900, size: 32),
                SizedBox(width: 12),
                Text(
                  'Stress Diary',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                    shadows: [
                      Shadow(
                        blurRadius: 3,
                        color: Colors.blue.shade200,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'How are you feeling today?',
                filled: true,
                fillColor: Colors.white.withOpacity(0.9),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _saveEntry,
              icon: Icon(Icons.save),
              label: Text('Save Entry'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade500,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.symmetric(vertical: 14),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
