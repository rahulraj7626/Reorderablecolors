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
    {'image': 'assets/black1.png', 'name': 'BLACK', 'pts': '17'},
    {'image': 'assets/blue1.png', 'name': 'BLUE', 'pts': '59'},
    {'image': 'assets/green1.png', 'name': 'GREEN', 'pts': '43'},
    {'image': 'assets/orange1.png', 'name': 'ORANGE', 'pts': '29'},
    {'image': 'assets/pink1.png', 'name': 'PINK', 'pts': '9'},
    {'image': 'assets/purple1.png', 'name': 'PURPLE', 'pts': '17'},
    {'image': 'assets/red1.png', 'name': 'RED', 'pts': '78'},
    {'image': 'assets/teal1.png', 'name': 'TEAL', 'pts': '14'},
    {'image': 'assets/yellow1.png', 'name': 'YELLOW', 'pts': '66'}
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
                    children: data.map((e) => buildItem(e['image'])).toList(),
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
  Widget buildItem(String text) {
    return Card(
      key: ValueKey(text),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ImagePreview(text)));
        },
        child: Container(
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(text), fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
