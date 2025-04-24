import 'package:flutter/material.dart';
import '../model/hadith_model.dart';

/// A widget that displays detailed information about a hadith
class HadithDetailView extends StatelessWidget {
  /// The hadith to display
  final Hadith hadith;
  
  /// Whether to show metadata (ID, book ID, chapter ID)
  final bool showMetadata;
  
  /// Creates a hadith detail view widget
  const HadithDetailView({
    Key? key,
    required this.hadith,
    this.showMetadata = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          
          if (showMetadata) ...[
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
        ],
      ),
    );
  }
}
