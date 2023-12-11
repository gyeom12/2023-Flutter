import 'package:flutter/material.dart';

class cutlet extends StatefulWidget {
  @override
  _cutletState createState() => _cutletState();
}

class _cutletState extends State<cutlet> {
  String _userInput = '전남 순천시 순천대2길 8';

  // 각 셀에 대한 이미지 경로 리스트
  List<String> imagePaths = [
    'assets/cutlet1.jpg',
    'assets/cutlet2.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('이백장돈까스'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 이미지
            Container(
              height: 500,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/cutlet.jpg'), // 대체하십시오
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            // 입력한 텍스트 표시
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _userInput,
                style: TextStyle(fontSize: 18),
              ),
            ),
            // 2x10 그리드
            _buildGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: imagePaths.length, // 이미지 수만큼
      itemBuilder: (context, index) {
        return _buildGridItem(index);
      },
    );
  }

  Widget _buildGridItem(int index) {
    // 각 셀에 대한 이미지를 추가
    return Container(
      color: Colors.grey[200],
      child: Center(
        child: Image.asset(
          imagePaths[index], // 이미지 경로 리스트에서 가져오기
          width: 200,
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

