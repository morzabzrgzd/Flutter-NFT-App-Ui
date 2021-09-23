import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft_app/constants.dart';
import 'package:nft_app/models/gridview_model.dart';
import 'package:nft_app/screens/detail_screen.dart';
import 'package:nft_app/widgets/appbar_widget.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  int selectedIndex = 0;

  List categories = [
    'All items',
    'Art',
    'Game',
    'Photography',
    'Music',
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Column(
          children: [
            AppBarWidget(size: size),
            Container(
              padding: EdgeInsets.only(
                left: size.width * 0.05,
              ),
              margin: const EdgeInsets.only(top: 50),
              alignment: Alignment.center,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(
                    categories.length,
                    (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.only(left: 10, right: 5),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: kBorderColor, width: .3),
                          borderRadius: BorderRadius.circular(8),
                          gradient:
                              selectedIndex == index ? kGradientColor : null,
                        ),
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            color: kTextColor,
                            fontSize: size.width * 0.04,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                ),
                margin: const EdgeInsets.only(top: 30),
                child: StaggeredGridView.countBuilder(
                  physics: const BouncingScrollPhysics(),
                  crossAxisCount: 4,
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) => Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  DetailScreen(
                                data: data[index],
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag: data[index].id,
                          child: Container(
                            padding: const EdgeInsets.only(
                              left: 10,
                              bottom: 10,
                            ),
                            alignment: Alignment.bottomLeft,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(data[index].image),
                              ),
                            ),
                            child: Text(
                              data[index].title,
                              style: TextStyle(
                                color: kTextColor,
                                fontSize: size.width * 0.045,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          alignment: Alignment.center,
                          width: size.width * 0.25,
                          height: size.height * 0.035,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border:
                                  Border.all(color: Colors.white, width: .5)),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/eth_ivon.svg',
                                width: size.width * 0.03,
                              ),
                              SizedBox(width: size.width * 0.01),
                              Text(
                                '${data[index].price.toString()} ETH',
                                style: TextStyle(
                                  color: kTextColor,
                                  fontSize: size.width * 0.04,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  staggeredTileBuilder: (int index) =>
                      StaggeredTile.count(2, index.isEven ? 2 : 3),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: size.width * 0.04,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
