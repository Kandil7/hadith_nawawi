import 'package:flutter/material.dart';

/// A search bar widget for searching hadiths
class HadithSearchBar extends StatelessWidget {
  /// Controller for the text field
  final TextEditingController? controller;
  
  /// Callback when the search query changes
  final void Function(String query) onQueryChanged;
  
  /// Callback when the clear button is pressed
  final VoidCallback? onClear;
  
  /// Hint text to display in the search bar
  final String hintText;
  
  /// Creates a hadith search bar widget
  const HadithSearchBar({
    Key? key,
    this.controller,
    required this.onQueryChanged,
    this.onClear,
    this.hintText = 'Search Hadiths',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: hintText,
          prefixIcon: const Icon(Icons.search),
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: onClear,
          ),
        ),
        onChanged: onQueryChanged,
      ),
    );
  }
}
