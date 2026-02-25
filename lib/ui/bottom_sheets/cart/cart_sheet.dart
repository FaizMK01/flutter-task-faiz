import 'package:faiztask/ui/widgets/common/checkout_button.dart';
import 'package:faiztask/ui/widgets/text_style.dart';
import 'package:flutter/material.dart';
import 'package:faiztask/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'cart_sheet_model.dart';



import 'package:faiztask/ui/common/ui_helpers.dart';
import 'package:faiztask/ui/common/app_strings.dart';

class CartSheet extends StackedView<CartSheetModel> {
  final SheetRequest request;
  final Function(SheetResponse) completer;

  const CartSheet({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
      BuildContext context, CartSheetModel viewModel, Widget? child) {
    final int itemCount = viewModel.items.length;

    // Height based on item count from figma
    double sheetHeight = cartSheetHeight(itemCount);

    return Container(
      height: sheetHeight,
      width: double.infinity,
      padding: const EdgeInsets.only(
        left: 24,   
        right: 24,  
        top: 16,    
        bottom: 24, 
      ),
      decoration: const BoxDecoration(
        color: white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          // ─── Items List ─────────────────────────────────
          // Scrollable when more than 2 items
          itemCount > 2
              ? Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: viewModel.items
                          .map((item) => _buildCartRow(item, viewModel))
                          .toList(),
                    ),
                  ),
                )
              : Expanded(
                  child: Column(
                    children: viewModel.items
                        .map((item) => _buildCartRow(item, viewModel))
                        .toList(),
                  ),
                ),

          // ─── Scroll Indicator (3+ items only) ───────────
          if (itemCount > 2) ...[
            verticalSpace4,
            Center(
              child: Container(
                width: 78,  // figma scrollbar width
                height: 4,  // scrollbar height
                decoration: BoxDecoration(
                  color: navy.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            verticalSpace4,
          ] else
            verticalSpace16,

          // ─── Checkout Button ─────────────────────────────
CheckoutButton(totalPrice: viewModel.totalPriceFormatted),
        ],
      ),
    );
  }

  /// Builds a single cart row with price, quantity controls, remove button
  Widget _buildCartRow(CartItem item, CartSheetModel viewModel) {
    final bool isLast = viewModel.items.last == item;
    final int itemCount = viewModel.items.length;

    // Top spacing based on item count
    double topSpacing = itemCount == 1 ? 12 : itemCount == 2 ? 5 : 0;

    return Column(
      children: [
        SizedBox(height: topSpacing), // dynamic top spacing
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            // ─── Left: Price + Info ───────────────────────
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Price row
                Row(
                  children: [
                  
                    CusText(
                      usdSpace,
                      fontSize: 16,
                      height: 1.5,
                      color: primaryBlue,
                    ),
                     CusText(
                      item.price,
                      fontSize: 16,
                      height: 1.5,
                      fontWeight: FontWeight.w700,
                      color: primaryBlue,
                    ),
                  ],
                ),
               
                  CusText(
                    "${item.dataSize} / ${item.validDays}",
                    fontSize: 13,
                    height: 1.5,
                    color: iconGrey,
                ),
              ],
            ),

            const Spacer(),

            // ─── Quantity Counter ─────────────────────────
            Container(
              width: 86,  // figma width
              height: 34, // figma height
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: navy, width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Decrement button
                  GestureDetector(
                    onTap: () => viewModel.decrement(item),
                    child: const Icon(
                      Icons.remove,
                      size: 15,
                    ),
                  ),
                 
                    CusText(
                      'x${item.quantity}',
                      fontSize: 16,
                      height: 1.5,
                      fontWeight: FontWeight.w700,
                    ),
                  // Increment button
                  GestureDetector(
                    onTap: () => viewModel.increment(item),
                    child: const Icon(
                      Icons.add,
                      color: navy,
                      size: 15,
                    ),
                  ),
                ],
              ),
            ),

            horizontalSpace14,

            // ─── Remove Button ────────────────────────────
            GestureDetector(
              onTap: () => viewModel.removeItem(item),
              child: Image.asset(
                close,
                width: 12,
                height: 12,
              ),
            ),
          ],
        ),

        verticalSpace12,

        // Divider between items (not after last item)
        if (!isLast)
          const Divider(color: dividerGrey, thickness: 1),
      ],
    );
  }

  @override
  CartSheetModel viewModelBuilder(BuildContext context) => CartSheetModel();
}
