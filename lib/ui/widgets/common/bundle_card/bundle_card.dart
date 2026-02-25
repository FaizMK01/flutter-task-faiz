import 'package:faiztask/ui/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:faiztask/ui/common/app_colors.dart';
import 'package:faiztask/ui/common/ui_helpers.dart';
import 'package:faiztask/ui/common/app_strings.dart';

/// Reusable BundleCard widget
/// Shows data size, valid days, price
/// Supports selected state with gradient border
class BundleCard extends StatelessWidget {
  final String dataSize;   // e.g. "3 GB"
  final String validDays;  // e.g. "30 Days"
  final String price;      // e.g. "2.99"
  final bool isSelected;
  final VoidCallback onTap;

  const BundleCard({
    Key? key,
    required this.dataSize,
    required this.validDays,
    required this.price,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8,  
          top: 8,   
        ),
        child: isSelected
            ? selectedCard()
            : unSelectedCard(),
      ),
    );
  }

  /// Card with gradient border when selected
  Widget selectedCard() {
    return Container(
      width: 109,  
      height: 135, 
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [primaryBlue, whatsapp], 
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(1.5), 
        child: Container(
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: _cardContent(),
        ),
      ),
    );
  }

  /// Card with light border when not selected
  Widget unSelectedCard() {
    return Container(
      width: 109,  
      height: 135, 
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: lightBlueBg, width: 1),
      ),
      child: _cardContent(),
    );
  }

  /// Card inner content - shared between selected and unselected
  Widget _cardContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 8),
          child: Container(
            height: 28, // figma badge height
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: lightBlueBg,
              borderRadius: BorderRadius.circular(20),
            ),
           
            child: CusText(
              dataSize,
              fontWeight: FontWeight.w700,
              height: 1.5,
            ),
          ),
        ),

        verticalSpace8,

        const Padding(
          padding: EdgeInsets.only(left: 8),
          
          child: CusText(
            validFor,
            fontSize: 12,
            color: navy,
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 8),
         
          child: CusText(
            validDays,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),

        const Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: SizedBox(
            width: 93, // 109 - 16 padding
            child: Divider(
              color: dividerGrey,
              height: 20,
              thickness: 1,
            ),
          ),
        ),

         Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Row(
            children: [
             

              const CusText(    
                usd,
                fontSize: 16,
                height: 1.5,
                color: primaryBlue,),
      
              horizontalSpace4,
             
              CusText(
                price,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 1.5,
                color: primaryBlue,
              ),
            ],
          ),
        ),
      ],
    );
  }
}