import 'package:faiztask/app/app.bottomsheets.dart';
import 'package:faiztask/app/app.locator.dart';
import 'package:faiztask/ui/bottom_sheets/cart/cart_sheet_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();

  /// Tracks selected card IDs (dataSize + validDays)
  final List<String> _selectedIds = [];

  /// Cart items - persists across bottom sheet open/close
  final List<CartItem> cartItems = [];

  /// Check if a bundle card is selected
  bool isSelected(String dataSize, String validDays) {
    return _selectedIds.contains(dataSize + validDays);
  }

  /// Handle bundle card tap
  /// Adds item to cart and opens bottom sheet
  void onBundleCardTap(CartItem item) {
    final String id = item.dataSize + item.validDays;

    // Only add if not already selected
    if (!_selectedIds.contains(id)) {
      _selectedIds.add(id);
      cartItems.add(item);
      rebuildUi();
    }

    // Open cart bottom sheet
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.cart,
      isScrollControlled: true,
      ignoreSafeArea: false,
    );
  }

  /// Remove selection and cart item
  /// Called when cross icon tapped in cart sheet
  void removeSelection(String dataSize, String validDays) {
    _selectedIds.remove(dataSize + validDays);
    cartItems.removeWhere(
      (e) => e.dataSize == dataSize && e.validDays == validDays,
    );
    rebuildUi();
  }
}