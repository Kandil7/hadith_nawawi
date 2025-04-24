import 'package:flutter/material.dart';
import 'package:hadith_nawawi/hadith_nawawi.dart';

class HadithDetailPage extends StatelessWidget {
  final Hadith hadith;

  const HadithDetailPage({Key? key, required this.hadith}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hadith ${hadith.idInBook}'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Narrator
            Text(
              hadith.english.narrator,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 16),
            
            // English text
            Text(
              hadith.english.text,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            
            // Arabic text
            Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                hadith.arabic,
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Amiri',
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // Metadata
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hadith ID: ${hadith.id}'),
                    Text('Book ID: ${hadith.bookId}'),
                    Text('Chapter ID: ${hadith.chapterId}'),
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
