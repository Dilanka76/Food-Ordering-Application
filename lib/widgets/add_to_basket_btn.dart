import 'package:flutter/material.dart';
import 'package:flutter_add_to_cart_button/flutter_add_to_cart_button.dart';
import 'package:food_ordering_application/constant/colors_padding_sizes.dart';
import 'package:food_ordering_application/providers/card_provider.dart';
import 'package:provider/provider.dart';

class AddToBasketBtn extends StatefulWidget {
  double addBasketCatergotyPrice;
  String addBasketCategoryId;
  AddToBasketBtn({
    super.key,
    required this.addBasketCatergotyPrice,
    required this.addBasketCategoryId,
  });

  @override
  State<AddToBasketBtn> createState() => _AddToBasketBtnState();
}

class _AddToBasketBtnState extends State<AddToBasketBtn> {
  AddToCartButtonStateId stateId = AddToCartButtonStateId.idle;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 50,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: AddToCartButton(
            trolley: Center(
              child: Row(
                children: [
                  Icon(Icons.add, color: Colors.white),
                  Icon(Icons.shopping_basket, color: Colors.white),
                ],
              ),
            ),
            text: Text(
              '',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.white),
              maxLines: 1,
              overflow: TextOverflow.fade,
            ),
            check: SizedBox(
              width: 48,
              height: 48,
              child: Icon(Icons.check, color: Colors.white, size: 24),
            ),
            borderRadius: BorderRadius.circular(24),
            backgroundColor: mainColor,
            onPressed: (id) {
              if (id == AddToCartButtonStateId.idle) {
                Provider.of<CardProvider>(context, listen: false).increment();
                clickAddBasketPrices();
                Provider.of<CardProvider>(
                  context,
                  listen: false,
                ).setBasketCateListData(widget.addBasketCategoryId);
                setState(() {
                  stateId = AddToCartButtonStateId.loading;
                  Future.delayed(Duration(seconds: 1), () {
                    setState(() {
                      stateId = AddToCartButtonStateId.done;
                    });
                  });
                });
              } else if (id == AddToCartButtonStateId.done) {
                Provider.of<CardProvider>(context, listen: false).decrement();
                unClickAddBasketPrices();
                Provider.of<CardProvider>(
                  context,
                  listen: false,
                ).removeBasketCateListData(widget.addBasketCategoryId);
                setState(() {
                  stateId = AddToCartButtonStateId.idle;
                });
              }
            },
            stateId: stateId,
          ),
        ),
      ),
    );
  }

  clickAddBasketPrices() {
    Provider.of<CardProvider>(context, listen: false).totalAddPrice +=
        widget.addBasketCatergotyPrice;
  }

  unClickAddBasketPrices() {
    Provider.of<CardProvider>(context, listen: false).totalAddPrice -=
        widget.addBasketCatergotyPrice;
  }
}
