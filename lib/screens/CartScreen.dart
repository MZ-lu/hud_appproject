// ignore: file_names
import 'package:flutter/material.dart';
import 'package:hud_appproject/screens/merchadising_screen.dart';

class CartScreen extends StatefulWidget {
  final List<MerchItem> cart;

  const CartScreen(this.cart, {super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void removeFromCart(MerchItem item) {
    setState(() {
      widget.cart.remove(item);
    });
  }

  double get totalPrice => widget.cart.fold(0, (sum, item) => sum + item.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body:
          widget.cart.isEmpty
              ? const Center(child: Text('Your cart is empty.'))
              : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.cart.length,
                      itemBuilder: (_, index) {
                        final item = widget.cart[index];
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
                              '\$${item.price.toStringAsFixed(2)}',
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => removeFromCart(item),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'Total: \$${totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Здесь можно вызвать экран оформления заказа
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Order placed!')),
                            );
                            setState(() => widget.cart.clear());
                          },
                          child: const Text('Checkout'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
    );
  }
}
