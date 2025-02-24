class MenuItemsData {
  final String menuItemId;
  final String title;
  final String description;
  final String imageUrl;
  final double deliveryprice;
  final double pickupPrice;
  final double tablePrice;
  final bool isDealProduct;
  final List ModifierGroupRulesIds;

  MenuItemsData({
    required this.menuItemId,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.deliveryprice,
    required this.pickupPrice,
    required this.tablePrice,
    required this.isDealProduct,
    required this.ModifierGroupRulesIds,
  });
}
