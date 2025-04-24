# Hadith Nawawi Package

## Overview

The **Hadith Nawawi** package is a Flutter plugin designed to provide seamless access to the esteemed collection of **Arba'in Al-Nawawi (الأربعين النووية)**, a compilation of forty hadiths by Imam Nawawi. This package simplifies integrating these foundational Islamic teachings into your Flutter applications, allowing developers to display and interact with the hadiths effortlessly.

---

### Key Features

- **Access Forty Hadiths:** Easily load and display the complete collection of Arba'in Al-Nawawi.
- **Multilingual Support:** Supports both Arabic and English translations of the hadith texts.
- **Customizable Display:** Use the provided widgets or integrate the data into your custom UI.
- **Efficient Data Management:** Load hadiths from a JSON file and parse them into structured objects.
- **Seamless Integration:** Designed for easy integration into any Flutter project.
- **Open Source & Contributions Welcome:** Licensed under the MIT License, this package is open to contributions and suggestions.
- **Clear Documentation:** Comprehensive examples and instructions for quick setup.
- **Asset Configuration Instructions:** Ensure your JSON file is correctly placed and configured.

---

## Installation

To use the **Hadith Nawawi** package in your Flutter application, follow these steps:

1. **Add the Dependency**

   Open your `pubspec.yaml` file and add the following under `dependencies`:

   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     hadith_nawawi: ^0.0.2 # Replace with the latest version
   ```

2. **Install the Package**

   Run the following command in your terminal to install the package:

   ```bash
   flutter pub get
   ```

---

## Usage

### 1. Import the Package

Import the package in your Dart files:

```dart
import 'package:hadith_nawawi/hadith_nawawi.dart';
```

### 2. Load Hadiths

Load the hadiths from the JSON file using the `loadHadiths` method. Ensure that your JSON file is located in the `assets` directory of your project.

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HadithNawawi.loadHadiths(); // Load the hadiths
  runApp(MyApp());
}
```

### 3. Access Hadiths

Retrieve the list of hadiths or fetch a specific hadith by its ID:

```dart
List<Hadith> hadiths = HadithNawawi.getHadiths();
Hadith? specificHadith = HadithNawawi.getHadithByNumber(1);
```

### 4. Search Hadiths

Search for hadiths containing specific text in Arabic or English:

```dart
List<Hadith> searchResults = HadithNawawi.searchHadiths("actions");
```

### 5. Display Hadiths

#### Using Built-in Widgets

The package provides several ready-to-use widgets for displaying hadiths:

```dart
// Display a list of hadiths
HadithListView(
  hadiths: HadithNawawi.getHadiths(),
  onHadithTap: (hadith) {
    // Handle tap on a hadith
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HadithDetailScreen(hadith: hadith),
      ),
    );
  },
)

// Display a single hadith card
HadithCard(
  hadith: hadith,
  onTap: () {
    // Handle tap on the card
  },
)

// Display detailed hadith information
HadithDetailView(
  hadith: hadith,
  showMetadata: true,
)

// Search bar for hadiths
HadithSearchBar(
  onQueryChanged: (query) {
    setState(() {
      _filteredHadiths = HadithNawawi.searchHadiths(query);
    });
  },
  onClear: () {
    setState(() {
      _filteredHadiths = HadithNawawi.getHadiths();
    });
  },
)
```

#### Custom Implementation

You can also create your own custom UI:

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
          title: Text('Hadith ${hadith.idInBook}'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(hadith.arabic),
              Text(hadith.english.text, style: TextStyle(color: Colors.grey)),
            ],
          ),
        );
      },
    );
  }
}
```

---

## JSON Structure

Ensure your JSON file (`assets/hadiths.json`) follows this structure:

```json
{
  "id": 10,
  "metadata": {
    "id": 10,
    "length": 42,
    "arabic": {
      "title": "الأربعون النووية",
      "author": "الإمام يحيى بن شرف النووي",
      "introduction": ""
    },
    "english": {
      "title": "The Forty Hadith of Imam Nawawi",
      "author": "Imam Yahya ibn Sharaf al-Nawawi",
      "introduction": ""
    }
  },
  "chapters": [
    {
      "id": 0,
      "bookId": 10,
      "arabic": "الأربعون النووية",
      "english": "Forty Hadith of an-Nawawi"
    }
  ],
  "hadiths": [
    {
      "id": 40944,
      "idInBook": 1,
      "chapterId": 0,
      "bookId": 10,
      "arabic": "عَنْ أَمِيرِ الْمُؤْمِنِينَ أَبِي حَفْصٍ عُمَرَ بْنِ الْخَطَّابِ رَضِيَ اللهُ عَنْهُ قَالَ...",
      "english": {
        "narrator": "It is narrated on the authority of Amirul Mu'minin, Abu Hafs 'Umar bin al-Khattab (ra) who said:",
        "text": "I heard the Messenger of Allah (ﷺ) say..."
      }
    },
    {
      "id": 40945,
      "idInBook": 2,
      "chapterId": 0,
      "bookId": 10,
      "arabic": "عَنْ عُمَرَ رَضِيَ اللهُ عَنْهُ أَيْضًا قَالَ...",
      "english": {
        "narrator": "Also on the authority of `Umar (ra) who said:",
        "text": "While we were one day sitting with the Messenger of Allah (ﷺ)..."
      }
    }
  ]
}
```

---

## Asset Configuration

Make sure to include the JSON file in your `pubspec.yaml`:

```yaml
flutter:
  assets:
    - assets/hadiths.json
```

Place the `hadiths.json` file in the `assets` directory of your project.

---

## Contributing

We welcome contributions to improve this package! If you'd like to contribute, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Submit a pull request with clear descriptions of your changes.

For major changes, please open an issue first to discuss what you would like to change.

---

## License

This package is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for more details.

---

## Contact

For questions, feedback, or support, feel free to reach out to:

- Email: [mohamedkandeal7@gmail.com](mailto:mohamedkandeal7@gmail.com)
- LinkedIn: [Mohamed Kandil](https://www.linkedin.com/in/mohamed-kandil-97k)
- GitHub: [@Kandil7](https://github.com/Kandil7)

---

### Why Choose Hadith Nawawi?

This package is designed to simplify the process of integrating Islamic teachings into your Flutter applications. Whether you're building an educational app, a religious companion, or a personal learning tool, **Hadith Nawawi** provides everything you need to work with the forty hadiths of Imam Nawawi efficiently.
