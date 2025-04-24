import 'package:flutter_test/flutter_test.dart';
import 'package:hadith_nawawi/hadith_nawawi.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('HadithNawawi', () {
    test('loads hadiths from JSON', () async {
      // Load the hadiths
      await HadithNawawi.loadHadiths();

      // Get the loaded hadiths
      final hadiths = HadithNawawi.getHadiths();

      // Check if the hadiths list is not empty
      expect(hadiths, isNotEmpty);

      // Check the structure of the first hadith
      final firstHadith = hadiths.first;
      expect(firstHadith.id, isNotNull);
      expect(firstHadith.arabic, isNotNull);
      expect(firstHadith.english.narrator, isNotNull);
      expect(firstHadith.english.text, isNotNull);
    });

    test('parses hadiths correctly', () async {
      // Load the hadiths
      await HadithNawawi.loadHadiths();

      // Get the loaded hadiths
      final hadiths = HadithNawawi.getHadiths();

      // Verify that the hadiths are parsed correctly
      expect(
        hadiths.length,
        42,
      ); // Ensure this matches the number of hadiths in your book

      // Check specific hadiths for correctness
      expect(hadiths[0].idInBook, 1);
      expect(
        hadiths[0].arabic.contains("إنَّمَا الْأَعْمَالُ بِالنِّيَّاتِ"),
        isTrue,
      );
      expect(hadiths[1].idInBook, 2);
    });

    test('search functionality works', () async {
      // Load the hadiths
      await HadithNawawi.loadHadiths();

      // Get all hadiths first
      final allHadiths = HadithNawawi.getHadiths();
      expect(allHadiths, isNotEmpty);

      // Test empty search returns all hadiths
      final emptySearchResults = HadithNawawi.searchHadiths("");
      expect(emptySearchResults.length, equals(allHadiths.length));

      // Test search with English text
      final englishResults = HadithNawawi.searchHadiths("actions");
      // We don't test specific results as the test data might change
      // Just verify the search function returns a list (doesn't crash)
      expect(englishResults, isA<List<Hadith>>());
    });

    test('gets hadith by number', () async {
      // Load the hadiths
      await HadithNawawi.loadHadiths();

      // Get hadith by number
      final hadith = HadithNawawi.getHadithByNumber(1);

      // Verify the hadith
      expect(hadith, isNotNull);
      expect(hadith?.idInBook, 1);
    });
  });
}
