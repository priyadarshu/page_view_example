import 'dart:async';
import 'package:flutter/material.dart';
import 'package:page_view_example/pages/pages_entries.dart';
//import 'package:page_view_example/pages/pages.dart';

class PageEntryWidget extends StatefulWidget {
  final PageEntry entry;
  const PageEntryWidget({Key key, this.entry}) : super(key: key);

  @override
  _PageEntryWidgetState createState() => _PageEntryWidgetState();
}

class _PageEntryWidgetState extends State<PageEntryWidget> {
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollToEnd(milliseconds: 1000);
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
      scrollToEnd(milliseconds: 100);
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          controller: controller,
          children: <Widget>[
            Image.asset(widget.entry.image, fit: BoxFit.cover),
            SizedBox(
              height: 8.0,
            ),
            Center(
              child: Text(widget.entry.title,
                  style: Theme.of(context).textTheme.headline6),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(widget.entry.description,
                style: Theme.of(context).textTheme.bodyText1),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      );
    });
  }

  void scrollToEnd({int milliseconds}) {
    Timer(Duration(milliseconds: milliseconds), () {
      if (!controller.hasClients) return;
      controller.jumpTo(controller.position.maxScrollExtent);
    });
  }
}
