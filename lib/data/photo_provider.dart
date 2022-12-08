import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_search/data/api.dart';
import 'package:image_search/model/Photo.dart';

class PhotoProvider extends InheritedWidget { // 상태관리, 필요한 데이터를 하위 위젯 트리로 전달한다. // 불변객체만 가질 수 있음
  final PixabayApi api;

  final _photoStreamController = StreamController<List<Photo>>()..add([]); // ..add([]) void를 리턴하는 메서드를 사용하여 객체 레퍼런스를 반환할수 있음
  Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  PhotoProvider({
    Key? key,
    required this.api,
    required Widget child,
  }) : super(key: key, child: child);

  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result =
        context.dependOnInheritedWidgetOfExactType<PhotoProvider>();
    assert(result != null, 'No PixabayApi found in context');
    return result!;
  }

  Future<void> fetch(String query) async {
    final result = await api.fetch(query);
    _photoStreamController.add(result);
  }

  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    return oldWidget.api != api;
  }
}