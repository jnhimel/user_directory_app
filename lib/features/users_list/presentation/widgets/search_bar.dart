// lib/presentation/widgets/search_bar.dart
import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final Function(String) onSearch;

  const CustomSearchBar({
    Key? key,
    required this.onSearch,
  }) : super(key: key);

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search users...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _searchController.clear();
              widget.onSearch('');
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        ),
        onChanged: (value) {
          widget.onSearch(value);
        },
      ),
    );
  }
}
