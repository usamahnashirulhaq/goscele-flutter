import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

/// Loader dialog that waits for a [Future] to finish before it disappears.
class FutureLoaderDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  FutureLoaderDialog({
    this.request,
    this.completer,
  })  : assert(request.customData != null),
        assert(request.title != null);

  @override
  Widget build(BuildContext context) {
    request.customData.then((val) {
      Navigator.of(context).pop(val);
      completer(DialogResponse(confirmed: true));
    }).catchError((e) {
      Navigator.of(context).pop();
      completer(DialogResponse(confirmed: false));
    });

    return WillPopScope(
      child: _buildDialog(context),
      onWillPop: () {
        return Future(() {
          return false;
        });
      },
    );
  }

  Widget _buildDialog(BuildContext context) {
    final content = Container(
      height: 100,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(width: 20),
            _buildText(context)
          ]),
    );

    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: content,
    );
  }

  Widget _buildText(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Text(request.title),
    );
  }
}