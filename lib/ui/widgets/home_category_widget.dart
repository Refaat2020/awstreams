import 'package:awstreams/data/data.dart';
import 'package:flutter/material.dart';

class HomeCategoryWidget extends StatefulWidget {
  final int index;
  int selectedCategoryIconIndex;

  HomeCategoryWidget({this.index,this.selectedCategoryIconIndex});

  @override
  _HomeCategoryWidgetState createState() => _HomeCategoryWidgetState();
}

class _HomeCategoryWidgetState extends State<HomeCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 30.0),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              setState(() {
                widget.selectedCategoryIconIndex = widget.index;

              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  height: 75.0,
                  width: 75.0,
                ),
                Material(
                  color: widget.selectedCategoryIconIndex == widget.index
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                  elevation: 8.0,
                  borderRadius: BorderRadius.circular(28.0),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Icon(
                      categoryIcon[widget.index],
                      size: 30.0,
                      color: widget.selectedCategoryIconIndex == widget.index ? Colors.white : Theme.of(context).primaryColor,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
