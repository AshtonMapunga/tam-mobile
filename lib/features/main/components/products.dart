import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trulyafricamarket/utils/assets_utils.dart';
import 'package:trulyafricamarket/utils/colors/pallete.dart';

class ProductsComponent extends StatelessWidget {
  final String title;
  final String seeAllText;
  final VoidCallback? onSeeAllPressed;
  final List<Product> products;
  final ValueChanged<Product>? onProductPressed;
  final ValueChanged<Product>? onAddToCart;

  const ProductsComponent({
    Key? key,
    this.title = 'Featured Products',
    this.seeAllText = 'See all',
    this.onSeeAllPressed,
    required this.products,
    this.onProductPressed,
    this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),

            Image.asset(
                     Assets.forwardArrow,
                          fit: BoxFit.contain,
                          height: 30,
                        ),
       
          ],
        ),
                        const SizedBox(height: 5),

        SizedBox(
          height: 240,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return GestureDetector(
                onTap: () => onProductPressed?.call(product),
                child: Container(
                  width: 160,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product image
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        child: SizedBox(
                          height: 140,
                          width: double.infinity,
                          child: Image.network(
                            product.imageUrl,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                color: Colors.grey[200],
                                child: Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress.cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Pallete.primaryColor,
                                child: Icon(
                                  Icons.shopping_bag,
                                  color: Pallete.primaryColor,
                                  size: 50,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Product details
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 16,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  product.rating.toString(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  product.price,
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Pallete.primaryColor, // Replace with your Pallete.secondaryColor
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => onAddToCart?.call(product),
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Pallete.primaryColor, // Replace with your Pallete.secondaryColor
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class Product {
  final String name;
  final String price;
  final String imageUrl;
  final double rating;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.rating,
  });
}

// Sample product data with Unsplash images
final List<Product> sampleProducts = [
  Product(
    name: 'Modern Chair',
    price: '\$129.99',
    imageUrl: 'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400&h=300&fit=crop',
    rating: 4.8,
  ),
  Product(
    name: 'Wireless Headphones',
    price: '\$89.99',
    imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400&h=300&fit=crop',
    rating: 4.6,
  ),
  Product(
    name: 'Smart Watch',
    price: '\$199.99',
    imageUrl: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400&h=300&fit=crop',
    rating: 4.9,
  ),
  Product(
    name: 'Camera Lens',
    price: '\$299.99',
    imageUrl: 'https://images.unsplash.com/photo-1606983340126-99ab4feaa64a?w=400&h=300&fit=crop',
    rating: 4.7,
  ),
  Product(
    name: 'Running Shoes',
    price: '\$79.99',
    imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400&h=300&fit=crop',
    rating: 4.5,
  ),
  Product(
    name: 'Backpack',
    price: '\$49.99',
    imageUrl: 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400&h=300&fit=crop',
    rating: 4.4,
  ),
];