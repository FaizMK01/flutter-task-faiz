import 'package:faiztask/app/app.locator.dart';
import 'package:faiztask/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';


class CartItem {
  final String dataSize;
  final String validDays;
  final String price;
  int quantity;

  CartItem({
    required this.dataSize,
    required this.validDays,
    required this.price,
    this.quantity = 1,
  });
}
class CartSheetModel extends BaseViewModel {
  
  final HomeViewModel homeViewModel = locator<HomeViewModel>();

  List<CartItem> get items => homeViewModel.cartItems;

  void increment(CartItem item) {
    item.quantity++;
    rebuildUi();
  }

  void decrement(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
      rebuildUi();
    } else {
      removeItem(item);
    }
  }

  void removeItem(CartItem item) {
    homeViewModel.removeSelection(item.dataSize, item.validDays);

    // Close sheet if no items left
    if (items.isEmpty) {
      locator<BottomSheetService>().completeSheet(SheetResponse());
    }

    rebuildUi();
  }

  double get totalPrice => items.fold(
        0,
        (sum, item) => sum + (double.parse(item.price) * item.quantity),
      );

  String get totalPriceFormatted => totalPrice.toStringAsFixed(2);
}