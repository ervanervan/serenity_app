import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:serenity/utils/colors.dart';
import '../utils/text_style.dart';
import 'bottom_bar.dart';

class DetailsPage extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final int jumlah;

  DetailsPage({
    required this.title,
    required this.image,
    required this.description,
    required this.jumlah,
  });

  String formatAngka(int angka) {
    if (angka >= 1000000000) {
      double hasil = angka / 1000000000;
      return hasil.toStringAsFixed(1) + 'ml';
    } else if (angka >= 1000000) {
      double hasil = angka / 1000000;
      return hasil.toStringAsFixed(1) + 'jt';
    } else if (angka >= 1000) {
      double hasil = angka / 1000;
      return hasil.toStringAsFixed(1) + 'rb';
    } else {
      return angka.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: _appBar(context),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 30, right: 24, left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: primary,
                    ),
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          '$title',
                          style: SubHeading1,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/svgs/usergroup-icon.svg",
                            width: 16,
                            height: 16,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            formatAngka(jumlah),
                            style: Visitors,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '$description',
                    style: Description,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 13,
                      bottom: 13,
                    ),
                    width: double.infinity,
                    margin: const EdgeInsets.only(
                      bottom: 24,
                      right: 16,
                      left: 24,
                    ),
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "Arahkan ke lokasi",
                      textAlign: TextAlign.center,
                      style: BodyButtonLarge,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(13),
                  margin: const EdgeInsets.only(
                    bottom: 24,
                    right: 24,
                  ),
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SvgPicture.asset("assets/svgs/add-favorite-icon.svg"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: background,
      title: Padding(
        padding: const EdgeInsets.only(top: 10, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const BottomBar()));
              },
              icon: SvgPicture.asset("assets/svgs/chevron-left.svg"),
            ),
            Text(
              "Detail",
              style: Heading2,
            ),
          ],
        ),
      ),
    );
  }
}
