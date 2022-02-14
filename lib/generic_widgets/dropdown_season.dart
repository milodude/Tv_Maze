import 'package:flutter/material.dart';
import 'package:tv_maze/models/season.dart';

/// This is the stateful widget that the main application instantiates.
class DropdownSeasons extends StatefulWidget {
  final Function setSelected;
  final List<Season> seasonList;
  final Season? selected;

  const DropdownSeasons(this.setSelected, this.seasonList, this.selected, {Key? key}) : super(key: key);

  @override
  _DropdownSeasonsState createState() => _DropdownSeasonsState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _DropdownSeasonsState extends State<DropdownSeasons> {
  late List<DropdownMenuItem<Season>>? seasonList;
  late Season? dropdownValue = widget.selected;

  @override
  void initState() {
    super.initState();
  }

  List<DropdownMenuItem<Season>>? _transformListToDropDownItems() {
    seasonList = widget.seasonList.map((Season season) {
      return DropdownMenuItem(
        value: season,
        child: Text(
          season.number.toString(),
          key: ValueKey<String>(season.number.toString() + '_Key'),
        ),
      );
    }).toList();

    if (widget.seasonList.isNotEmpty) {
      setState(() {
        dropdownValue = dropdownValue == null? widget.seasonList.first:
        widget.seasonList.firstWhere((element) => element.id == dropdownValue!.id);
      });
    }

    return seasonList;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Season>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        key: const Key("DropDown"),
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (Season? newValue) {
            widget.setSelected(newValue);
            dropdownValue = newValue;
        },
        items: widget.seasonList.isNotEmpty
            ? _transformListToDropDownItems()
            : null);
  }
}
