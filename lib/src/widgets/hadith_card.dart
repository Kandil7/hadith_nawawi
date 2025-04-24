import 'package:flutter/material.dart';
import '../model/hadith_model.dart';

/// A card widget that displays a hadith in a compact format
class HadithCard extends StatelessWidget {
  /// The hadith to display
  final Hadith hadith;
  
  /// Callback when the card is tapped
  final VoidCallback? onTap;
  
  /// Whether to show the full Arabic text
  final bool showFullArabic;
  
  /// Whether to show the full English text
  final bool showFullEnglish;

  /// Creates a hadith card widget
  const HadithCard({
    Key? key,
    required this.hadith,
    this.onTap,
    this.showFullArabic = false,
    this.showFullEnglish = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${hadith.idInBook}',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      hadith.english.narrator,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                showFullEnglish
                    ? hadith.english.text
                    : (hadith.english.text.length > 100
                        ? '${hadith.english.text.substring(0, 100)}...'
                        : hadith.english.text),
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  showFullArabic
                      ? hadith.arabic
                      : (hadith.arabic.length > 50
                          ? '${hadith.arabic.substring(0, 50)}...'
                          : hadith.arabic),
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Amiri',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
