import 'package:flutter/material.dart';
import 'package:hud_appproject/screens/FavoritesScreen.dart'
    show FavoritesScreen;

class MerchItem {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  bool isFavorite;

  MerchItem({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    this.isFavorite = false,
  });
}

class MerchandisingScreen extends StatefulWidget {
  const MerchandisingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MerchandisingScreenState createState() => _MerchandisingScreenState();
}

class _MerchandisingScreenState extends State<MerchandisingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<MerchItem> allItems = [
    // Stuff (4)
    MerchItem(
      id: 's1',
      title: 'Bag',
      description: 'Convenient branded bag.',
      price: 12.99,
      imageUrl: 'merch/stuff/astana merch 5.png',
      category: 'stuff',
    ),
    MerchItem(
      id: 's2',
      title: 'Mug',
      description: 'Ceramic mug with logo',
      price: 9.99,
      imageUrl: 'merch/stuff/astana merch 10.png',
      category: 'stuff',
    ),
    MerchItem(
      id: 's3',
      title: 'Notebook',
      description: 'Lined notebook for notes',
      price: 7.49,
      imageUrl: 'merch/stuff/astana merch 7.png',
      category: 'stuff',
    ),
    MerchItem(
      id: 's4',
      title: 'Umbrella',
      description: 'Umbrella for all weather conditions.',
      price: 4.99,
      imageUrl: 'merch/stuff/astana merch 8.png',
      category: 'stuff',
    ),
    // Clothes (7)
    MerchItem(
      id: 'c1',
      title: 'T-Shirt',
      description: '100% cotton white tee',
      price: 19.99,
      imageUrl: 'merch/clothes/astana merch.png',
      category: 'clothes',
    ),
    MerchItem(
      id: 'c2',
      title: 'Hoodie',
      description: 'Warm fleece hoodie',
      price: 39.99,
      imageUrl: 'merch/clothes/astana merch 6.png',
      category: 'clothes',
    ),
    MerchItem(
      id: 'c3',
      title: 'Bomber',
      description: 'Warm and comfortable',
      price: 14.99,
      imageUrl: 'merch/clothes/astana merch 11.png',
      category: 'clothes',
    ),
    MerchItem(
      id: 'c4',
      title: 'T-Shirt 2',
      description: '100% cotton white tee',
      price: 6.99,
      imageUrl: 'merch/clothes/astana merch 2.png',
      category: 'clothes',
    ),
    MerchItem(
      id: 'c5',
      title: 'Hoodie 2',
      description: 'Warm fleece hoodie',
      price: 11.99,
      imageUrl: 'merch/clothes/astana merch 9.png',
      category: 'clothes',
    ),
    MerchItem(
      id: 'c6',
      title: 'Jacket',
      description: 'Windbreaker jacket',
      price: 59.99,
      imageUrl: 'merch/clothes/astana merch 4.png',
      category: 'clothes',
    ),
    MerchItem(
      id: 'c7',
      title: 'Jacket 2',
      description: 'Windbreaker jacket',
      price: 13.99,
      imageUrl: 'merch/clothes/astana merch 3.png',
      category: 'clothes',
    ),
  ];

  List<MerchItem> cart = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  void toggleFavorite(String id) {
    setState(() {
      final index = allItems.indexWhere((item) => item.id == id);
      if (index != -1) {
        allItems[index].isFavorite = !allItems[index].isFavorite;
      }
    });
  }

  void addToCart(MerchItem item) {
    setState(() {
      cart.add(item);
    });
  }

  Widget buildItemCard(MerchItem item) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: Image.network(
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
              icon: Icon(
                item.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: () => toggleFavorite(item.id),
            ),
            ElevatedButton(
              onPressed: () => addToCart(item),
              child: const Text('Add to cart'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTabView(List<MerchItem> items) {
    return ListView(children: items.map(buildItemCard).toList());
  }

  @override
  Widget build(BuildContext context) {
    final stuffItems =
        allItems.where((item) => item.category == 'stuff').toList();
    final clothesItems =
        allItems.where((item) => item.category == 'clothes').toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Merchandise'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Stuff'),
            Tab(text: 'Clothes'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) => FavoritesScreen(
                        favorites:
                            allItems.where((item) => item.isFavorite).toList(),
                        onToggleFavorite: toggleFavorite,
                        onAddToCart: addToCart,
                      ),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CartScreen(cart)),
              );
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildTabView(allItems),
          buildTabView(stuffItems),
          buildTabView(clothesItems),
        ],
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  final List<MerchItem> cart;

  const CartScreen(this.cart);

  @override
  Widget build(BuildContext context) {
    double total = cart.fold(0, (sum, item) => sum + item.price);

    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body:
          cart.isEmpty
              ? const Center(child: Text('Your cart is empty'))
              : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (_, index) {
                        final item = cart[index];
                        return ListTile(
                          title: Text(item.title),
                          subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Total: \$${total.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
    );
  }
}
