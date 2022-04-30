import 'package:flutter/material.dart';

class ProfileSelectionButton extends StatelessWidget {
  final bool firstTabIsSelected;
  final double width;
  final List<Color> tabColors;
  final Function(bool selectedFirstTab) onSelect;

  const ProfileSelectionButton({
    Key? key,
    required this.firstTabIsSelected,
    required this.tabColors,
    this.width = 240,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 30,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: InkWell(
              child: Container(
                color: firstTabIsSelected ? Colors.white : tabColors[1],
                child: Center(
                  child: Text(
                    'Buyer',
                    style: TextStyle(
                        color:
                            firstTabIsSelected ? tabColors[0] : Colors.white),
                  ),
                ),
              ),
              onTap: () {
                onSelect(true);
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              child: Container(
                color: firstTabIsSelected ? tabColors[0] : Colors.white,
                child: Center(
                  child: Text(
                    'Seller',
                    style: TextStyle(
                        color:
                            firstTabIsSelected ? Colors.white : tabColors[1]),
                  ),
                ),
              ),
              onTap: () {
                onSelect(false);
              },
            ),
          ),
        ],
      ),
    );
  }
}
