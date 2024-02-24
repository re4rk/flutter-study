class Result<T> {
  final T? value;
  final String? error;

  Result(this.value, this.error);

  bool get isSuccess => value != null;

  bool get isFailure => error != null;

  T getOrElse(T defaultValue) {
    if (value != null) {
      return value!;
    }
    return defaultValue;
  }

  Result<T> onSuccess(T Function(T value) fn) {
    if (value != null) {
      fn(value!);
    }
    return this;
  }

  Result<T> onFailure(T Function(String error) fn) {
    if (error != null) {
      fn(error!);
    }
    return this;
  }
}
