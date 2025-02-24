import 'package:flutter/material.dart';
import 'package:food_ordering_application/widgets/view_shoping_cart_popup.dart';
import 'package:provider/provider.dart';
import '../constant/colors_padding_sizes.dart';
import '../providers/card_provider.dart';

class ViewShopingCart extends StatefulWidget {
  const ViewShopingCart({super.key});

  @override
  State<ViewShopingCart> createState() => _ViewShopingCartState();
}

class _ViewShopingCartState extends State<ViewShopingCart> {
  @override
  Widget build(BuildContext context) {
    final viewShopingCartList = Provider.of<CardProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {
            if(viewShopingCartList.proceedOrderList.isNotEmpty){
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) {
                  return ViewShopingCartPopup();
                },
              );
            }else{
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Alert"),
                    content: Text("Cart is Empty !"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: Text("OK"),
                      ),
                    ],
                  );
                },
              );

            }
          },
          icon: Icon(Icons.shopping_cart, color: mainColor,size: 25,),
        ),
      ],
    );;
  }
}

