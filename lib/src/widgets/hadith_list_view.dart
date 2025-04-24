import 'package:flutter/material.dart';
import '../model/hadith_model.dart';
import 'hadith_card.dart';

/// A widget that displays a list of hadiths
class HadithListView extends StatelessWidget {
  /// The list of hadiths to display
  final List<Hadith> hadiths;
  
  /// Callback when a hadith is tapped
  final void Function(Hadith hadith)? onHadithTap;
  
  /// Whether to show the full Arabic text in each card
  final bool showFullArabic;
  
  /// Whether to show the full English text in each card
  final bool showFullEnglish;
  
  /// Creates a hadith list view widget
  const HadithListView({
    Key? key,
    required this.hadiths,
    this.onHadithTap,
    this.showFullArabic = false,
    this.showFullEnglish = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (hadiths.isEmpty) {
      return const Center(
        child: Text('No hadiths found'),
      );
    }

    return ListView.builder(
      itemCount: hadiths.length,
      itemBuilder: (context, index) {
        final hadith = hadiths[index];
        return HadithCard(
          hadith: hadith,
          showFullArabic: showFullArabic,
          showFullEnglish: showFullEnglish,
          onTap: onHadithTap != null ? () => onHadithTap!(hadith) : null,
        );
      },
    );
  }
}
