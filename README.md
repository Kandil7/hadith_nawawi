Here's a `README.md` file that describes the `hadith_nawawi` Flutter package. This file will help users understand what the package does, how to install it, and how to use it.

# Hadith Nawawi Package

## Overview

The **Hadith Nawawi** package is a Flutter package designed to provide access to the esteemed collection of **Arba'in Al-Nawawi (الأربعين النووية)**, a compilation of forty hadiths by Imam Nawawi. This package allows for easy integration into your Flutter applications, offering a seamless way to access and display these foundational hadiths.

## Features

- Access and display a collection of forty hadiths by Imam Nawawi.
- Simple integration into Flutter applications.
- Load hadiths from a JSON file
- Parse hadith data into Flutter objects
- Access hadiths by their ID
- Display hadiths in a list format
- Support for both Arabic and English hadith texts
- Customizable and extensible for additional features
- Licensed under the MIT License
- Open to contributions and suggestions
- Contact information for support
- Clear and concise documentation
- Easy-to-understand code examples
- Structured and organized content
- Asset configuration instructions

## Installation

To use the Hadith Nawawi package in your Flutter application, follow these steps:

1. **Add the dependency**

   Open your `pubspec.yaml` file and add `hadith_nawawi` under dependencies:

   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     hadith_nawawi:
       git:
         url: https://github.com/Kandil7/hadith_nawawi.git
   ```

2. **Install the package**

   Run `flutter pub get` in your terminal to install the package.

## Usage

Here's a quick example of how to use the Hadith Nawawi package:

1. **Import the package**

   ```dart
   import 'package:hadith_nawawi/hadith_nawawi.dart';
   ```


## Usage

### Loading Hadiths

To load hadiths from a JSON file, use the `loadHadiths` method. Ensure that your JSON file is located in the `assets` directory of your project.

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HadithNawawi.loadHadiths(); // Load the hadiths
  runApp(MyApp());
}
```

### Accessing Hadiths

You can access the list of hadiths using the `getHadiths` method and get a specific hadith by its ID using `getHadithByNumber`.

```dart
List<Hadith> hadiths = HadithNawawi.getHadiths();
Hadith? specificHadith = HadithNawawi.getHadithByNumber(1);
```

### Displaying Hadiths

Here's an example of how to display hadiths in a simple `ListView`:

```dart
class HadithList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hadiths = HadithNawawi.getHadiths();

    return ListView.builder(
      itemCount: hadiths.length,
      itemBuilder: (context, index) {
        final hadith = hadiths[index];
        return ListTile(
          title: Text('Hadith ${hadith.id}'),
          subtitle: Text(hadith.arabic),
        );
      },
    );
  }
}
```

## JSON Structure

Ensure your JSON file (`assets/hadiths.json`) is structured as follows:

```json
[
      {
         "id": 40944,
         "idInBook": 1,
         "chapterId": 0,
         "bookId": 10,
         "arabic": "عَنْ أَمِيرِ الْمُؤْمِنِينَ أَبِي حَفْصٍ عُمَرَ بْنِ الْخَطَّابِ رَضِيَ اللهُ عَنْهُ قَالَ: سَمِعْتُ رَسُولَ اللَّهِ صلى الله عليه وسلم يَقُولُ: \" إنَّمَا الْأَعْمَالُ بِالنِّيَّاتِ، وَإِنَّمَا لِكُلِّ امْرِئٍ مَا نَوَى، فَمَنْ كَانَتْ هِجْرَتُهُ إلَى اللَّهِ وَرَسُولِهِ فَهِجْرَتُهُ إلَى اللَّهِ وَرَسُولِهِ، وَمَنْ كَانَتْ هِجْرَتُهُ لِدُنْيَا يُصِيبُهَا أَوْ امْرَأَةٍ يَنْكِحُهَا فَهِجْرَتُهُ إلَى مَا هَاجَرَ إلَيْهِ\". \nرَوَاهُ إِمَامَا الْمُحَدِّثِينَ أَبُو عَبْدِ اللهِ مُحَمَّدُ بنُ إِسْمَاعِيل بن إِبْرَاهِيم بن الْمُغِيرَة بن بَرْدِزبَه الْبُخَارِيُّ الْجُعْفِيُّ  رَضِيَ اللهُ عَنْهُمَا فِي \"صَحِيحَيْهِمَا\" اللذَينِ هُمَا أَصَحُّ الْكُتُبِ الْمُصَنَّفَةِ.",
         "english": {
            "narrator": "It is narrated on the authority of Amirul Mu'minin, Abu Hafs 'Umar bin al-Khattab (ra) who said:",
            "text": "I heard the Messenger of Allah (ﷺ) say: \"Actions are (judged) by motives (niyyah), so each man will have what he intended. Thus, he whose migration (hijrah) was to Allah and His Messenger, his migration is to Allah and His Messenger; but he whose migration was for some worldly thing he might gain, or for a wife he might marry, his migration is to that for which he migrated.\"\n\n"
         }
      },
      {
         "id": 40945,
         "idInBook": 2,
         "chapterId": 0,
         "bookId": 10,
         "arabic": "عَنْ عُمَرَ رَضِيَ اللهُ عَنْهُ أَيْضًا قَالَ: \" بَيْنَمَا نَحْنُ جُلُوسٌ عِنْدَ رَسُولِ اللَّهِ صلى الله عليه و سلم ذَاتَ يَوْمٍ، إذْ طَلَعَ عَلَيْنَا رَجُلٌ شَدِيدُ بَيَاضِ الثِّيَابِ، شَدِيدُ سَوَادِ الشَّعْرِ، لَا يُرَى عَلَيْهِ أَثَرُ السَّفَرِ، وَلَا يَعْرِفُهُ مِنَّا أَحَدٌ. حَتَّى جَلَسَ إلَى النَّبِيِّ صلى الله عليه و سلم . فَأَسْنَدَ رُكْبَتَيْهِ إلَى رُكْبَتَيْهِ، وَوَضَعَ كَفَّيْهِ عَلَى فَخِذَيْهِ، \nوَقَالَ: يَا مُحَمَّدُ أَخْبِرْنِي عَنْ الْإِسْلَامِ. \nفَقَالَ رَسُولُ اللَّهِ صلى الله عليه و سلم الْإِسْلَامُ أَنْ تَشْهَدَ أَنْ لَا إلَهَ إلَّا اللَّهُ وَأَنَّ مُحَمَّدًا رَسُولُ اللَّهِ، وَتُقِيمَ الصَّلَاةَ، وَتُؤْتِيَ الزَّكَاةَ، وَتَصُومَ رَمَضَانَ، وَتَحُجَّ الْبَيْتَ إنْ اسْتَطَعْت إلَيْهِ سَبِيلًا. \nقَالَ: صَدَقْت . فَعَجِبْنَا لَهُ يَسْأَلُهُ وَيُصَدِّقُهُ!\nقَالَ: فَأَخْبِرْنِي عَنْ الْإِيمَانِ. \nقَالَ: أَنْ تُؤْمِنَ بِاَللَّهِ وَمَلَائِكَتِهِ وَكُتُبِهِ وَرُسُلِهِ وَالْيَوْمِ الْآخِرِ، وَتُؤْمِنَ بِالْقَدَرِ خَيْرِهِ وَشَرِّهِ.\nقَالَ: صَدَقْت. قَالَ: فَأَخْبِرْنِي عَنْ الْإِحْسَانِ. \nقَالَ: أَنْ تَعْبُدَ اللَّهَ كَأَنَّك تَرَاهُ، فَإِنْ لَمْ تَكُنْ تَرَاهُ فَإِنَّهُ يَرَاك. \nقَالَ: فَأَخْبِرْنِي عَنْ السَّاعَةِ. قَالَ: مَا الْمَسْئُولُ عَنْهَا بِأَعْلَمَ مِنْ السَّائِلِ. \nقَالَ: فَأَخْبِرْنِي عَنْ أَمَارَاتِهَا؟ قَالَ: أَنْ تَلِدَ الْأَمَةُ رَبَّتَهَا، وَأَنْ تَرَى الْحُفَاةَ الْعُرَاةَ الْعَالَةَ رِعَاءَ الشَّاءِ يَتَطَاوَلُونَ فِي الْبُنْيَانِ. ثُمَّ انْطَلَقَ، فَلَبِثْتُ مَلِيًّا، \nثُمَّ قَالَ: يَا عُمَرُ أَتَدْرِي مَنْ السَّائِلُ؟. \n‫‬قُلْتُ: اللَّهُ وَرَسُولُهُ أَعْلَمُ. \nقَالَ: فَإِنَّهُ جِبْرِيلُ أَتَاكُمْ يُعَلِّمُكُمْ دِينَكُمْ \". \n.",
         "english": {
            "narrator": "Also on the authority of `Umar (ra) who said:",
            "text": "While we were one day sitting with the Messenger of Allah (ﷺ) there appeared before us a man dressed in extremely white clothes and with very black hair. No traces of journeying were visible on him, and none of us knew him.\n\nHe sat down close by the Prophet (ﷺ) rested his knees against the knees of the Prophet (ﷺ) and placed his palms over his thighs, and said: \"O Muhammad! Inform me about Islam.\" The Messenger of Allah (ﷺ) replied: \"Islam is that you should testify that there is no deity worthy of worship except Allah and that Muhammad is His Messenger (ﷺ), that you should perform salah (ritual prayer), pay the zakah, fast during Ramadan, and perform Hajj (pilgrimage) to the House (the Ka`bah at Makkah), if you can find a way to it (or find the means for making the journey to it).\" He said: \"You have spoken the truth.\"\n\nWe were astonished at his thus questioning him (ﷺ) and then telling him that he was right, but he went on to say, \"Inform me about Iman (faith).\" He (the Prophet) answered, \"It is that you believe in Allah and His angels and His Books and His Messengers and in the Last Day, and in fate (qadar), both in its good and in its evil aspects.\" He said, \"You have spoken the truth.\"\n\nThen he (the man) said, \"Inform me about Ihsan.\" He (the Prophet) answered, \"It is that you should serve Allah as though you could see Him, for though you cannot see Him yet He sees you.\"\n\nHe said, \"Inform me about the Hour.\" He (the Prophet) said, \"About that the one questioned knows no more than the questioner.\" So he said, \"Well, inform me about its signs.\" He said, \"They are that the slave-girl will give birth to her mistress and that you will see the barefooted ones, the naked, the destitute, the herdsmen of the sheep (competing with each other) in raising lofty buildings.\" Thereupon the man went off.\n\nI waited a while, and then he (the Prophet) said, \"O `Umar, do you know who that questioner was?\" I replied, \"Allah and His Messenger know better.\" He said, \"That was Jibril. He came to teach you your religion.\"\n\n"
         }
      },
   
]
```

## Asset Configuration

Make sure to add your JSON file to the `pubspec.yaml`:

```yaml
flutter:
  assets:
    - assets/hadiths.json
```

## Contributing

Feel free to submit issues or pull requests. Contributions are welcome!



### Notes:
- **JSON Structure**: Ensure that the JSON structure matches the one expected by your code.
- **Asset Configuration**: Update the path to match where your assets are located.
- **Contact**: Replace with your actual contact details.

Feel free to adjust the content to better fit your package's specifics and requirements!

## Assets

Make sure to place the `hadiths.json` file in the `assets` directory of your project, and ensure it is included in your `pubspec.yaml` file under `flutter: assets`.

## License

This package is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Contact

For any questions or issues, please contact [Mohamed Kandil](mailto:mohamedkandeal7@gmail.com).

---

Feel free to modify this `README.md` as needed for your package!


### Key Sections:

- **Overview**: Provides a summary of what the package does.
- **Features**: Lists the main features of the package.
- **Installation**: Instructions on how to add the package to a Flutter project.
- **Usage**: Example code to help users get started with the package.
- **Assets**: Notes on ensuring the `hadiths.json` file is correctly placed and configured.
- **License**: Licensing information for the package.
- **Contact**: Contact information for support.

Make sure to adapt and expand the `README.md` file based on additional features or changes you make to the package.
