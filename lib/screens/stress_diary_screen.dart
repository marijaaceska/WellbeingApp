import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StressDiaryScreen extends StatefulWidget {
  @override
  _StressDiaryScreenState createState() => _StressDiaryScreenState();
}

class _StressDiaryScreenState extends State<StressDiaryScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _selectedMood = '😊';

  List<_DiaryEntry> _entries = [];

  final List<String> moods = ['😊', '😐', '😞', '😡', '😴', '😌', '🤯'];

  final List<String> quotes = [
    'Every day is a fresh start 🌅',
    'Breathe in peace, breathe out stress 💖',
    'Small steps lead to big changes 🚶‍♂️',
    'You are stronger than you think 💪',
    'Be kind to yourself today 💖',
  ];

  late String _quote;

  @override
  void initState() {
    super.initState();
    _quote = quotes[Random().nextInt(quotes.length)];
  }

  void _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _saveEntry() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _entries.insert(
        0,
        _DiaryEntry(date: _selectedDate, mood: _selectedMood, content: text),
      );
      _controller.clear();
      _selectedDate = DateTime.now();
      _selectedMood = '😊';
      _quote = quotes[Random().nextInt(quotes.length)];
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Diary entry saved!'),
        backgroundColor: Colors.blueAccent,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.indigo.shade100, Colors.indigo.shade50],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.indigo.shade300, Colors.indigo.shade200],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.indigo.shade200.withOpacity(0.6),
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(Icons.format_quote, color: Colors.white, size: 30),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    _quote,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                      shadows: [
                        Shadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(1, 1),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),


          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 12,
            children: moods.map((mood) {
              final isSelected = mood == _selectedMood;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedMood = mood;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 350),
                  padding: EdgeInsets.all(isSelected ? 20 : 14),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.indigo.shade400 : Colors.indigo.shade100,
                    shape: BoxShape.circle,
                    boxShadow: isSelected
                        ? [
                      BoxShadow(
                        color: Colors.indigoAccent.withOpacity(0.7),
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      ),
                    ]
                        : [],
                  ),
                  child: Text(
                    mood,
                    style: TextStyle(fontSize: 32),
                  ),
                ),
              );
            }).toList(),
          ),

          SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Date:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.indigo.shade900),
              ),
              SizedBox(width: 8),
              TextButton.icon(
                onPressed: _pickDate,
                icon: Icon(Icons.calendar_today, color: Colors.indigo.shade700),
                label: Text(
                  DateFormat.yMMMd().format(_selectedDate),
                  style: TextStyle(fontSize: 18, color: Colors.indigo.shade700),
                ),
              ),
            ],
          ),

          SizedBox(height: 12),

          Expanded(
            child: TextField(
              controller: _controller,
              maxLines: null,
              expands: true,
              textInputAction: TextInputAction.newline,
              decoration: InputDecoration(
                hintText: 'Write how you feel today...',
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide(color: Colors.indigo.shade400, width: 2),
                ),
              ),
              style: TextStyle(fontSize: 16, color: Colors.indigo.shade900),
            ),
          ),

          SizedBox(height: 16),

          ElevatedButton.icon(
            onPressed: _saveEntry,
            icon: Icon(Icons.save),
            label: Text('Save Entry'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo.shade700,
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          SizedBox(height: 16),

          // Entries list
          if (_entries.isNotEmpty)
            Flexible(
              child: ListView.builder(
                itemCount: _entries.length,
                itemBuilder: (context, index) {
                  final entry = _entries[index];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade50,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.indigo.shade200.withOpacity(0.5),
                          blurRadius: 10,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Text(
                        entry.mood,
                        style: TextStyle(fontSize: 32),
                      ),
                      title: Text(
                        entry.content,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.indigo.shade900, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(DateFormat.yMMMd().format(entry.date),
                          style: TextStyle(color: Colors.indigo.shade700)),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

class _DiaryEntry {
  final DateTime date;
  final String mood;
  final String content;

  _DiaryEntry({required this.date, required this.mood, required this.content});
}
