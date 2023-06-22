import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serenity/colors.dart';
import 'package:serenity/text_style.dart';
import 'package:serenity/data/datas.dart';

class CardItem extends StatelessWidget {
  final int id;
  final double scale;
  final bool isActive;
  final String image;
  final String title;
  final String location;
  final String description;

  CardItem(
      {required this.id,
      required this.scale,
      required this.isActive,
      required this.image,
      required this.title,
      required this.description,
      required this.location});

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
                            Text(
                              '$title',
                              style: SubHeading2,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '$location',
                                  style: BodyLocation,
                                ),
                                Container(
                                  // margin: EdgeInsets.only(le),
                                  decoration: BoxDecoration(
                                      color: primary,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Lihat",
                                        style: BodyButton,
                                      )),
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchValue = "";

  final List<DataPlace> cardList = dataForCard;
  final PageController pageController = PageController(viewportFraction: 0.8);

  int currentIndex = 0;
  String activeCategory = "Nongkrong";

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void onChangeCategory(String category) {
    setState(() {
      activeCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(),
      // appBar: AppBar(),
      body: SafeArea(
        child: Container(
          // padding: EdgeInsets.only(left: 24, top: 24, right: 24, bottom: 24),
          color: background,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            child: SvgPicture.asset("assets/svgs/logo.svg",
                                width: 32, height: 32)),
                      ],
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tempat Rekomendasi",
                            style: Heading2,
                          ),
                          Text(
                            "Ayo Kunjungi tempat menarik di Jakarta!",
                            style: Body2,
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 20),
                      padding: EdgeInsets.only(
                          left: 16, right: 16, top: 2, bottom: 2),
                      // color: Colors.black,
                      decoration: BoxDecoration(
                          color: Color(0xffEEEEEE),
                          borderRadius: BorderRadius.circular(12)),
                      child: TextField(
                        style: LabelPlaceholder,
                        onChanged: (value) {
                          setState(() {
                            searchValue = value;
                          });
                        },
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            labelText: "Cari",
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.search,
                                color: Color(0xff646464),
                                size: 20,
                              ),
                              onPressed: () {
                                setState(() {
                                  print('text : $searchValue');
                                });
                              },
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 335,
                    child: PageView.builder(
                      onPageChanged: onPageChanged,
                      controller: pageController,
                      itemCount: cardList.length,
                      itemBuilder: (context, index) {
                        final scale = index == currentIndex ? 1.0 : 0.9;
                        final cardActive = cardList[index];
                        return CardItem(
                          title: cardActive.title,
                          description: cardActive.description,
                          location: cardActive.location,
                          id: cardActive.id,
                          image: cardActive.image,
                          scale: scale,
                          isActive: index == currentIndex,
                        );
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: activeCategory == "Nongkrong"
                                  ? primary
                                  : Colors.transparent),
                          child: TextButton(
                              onPressed: () {
                                onChangeCategory("Nongkrong");
                              },
                              child: Text(
                                "Nongkrong",
                                style: activeCategory == "Nongkrong"
                                    ? BodyCategory
                                    : BodyCategoryOff,
                              ))),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: activeCategory == "Sejarah"
                                  ? primary
                                  : Colors.transparent),
                          child: TextButton(
                              onPressed: () {
                                onChangeCategory("Sejarah");
                              },
                              child: Text(
                                "Sejarah",
                                style: activeCategory == "Sejarah"
                                    ? BodyCategory
                                    : BodyCategoryOff,
                              ))),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: activeCategory == "Hiburan"
                                  ? primary
                                  : Colors.transparent),
                          child: TextButton(
                              onPressed: () {
                                onChangeCategory("Hiburan");
                              },
                              child: Text(
                                "Hiburan",
                                style: activeCategory == "Hiburan"
                                    ? BodyCategory
                                    : BodyCategoryOff,
                              ))),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: activeCategory == "Belanja"
                                  ? primary
                                  : Colors.transparent),
                          child: TextButton(
                              onPressed: () {
                                onChangeCategory("Belanja");
                              },
                              child: Text(
                                "Belanja",
                                style: activeCategory == "Belanja"
                                    ? BodyCategory
                                    : BodyCategoryOff,
                              ))),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: activeCategory == "Restoran"
                                  ? primary
                                  : Colors.transparent),
                          child: TextButton(
                              onPressed: () {
                                onChangeCategory("Restoran");
                              },
                              child: Text(
                                "Restoran",
                                style: activeCategory == "Restoran"
                                    ? BodyCategory
                                    : BodyCategoryOff,
                              ))),
                      Container(),
                    ],
                  ),
                ]),
              )
            ]),
          ),
        ),
      ),
    );
  }

  BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
        backgroundColor: back,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          _bottomBarItem(icon: "assets/svgs/home-icon.svg", label: "Home"),
          _bottomBarItem(
              icon: "assets/svgs/favorite-icon.svg", label: "Favorite"),
          _bottomBarItem(
              icon: "assets/svgs/profile-icon.svg", label: "Profile"),
        ],
      );

  BottomNavigationBarItem _bottomBarItem(
          {required String icon, required String label}) =>
      BottomNavigationBarItem(
          icon: SvgPicture.asset(
            icon,
            color: secondary,
          ),
          activeIcon: SvgPicture.asset(
            icon,
            color: primary,
          ),
          label: label);
}
