import 'package:flutter/material.dart';
import 'package:souqflow/models/review.dart';

class ReviewsProvider extends ChangeNotifier {
  List<Review> _reviews = [
    Review(
      id: '2',
      productId: '1',
      userName: 'Sarah Smith',
      rating: 5.0,
      comment: 'Excellent quality, highly recommended!',
      date: DateTime.now().subtract(Duration(days: 5)),
    ),
    Review(
      id: '3',
      productId: '2',
      userName: 'Mike Johnson',
      rating: 4.0,
      comment: 'Good performance for the price',
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
  ];

  List<Review> get reviews => [..._reviews];

  List<Review> getReviewsForProduct(String productId) {
    return _reviews.where((review) => review.productId == productId).toList();
  }

  void addReview(Review review) {
    _reviews.add(review);
    notifyListeners();
  }

  double getAverageRating(String productId) {
    final productReviews = getReviewsForProduct(productId);
    if (productReviews.isEmpty) {
      return 0.0;
    }
    double total = 0.0;
    for (var review in productReviews) {
      total = total + review.rating;
    }
    return total / productReviews.length;
  }
}
