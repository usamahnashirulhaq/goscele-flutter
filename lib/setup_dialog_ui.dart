import 'package:goscele/components/dialogs/future_loader_dialog.dart';
import 'package:goscele/service_locator.dart';
import 'package:stacked_services/stacked_services.dart';

/// Setup function to build dialogs using [DialogService]
// The types of dialogs to show
enum DialogType { loader }

/// Set up the builders of each dialog types
void setupDialogUI() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.loader: (context, sheetRequest, completer) =>
        FutureLoaderDialog(request: sheetRequest, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
