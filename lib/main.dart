import 'package:flutter/material.dart';
import 'package:page_view_example/pages/page_circle_indicator.dart';
import 'package:page_view_example/pages/page_entries_widget.dart';
import 'package:page_view_example/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final String appTitle = 'PageView';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        primaryColor: Colors.blue[100],
      ),
      home: PageViewExample(appTitle: appTitle),
    );
  }
}

class PageViewExample extends StatefulWidget {
  final String appTitle;
  const PageViewExample({this.appTitle});

  @override
  _PageViewExampleState createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample> {
  final ValueNotifier currentPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appTitle),
        centerTitle: true,
        titleSpacing: 2.0,
      ),
      body: Stack(
        children: <Widget>[
          PageView.builder(
            onPageChanged: (int index) {
              currentPageNotifier.value = index;
            },
            controller: PageController(
              initialPage: currentPageNotifier.value,
            ),
            itemCount: pages.length,
            itemBuilder: (BuildContext buildContext, int index) {
              return PageEntryWidget(entry: pages[index]);
            },
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 8.0,
            child: PageCircleIndicator(
              itemCount: pages.length,
              currentPageNotifier: currentPageNotifier,
            ),
          ),
        ],
      ),
    );
  }
}
