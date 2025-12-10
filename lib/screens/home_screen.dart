import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:souqflow/providers/cart_provider.dart';
import 'package:souqflow/providers/products_provider.dart';
import 'package:souqflow/core/constants/colors.dart';
import 'package:souqflow/providers/wishlist_provider.dart';
import 'package:souqflow/screens/product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    final displayedProducts = productsProvider.searchProducts(_searchQuery);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search products...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.grey[50],
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
            SizedBox(height: 16),
            Text(
              'Available Products',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            SizedBox(height: 16),
            //Products List
            Expanded(
              child: displayedProducts.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 60,
                            color: AppColors.textLight,
                          ),
                          SizedBox(height: 16),
                          Text(
                            _searchQuery.isEmpty
                                ? 'No products available'
                                : 'No results for "$_searchQuery"',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.textLight,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: displayedProducts.length,
                      itemBuilder: (context, index) {
                        final product = displayedProducts[index];
                        return ProductCard(
                          product: product,
                          searchQuery: _searchQuery,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, this.searchQuery = ''});
  final Product product;
  final String searchQuery;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(productId: product.id),
          ),
        );
      },
      child: Card(
        elevation: 2,
        margin: EdgeInsets.only(bottom: 12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  product.imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      width: 80,
                      height: 80,
                      color: AppColors.primaryLight,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 80,
                      height: 80,
                      color: AppColors.primaryLight,
                      child: Icon(
                        Icons.shopping_bag,
                        color: Colors.white,
                        size: 40,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(width: 16),
              Consumer<WishlistProvider>(
                builder: (context, wishlist, child) {
                  return IconButton(
                    icon: Icon(
                      wishlist.isInWishlist(product.id)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: wishlist.isInWishlist(product.id)
                          ? Colors.red
                          : Colors.grey,
                    ),
                    onPressed: () {
                      wishlist.toggleWishlist(product.id);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            wishlist.isInWishlist(product.id)
                                ? 'Added to wishlist'
                                : 'Removed from wishlist',
                          ),
                          backgroundColor: AppColors.primary,
                        ),
                      );
                    },
                  );
                },
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: _buildHighlightedText(
                          product.name,
                          searchQuery,
                        ),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      product.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textLight,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          final cartProvider = Provider.of<CartProvider>(
                            context,
                            listen: false,
                          );
                          cartProvider.addItem(product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '${product.name} was added successfully!',
                              ),
                              backgroundColor: AppColors.success,
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                        ),
                        child: Text('Add to Cart'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<TextSpan> _buildHighlightedText(String text, String query) {
    if (query.isEmpty) {
      return [TextSpan(text: text)];
    }

    List<TextSpan> spans = [];
    String lowerText = text.toLowerCase();
    String lowerQuery = query.toLowerCase();

    int lastIndex = 0;
    int index = lowerText.indexOf(lowerQuery);

    while (index != -1) {
      //Text before matching
      spans.add(
        TextSpan(
          text: text.substring(lastIndex, index),
          style: TextStyle(color: AppColors.textDark),
        ),
      );
      //Text that matched
      spans.add(
        TextSpan(
          text: text.substring(index, index + query.length),
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
      lastIndex = index + query.length;
      index = lowerText.indexOf(lowerQuery, lastIndex);
    }
    //Final text after last matching
    spans.add(
      TextSpan(
        text: text.substring(lastIndex),
        style: TextStyle(color: AppColors.textDark),
      ),
    );
    return spans;
  }
}
