import 'package:colorarranger/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class ListingColors extends StatefulWidget {
  final List? data;
  const ListingColors({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  _ListingColorsState createState() => _ListingColorsState();
}

class _ListingColorsState extends State<ListingColors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: widget.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: rowItem(
                                index,
                                widget.data![index]['image'],
                                widget.data![index]['name'],
                                widget.data![index]['pts']));
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonWidget(
                    buttonName: "START",
                    onpressed: () {
                      Navigator.pop(context);
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

  Widget rowItem(index, color, name, pt) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text((index + 1).toString() + "."),
          Container(
            margin: const EdgeInsets.all(5),
            height: 80,
            width: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(color), fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(name,
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w500)),
                Text(pt + "PTS",
                    style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 14,
                        fontWeight: FontWeight.w800))
              ],
            ),
          )
        ],
      ),
    );
  }
}
