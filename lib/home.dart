import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  String _selectedSeg = "byroom";
  int _carouselIndex = 0;
  List<String> _headerTitleList = const [
    "Furma Riverfront, Singapore",
    "Lorem ipsum dolor sit amet, "
  ];
  List<String> _headerTitleAddrList = const [
    "405 Havelock Road, Singapore 169633",
    "Lorem ipsum dolor sit amet, "
  ];

  late String _headerTitle;
  late String _headerTitleAddr;

  late final AnimationController _fadeHeaderTextAnimCtrl;
  late final Animation<double> _fadeHeaderTextAnim;

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      leading: const Icon(
        Icons.arrow_back,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Image.asset(
            "assets/images/currency@3x.png",
            width: 40,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Image.asset(
            "assets/images/chatactive@3x.png",
            width: 40,
          ),
        ),
      ],
    );
  }

  Widget _headerContainer() {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                _headerTitle,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
              ),
              flex: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Image.asset(
                "assets/images/nextred@3x.png",
                width: 40,
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Text(_headerTitleAddr),
              flex: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Image.asset(
                "assets/images/currentlocation@3x.png",
                width: 40,
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _headerCarousel() {
    return Stack(
      children: [
        Container(
          child: CarouselSlider.builder(
            itemCount: 68,
            itemBuilder: (context, index, realIndex) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Image.asset("assets/images/carousel_item.jpg"),
              );
            },
            options: CarouselOptions(onPageChanged: (index, reason) {
              _carouselIndex = index;

              _fadeHeaderTextAnimCtrl.reverse().then((value) {
                _headerTitle = _headerTitleList
                    .firstWhere((element) => element != _headerTitle);
                _headerTitleAddr = _headerTitleAddrList
                    .firstWhere((element) => element != _headerTitleAddr);
                setState(() {});
                _fadeHeaderTextAnimCtrl.forward();
              });

              setState(() {});
            }),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 10,
          child: ClipPath(
            clipper: RectangleClipper(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: Colors.black87,
              child: Text(
                "See All ${_carouselIndex + 1}/68",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _categories() {
    Widget _item(String imageName, String name) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.asset(
              "assets/images/" + imageName,
              width: (MediaQuery.of(context).size.width / 5) - 40,
            ),
            Text(name),
          ],
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _item("theme@3x.png", "Amenties"),
        _item("workout@3x.png", "Facilities"),
        _item("fnb@3x.png", "F&B"),
        _item("kidsfamily@3x.png", "Kids/Family"),
        _item("wellness@3x.png", "Wellness")
      ],
    );
  }

  Widget _tabSegments() {
    Widget _item(String txt) {
      return Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Text(txt),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                _selectedSeg = "byroom";
                setState(() {});
              },
              child: CustomPaint(
                painter: TrapeziumClipper(selected: _selectedSeg == "byroom"),
                child: _item("By Room"),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                _selectedSeg = "byrates";
                setState(() {});
              },
              child: CustomPaint(
                painter: TrapeziumClipper2(selected: _selectedSeg == "byrates"),
                child: _item("By Rates"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget byRoomView() {
    Widget _item() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Image.asset("assets/images/carousel_item.jpg"),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Deluxe Twin",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Twin Single Beds, Cable TV, Free Wfi and more and so on",
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "View Rates",
                    style: const TextStyle(color: Colors.orange),
                  ),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.resolveWith((states) =>
                          const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15)),
                      shape: MaterialStateProperty.resolveWith((states) =>
                          const RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.orange)))),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    "Avg. Nightly/Room From",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "SGD",
                        style: TextStyle(fontSize: 14),
                      ),
                      TextSpan(
                        text: "161.42",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              thickness: 3,
              color: Colors.black45,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => _item(),
      itemCount: 5,
    );
  }

  Widget byRatesView() {
    Widget _item() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: DottedBorder(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "YOUR E-VOURCHER RATE",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              const Text(
                                "Mobile App Special Voucher",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              )
                            ],
                          ),
                        ),
                        Image.asset(
                          "assets/images/nextred@3x.png",
                          width: 40,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/fnb@3x.png",
                                    width: 40,
                                  ),
                                  const Text(
                                    "Inclusive of Breakfast",
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/discount@3x.png",
                                    width: 40,
                                  ),
                                  const Text(
                                    "20% off In-Room Service",
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ],
                        )),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "View Rates",
                            style: const TextStyle(color: Colors.orange),
                          ),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.resolveWith(
                                  (states) => const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15)),
                              shape: MaterialStateProperty.resolveWith(
                                  (states) => const RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: Colors.orange)))),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(
                      thickness: 2,
                      color: Colors.black54,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Avg. Nightly/Room From",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "Subject to GST & Service charge",
                                style: const TextStyle(fontSize: 12),
                              )
                            ],
                          )),
                        ),
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: "SGD",
                                style: TextStyle(fontSize: 14),
                              ),
                              TextSpan(
                                text: "161.42",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.amber[200])),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.format_paint,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "MEMBERS DETAILS",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }

    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => _item(),
        separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
        itemCount: 5);
  }

  @override
  void initState() {
    super.initState();
    _headerTitle = _headerTitleList.first;
    _headerTitleAddr = _headerTitleAddrList.first;
    _fadeHeaderTextAnimCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _fadeHeaderTextAnim =
        Tween(begin: 0.0, end: 1.0).animate(_fadeHeaderTextAnimCtrl);
    _fadeHeaderTextAnimCtrl.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: FadeTransition(
                opacity: _fadeHeaderTextAnim,
                child: _headerContainer(),
              ),
            ),
            _headerCarousel(),
            _categories(),
            const SizedBox(
              height: 20,
            ),
            _tabSegments(),
            const SizedBox(
              height: 20,
            ),
            _selectedSeg == "byroom" ? byRoomView() : byRatesView()
          ],
        ),
      ),
    );
  }
}

class RectangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(10, 0);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(RectangleClipper oldClipper) => false;
}

class TrapeziumClipper extends CustomPainter {
  bool selected;
  TrapeziumClipper({this.selected = false});
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(10, 0);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width - 10, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    canvas.drawPath(
        path,
        Paint()
          ..style = PaintingStyle.stroke
          ..color = const Color(0xff96c1d5)
          ..strokeWidth = 2);
    if (selected) {
      canvas.drawPath(
          path,
          Paint()
            ..style = PaintingStyle.fill
            ..color = const Color(0xff96c1d5)
            ..strokeWidth = 2);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class TrapeziumClipper2 extends CustomPainter {
  bool selected;
  TrapeziumClipper2({this.selected = false});
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    // path.moveTo(10, 0);
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(-10, size.height);
    path.close();
    canvas.drawPath(
        path,
        Paint()
          ..style = PaintingStyle.stroke
          ..color = const Color(0xff96c1d5)
          ..strokeWidth = 2);
    if (selected) {
      canvas.drawPath(
          path,
          Paint()
            ..style = PaintingStyle.fill
            ..color = const Color(0xff96c1d5)
            ..strokeWidth = 2);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
