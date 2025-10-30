import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';
import '../../widgets/product_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final cartItems = cart.cartItems;

    return Scaffold(
      appBar: AppBar(title: const Text('Panier')),
      body: cartItems.isEmpty
          ? const Center(child: Text('Votre panier est vide'))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (ctx, i) {
                final product = cartItems[i];
                return ProductCard(product: product);
              },
            ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.grey[200],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total: ${cart.totalAmount} €'),
            ElevatedButton(
              onPressed: () {
                // TODO: Ajouter la fonction checkout
              },
              child: const Text('Valider'),
            ),
          ],
        ),
      ),
    );
  }
}
