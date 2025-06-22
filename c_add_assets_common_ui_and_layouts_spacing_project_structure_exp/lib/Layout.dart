import 'package:flutter/material.dart';

void main() {
  runApp(Layout());
}

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //------------------------------------------------------------------------------
        /*
        body: Container(
          width: 200,    // 	Size constraints
          height: 100,   // 	Size constraints
          margin: EdgeInsets.all(10),    // Space outside
          padding: EdgeInsets.all(16),   // Space inside
          alignment: Alignment.center,  // Aligns child within container
          decoration: BoxDecoration(     // Add borders, gradients, shadows
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(blurRadius: 4, color: Colors.grey)],
          ),
          child: Text('Container', style: TextStyle(color: Colors.white)),
          // transform --> Rotate, scale, skew
        ),
        */
        //------------------------------------------------------------------------------
        // body: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   mainAxisSize: MainAxisSize.min, // Widget takes only the space needed by its children
        //   children: [
        //     Icon(Icons.home),
        //     Icon(Icons.favorite),
        //     Icon(Icons.settings),
        //   ],
        // ),
        //------------------------------------------------------------------------------
        // body: Flex(
        //   direction: Axis.horizontal,
        //   mainAxisAlignment: MainAxisAlignment.spaceAround ,
        //   children: [
        //     Icon(Icons.access_alarm),
        //     Icon(Icons.backup),
        //     Icon(Icons.camera),
        //   ],
        // ),
        //------------------------------------------------------------------------------
        // body: Flex(
        //   direction: Axis.horizontal,
        //   children: [
        //     Expanded(
        //       /*
        //       Direction is static ---> Use Row / Column
        //       Direction is dynamic (user setting, orientation) ---> Use Flex
        //       */
        //       flex: 2, // The first Container gets 2/3 of the width
        //       child: Container(color: Colors.red, height: 50),
        //     ),
        //     Expanded(
        //       flex: 1, // The second gets 1/3
        //       child: Container(color: Colors.green, height: 50),
        //     ),
        //   ],
        // ),
        //------------------------------------------------------------------------------
        /*
        body: Stack(
          // fit:
          // The fit property controls how non-positioned children should be sized
          // relative to the Stack’s size.
          // fit: StackFit.expand, // Forces non-positioned children to fill the entire Stack (match parent's size)
          fit: StackFit
              .loose, // (Default) Non-positioned children can be any size they want.
          clipBehavior: Clip
              .none, //(If need to learn otherwise ignore)The clipBehavior defines how to clip children that overflow the Stack’s bounds.
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ), // fixed size
            Positioned(
              bottom: 10,
              right: 10,
              child: Icon(Icons.star, color: Colors.white),
            ),
          ],
        ),
        */
        //------------------------------------------------------------------------------
        // body: ListView(
        //   children: [
        //     ListBody(
        //       children: [
        //         Row(
        //           children: [
        //             Padding(padding: EdgeInsets.only(left: 10.0)),
        //             Column(children: [Icon(Icons.autorenew_sharp)]),
        //             SizedBox(width: 20),
        //             Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Row(
        //                   children: [
        //                     Text(
        //                       "A",
        //                       style: TextStyle(
        //                         fontSize: 20,
        //                         fontWeight: FontWeight.bold,
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //                 Row(
        //                   children: [
        //                     Text(
        //                       "A is is the text of alphabet",
        //                       style: TextStyle(fontSize: 12),
        //                     ),
        //                   ],
        //                 ),
        //               ],
        //             ),
        //           ],
        //         ),
        //       ],
        //     ),
        //     ListTile(title: Text("Item 2")),
        //     ListTile(title: Text("Item 3")),
        //   ],
        // ),
        //------------------------------------------------------------------------------
        // body: ListView.builder(
        //   itemCount: 5,
        //   itemBuilder:
        //   (context, index) {
        //     return ListTile(title: Text("Item $index"));
        //   },
        // ),
        //------------------------------------------------------------------------------
        backgroundColor: Colors.white,
        // body: ListView.separated(
        //   itemCount: 10,
        //   itemBuilder: (context, index) => ListTile(title: Text("Item $index")),
        //   separatorBuilder: (context, index) => Divider(color: const Color.fromARGB(164, 171, 171, 171)),
        // ),
        //------------------------------------------------------------------------------
        // body: ListView.custom(
        //   childrenDelegate: SliverChildBuilderDelegate(
        //     (context, index) => Text("Item $index"),
        //     childCount: 5,
        //   ),
        // ),
        //------------------------------------------------------------------------------
        // body: ListView(
        //   scrollDirection: Axis.horizontal, // Axis.vertical by default
        //   children: [
        //     Container(width: 50, height: 10, color: Colors.red),
        //     Container(width: 50, height: 10, color: Colors.green),
        //     Container(width: 50, height: 10, color: Colors.blue),
        //     Container(width: 50, height: 10, color: Colors.red),
        //     Container(width: 50, height: 10, color: Colors.green),
        //     Container(width: 50, height: 10, color: Colors.blue),
        //     Container(width: 50, height: 10, color: Colors.red),
        //     Container(width: 50, height: 10, color: Colors.green),
        //     Container(width: 50, height: 10, color: Colors.blue),
        //     Container(width: 50, height: 10, color: Colors.red),
        //     Container(width: 50, height: 10, color: Colors.green),
        //   ],
        // ),
        //------------------------------------------------------------------------------
        // body: Column(
        //   children: [
        //     Text("Top Section"),
        //     ListView(
        //       // shrinkWrap: false, // Important!
        //       children: List.generate(20, (i) => Text("Item $i")),
        //     ),
        //     Text("Bottom Section"),
        //   ],
        // ),
        //------------------------------------------------------------------------------
        // body: ListView(
        //   physics: BouncingScrollPhysics(), // Smooth iOS bounce
        //   children: List.generate(100, (i) => ListTile(title: Text("Item $i"))),
        // ),
        //------------------------------------------------------------------------------
        // body: ListView(
        //   reverse: true, // Reverses scroll direction
        //   children: List.generate(50, (i) => ListTile(title: Text("Item $i"))),
        // ),
        //------------------- All in one example -------------------------------------------
        // body: ListView.builder(
        //   scrollDirection: Axis.vertical,
        //   shrinkWrap: true,
        //   physics: BouncingScrollPhysics(),
        //   padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        //   reverse: false,
        //   itemCount: 10,
        //   itemBuilder: (context, index) {
        //     return Card(
        //       margin: EdgeInsets.symmetric(vertical: 8),
        //       child: ListTile(
        //         leading: Icon(Icons.star),
        //         title: Text("Item $index"),
        //       ),
        //     );
        //   },
        // ),
        //------------------------------------------------------------------------------
        // body: ListTile(
        //   leading: Icon(Icons.person),
        //   title: Text("Umer"),
        //   subtitle: Text("Flutter Developer"),
        //   trailing: Icon(Icons.arrow_forward),
        //   onTap: () => print("Tapped"),
        // ),
        //------------------------------------------------------------------------------
        // body: SingleChildScrollView(
        //   scrollDirection: Axis.vertical, // or Axis.horizontal
        //   padding: EdgeInsets.all(16),
        //   physics: BouncingScrollPhysics(),
        //   child: Column(
        //     children: [
        //       Text("Title", style: TextStyle(fontSize: 32)),
        //       Image.asset("assets/images/Asset_18.png"),
        //       Padding(
        //         padding: EdgeInsets.all(16),
        //         child: Text("Long paragraph..."),
        //       ),
        //     ],
        //   ),
        // ),
        //------------------------------------------------------------------------------
        // body: GridView.count(
        //   crossAxisCount: 3, // 3 columns
        //   crossAxisSpacing: 10,
        //   mainAxisSpacing: 10,
        //   padding: EdgeInsets.all(8),
        //   children: List.generate(19, (index) {
        //     return Container(
        //       color: Colors.teal[100 * (index % 9)],
        //       child: Center(child: Text('Item $index')),
        //     );
        //     // ---------------
        //     // return Card(
        //     //   child: Center(
        //     //      color: Colors.teal[100 * (index % 9)],
        //     //     child: Image.asset("assets/images/asset_$index.png"),
        //     //   ),
        //     // );
        //   }),
        // ),
        //------------------------------------------------------------------------------
        // body: GridView.extent(
        //   maxCrossAxisExtent: 150, // Each item max 150px wide
        //   mainAxisSpacing: 10,
        //   crossAxisSpacing: 10,
        //   padding: EdgeInsets.all(8),
        //   children: List.generate(
        //     10,
        //     (index) => Container(
        //       color: Colors.blue[100 * (index % 9)],
        //       child: Center(child: Text('Box $index')),
        //     ),
        //   ),
        // ),
        //------------------------------------------------------------------------------
        // body: GridView.builder(
        //   itemCount: 20,
        //   // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: ),
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 2,
        //     mainAxisSpacing: 10,
        //     crossAxisSpacing: 10,
        //     // childAspectRatio: 0.5,        // 	Width = Half of Height (Tall box) -->  Tall
        //     // childAspectRatio: 1.0,        // 	Width = Height (Square box)	--> Square
        //     childAspectRatio: 2.0,            // Width = 2×Height (Wide box)	--> wide
        //   ),
        //   itemBuilder: (context, index) {
        //     return Container(
        //       color: Colors.purple[100 * (index % 9)],
        //       child: Center(child: Text('Item $index')),
        //     );
        //   },
        // ),
        //------------------------------------------------------------------------------
        // body: CustomScrollView(
        //   slivers: [
        //     SliverAppBar(
        //       pinned: true,
        //       expandedHeight: 200,
        //       // title: Text('SliverAppBar'),
        //       // floating: false, // Appears immediately when user scrolls up
        //       // snap: false, // Works with floating
        //       flexibleSpace: FlexibleSpaceBar(
        //         title: Text('Collapsing Title'),
        //         background: Image.asset('assets/images/Asset_18.png', fit: BoxFit.cover),
        //       ),
        //     ),
        //     SliverList(
        //       delegate: SliverChildBuilderDelegate(
        //         (context, index) => ListTile(title: Text("Item $index")),
        //         childCount: 20,
        //       ),
        //     ),
        //   ],
        // ),
        //------------------------------------------------------------------------------
        // body: CustomScrollView(
        //   slivers: [
        //     SliverGrid(
        //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //         crossAxisCount: 2,
        //         childAspectRatio: 1.5,
        //         crossAxisSpacing: 20,
        //         mainAxisSpacing: 20,
        //       ),
        //       delegate: SliverChildBuilderDelegate(
        //         childCount: 10,
        //         (context, index) => Container(
        //           color: Colors.amber,
        //           child: Center(child: Text('Item $index')),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        //------------------------------------------------------------------------------
        // body: CustomScrollView(
        //   slivers: [
        //     SliverToBoxAdapter(
        //       child: Padding(
        //         padding: EdgeInsets.all(8.0),
        //         child: Text('I am a regular widget'),
        //       ),
        //     ),
        //   ],
        // ),
        //--------------------Combining Slivers-------------------------------------------
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 150.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('My App'),
                background: Image.asset('assets/banner.jpg', fit: BoxFit.cover),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Welcome to the Sliver World!'),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(title: Text('Item $index')),
                childCount: 10,
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                  color: Colors.orange[100 * (index % 9)],
                  child: Center(child: Text('Grid $index')),
                ),
                childCount: 6,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 1.2,
              ),
            ),
          ],
        ),
        //------------------------------------------------------------------------------
      ),
    );
  }
}
