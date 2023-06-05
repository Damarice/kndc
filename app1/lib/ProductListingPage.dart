import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;

  Product(this.name, this.price);
}

class ProductListingPage extends StatefulWidget {
  const ProductListingPage({Key? key}) : super(key: key);

  @override
  _ProductListingPageState createState() => _ProductListingPageState();
}

class _ProductListingPageState extends State<ProductListingPage> {
  List<Product> _products = [
    Product('Apple', 2.5),
    Product('Banana', 1.5),
    Product('Orange', 3.0),
    Product('Grapes', 4.0),
    Product('Mango', 2.8),
    Product('Strawberry', 1.2),
    Product('Watermelon', 3.5),
    Product('Pineapple', 2.7),
    Product('Kiwi', 1.8),
    Product('Peach', 2.3),
  ];

  List<Product> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _filteredProducts = List.from(_products);
    _filteredProducts.sort((a, b) => a.name.compareTo(b.name));
  }

  void _applyFilter() {
    setState(() {
      // Apply filter based on selected options
      // For simplicity, let's assume the filtering logic is already implemented
      // and the filtered list is assigned to _filteredProducts
    });
  }

  void _navigateToBiddingPage(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BiddingPage(product: product)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Listing'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Search',
                    ),
                    onChanged: (value) {
                      // Perform search/filtering based on entered value
                      // For simplicity, let's assume the search logic is already implemented
                      // and the filtered list is assigned to _filteredProducts
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: _applyFilter,
                  child: const Text('Apply Filter'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredProducts.length,
              itemBuilder: (context, index) {
                final product = _filteredProducts[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('Price: \$${product.price.toStringAsFixed(2)}'),
                  trailing: ElevatedButton(
                    onPressed: () => _navigateToBiddingPage(product),
                    child: const Text('Bid'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BiddingPage extends StatelessWidget {
  final Product product;

  const BiddingPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bidding for ${product.name}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Product: ${product.name}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Price: \$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Implement bidding logic here
              },
              child: const Text('Place Bid'),
            ),
          ],
        ),
      ),
    );
  }
}
