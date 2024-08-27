import 'package:flutter/material.dart';
import 'package:hadith_nawawi/hadith_nawawi.dart'; // Adjust import as needed

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HadithNawawi.getHadiths(); // Ensure this method is correctly implemented

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hadith Nawawi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hadith Nawawi'),
        ),
        body: HadithList(),
      ),
    );
  }
}

class HadithList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hadiths = HadithNawawi.getHadiths(); // Ensure this method returns a list of Hadith objects

    return ListView.builder(
      itemCount: hadiths.length,
      itemBuilder: (context, index) {
        final hadith = hadiths[index];
        return ListTile(
          title: Text('Hadith ${hadith.id}'), // Assuming 'id' is used to identify the hadith
          subtitle: Text(hadith.arabic), // Display the Arabic text of the hadith
        );
      },
    );
  }
}
