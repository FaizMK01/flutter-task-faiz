import 'package:faiztask/ui/common/app_colors.dart';
import 'package:faiztask/ui/common/app_strings.dart';
import 'package:faiztask/ui/widgets/text_style.dart';
import 'package:flutter/material.dart';

class CheckoutButton extends StatelessWidget {
  final String totalPrice;

  const CheckoutButton({
    Key? key,
    required this.totalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: whatsapp,
          borderRadius: BorderRadius.circular(24),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
           
            CusText(  
              usdSpace,
              fontSize: 16,
              color: white,
            ),
            CusText(
              totalPrice,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: white,
            ),
           
            CusText(
              checkout,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: white,
            ),
          ],
        ),
      ),
    );
  }
}