import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_search/data/api.dart';
import 'package:image_search/model/Photo.dart';
import 'package:image_search/ui/widget/photo_widget.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final api = PixabayApi();

  final _controller = TextEditingController();

  List<Photo> _photos = [];


  @override
  void dispose() {
    _controller.dispose(); // 다쓰고 해제해주어야 함
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("이미지 검색 앱", style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 3, // 그림자
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField( // 검색창
              controller: _controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder( // const 는 변수없이 사용할 때 사용(메모리 아낄 수 있음) 가장 마지막에 붙인다.
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                suffixIcon: IconButton(
                  onPressed: () async {
                    final photos = await api.fetch(_controller.text);
                    setState(() {
                      _photos = photos;
                    });
                },
                  icon: const Icon(Icons.search),)
              ),
            ),
          ),
          Expanded(
            child: GridView.builder( // 갯수가 동적이라면 builder 사용
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              itemCount: _photos.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2열
                crossAxisSpacing: 16, // 여백
                mainAxisSpacing: 16, // 여백
              ),
              itemBuilder: (context, index) {
                final photo = _photos[index];
                return PhotoWidget(photo: photo);
              },
            ),
          ),
        ],
      ),
    );
  }
}


