import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../model/hadith_model.dart';

/// Main service class for accessing Hadith Nawawi collection
class HadithNawawi {
  static List<Hadith> _hadiths = [];
  static bool _isLoaded = false;

  /// Load the JSON data from assets and convert it to a Book object
  /// This must be called before accessing any hadiths
  static Future<void> loadHadiths() async {
    if (_isLoaded) return;

    try {
      final jsonString = await rootBundle.loadString('assets/hadiths.json');
      final jsonData = json.decode(jsonString) as Map<String, dynamic>;
      final book = Book.fromJson(jsonData);
      _hadiths = book.hadiths; // Extract hadiths from the Book object
      _isLoaded = true;
    } catch (e) {
      print('Error loading hadiths: $e');
      throw Exception('Failed to load hadiths: $e');
    }
  }

  /// Get all hadiths
  /// Returns an empty list if hadiths haven't been loaded
  static List<Hadith> getHadiths() {
    return List.unmodifiable(_hadiths);
  }

  /// Get a hadith by its number in the book
  /// Returns null if not found
  static Hadith? getHadithByNumber(int number) {
    try {
      return _hadiths.firstWhere((hadith) => hadith.idInBook == number);
    } catch (e) {
      return null;
    }
  }

  /// Search hadiths by text in Arabic or English
  static List<Hadith> searchHadiths(String query) {
    if (query.isEmpty) return getHadiths();

    return _hadiths.where((hadith) {
      return hadith.arabic.contains(query) ||
          hadith.english.text.toLowerCase().contains(query.toLowerCase()) ||
          hadith.english.narrator.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  /// Get book metadata
  static Map<String, dynamic>? getBookMetadata() {
    if (_hadiths.isEmpty) return null;

    // Since all hadiths belong to the same book, we can use the first hadith's bookId
    final bookId = _hadiths.first.bookId;
    return {'id': bookId, 'totalHadiths': _hadiths.length};
  }
}
