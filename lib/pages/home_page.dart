import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serenity/data/datas.dart';
import '../utils/colors.dart';
import '../utils/text_style.dart';
import 'card_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchValue = "";

  List<DataPlace> cardList = [];
  final PageController pageController = PageController(viewportFraction: 0.8);

  int currentIndex = 0;
  String activeCategory = "Nongkrong";

  @override
  void initState() {
    super.initState();
    fetchData().then((data) {
      setState(() {
        cardList = data;
      });
    });
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
    // Filter the cardList based on the searchValue
    List<DataPlace> filteredData = cardList.where((data) {
      final title = data.title.toLowerCase();
      final location = data.location.toLowerCase();
      final search = searchValue.toLowerCase();
      return title.contains(search) || location.contains(search);
    }).toList();

    currentIndex = filteredData.isNotEmpty
        ? currentIndex.clamp(0, filteredData.length - 1)
        : 0;

    return Scaffold(
      body: SafeArea(
        child: Visibility(
          visible: cardList.isNotEmpty,
          replacement: Center(
            child: CircularProgressIndicator(),
          ),
          child: Container(
            color: background,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              child: SvgPicture.asset(
                                "assets/svgs/logo.svg",
                                width: 32,
                                height: 32,
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(right: 120),
                                child: Text(
                                  'Hi, username',
                                  overflow: TextOverflow.ellipsis,
                                  style: BodyLocation,
                                  maxLines: 1,
                                ),
                              ),
                            ),
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
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20, bottom: 20),
                          padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 2,
                            bottom: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffEEEEEE),
                            borderRadius: BorderRadius.circular(12),
                          ),
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
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  filteredData.isNotEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 347,
                              child: PageView.builder(
                                onPageChanged: onPageChanged,
                                controller: pageController,
                                itemCount: filteredData.length,
                                itemBuilder: (context, index) {
                                  final scale =
                                      index == currentIndex ? 1.0 : 0.9;
                                  final cardActive = filteredData[index];
                                  return CardItem(
                                    category: cardActive.category,
                                    title: cardActive.title,
                                    description: cardActive.description,
                                    location: cardActive.location,
                                    id: cardActive.id,
                                    image: cardActive.image,
                                    scale: scale,
                                    jumlah: cardActive.jumlah,
                                    isActive: index == currentIndex,
                                  );
                                },
                              ),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(24.0),
                              child: Text(
                                "Tempat Tidak Ditemukan",
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 150,
                            ),
                          ],
                        ),
                  Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: activeCategory == "Nongkrong"
                                    ? primary
                                    : Colors.transparent,
                              ),
                              child: TextButton(
                                onPressed: () {
                                  onChangeCategory("Nongkrong");
                                },
                                child: Text(
                                  "Nongkrong",
                                  style: activeCategory == "Nongkrong"
                                      ? BodyCategory
                                      : BodyCategoryOff,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: activeCategory == "Sejarah"
                                    ? primary
                                    : Colors.transparent,
                              ),
                              child: TextButton(
                                onPressed: () {
                                  onChangeCategory("Sejarah");
                                },
                                child: Text(
                                  "Sejarah",
                                  style: activeCategory == "Sejarah"
                                      ? BodyCategory
                                      : BodyCategoryOff,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: activeCategory == "Hiburan"
                                    ? primary
                                    : Colors.transparent,
                              ),
                              child: TextButton(
                                onPressed: () {
                                  onChangeCategory("Hiburan");
                                },
                                child: Text(
                                  "Hiburan",
                                  style: activeCategory == "Hiburan"
                                      ? BodyCategory
                                      : BodyCategoryOff,
                                ),
                              ),
                            ),
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
                                    : Colors.transparent,
                              ),
                              child: TextButton(
                                onPressed: () {
                                  onChangeCategory("Belanja");
                                },
                                child: Text(
                                  "Belanja",
                                  style: activeCategory == "Belanja"
                                      ? BodyCategory
                                      : BodyCategoryOff,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: activeCategory == "Restoran"
                                    ? primary
                                    : Colors.transparent,
                              ),
                              child: TextButton(
                                onPressed: () {
                                  onChangeCategory("Restoran");
                                },
                                child: Text(
                                  "Restoran",
                                  style: activeCategory == "Restoran"
                                      ? BodyCategory
                                      : BodyCategoryOff,
                                ),
                              ),
                            ),
                            Container(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
