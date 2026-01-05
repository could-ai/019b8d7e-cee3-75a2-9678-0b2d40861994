class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String category;
  final String platform; // 'instagram', 'twitter', 'facebook', etc.
  final String imageUrl; // Placeholder for now

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.platform,
    required this.imageUrl,
  });
}

final List<Product> mockProducts = [
  Product(
    id: '1',
    title: 'Aged Instagram Account (2016)',
    description: 'Original Instagram account with real followers',
    price: 25000,
    category: 'Aged Instagram',
    platform: 'instagram',
    imageUrl: 'assets/instagram_3d.png',
  ),
  Product(
    id: '2',
    title: 'Verified Aged Twitter',
    description: 'Verified aged Twitter account with original email access',
    price: 15000,
    category: 'Aged Twitter',
    platform: 'twitter',
    imageUrl: 'assets/twitter_3d.png',
  ),
  Product(
    id: '3',
    title: 'USA Facebook Account',
    description: 'High quality USA based Facebook profile with activity',
    price: 12000,
    category: 'USA Facebook',
    platform: 'facebook',
    imageUrl: 'assets/facebook_3d.png',
  ),
  Product(
    id: '4',
    title: 'Random Facebook Account',
    description: 'Random aged Facebook account for ads',
    price: 5000,
    category: 'Random Facebook',
    platform: 'facebook',
    imageUrl: 'assets/facebook_3d.png',
  ),
  Product(
    id: '5',
    title: 'Aged Twitter (2010)',
    description: 'Premium aged Twitter account from 2010',
    price: 30000,
    category: 'Aged Twitter',
    platform: 'twitter',
    imageUrl: 'assets/twitter_3d.png',
  ),
];
