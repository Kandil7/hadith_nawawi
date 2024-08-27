import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../../hadith_nawawi.dart';

class HadithNawawi {
  static List<Hadith> _hadiths = [];

  // Load the JSON data from assets and convert it to a Book object
  static Future<void> loadBook() async {
    try {
      final jsonString = await rootBundle.loadString('assets/hadiths.json');
      final jsonData = json.decode(jsonString) as Map<String, dynamic>;
      final book = Book.fromJson(jsonData);
      _hadiths = book.hadiths; // Extract hadiths from the Book object
    } catch (e) {
      print('Error loading book: $e');
    }
  }

  // Get all hadiths
  static List<Hadith> getHadiths() {
    return _hadiths;
  }

  // Get a hadith by its number
  static Hadith? getHadithByNumber(int number) {
    return _hadiths.firstWhere((hadith) => hadith.id == number,

    );
  }
}
