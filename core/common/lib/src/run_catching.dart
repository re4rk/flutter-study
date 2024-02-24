import '../common.dart';

Result<T> runCatching<T>(T Function() fn) {
  try {
    return Result(fn(), null);
  } catch (e) {
    return Result(null, e.toString());
  }
}
