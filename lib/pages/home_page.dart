import 'package:avatar_glow/avatar_glow.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:pizza_apps/pages/Details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> itemsData = [
    'ALL',
    'Pizza',
    'Burger',
    'Dessert',
    'Burrito',
  ];
  Widget? _child;
  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = HomePage();
          break;
        case 1:
          // _child = AccountContent();
          break;
        case 2:
          // _child = GridContent();
          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: Duration(milliseconds: 500),
        child: _child,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      bottomNavigationBar: FluidNavBar(
        // (1)
        icons: [
          // (2)
          FluidNavBarIcon(
            icon: Icons.home,
          ), // (3)
          FluidNavBarIcon(
            icon: Icons.bookmark,
          ),
          FluidNavBarIcon(
            icon: Icons.favorite,
          ),
          FluidNavBarIcon(
            icon: Icons.message,
          ),
        ],
        defaultIndex: 3,
        onChange: _handleNavigationChange, // (4)
        style: FluidNavBarStyle(
            iconSelectedForegroundColor: Colors.red[500],
            iconUnselectedForegroundColor: Colors.black87),
      ),
      extendBody: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //navigation Bars
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.red[50],
                      borderRadius: BorderRadius.circular(12.0)),
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.menu_rounded,
                    color: Colors.red[500],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.shop_two,
                        color: Colors.red[500],
                      ),
                    ),
                    AvatarGlow(
                      endRadius: 40.0,
                      child: Material(
                        // Replace this child with your own
                        elevation: 8.0,
                        shape: CircleBorder(),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            'assets/images/flutter.png',
                            height: 30,
                          ),
                          radius: 25.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            //greetiongs
            const Text("Good Morning Alice !!",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),

            const SizedBox(height: 10),
            //Search Bar

            Row(
              children: [
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(Icons.mic),
                      hintText: "Search 'Pizza'",
                      filled: true,
                      focusColor: Colors.red,
                      fillColor: Colors.grey[200],
                      constraints: BoxConstraints.tightFor(
                          width: MediaQuery.of(context).size.width * 0.7),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(8))),
                ),
                SizedBox(
                  width: 24,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.red[50],
                      borderRadius: BorderRadius.circular(4.0)),
                  padding: EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.settings,
                    color: Colors.red[700],
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 16,
            ),

            const Text(
              'Categories',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold),
            ),

            const CateWidget(),
            const SizedBox(
              height: 24,
            ),
            GridWidget()
          ]),
        ),
      ),
    );
  }
}

class CateWidget extends StatefulWidget {
  const CateWidget({super.key});
  @override
  State<CateWidget> createState() => _CategorieState();
}

class _CategorieState extends State<CateWidget> {
  List<String> itemsData = [
    'All',
    'Pizza',
    'Burger',
    'Dessert',
    'Burrito',
  ];

  int _selectedIndex = 0;
  _onSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 108,
      alignment: Alignment.center,
      child: Expanded(
          child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemsData.length,
        itemBuilder: (BuildContext ctx, index) {
          return GestureDetector(
            onTap: () {
              _onSelected(index);
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(8, 8, 20, 8),
              width: 54,
              height: 92,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.white70,
                boxShadow: [
                  BoxShadow(
                    color: _selectedIndex != null && _selectedIndex == index
                        ? Colors.grey.withOpacity(0.2)
                        : Colors.white.withOpacity(0.2), //color of shadow
                    spreadRadius: 5, //spread radius
                    blurRadius: 7, // blur radius
                    offset: Offset(0, 2), // changes position of shadow
                    //first paramerter of offset is left-right
                    //second parameter is top to down
                  ),
                  //you can set more BoxShadow() here
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                itemsData[index],
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      )),
    );
  }
}

class GridWidget extends StatefulWidget {
  const GridWidget({super.key});
  @override
  State<GridWidget> createState() => _ProductState();
}

class _ProductState extends State<GridWidget> {
  final List<Map> myProducts =
      List.generate(100000, (index) => {"id": index, "name": "Product $index"})
          .toList();

  void _viewDetails() {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) {
      return const DetailPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 4 / 5.1,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: myProducts.length,
          itemBuilder: (BuildContext ctx, index) {
            return GestureDetector(
              onTap: () {
                _viewDetails();
              },
              child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2), //color of shadow
                          spreadRadius: 5, //spread radius
                          blurRadius: 7, // blur radius
                          offset: Offset(0, 2), // changes position of shadow
                          //first paramerter of offset is left-right
                          //second parameter is top to down
                        ),
                        //you can set more BoxShadow() here
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 118,
                        width: double.infinity,
                        child: ClipRRect(
                          child: Image.asset('images/image3.png'),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        myProducts[index]["name"],
                        style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "£200",
                            style: TextStyle(
                                color: Colors.red[500],
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                                color: Colors.red[500],
                                borderRadius: BorderRadius.circular(60)),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white70,
                              size: 16,
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            );
          }),
    );
  }
}
