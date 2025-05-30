import 'package:flutter/material.dart';

class CategoriesScreenTab extends StatelessWidget {
  const CategoriesScreenTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.category, size: 80, color: Colors.blueGrey),
          SizedBox(height: 20),
          Text(
            'Explore various product categories here!',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _buildCategoryChip(context, 'Electronics'),
              _buildCategoryChip(context, 'Jewelery'),
              _buildCategoryChip(context, "Men's Clothing"),
              _buildCategoryChip(context, "Women's Clothing"),
              _buildCategoryChip(context, 'Books'),
              _buildCategoryChip(context, 'Home & Kitchen'),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCategoryChip(BuildContext context, String category) {
    return Chip(
      label: Text(category),
      avatar: Icon(Icons.label_outline),
      backgroundColor: Colors.blueGrey.shade100,
      labelStyle: TextStyle(color: Colors.blueGrey.shade800),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}