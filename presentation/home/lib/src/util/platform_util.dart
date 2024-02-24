import 'dart:io';

import 'package:common/common.dart';

bool get isMobile =>
    runCatching<bool>(() => Platform.isAndroid || Platform.isIOS)
        .getOrElse(false);
