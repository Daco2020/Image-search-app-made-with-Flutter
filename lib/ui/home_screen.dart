import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
            padding: EdgeInsets.all(16.0),
            child: TextField( // 검색창
              decoration: InputDecoration(
                border: const OutlineInputBorder( // const 는 변수없이 사용할 때 사용(메모리 아낄 수 있음) 가장 마지막에 붙인다.
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    //
                }, icon: const Icon(Icons.search),)
              ),
            ),
          ),
          Expanded(
            child: GridView.builder( // 갯수가 동적이라면 builder 사용
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2열
                crossAxisSpacing: 16, // 여백
                mainAxisSpacing: 16, // 여백
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage('https://w.namu.la/s/5a0dfbc22d0e432def0ab164c2f53441794f55e17f00ce84ab021bea2dae11d2c0d93adbfd509f1f4fc1476d32fa854b7b3d0d58ba9d0fbad8b57f2280d6d3306bc4040ce0fb41edd216d15572a25511156fe44e51c444cf96a5f672bc6eca13'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


