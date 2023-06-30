import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/text_style.dart';
import 'details_page.dart';

class CardItem extends StatelessWidget {
  final int id;
  final double scale;
  final bool isActive;
  final String image;
  final String title;
  final String location;
  final String description;
  final int jumlah;

  CardItem(
      {required this.id,
      required this.scale,
      required this.isActive,
      required this.image,
      required this.title,
      required this.description,
      required this.location,
      required this.jumlah});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
      // margin: EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 180 : 150, // Adjust the heights as needed
      child: Container(
        child: Transform.scale(
          scale: scale,
          child: Container(
            clipBehavior: Clip.hardEdge,
            // padding: EdgeInsets.only(left: 15, right: 15, bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // border: Border.all(color: Color.fromARGB(255, 255, 255, 255))
            ),
            child: Container(
              alignment: Alignment.centerLeft,

              // width: double.infinity,
              color: Colors.white,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 223,
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.network(
                          image,
                          fit: BoxFit.cover,
                          // height: 223,
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(
                            left: 16, top: 16, bottom: 16, right: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    '$title',
                                    style: SubHeading2,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    '$location',
                                    style: BodyLocation,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: primary,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) => DetailsPage(
                                                    description: description,
                                                    image: image,
                                                    title: title,
                                                    jumlah: jumlah,
                                                  )));
                                    },
                                    child: Text(
                                      "Lihat",
                                      style: BodyButton,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ))
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
