import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serenity/pages/bottom_bar.dart';
import 'package:serenity/utils/colors.dart';
import 'package:serenity/data/datas.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/text_style.dart';

class CardWishlist extends StatelessWidget {
  final String image;
  final String location;
  final String title;

  const CardWishlist({
    Key? key,
    required this.image,
    required this.title,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.only(left: 24, right: 24, bottom: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            image,
            width: 110,
            fit: BoxFit.cover,
            height: 100,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$title',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: SubHeadingWishlistCard,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '$location',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: BodyWishlistCard,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<DataPlace> dataWishlist = [];
  List<String> favoriteIds = [];

  @override
  void initState() {
    super.initState();
    fetchData().then((data) {
      setState(() {
        dataWishlist = data;
      });
    });
    getFavoriteIds();
  }

  void getFavoriteIds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList("favorite") ?? [];
    setState(() {
      favoriteIds = favorites;
    });
  }

  List<DataPlace> getFilteredData() {
    return dataWishlist.where((data) => favoriteIds.contains(data.id)).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<DataPlace> filteredData = getFilteredData();
    return Scaffold(
      backgroundColor: background,
      appBar: _appBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: filteredData.map((data) {
                return CardWishlist(
                  image: data.image,
                  title: data.title,
                  location: data.location,
                );
              }).toList(),
            ),
          ),
        ),
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
                  MaterialPageRoute(builder: (context) => const BottomBar()),
                );
              },
              icon: SvgPicture.asset("assets/svgs/chevron-left.svg"),
            ),
            Text(
              "Tempat Favorit",
              style: Heading2,
            ),
          ],
        ),
      ),
    );
  }
}
