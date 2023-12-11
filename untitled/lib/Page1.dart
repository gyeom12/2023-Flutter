import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'jibbob.dart';
import 'cutlet.dart';
import 'noddletree.dart';
import 'pighome.dart';
import 'backbone.dart';


class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildTop(context),
        _buildMiddle(),
        _buildBottom(),
      ],
    );
  }

  //메뉴
  Widget _buildTop(context){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => pighome(),
                  ),
                );
              },
              child: Column(
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.yellow,
                    size: 40,
                  ),
                  Text('돼지마을'),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => jibbob(),
                  ),
                );
              },
              child: Column(
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.lightGreen,
                    size: 40,
                  ),
                  Text('집밥한끼'),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => noodletree(),
                  ),
                );
              },
              child: Column(
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.grey,
                    size: 40,
                  ),
                  Text('국수나무'),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => cutlet(),
                  ),
                );
              },
              child: Column(
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.blue,
                    size: 40,
                  ),
                  Text('이백장돈까스'),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => noodletree(),
                  ),
                );
              },
              child: Column(
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.pink,
                    size: 40,
                  ),
                  Text('찌개앤찜'),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => cutlet(),
                  ),
                );
              },
              child: Column(
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.brown,
                    size: 40,
                  ),
                  Text('마로니에국밥'),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => cutlet(),
                  ),
                );
              },
              child: Column(
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.purpleAccent,
                    size: 40,
                  ),
                  Text('등뼈'),
                ],
              ),
            ),

          ],
        ),
      ],
    );
  }


  Widget _buildMiddle(){
    final imageItems = [
      'assets/pighome.jpg',
      'assets/jibbob.jpg',
      'assets/noddle.jpg',
      'assets/cutlet.jpg'
    ];

    return CarouselSlider(
      options: CarouselOptions(
        height: 500.0,
      ),
      items: imageItems.map((path)
      {
        return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: ClipRect(
                  child: Image.asset(
                    path,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
        );
      }
      ).toList(),
    );
  }

  Widget _buildBottom(){
    final items = List.generate(
        1, (i){
          return Column(
            children: [
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('돼지마을 : 061-752-7879'),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('집밥한끼 : 0507-1365-8522'),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('국수나무 : 0507-1387-1510'),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('이백장돈까스 : 0507-1481-2057'),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('찌개앤찜 : 070-7572-0202'),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('마로니에 국밥 : 061-751-3311'),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('등뼈 : 061-752-3737'),
              ),
            ],
          );
    });
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: items,
    );
  }
}
