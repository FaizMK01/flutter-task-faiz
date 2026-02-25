import 'package:faiztask/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:faiztask/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:faiztask/ui/views/home/home_view.dart';
import 'package:faiztask/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:faiztask/ui/bottom_sheets/cart/cart_sheet.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: HomeViewModel), // ← add karo
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: CartSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
   // StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
