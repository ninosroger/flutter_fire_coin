import 'package:flutter/material.dart';
import 'package:flutter_vicoin/resources/colors.dart';

class ToggleTab extends StatefulWidget {
  const ToggleTab({
    Key key,
    @required this.labels,
    @required this.initialIndex,
    @required this.selectedLabelIndex,
    @required this.selectedTextStyle,
    @required this.unSelectedTextStyle,
    this.height,
    this.selectedBackgroundColors,
    this.unSelectedBackgroundColors,
    this.borderRadius,
    this.begin,
    this.end,
    this.selectedIndex,
  }) : super(key: key);

  final List<String> labels;
  final int initialIndex;
  final int selectedIndex;
  final double height;

  final List<Color> selectedBackgroundColors;
  final List<Color> unSelectedBackgroundColors;
  final TextStyle selectedTextStyle;
  final TextStyle unSelectedTextStyle;
  final Function(int) selectedLabelIndex;
  final double borderRadius;
  final Alignment begin;
  final Alignment end;

  @override
  _ToggleTabState createState() => _ToggleTabState();
}

class _ToggleTabState extends State<ToggleTab> {
  var _labels = List<DataTab>();

  @override
  void initState() {
    if (widget.selectedIndex != null) {
      _labels.clear();
      for (int x = 0; x < widget.labels.length; x++) {
        if (x == widget.selectedIndex) {
          _labels.add(DataTab(title: widget.labels[x], isSelected: true));
        } else {
          _labels.add(DataTab(title: widget.labels[x], isSelected: false));
        }
      }
    } else {
      for (int x = 0; x < widget.labels.length; x++) {
        if (x == widget.initialIndex) {
          _labels.add(DataTab(title: widget.labels[x], isSelected: true));
        } else {
          _labels.add(DataTab(title: widget.labels[x], isSelected: false));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    print("initial ${widget.initialIndex}");
    return widget.labels.length <= 1
        ? Text(
            "Error : Label should >1",
            style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          )
        : Container(
            height: widget.height ?? 45,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.line_gray),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 30),
            ),
            child: Row(
              children: _labels
                  .asMap()
                  .map((index, value) => MapEntry(
                      index,
                      Expanded(
                          child: ButtonsTab(
                        unSelectedColors:
                            widget.unSelectedBackgroundColors != null
                                ? (widget.unSelectedBackgroundColors.length == 1
                                    ? [
                                        widget.unSelectedBackgroundColors[0],
                                        widget.unSelectedBackgroundColors[0]
                                      ]
                                    : widget.unSelectedBackgroundColors)
                                : [Color(0xffe0e0e0), Color(0xffe0e0e0)],
                        title: _labels[index].title,
                        selectedTextStyle: widget.selectedTextStyle,
                        unSelectedTextStyle: widget.unSelectedTextStyle,
                        isSelected: _labels[index].isSelected,
                        radius: widget.borderRadius ?? 30,
                        selectedColors: widget.selectedBackgroundColors != null
                            ? (widget.selectedBackgroundColors.length == 1
                                ? [
                                    widget.selectedBackgroundColors[0],
                                    widget.selectedBackgroundColors[0]
                                  ]
                                : widget.selectedBackgroundColors)
                            : [
                                Theme.of(context).primaryColor,
                                Theme.of(context).primaryColor
                              ],
                        onPressed: () {
                          try {
                            for (int x = 0; x < _labels.length; x++) {
                              setState(() {
                                if (_labels[index] == _labels[x]) {
                                  _labels[x].isSelected = true;
                                  widget.selectedLabelIndex(index);
                                } else
                                  _labels[x].isSelected = false;
                              });
                            }
                          } catch (e) {
                            print("err : $e");
                          }
                        },
                      ))))
                  .values
                  .toList(),
            ),
          );
  }
}

class DataTab {
  String title;
  bool isSelected;

  DataTab({this.title, this.isSelected});
}

class ButtonsTab extends StatefulWidget {
  const ButtonsTab(
      {Key key,
      this.title,
      this.onPressed,
      @required this.width,
      this.height,
      this.isSelected,
      this.radius,
      this.selectedTextStyle,
      this.unSelectedTextStyle,
      @required this.selectedColors,
      @required this.unSelectedColors,
      this.begin,
      this.end})
      : super(key: key);

  final String title;
  final Function onPressed;
  final double width;
  final double height;
  final List<Color> selectedColors;
  final List<Color> unSelectedColors;
  final TextStyle selectedTextStyle;
  final TextStyle unSelectedTextStyle;

  final bool isSelected;
  final double radius;

  final Alignment begin;
  final Alignment end;

  @override
  _ButtonsTabState createState() => _ButtonsTabState();
}

class _ButtonsTabState extends State<ButtonsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 50,
      decoration: widget.isSelected
          ? bdHeader.copyWith(
              borderRadius: BorderRadius.circular(widget.radius),
              gradient: LinearGradient(
                // Where the linear gradient begins and ends
                begin: widget.begin ?? Alignment.topCenter,
                end: widget.end ?? Alignment.bottomCenter,
                colors:
                    widget.selectedColors ?? [Theme.of(context).primaryColor],
              ))
          : null,
      child: FlatButton(
          onPressed: widget.onPressed,
          shape: new RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.radius)),
          padding: EdgeInsets.all(0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: widget.isSelected
                    ? widget.selectedTextStyle
                    : widget.unSelectedTextStyle,
                textAlign: TextAlign.center,
              )
            ],
          )),
    );
  }
}

const BoxShadow bsInner = BoxShadow(
  color: Colors.black12,
  offset: const Offset(0.0, 1.5),
  blurRadius: 1.0,
  spreadRadius: -1.0,
);
const BoxShadow bsOuter = BoxShadow(
  color: Colors.black12,
  offset: const Offset(0.0, 1.5),
  blurRadius: 1.0,
  spreadRadius: 1.0,
);

const BoxDecoration bdHeader = BoxDecoration(boxShadow: [bsOuter]);
