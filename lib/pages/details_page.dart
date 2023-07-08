import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:serenity/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/text_style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bottom_bar.dart';

class DetailsPage extends StatefulWidget {
  final String id;
  final String title;
  final String image;
  final String description;
  final String urlmap;
  final int jumlah;

  DetailsPage({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.urlmap,
    required this.jumlah,
  });

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool _isFavorite = false;

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
  void initState() {
    super.initState();
    _checkFavorite();
  }

  void _openMapUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _checkFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList("favorite") ?? [];

    if (favorites.contains(widget.id)) {
      setState(() {
        _isFavorite = true;
      });
    }
  }

  void addToFavorite() async {
    print("saved");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList("favorite") ?? [];

    if (favorites.contains(widget.id)) {
      favorites.remove(widget.id);
      setState(() {
        _isFavorite = false;
      });
    } else {
      favorites.add(widget.id);
      setState(() {
        _isFavorite = true;
      });
    }

    await prefs.setStringList("favorite", favorites);
    print("favorites >> $favorites");
  }

  void removeFromFavorite() async {
    print("removed");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList("favorite") ?? [];

    if (favorites.contains(widget.id)) {
      favorites.remove(widget.id);
      setState(() {
        _isFavorite = false;
      });
    }

    await prefs.setStringList("favorite", favorites);
    print("favorites >> $favorites");
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
                      widget.image,
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
                          '${widget.title}',
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
                            formatAngka(widget.jumlah),
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
                    '${widget.description}',
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
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        _openMapUrl('${widget.urlmap}');
                      },
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
                  ),
                ),

                /*
                
                Ketika tombol "Arahkan ke lokasi" ditekan oleh pengguna, maka 
                fungsi _openMapUrl('${widget.urlmap}'); akan dijalankan dengan 
                mengirimkan parameter ${widget.urlmap}. Dimana berisi URL yang
                mengarahkan pengguna ke Google Maps dengan lokasi yang 
                ditentukan sebelumnya. Fungsi _openMapUrl() akan mengambil URL
                sebagai argumen dan membuka URL tersebut. Pengguna akan 
                diarahkan ke aplikasi Google Maps atau tampilan web Google Maps
                dengan tujuan lokasi yang ditentukan dalam URL.

                */

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
                  child: _isFavorite
                      ? GestureDetector(
                          onTap: removeFromFavorite,
                          child: SvgPicture.asset(
                            "assets/svgs/favorite-dark-icon.svg",
                            color: Colors.white,
                          ))
                      : GestureDetector(
                          onTap: addToFavorite,
                          child: SvgPicture.asset(
                              "assets/svgs/add-favorite-icon.svg")),
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
