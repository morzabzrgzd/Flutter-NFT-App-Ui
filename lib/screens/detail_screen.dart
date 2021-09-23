import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft_app/constants.dart';

class DetailScreen extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final data;
  const DetailScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 0.05,
                    right: size.width * 0.05,
                    top: size.height * 0.025,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                            Text(
                              'Back',
                              style: TextStyle(
                                color: kTextColor,
                                fontSize: size.width * 0.05,
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        'Cangrats!',
                        style: TextStyle(
                          color: kTextColor,
                          fontWeight: FontWeight.w700,
                          fontSize: size.width * 0.05,
                        ),
                      ),
                      const SizedBox(
                        width: 60,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'The highest bid is yours',
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: size.width * 0.038,
                        ),
                      ),
                      SizedBox(width: size.width * 0.02),
                      SvgPicture.asset('assets/icons/Emoji.svg')
                    ],
                  ),
                ),
                Hero(
                  tag: widget.data.id,
                  child: Container(
                    width: size.width / 1.5,
                    height: size.height / 2.5,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('${widget.data.image}'),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  width: size.width / 1.5,
                  child: const DottedLine(
                    direction: Axis.horizontal,
                    lineLength: double.infinity,
                    lineThickness: 1,
                    dashLength: 4,
                    dashColor: Colors.white,
                    dashRadius: 0,
                    dashGapLength: 4,
                    dashGapColor: Colors.transparent,
                    dashGapRadius: 0,
                  ),
                ),
                SizedBox(
                  width: size.width / 1.5,
                  child: Text(
                    'NFT Item: Discovery of the world\nDue Date: June 22, 2021',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: kTextColor, wordSpacing: 2, height: 1.5),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 30,
              child: Text(
                'Continue',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                  color: kTextColor,
                  fontSize: size.width * 0.045,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
