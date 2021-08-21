
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import '../common/common.dart';

class BarcodeScannerView extends StatelessWidget {

  // This is used in the platform side to register the view.
  final String _viewType = BARCODE_SCANNER_VIEW_TYPE;

  // Pass parameters to the platform side.
  final Map<String, dynamic> _creationParams = <String, dynamic>{};

  @override
  Widget build(BuildContext context) {

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return PlatformViewLink(
          viewType: _viewType,
          surfaceFactory: (BuildContext context, PlatformViewController controller) {
            return AndroidViewSurface(
              controller: controller as AndroidViewController,
              gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
              hitTestBehavior: PlatformViewHitTestBehavior.opaque,
            );
          },
          onCreatePlatformView: (PlatformViewCreationParams params) {
            return PlatformViewsService.initSurfaceAndroidView(
              id: params.id,
              viewType: _viewType,
              layoutDirection: TextDirection.ltr,
              creationParams: _creationParams,
              creationParamsCodec: const StandardMessageCodec(),
            )
              ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
              ..create();
          },
        );
      case TargetPlatform.iOS:
        return UiKitView(
          viewType: _viewType,
          layoutDirection: TextDirection.ltr,
          creationParams: _creationParams,
          creationParamsCodec: const StandardMessageCodec(),
        );
      default:
        return Center(
          child: Text("Unavailable"),
        );
    }
  }
}