import 'package:flutter/material.dart';
import 'package:food_ordering_application/constant/colors_padding_sizes.dart';
import 'package:food_ordering_application/models/menu_items_model.dart';
import 'is_deal_product_tag.dart';

class MenuItemDescCard extends StatefulWidget {
  final String selectedCatergoryMenuItemName;
  final double selectedCategoryMenuItemprice;
  final List<MenuItemsData> selectedMenuItemDataset;
  const MenuItemDescCard({
    super.key,
    required this.selectedCatergoryMenuItemName,
    required this.selectedCategoryMenuItemprice,
    required this.selectedMenuItemDataset,
  });

  @override
  State<MenuItemDescCard> createState() => _MenuItemDescCardState();
}

class _MenuItemDescCardState extends State<MenuItemDescCard> {
  @override
  Widget build(BuildContext context) {
    for (MenuItemsData item in widget.selectedMenuItemDataset) {}
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "https://s3-alpha-sig.figma.com/img/5ae3/bea9/74c02cf405be136eb85d899535045090?Expires=1740960000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=ih16xpd--InefMMvPt0Xgu6~Sd0u-aAXE~CY3tycJHJn5lZxlc~fuuEBn6yySG~ZuyTMTA-PUofiuAl8vNRLaFFfCbqeAMDwZJv-tmwWDdN1OD1AZBmyhuIkbZ5DdjRVYEun3mQfxHox0n0LrHsE1MGCDFzSdsZQ7CJTKEmLch0SAPWMlRz67KYMiQ6BJ~bbINOZVtrgW3n7~TPGXV-ZSdUnV3W8Il-cEf3FzAt883wsDJEH3srNPG7ks1nEVfnZtFmay6uHdwM-fr-Q7-24yUL7DK~CYdFiEyJdJV0AYSUQ1SmEpw1LJu0jrBtTR-vqLboY0gMifBdOzbyRbDD8Ew__",
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              widget.selectedMenuItemDataset[0].isDealProduct
                  ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IsDaelProTag(),
                  )
                  : Container(),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.selectedCatergoryMenuItemName, style: mainTopicSize),
              Text(
                "Rs ${widget.selectedCategoryMenuItemprice}",
                style: mainTopicSize,
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.location_on_outlined, color: mainColor),
              Row(
                children: [
                  Icon(Icons.star, color: mainColor),
                  Text("5.0", style: mainTopicSize),
                ],
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(
            widget.selectedMenuItemDataset[0].description,
            style: normalSize,
          ),
        ],
      ),
    );
  }
}
