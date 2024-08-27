import 'package:flutter_test/flutter_test.dart';
import 'package:hadith_nawawi/hadith_nawawi.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('HadithNawawi', () {
    test('loads hadiths from JSON', () async {
      // Load the book and extract hadiths
      await HadithNawawi.loadBook();

      // Get the loaded hadiths
      final hadiths = HadithNawawi.getHadiths();

      // Check if the hadiths list is not empty
      expect(hadiths, isNotEmpty);

      // Check the structure of the first hadith
      final firstHadith = hadiths.first;
      expect(firstHadith.id, isNotNull);
      expect(firstHadith.arabic, isNotNull);
    });

    test('parses hadiths correctly', () async {
      // Load the book and extract hadiths
      await HadithNawawi.loadBook();

      // Get the loaded hadiths
      final hadiths = HadithNawawi.getHadiths();

      // Verify that the hadiths are parsed correctly
      expect(hadiths.length, 42); // Ensure this matches the number of hadiths in your book

      // Check specific hadiths for correctness
      expect(hadiths[0].idInBook, 1);
      expect(hadiths[0].arabic, "عَنْ أَمِيرِ الْمُؤْمِنِينَ أَبِي حَفْصٍ عُمَرَ بْنِ الْخَطَّابِ رَضِيَ اللهُ عَنْهُ قَالَ: سَمِعْتُ رَسُولَ اللَّهِ صلى الله عليه وسلم يَقُولُ: \" إنَّمَا الْأَعْمَالُ بِالنِّيَّاتِ، وَإِنَّمَا لِكُلِّ امْرِئٍ مَا نَوَى، فَمَنْ كَانَتْ هِجْرَتُهُ إلَى اللَّهِ وَرَسُولِهِ فَهِجْرَتُهُ إلَى اللَّهِ وَرَسُولِهِ، وَمَنْ كَانَتْ هِجْرَتُهُ لِدُنْيَا يُصِيبُهَا أَوْ امْرَأَةٍ يَنْكِحُهَا فَهِجْرَتُهُ إلَى مَا هَاجَرَ إلَيْهِ\". \nرَوَاهُ إِمَامَا الْمُحَدِّثِينَ أَبُو عَبْدِ اللهِ مُحَمَّدُ بنُ إِسْمَاعِيل بن إِبْرَاهِيم بن الْمُغِيرَة بن بَرْدِزبَه الْبُخَارِيُّ الْجُعْفِيُّ  رَضِيَ اللهُ عَنْهُمَا فِي \"صَحِيحَيْهِمَا\" اللذَينِ هُمَا أَصَحُّ الْكُتُبِ الْمُصَنَّفَةِ.");
      expect(hadiths[1].idInBook, 2);
      // Add more specific assertions based on the actual hadith texts and IDs
    });
  });
}
