import 'package:flutter/material.dart';

import '../../../constants.dart';
class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int selectedIndex = 0;
  int hoverIndex = 0;
  List<String> menuItems = [    "Home",    "About",    "Services",    "Portfolio",    "Testimonial",    "Contact"  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double maxWidth = screenWidth < 1110 ? screenWidth : 1110;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 2.5),
      constraints: BoxConstraints(maxWidth: maxWidth),
      height: screenWidth < tabletScreenWidth ? 200 : 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: [kDefaultShadow],
      ),
      child: LayoutBuilder(

        builder: (context,constraints) {
          if (constraints.maxWidth <= tabletScreenWidth) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    (menuItems.length/2).ceil(),
                        (index) => buildMenuItem(index),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    (menuItems.length/2).ceil(),
                        (index) => buildMenuItem(index + (menuItems.length/2).ceil()),
                  ),
                ),
              ],
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                menuItems.length,
                    (index) => buildMenuItem(index),
              ),
            );
          }

        }
      ),
    );
  }

  Widget buildMenuItem(int index) => InkWell(
    onTap: () {
      setState(() {
        selectedIndex = index;
      });
    },
    onHover: (value) {
      setState(() {
        value ? hoverIndex = index : hoverIndex = selectedIndex;
      });
    },
    child: Container(
      constraints: BoxConstraints(minWidth: 122),
      height: 100,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            menuItems[index],
            style: TextStyle(fontSize: 20, color: kTextColor),
          ),
          // Hover
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            left: 0,
            right: 0,
            bottom:
            selectedIndex != index && hoverIndex == index ? -20 : -32,
            child: Image.asset("assets/images/Hover.png"),
          ),
          // Select
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            left: 0,
            right: 0,
            bottom: selectedIndex == index ? -2 : -32,
            child: Image.asset("assets/images/Hover.png"),
          ),
        ],
      ),
    ),
  );
}
