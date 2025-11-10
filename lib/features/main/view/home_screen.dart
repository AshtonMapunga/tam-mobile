import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trulyafricamarket/features/auth/view/profile_screen.dart';
import 'package:trulyafricamarket/features/cart/view/cart_screen.dart';
import 'package:trulyafricamarket/features/main/components/advertising.dart';
import 'package:trulyafricamarket/features/main/components/category.dart';
import 'package:trulyafricamarket/features/main/components/products.dart';
import 'package:trulyafricamarket/features/main/components/slider.dart';
import 'package:trulyafricamarket/features/main/components/special_offer.dart';
import 'package:trulyafricamarket/features/shop/view/shop_screen.dart';
import 'package:trulyafricamarket/features/wishlist/view/wishlist_screen.dart';
import 'package:trulyafricamarket/utils/colors/pallete.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  int _selectedCategoryIndex = 0;
  final ScrollController _scrollController = ScrollController();
  bool _showSearchOnly = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset > 100 && !_showSearchOnly) {
      setState(() {
        _showSearchOnly = true;
      });
    } else if (_scrollController.offset <= 100 && _showSearchOnly) {
      setState(() {
        _showSearchOnly = false;
      });
    }
  }

  void _onCategorySelected(int index) {
    setState(() {
      _selectedCategoryIndex = index;
    });
    print('Selected category index: $index');
  }

  void _onSpecialOfferPressed() {
    print('Special offer button pressed!');
  }

  final List<Product> _featuredProducts = sampleProducts;
  final List<AdvertiseProduct> _advertisingProducts = sampleAdProducts;

  void _onSeeAllPressed() {
    print('See all products pressed');
  }

  void _onProductPressed(Product product) {
    print('Product pressed: ${product.name}');
  }

  void _onAdvertsingProductPressed(AdvertiseProduct product) {
    print('Product pressed: ${product.name}');
  }

  final List<String> _sliderImages = [
    'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=800&h=400&fit=crop',
    'https://images.unsplash.com/photo-1556760544-74068565f05c?w=800&h=400&fit=crop',
    'https://images.unsplash.com/photo-1556742044-5f1d0c6f5b0c?w=800&h=400&fit=crop',
    'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=800&h=400&fit=crop',
  ];

  void _onAddToCart(Product product) {
    print('Add to cart: ${product.name}');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} added to cart'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            // Sliver App Bar
            SliverAppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              pinned: true,
              floating: false, // Changed to false for better control
              snap: false, // Changed to false for better control
              automaticallyImplyLeading: false, // This removes the back arrow
              expandedHeight: 160.0, 
              flexibleSpace: LayoutBuilder(
                builder: (context, constraints) {
                  final safeAreaTop = MediaQuery.of(context).padding.top;
                  final appBarHeight = constraints.biggest.height;
                  final visibleMainHeight = appBarHeight - safeAreaTop;
                  
                  return FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    titlePadding: const EdgeInsets.all(0),
                    expandedTitleScale: 1.0,
                    title: _showSearchOnly 
                        ? Container(
                            color: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                            child: _buildSearchBar(),
                          )
                        : null,
                    background: _buildExpandedHeader(),
                  );
                },
              ),
            ),

            // Main Content
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Categories section
                      CategoryComponent(
                        onCategorySelected: _onCategorySelected,
                        initialSelectedIndex: _selectedCategoryIndex,
                      ),
                      const SizedBox(height: 2),

                      CreativeSlider(
                        imageUrls: _sliderImages,
                        height: 200,
                        borderRadius: 20,
                        autoPlayInterval: Duration(seconds: 4),
                        onTap: () {
                          print('Slider tapped at page');
                        },
                      ),
                      const SizedBox(height: 20),

                      ProductsComponent(
                        products: _featuredProducts,
                        onSeeAllPressed: _onSeeAllPressed,
                        onProductPressed: _onProductPressed,
                        onAddToCart: _onAddToCart,
                      ),
                      const SizedBox(height: 20),

                      AdvertisingComponent(
                        title: "Best offer",
                        products: _advertisingProducts,
                        onProductPressed: _onAdvertsingProductPressed,
                      ),
                      const SizedBox(height: 20),

                      AdvertisingComponent(
                        height: 200,
                        title: "Our Collection",
                        products: _advertisingProducts,
                        onProductPressed: _onAdvertsingProductPressed,
                        backgroundImageUrl:
                            "https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=800&h=400&fit=crop",
                        showProductName: false,
                        productImageHeight: 180,
                      ),
                      const SizedBox(height: 20),

                      // With background image, centered products
                      AdvertisingComponent(
                        height: 250,
                        title: "Our Collection",
                        products: _advertisingProducts,
                        onProductPressed: _onAdvertsingProductPressed,
                        backgroundImageUrl:
                            "https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=800&h=400&fit=crop",
                        showProductName: false,
                        productImageHeight: 120,
                        borderRadius: 20.0,
                      ),
                      const SizedBox(height: 20),

                      // Another example with different settings
                      AdvertisingComponent(
                        height: 300,
                        title: "Premium Products",
                        products: _advertisingProducts,
                        onProductPressed: _onAdvertsingProductPressed,
                        backgroundImageUrl:
                            "https://images.unsplash.com/photo-1556760544-74068565f05c?w=800&h=400&fit=crop",
                        showProductName: true,
                        productImageHeight: 150,
                        borderRadius: 24.0,
                      ),
                      const SizedBox(height: 20),

                      SpecialOfferComponent(
                        title: 'Summer Sale!',
                        description:
                            'Up to 50% off on summer collection. Don\'t miss out!',
                        buttonText: 'Explore',
                        imagePath: 'assets/images/summer_sale.png',
                        backgroundColor: Colors.orange,
                        onPressed: () {
                          print('Summer sale button pressed!');
                        },
                      ),
                      const SizedBox(height: 30),

                      ProductsComponent(
                        title: 'New Arrivals',
                        products: sampleProducts.sublist(0, 3),
                        onSeeAllPressed: _onSeeAllPressed,
                        onProductPressed: _onProductPressed,
                        onAddToCart: _onAddToCart,
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildExpandedHeader() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30), 
          
          // Buttons Row
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    // Handle Google sign up
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 11),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: BorderSide(
                      color: Pallete.lightPrimaryTextColor.withOpacity(0.3),
                    ),
                    backgroundColor: Colors.yellow,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 24,
                        width: 24,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.g_mobiledata,
                            size: 32,
                            color: Colors.red,
                          );
                        },
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Truly Africa',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Pallete.lightPrimaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),

              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    // Handle Facebook sign up
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 11),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: BorderSide(
                      color: Pallete.lightPrimaryTextColor.withOpacity(0.3),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/onlinebuy.png',
                        height: 24,
                        width: 24,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.facebook,
                            size: 24,
                            color: Colors.blue.shade700,
                          );
                        },
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Buy Online',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Pallete.lightPrimaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    // Handle Facebook sign up
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 11),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: BorderSide(
                      color: Pallete.lightPrimaryTextColor.withOpacity(0.3),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/deliver.png',
                        height: 24,
                        width: 24,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.facebook,
                            size: 24,
                            color: Colors.blue.shade700,
                          );
                        },
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Deliver',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Pallete.lightPrimaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Search bar
          _buildSearchBar(),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          Icon(
            Iconsax.search_normal,
            color: Pallete.lightPrimaryTextColor.withOpacity(0.5),
            size: 18,
          ),
          const SizedBox(width: 12),
        Expanded(
  child: TextField(
    style: GoogleFonts.poppins(
      fontSize: 14, // reduce main text font size
      color: Pallete.lightPrimaryTextColor,
    ),
    decoration: InputDecoration(
      hintText: 'Search products...',
      hintStyle: GoogleFonts.poppins(
        fontSize: 13, // reduce hint text font size
        color: Pallete.lightPrimaryTextColor.withOpacity(0.5),
      ),
      border: InputBorder.none,
    ),
  ),
),

          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Pallete.secondaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Iconsax.filter, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }

// In your _HomeScreenState class, modify the bottom navigation bar onTap:
Widget _buildBottomNavigationBar() {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, -2),
        ),
      ],
    ),
    child: BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
     if (index == 3) {
  // Navigate to CartScreen
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => CartScreen()),
  );
} else if (index == 4) {
  // Navigate to ProfileScreen
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ProfileScreen()),
  );
}
else if (index == 2) {
  // Navigate to ProfileScreen
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => WishlistScreen()),
  );
}

else if (index == 1) {
  // Navigate to ProfileScreen
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ShopScreen()),
  );
}






     
      },
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Pallete.secondaryColor,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: GoogleFonts.poppins(fontSize: 12),
      unselectedLabelStyle: GoogleFonts.poppins(fontSize: 12),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Iconsax.home),
          activeIcon: Icon(Iconsax.home_15),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Iconsax.shop),
          activeIcon: Icon(Iconsax.shop5),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
          icon: Icon(Iconsax.heart),
          activeIcon: Icon(Iconsax.heart5),
          label: 'Wishlist',
        ),
        BottomNavigationBarItem(
          icon: Icon(Iconsax.shopping_cart),
          activeIcon: Icon(Iconsax.shopping_cart5),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Iconsax.profile_circle),
          activeIcon: Icon(Iconsax.profile_circle5),
          label: 'Profile',
        ),
      ],
    ),
  );
}
}