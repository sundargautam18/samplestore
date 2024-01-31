import 'package:flutter/material.dart';

class AppSearch extends SearchDelegate {
  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Another Item'
  ]; // Your list of strings

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () {}, icon: const Icon(Icons.sort_rounded)),
      IconButton(onPressed: () {}, icon: const Icon(Icons.filter_alt_sharp)),
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.clear), // Clear button
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestion = query.isEmpty
        ? items
        : items
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestion.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestion[index]),
          onTap: () => close(context, suggestion[index]),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestion = query.isEmpty
        ? items
        : items
            .where((item) => item.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestion.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestion[index]),
          onTap: () => close(context, suggestion[index]),
        );
      },
    );
  }
}
