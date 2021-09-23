import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nft_app/constants.dart';


class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: size.width * 0.05,
        right: size.width * 0.05,
        top: size.height * 0.025,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 15,
            backgroundImage: AssetImage(
              'assets/images/profile_image.png',
            ),
          ),
          Text(
            'Discover NFT',
            style: TextStyle(
              color: kTextColor,
              fontWeight: FontWeight.w700,
              fontSize: size.width * 0.05,
            ),
          ),
          SvgPicture.asset(
            'assets/icons/search.svg',
            color: kIconColor,
          )
        ],
      ),
    );
  }
}
