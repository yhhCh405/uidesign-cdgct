import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  AppBar _appBar() {
    return AppBar(
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
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const Expanded(
              child: Text(
                "Furma Riverfront, Singapore",
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
            const Expanded(
              child: Text("405 Havelock Road, Singapore 169633"),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: _headerContainer(),
            )
          ],
        ),
      ),
    );
  }
}
