import 'package:colorarranger/home/colors_listing.dart';
import 'package:colorarranger/widgets/button_widget.dart';
import 'package:colorarranger/widgets/image_view.dart';
import 'package:flutter/material.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List data = [
    {
      'image': 'assets/black1.png',
      'name': 'BLACK',
      'pts': '17',
      'img_list': [
        {'path': 'assets/black1.png'}
      ]
    },
    {
      'image': 'assets/blue1.png',
      'name': 'BLUE',
      'pts': '59',
      'img_list': [
        {'path': 'assets/blue1.png'},
        {'path': 'assets/blue2.png'},
        {'path': 'assets/blue3.png'}
      ]
    },
    {
      'image': 'assets/green1.png',
      'name': 'GREEN',
      'pts': '43',
      'img_list': [
        {'path': 'assets/green1.png'},
        {'path': 'assets/green2.png'},
        {'path': 'assets/green3.png'}
      ]
    },
    {
      'image': 'assets/orange1.png',
      'name': 'ORANGE',
      'pts': '29',
      'img_list': [
        {'path': 'assets/orange1.png'},
        {'path': 'assets/orange2.png'},
        {'path': 'assets/orange3.png'}
      ]
    },
    {
      'image': 'assets/pink1.png',
      'name': 'PINK',
      'pts': '9',
      'img_list': [
        {'path': 'assets/pink1.png'},
        {'path': 'assets/pink2.png'},
        {'path': 'assets/pink3.png'}
      ]
    },
    {
      'image': 'assets/purple1.png',
      'name': 'PURPLE',
      'pts': '17',
      'img_list': [
        {'path': 'assets/purple1.png'},
        {'path': 'assets/purple2.png'},
        {'path': 'assets/purple3.png'}
      ]
    },
    {
      'image': 'assets/red1.png',
      'name': 'RED',
      'pts': '78',
      'img_list': [
        {'path': 'assets/red1.png'},
        {'path': 'assets/red2.png'},
        {'path': 'assets/red3.png'}
      ]
    },
    {
      'image': 'assets/teal1.png',
      'name': 'TEAL',
      'pts': '14',
      'img_list': [
        {'path': 'assets/teal1.png'},
        {'path': 'assets/teal2.png'},
        {'path': 'assets/teal3.png'}
      ]
    },
    {
      'image': 'assets/yellow1.png',
      'name': 'YELLOW',
      'pts': '66',
      'img_list': [
        {'path': 'assets/yellow1.png'},
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Expanded(
                  //Reorderable grid view
                  child: ReorderableGridView.count(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    children: data
                        .map((e) => buildItem(e['image'], e['img_list']))
                        .toList(),
                    onReorder: (oldIndex, newIndex) {
                      setState(() {
                        final element = data.removeAt(oldIndex);
                        data.insert(newIndex, element);
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonWidget(
                    buttonName: "Submit",
                    onpressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListingColors(
                                  data: data,
                                )),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

//return builder item widget
  Widget buildItem(String text, List path) {
    return Card(
      key: ValueKey(text),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ImagePreview(path)));
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(text), fit: BoxFit.cover)),
            ),
            path.length == 1
                ? const SizedBox()
                : Positioned(
                    top: 2,
                    right: 2,
                    child: GestureDetector(
                        onTap: () {},
                        child: Image.asset('assets/icon_pictures.png')),
                  ),
          ],
        ),
      ),
    );
  }
}
