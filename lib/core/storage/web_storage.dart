import 'dart:convert';
import 'dart:html' if (dart.library.html) 'dart:html' as html;
import 'package:hive/hive.dart';

class WebStorage<T> extends Box<T> {
  final String _name;
  final Map<String, T> _cache = {};
  final T Function(Map<String, dynamic>)? _fromJson;
  final Map<String, dynamic> Function(T)? _toJson;

  WebStorage(this._name, {T Function(Map<String, dynamic>)? fromJson, Map<String, dynamic> Function(T)? toJson})
      : _fromJson = fromJson,
        _toJson = toJson {
    _loadFromLocalStorage();
  }

  void _loadFromLocalStorage() {
    final data = html.window.localStorage[_name];
    if (data != null) {
      final Map<String, dynamic> jsonData = json.decode(data);
      jsonData.forEach((key, value) {
        if (_fromJson != null) {
          _cache[key] = _fromJson!(value as Map<String, dynamic>);
        } else {
          _cache[key] = value as T;
        }
      });
    }
  }

  void _saveToLocalStorage() {
    final Map<String, dynamic> data = {};
    _cache.forEach((key, value) {
      if (_toJson != null) {
        data[key] = _toJson!(value);
      } else {
        data[key] = value;
      }
    });
    html.window.localStorage[_name] = json.encode(data);
  }

  @override
  T? get(key, {T? defaultValue}) => _cache[key.toString()] ?? defaultValue;

  @override
  Future<void> put(key, T value) async {
    _cache[key.toString()] = value;
    _saveToLocalStorage();
  }

  @override
  Future<void> delete(key) async {
    _cache.remove(key.toString());
    _saveToLocalStorage();
  }

  @override
  Future<void> deleteFromDisk() async {
    _cache.clear();
    html.window.localStorage.remove(_name);
  }

  @override
  Future<void> close() async {}

  @override
  bool get isOpen => true;

  @override
  String get name => _name;

  @override
  String? get path => null;

  @override
  bool get lazy => false;

  @override
  bool get isEmpty => _cache.isEmpty;

  @override
  bool get isNotEmpty => _cache.isNotEmpty;

  @override
  Iterable get keys => _cache.keys;

  @override
  int get length => _cache.length;

  @override
  bool containsKey(key) => _cache.containsKey(key.toString());

  @override
  Future<int> add(T value) async {
    final key = _cache.length.toString();
    await put(key, value);
    return _cache.length - 1;
  }

  @override
  Future<Iterable<int>> addAll(Iterable<T> values) async {
    final startIndex = _cache.length;
    var index = startIndex;
    for (final value in values) {
      await put(index.toString(), value);
      index++;
    }
    return Iterable.generate(values.length, (i) => startIndex + i);
  }

  @override
  Future<int> clear() async {
    final length = _cache.length;
    _cache.clear();
    _saveToLocalStorage();
    return length;
  }

  @override
  Future<void> compact() async {}

  @override
  Future<void> deleteAll(Iterable keys) async {
    for (final key in keys) {
      await delete(key);
    }
  }

  @override
  Future<void> deleteAt(int index) async {
    await delete(index.toString());
  }

  @override
  T? getAt(int index) => get(index.toString());

  @override
  dynamic keyAt(int index) => index.toString();

  @override
  Future<void> putAll(Map<dynamic, T> entries) async {
    entries.forEach((key, value) async {
      await put(key, value);
    });
  }

  @override
  Future<void> putAt(int index, T value) async {
    await put(index.toString(), value);
  }

  @override
  Map<dynamic, T> toMap() => Map.from(_cache);

  @override
  List<T> get values => _cache.values.toList();

  @override
  Iterable<T> valuesBetween({startKey, endKey}) {
    if (startKey == null && endKey == null) return values;
    final start = startKey != null ? int.tryParse(startKey.toString()) ?? 0 : 0;
    final end = endKey != null ? int.tryParse(endKey.toString()) ?? length : length;
    return values.sublist(start, end);
  }

  @override
  Stream<BoxEvent> watch({key}) => const Stream.empty();

  @override
  Future<void> flush() async {
    _saveToLocalStorage();
  }
} 