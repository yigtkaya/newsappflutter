/// List extension to check if a list is null or empty.
extension NullListExtension<T> on List<T>? {
  /// Check if the list is null or empty.
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  /// Check if the list is not null or empty.
  bool get isNotNullOrEmpty => this != null && this!.isNotEmpty;
}

/// List extension to get the first element that satisfies the condition.
extension NullableFirstWhere<E> on Iterable<E?> {
  /// Get the first element that satisfies the condition.
  E? firstWhereNull(bool Function(E element) test, {E Function()? orElse}) {
    for (final element in this) {
      if (element != null) {
        if (test(element)) {
          return element;
        }
      }
    }
    if (orElse != null) return orElse();
    return null;
  }
}
