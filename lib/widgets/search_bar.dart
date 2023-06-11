import 'package:flutter/material.dart';
import 'package:skill_tracker/constants/localization.dart';

class SearchBar extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final Function(String) onSearch;

  const SearchBar({super.key, required this.controller, required this.onSearch, required this.title});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool _isTextEmpty = true;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    final text = widget.controller.text;
    final isTextEmpty = text.isEmpty;
    if (_isTextEmpty != isTextEmpty) {
      setState(() => _isTextEmpty = isTextEmpty);
    }
    widget.onSearch(text);
  }

  void _clearText() {
    widget.controller.clear();
    _onTextChanged();
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.title,
        labelStyle: const TextStyle(color: Colors.grey),
        suffixIcon: _isTextEmpty ? null : IconButton(icon: const Icon(Icons.clear), onPressed: _clearText),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
      onChanged: (text) => _onTextChanged(),
    );
  }
}
