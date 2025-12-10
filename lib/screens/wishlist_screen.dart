import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:souqflow/providers/wishlist_provider.dart';
import 'package:souqflow/providers/products_provider.dart';
import 'product_detail_screen.dart';
import 'package:souqflow/core/constants/colors.dart';

class WishlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final productsProvider = Provider.of<ProductsProvider>(context);

    final wishlistProducts = productsProvider.products.where((product) {
      return wishlistProvider.isInWishlist(product.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('My Wishlist'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: wishlistProducts.isEmpty
          ? _buildEmptyWishlist()
          : _buildWishlistItems(wishlistProducts, context),
    );
  }

  Widget _buildEmptyWishlist() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border,
            size: 80,
            color: AppColors.textLight,
          ),
          SizedBox(height: 16),
          Text(
            'Your wishlist is empty',
            style: TextStyle(
              fontSize: 20,
              color: AppColors.textLight,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Tap the heart icon on products to add them here',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textLight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWishlistItems(List<Product> products, BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return _buildWishlistItem(product, context);
      },
    );
  }

  Widget _buildWishlistItem(Product product, BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context, listen: false);

    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(productId: product.id),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  product.imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 80,
                      height: 80,
                      color: AppColors.primaryLight,
                      child: Icon(Icons.shopping_bag, color: Colors.white),
                    );
                  },
                ),
              ),
            ),
            SizedBox(width: 16),            
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(productId: product.id),
                        ),
                      );
                    },
                    child: Text(
                      product.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    product.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
                ],
              ),
            ),            
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                wishlistProvider.toggleWishlist(product.id);
                
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Removed from wishlist'),
                    backgroundColor: AppColors.primary,
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        wishlistProvider.toggleWishlist(product.id);
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}