import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/category_provider.dart';
import '../../widgets/product_card.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<CategoryProvider>(context).categories;

    return Scaffold(
      appBar: AppBar(title: const Text('Catégories')),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (ctx, i) {
          final category = categories[i];
          return ListTile(
            leading: category.image != null
                ? Image.network(category.image!, width: 50, height: 50)
                : const Icon(Icons.category),
            title: Text(category.title),
            subtitle: Text(category.description),
          );
        },
      ),
    );
  }
}
