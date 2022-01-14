import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImagePreview extends StatelessWidget {
  final List images; //for list of images
  // final String image;
  const ImagePreview(this.images, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            PhotoViewGallery.builder(
              itemCount: images
                  .length, //1. for single image , images.length for mutiple
              builder: (context, index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: AssetImage(images[index]['path']),
                );
              },
              scrollPhysics: const BouncingScrollPhysics(),
              backgroundDecoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
              ),
              loadingBuilder: (context, event) => const Center(
                child: SizedBox(
                  width: 30.0,
                  height: 30.0,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.circular(40)),
                      child: const Icon(Icons.close))),
            ),
          ],
        ),
      ),
    );
  }
}
