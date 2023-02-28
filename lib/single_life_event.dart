class SingleLifeEvent<T> {
  T? _value;

  T? get value {
    T? result = _value;
    _value = null;
    return result;
  }

  set value(T? val) => _value = val;
}
