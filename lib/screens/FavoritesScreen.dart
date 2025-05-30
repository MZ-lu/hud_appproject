import 'package:flutter/material.dart';

import 'merchadising_screen.dart';

class FavoritesScreen extends StatelessWidget {
  final List<MerchItem> favorites;
  final Function(String) onToggleFavorite;
  final Function(MerchItem) onAddToCart;

  const FavoritesScreen({
    super.key,
    required this.favorites,
    required this.onToggleFavorite,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body:
          favorites.isEmpty
              ? const Center(child: Text('No favorites yet.'))
              : ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (_, index) {
                  final item = favorites[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    child: ListTile(
                      leading: Image.asset(
                        item.imageUrl,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(item.title),
                      subtitle: Text(
                        '${item.description}\n\$${item.price.toStringAsFixed(2)}',
                      ),
                      isThreeLine: true,
                      trailing: Wrap(
                        spacing: 8,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.favorite, color: Colors.red),
                            onPressed: () => onToggleFavorite(item.id),
                          ),
                          ElevatedButton(
                            onPressed: () => onAddToCart(item),
                            child: const Text('Add to cart'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
