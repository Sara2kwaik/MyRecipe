import 'package:flutter/material.dart';

class CategoryFilter extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onSelected;

  CategoryFilter({
    super.key,
    required this.selectedCategory,
    required this.onSelected,
  });

  final List<String> categories = [
    "All",
    "Sweets",
    "Dishes",
    "Healthy",
    "Grilled",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final category = categories[index];
          final bool isSelected = category == selectedCategory;

          return GestureDetector(
            onTap: () => onSelected(category),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? Colors.orange : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Text(
                category,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black54,
                  fontSize: 14,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
