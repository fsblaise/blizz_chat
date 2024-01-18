import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({required this.searchController, required this.fn, super.key});
  final Function(String) fn;
  final TextEditingController searchController;

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: const Color.fromRGBO(150, 150, 150, 0.2),
        ),
        child: TextField(
          controller: widget.searchController,
          onSubmitted: (value) => widget.fn(value),
          decoration:
              const InputDecoration(hintText: 'Search', border: InputBorder.none, prefixIcon: Icon(Icons.search)),
        ),
      ),
    );
  }
}
