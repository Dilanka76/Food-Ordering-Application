import 'package:flutter/material.dart';
import 'package:food_ordering_application/widgets/view_shoping_cart_popup.dart';
import 'package:provider/provider.dart';
import '../constant/colors_padding_sizes.dart';
import '../models/proceed_item_model.dart';
import '../providers/card_provider.dart';

class AddToCartCard extends StatefulWidget {
  final selectedMenuItemDataset;
  const AddToCartCard({
    super.key,
    required this.selectedMenuItemDataset
  });

  @override
  State<AddToCartCard> createState() => _AddToCartCardState();
}

class _AddToCartCardState extends State<AddToCartCard> {
  late final TextEditingController comentText = TextEditingController();

  int addToCartCount = 0;

  bool showDailog =false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Add Comments (Optional)", style: normalSize),
          Container(
            child: TextField(
              controller: comentText,
              decoration: InputDecoration(
                hintText: 'Write Here',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: mainColor, width: 2.0),
                ),
              ),
              maxLines: 4,
            ),
          ),
          SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white, //
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (addToCartCount != 0) {
                              addToCartCount--;
                            }
                          });
                        },
                        icon: Icon(Icons.remove, color: mainColor),
                      ),
                      Text(
                        "$addToCartCount",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            addToCartCount++;
                          });
                        },
                        icon: Icon(Icons.add, color: mainColor),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Container(
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: mainColor,
                        textStyle: const TextStyle(fontSize: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8,), // Circular border
                        ),
                      ),
                      onPressed: () async {
                        await addToCartProcess ();
                        if(addToCartCount !=0){
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return ViewShopingCartPopup();
                            },
                          );
                        }
                         setState(() {
                         });
                      },
                      child: Text("Add to Cart", style: mainTopicSize),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
    addToCartProcess (){
    List <ProceedItemsData> list = Provider.of<CardProvider>(context,listen: false).proceedOrderList;
    list.add(
        ProceedItemsData(
          itemName: widget.selectedMenuItemDataset[0].title,
          itemcount: addToCartCount,
          itemId: widget.selectedMenuItemDataset[0].menuItemId,
          imageUrl: widget.selectedMenuItemDataset[0].imageUrl,
        )
    );
  }
}
