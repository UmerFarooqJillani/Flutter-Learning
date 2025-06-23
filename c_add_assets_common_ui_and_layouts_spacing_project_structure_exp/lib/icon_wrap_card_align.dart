import 'package:flutter/material.dart';

void main() => runApp(UiCom());

class UiCom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Image.asset("assets/images/Asset_18.png")),
        // -------------------------------------------------------------------------
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite, // Built-in Material icon
                    size: 40.0, // Size of icon in logical pixels
                    color: Colors.red, // Icon color
                    semanticLabel: 'Like', // For accessibility
                    textDirection: TextDirection.ltr,
                    shadows: [
                      BoxShadow(color: Colors.black54, blurRadius: 10.0),
                    ],
                  ),
                  // -------------------------------------------------------------------------
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.send),
                    label: Text("Send"),
                  ),

                  // -------------------------------------------------------------------------
                  // Icon with semanticLabel (for screen readers):
                  Icon(Icons.access_alarm, semanticLabel: 'Alarm Icon'),
                  // -------------------------------------------------------------------------
                  // IconData Class (Later Learn)
                  // IconData is the underlying class that represents an icon symbol — it stores the Unicode value and font information required to draw an icon.
                  // -------------------------------------------------------------------------
                  // TextDirection and RTL
                  // Some icons flip in Right-To-Left (RTL) languages. textDirection: controls that.
                  Icon(
                    Icons.arrow_back,
                    textDirection: TextDirection.ltr, // flips the icon
                  ),
                  // -------------------------------------------------------------------------
                  // Spacer(),
                  // -------------------------------------------------------------------------
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset("assets/images/Asset_18.png", width: 50),
                  ),
                  // -------------------------------------------------------------------------
                ],
              ),
              Padding(padding: EdgeInsetsGeometry.symmetric(vertical: 20)),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // -------------------------------------------------------------------------
                  /*
                  The RichText widget lets you display text with multiple styles (bold, italic, colored, 
                  clickable links), and it can embed other widgets like icons inline with text using 
                  WidgetSpan.
                  */
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          // A span of styled text
                          text: "Task Completed ",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        WidgetSpan(
                          // Allows embedding widgets (like icons or images) inline
                          child: Row(
                            children: [
                              Icon(Icons.check, color: Colors.green, size: 20),
                              Image.asset(
                                'assets/images/Asset_18.png',
                                width: 40,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // -------------------------------------------------------------------------
                ],
              ),
              Padding(padding: EdgeInsetsGeometry.symmetric(vertical: 10)),
              Row(
                children: [
                  Wrap(
                    direction: Axis.horizontal, // or Axis.vertical
                    spacing: 8.0, // horizontal space between children
                    runSpacing:
                        4.0, // vertical space between runs --- Space between lines or columns
                    // alignment: WrapAlignment.center,
                    // runAlignment: WrapAlignment.end, //Align runs (lines) in the cross axis
                    children: [
                      Chip(label: Text('Flutter')),
                      Chip(label: Text('Dart')),
                      Chip(label: Text('Wrap')),
                      Chip(label: Text('Widget')),
                    ],
                    // children: List.generate(10, (index) {
                    //   return Chip(label: Text('Item $index'));
                    // }),
                  ),
                  // -------------------------------------------------------------------------
                ],
              ),
              Padding(padding: EdgeInsetsGeometry.symmetric(vertical: 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    elevation: 4,
                    // margin: EdgeInsets.all(12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Flutter Card', style: TextStyle(fontSize: 20)),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text("Click Me"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsetsGeometry.symmetric(vertical: 10)),
              Align(
                alignment: Alignment.center,
                // widthFactor -->	Multiplies the child's width
                // heightFactor --> Multiplies the child's height
                widthFactor: 3.0,
                child: Text("Hello"),
              ),
            ],
          ),
        ),
        // -------------------------------------------------------------------------
        // -------------------------------------------------------------------------
      ),
    );
  }
}
