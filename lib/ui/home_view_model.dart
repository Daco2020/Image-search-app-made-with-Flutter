import 'dart:async';

import 'package:image_search/data/api.dart';
import 'package:image_search/model/Photo.dart';

/// 뷰 모델은 비즈니스 모델을 의미함 (MVVM 구현)
/// ViewModel은 앱의 핵심적인 비즈니스 로직을 담고 있는 코드의 계층이다. MVC 패턴의 Controller와 비슷한 역할을 하고 있다. View와 Model의 사이에서 View의 요청에 따라 로직을 실행하고, Model의 변화에 따라 View를 refresh하는 등, 유사한 점이 아주 많다.
/// Model에 뭔가 변화가 생기면 View에게 notification을 보내주는 역할을 한다. 또한, View로부터 전달받는 요청을 해결할 비즈니스 로직들을 담고 있다. ViewModel은 UI 관련 코드로부터 완전히 분리되어있고, 따라서 ViewModel 파일에는 SwiftUI같은 UI 프레임워크를 import할 이유조차 없다.
class HomeViewModel {

  // 이처럼 실제 데이터 조작하는 객체가 뷰 모델에 존재한다.
  final PixabayApi api;

  final _photoStreamController = StreamController<List<Photo>>()..add([]); // ..add([]) void를 리턴하는 메서드를 사용하여 객체 레퍼런스를 반환할수 있음
  Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  HomeViewModel(this.api);

  Future<void> fetch(String query) async {
    final result = await api.fetch(query);
    _photoStreamController.add(result);
  }

}