import 'package:flutter/material.dart';

class PopularSearches extends StatelessWidget {
  final List<String> popularSearches;
  final Function(String) onTap;

  PopularSearches({required this.popularSearches, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: popularSearches
          .map(
            (search) => GestureDetector(
              onTap: () {
                onTap(search);
              },
              child: Chip(
                label: Text(search),
              ),
            ),
          )
          .toList(),
    );
  }
}
