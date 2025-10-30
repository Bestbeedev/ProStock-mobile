import 'package:flutter/material.dart';
import '../../models/category.dart';
import '../../providers/category_provider.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final CategoryProvider _categoryProvider = CategoryProvider();
  List<Category> _categories = [];
  bool _loading = true;
  String token = "";
  
  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  Future<void> _fetchCategories() async {
    try {
      await _categoryProvider.fetchCategories(token);
      setState(() {
        _categories = _categoryProvider.categories;
        _loading = false;
      });
    } catch (e) {
      debugPrint("Erreur chargement catégories: $e");
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Catégories"), centerTitle: true),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _categories.isEmpty
          ? const Center(child: Text("Aucune catégorie trouvée 😢"))
          : ListView.builder(
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final cat = _categories[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: ListTile(
                    leading: cat.image != null
                        ? Image.network(
                            cat.image!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )
                        : const Icon(Icons.category),
                    title: Text(cat.title),
                    subtitle: Text(cat.description),
                    onTap: () {
                      // TODO: Naviguer vers les produits de cette catégorie
                    },
                  ),
                );
              },
            ),
    );
  }
}
