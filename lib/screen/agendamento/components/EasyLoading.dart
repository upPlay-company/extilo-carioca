import 'package:flutter_easyloading/flutter_easyloading.dart';

// ignore: missing_return
EasyLoading easyLoading() {
  EasyLoading.show(
    status: 'Carregando',
    maskType: EasyLoadingMaskType.black,
  );
}
