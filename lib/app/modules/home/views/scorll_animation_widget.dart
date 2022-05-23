import 'package:flutter/material.dart';

class ScrollAnimationWidget extends StatefulWidget {
  @override
  State<ScrollAnimationWidget> createState() => _ScrollAnimationWidgetState();
}

class _ScrollAnimationWidgetState extends State<ScrollAnimationWidget> {
 int indexWidget = 0;
  String selected = "Definition";
  Widget screenWidget = _menuScreen[0].widget;
  final ScrollController itemScrollController = ScrollController();
  final ScrollController itemScrollController2 = ScrollController();
  // final PositionsListener itemPositionsListener =
  //     PositionsListener.create();
  int currentMenuIndex = 0;
  @override
  void initState() {
    super.initState();
    itemScrollController2.addListener(() {
      final indices = itemScrollController2.position.pixels;

      if (indices < 10) {
        setState(() {
          // selected = _menuScreen[0].title;
          itemScrollController.animateTo(0,
              duration: Duration(milliseconds: 250),
              curve: Curves.easeInOutCubic);
        });
      } else if (indices < 6) {
        setState(() {
          // selected = _menuScreen[1].title;
          itemScrollController.animateTo(519,
              duration: Duration(milliseconds: 250),
              curve: Curves.easeInOutCubic);
        });
      } else if (indices < 12) {
        setState(() {
          // selected = _menuScreen[2].title;
          itemScrollController.animateTo(1027,
              duration: Duration(milliseconds: 250),
              curve: Curves.easeInOutCubic);
        });
      } else if (indices < 18) {
        setState(() {
          itemScrollController.animateTo(1556,
              duration: Duration(milliseconds: 250),
              curve: Curves.easeInOutCubic);
          // selected = _menuScreen[3].title;
        });
      } else {
        setState(() {
          // selected = _menuScreen[4].title;
          itemScrollController.animateTo(2060,
              duration: Duration(milliseconds: 250),
              curve: Curves.easeInOutCubic);
        });
      }
      // print(indices);

      print(indices);
    });

    itemScrollController.addListener(() {
      final indices = itemScrollController.position.pixels;

      Future.delayed(Duration(milliseconds: 500));

      if (indices < 200) {
        setState(() {
          selected = _menuScreen[0].title;
        });
      } else if (indices < 800) {
        setState(() {
          selected = _menuScreen[1].title;
        });
      } else if (indices < 1200) {
        setState(() {
          selected = _menuScreen[2].title;
        });
      } else if (indices < 1600) {
        setState(() {
          selected = _menuScreen[3].title;
        });
      } else {
        setState(() {
          selected = _menuScreen[4].title;
        });
      }
      // print(indices);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Image.asset('images/logollama1.png', height: 26.0, width: 26.0),
              ],
            ),
            const SizedBox(width: 10.0),
            Text('Example'),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 5),
          Container(
            alignment: Alignment.center,
            height: 30,
            child: ListView.builder(
                controller: itemScrollController2,
                scrollDirection: Axis.horizontal,
                itemCount: _menuScreen.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 4, right: 4),
                    child: GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          setState(() {
                            itemScrollController.animateTo(0,
                                duration: Duration(milliseconds: 250),
                                curve: Curves.easeInOutCubic);
                          });
                        } else if (index == 1) {
                          setState(() {
                            itemScrollController.animateTo(519,
                                duration: Duration(milliseconds: 250),
                                curve: Curves.easeInOutCubic);
                          });
                        } else if (index == 2) {
                          setState(() {
                            itemScrollController.animateTo(1027,
                                duration: Duration(milliseconds: 250),
                                curve: Curves.easeInOutCubic);
                          });
                        } else if (index == 3) {
                          setState(() {
                            itemScrollController.animateTo(1556,
                                duration: Duration(milliseconds: 250),
                                curve: Curves.easeInOutCubic);
                          });
                        } else if (index == 4) {
                          setState(() {
                            itemScrollController.animateTo(2060,
                                duration: Duration(milliseconds: 250),
                                curve: Curves.easeInOutCubic);
                          });
                        }
                      },
                      child: Chip(
                          shadowColor: Colors.black,
                          backgroundColor: selected == _menuScreen[index].title
                              ? Colors.blue
                              : Color.fromARGB(255, 202, 202, 202),
                          label: Text(
                            _menuScreen[index].title,
                            style: TextStyle(
                              color: selected == _menuScreen[index].title
                                  ? Colors.white
                                  : Color.fromARGB(255, 106, 106, 106),
                            ),
                          )),
                    ),
                  );
                }),
          ),
          SizedBox(height: 5),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  // itemPositionsListener: itemPositionsListener,
                  controller: itemScrollController,
                  scrollDirection: Axis.vertical,
                  itemCount: _menuScreen.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _menuScreen[index].widget,
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuScreen {
  String title;
  Widget widget;
  _MenuScreen({required this.title, required this.widget});
}

List<_MenuScreen> _menuScreen = [
  _MenuScreen(title: 'Subtitle1', widget: SectionOne()),
  _MenuScreen(title: 'Subtitle2', widget: SectionTwo()),
  _MenuScreen(title: 'Subtitle3', widget: SectionThree()),
  _MenuScreen(title: 'Subtitle4', widget: SectionFour()),
  _MenuScreen(title: 'Subtitle5', widget: SectionFive()),
];

class SectionOne extends StatefulWidget {
  @override
  State<SectionOne> createState() => _SectionOneState();
}

class _SectionOneState extends State<SectionOne> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500, color: Colors.white, child: Text('SectionOne'));
  }
}

class SectionTwo extends StatefulWidget {
  @override
  State<SectionTwo> createState() => _SectionTwoState();
}

class _SectionTwoState extends State<SectionTwo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500, color: Colors.blue, child: Text('SectionTwo'));
  }
}

class SectionThree extends StatefulWidget {
  @override
  State<SectionThree> createState() => _SectionThreeState();
}

class _SectionThreeState extends State<SectionThree> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500, color: Colors.white, child: Text('SectionThree'));
  }
}

class SectionFour extends StatefulWidget {
  @override
  State<SectionFour> createState() => _SectionFourState();
}

class _SectionFourState extends State<SectionFour> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500, color: Colors.blue, child: Text('SectionFour'));
  }
}

class SectionFive extends StatefulWidget {
  @override
  State<SectionFive> createState() => _SectionFiveState();
}

class _SectionFiveState extends State<SectionFive> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500, color: Colors.white, child: Text('SectionFive'));
  }
}
