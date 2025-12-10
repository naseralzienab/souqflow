import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:souqflow/models/review.dart';
import 'package:souqflow/providers/products_provider.dart';
import 'package:souqflow/providers/cart_provider.dart';
import 'package:souqflow/core/constants/colors.dart';
import 'package:souqflow/providers/reviews_provider.dart';
import 'package:souqflow/screens/cart_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    //search the product by its ID
    final productsProvider = Provider.of<ProductsProvider>(context);
    final product = productsProvider.products.firstWhere(
      (prod) => prod.id == productId,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              color: AppColors.primaryLight,
              child: Icon(Icons.shopping_bag, size: 100, color: Colors.white),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(fontSize: 16, color: AppColors.textLight),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '\$${product.price}',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(height: 24),
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
                              '${product.name} Added to Cart Successfully!',
                            ),
                            backgroundColor: AppColors.success,
                            duration: Duration(seconds: 3),
                            action: SnackBarAction(
                              label: 'Go to cart',
                              textColor: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CartScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  _buildReviewsSection(context, product.id),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewsSection(BuildContext context, String productId) {
    return Consumer<ReviewsProvider>(
      builder: (ctx, reviewsProvider, child) {
        final productReviews = reviewsProvider.getReviewsForProduct(productId);
        final averageRating = reviewsProvider.getAverageRating(productId);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Reviews',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    SizedBox(width: 4),
                    Text(
                      averageRating.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      '(${productReviews.length})',
                      style: TextStyle(color: AppColors.textLight),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12),

            if (productReviews.isEmpty)
              Text(
                'No reviews yet',
                style: TextStyle(
                  color: AppColors.textLight,
                  fontStyle: FontStyle.italic,
                ),
              )
            else
              Column(
                children: productReviews
                    .take(3)
                    .map((review) => _buildReviewItem(review))
                    .toList(),
              ),
          ],
        );
      },
    );
  }

  Widget _buildReviewItem(Review review) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                review.userName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    review.rating.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 4,),
                  Icon(Icons.star, color: Colors.amber, size: 16,),
                ],
              ),
            ],
          ),
          SizedBox(height: 8,),
          Text(
            review.comment,
            style: TextStyle(
              color: AppColors.textLight,
            ),
          ),
        ],
      ),
    );
  }
}
