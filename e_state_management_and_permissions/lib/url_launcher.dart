/*
--> void openWebLinkExternally() async
    - `async`: Allows the use of await inside the function for handling asynchronous (non-blocking) operations.
    - This is important because:
      - `canLaunchUrl` and launchUrl both take time (e.g., checking availability, launching app).
      - `async` ensures the UI doesn't freeze while these complete.

--> final Uri url = Uri.parse('https://www.linkedin.com/feed/');
    - Uri.parse(...): Converts a string into a safe, structured Uri object.
    - Why it's needed:
      - launchUrl() and canLaunchUrl() require a Uri, not a raw string. 
      - Prevents errors like: “component name is null”.

--> canLaunchUrl(url)
    - Checks if there’s an app on the device that can handle the URL.
    - Returns Future<bool> — true if it can, false if it can’t.
    - Example:
      - https://linkedin.com  → handled by browser ✅
      - fb://page/123456      → only handled if Facebook is installed ❌

--> await canLaunchUrl(url)
    - await: Waits for canLaunchUrl to finish before continuing.

--> launchUrl(url, mode: LaunchMode.externalApplication)
    - `launchUrl`: Actually opens the URL using the method you specify.
    - `mode`: Controls how it opens.

--> String vs. parse()
    -> String:
      - A string is just plain text.
        String urlString = "https://flutter.dev";
      - It’s easy to type, read, and display.
      - But it's not structured
    -> Uri.parse():
      - Uri.parse() converts a String into a Uri object — a structured format Dart understands.
*/
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Open a Link OUTSIDE the App
  void openWebLinkExternally() async {
    // final Uri url = Uri.parse('https://flutter.dev');
    final Uri url = Uri.parse('https://www.linkedin.com/feed/');
    // final Uri url = Uri.parse(
    //   'https://youtu.be/56xvk6OHTpM',
    // );

    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode
            .externalApplication, // Opens in external browser (e.g., Chrome, Safari)
        // mode: LaunchMode.externalNonBrowserApplication, // Tries to open a non-browser app like Facebook or WhatsApp
      );
    } else {
      // throw 'Could not launch $url';
      throw Exception('Could not launch $url');
    }
  }

  // Open a Link INSIDE the App
  void openLinkInApp() async {
    final Uri url2 = Uri.parse(
      'https://github.com/UmerFarooqJillani/Flutter-Learning',
    );
    // final Uri url2 = Uri.parse(
    //   'https://youtu.be/56xvk6OHTpM',
    // );

    if (await canLaunchUrl(url2)) {
      await launchUrl(
        url2,
        mode: LaunchMode
            .inAppWebView, // Opens inside your app using a native webview tab
        // mode: LaunchMode.platformDefault,  // Uses system default (usually in-app browser)
        // mode: LaunchMode.inAppBrowserView,
      );
    } else {
      throw 'Could not launch $url2';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          // child: InkWell(
          //   onTap: () => openLinkInApp(),
          //   child: Text("Click Here"),
          // ),
          //------------------------------------------------------------------------------------
          child: Link(
            uri: Uri.parse('https://www.linkedin.com/feed/'),
            target: LinkTarget.blank,
            // builder: (context, lin) =>
            //     TextButton(onPressed: lin, child: Text('Visit Flutter')),
            //-----------
            builder: (context, followLink) =>
                TextButton(onPressed: followLink, child: Text('Visit Flutter')),
            // ----------
            // builder: (context, followLink) => GestureDetector(
            //   onTap: followLink,
            //   child: Text(
            //     'Tap here',
            //     style: TextStyle(
            //       color: Colors.blue,
            //       decoration: TextDecoration.underline,
            //     ),
            //   ),
            // ),
            // ----------
          ),
        ),
      ),
    );
  }
}
