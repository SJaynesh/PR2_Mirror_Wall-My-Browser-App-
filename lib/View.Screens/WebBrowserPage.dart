import 'package:flutter/material.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall_code/Utills/All_Atributes.dart';

class WebBrowserPage extends StatefulWidget {
  const WebBrowserPage({Key? key}) : super(key: key);

  @override
  State<WebBrowserPage> createState() => _WebBrowserPageState();
}

class _WebBrowserPageState extends State<WebBrowserPage> {
  InAppWebViewController? inAppWebViewController;

  String PopupMenuItemSelect = "1";
  String PopupMenuItemURI = "";

  @override
  Widget build(BuildContext context) {
    Map webValue = ModalRoute.of(context)!.settings.arguments as Map;

    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Jaynesh Sarkar",
          style: TextStyle(
            color: Colors.black,
            fontSize: h * 0.025,
          ),
        ),
        actions: [
          PopupMenuButton(
            color: Color(0xfff5ecf6),
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            onSelected: (val) {
              setState(() {
                PopupMenuItemSelect = val;
                if (val == "1") {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => Container(
                      height: h * 0.92,
                      width: w,
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                height: h * 0.05,
                                width: w,
                                color: Color(0xfff8f1f9),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.clear,
                                      color: Color(0xff6954a6),
                                    ),
                                    SizedBox(
                                      width: w * 0.01,
                                    ),
                                    Text(
                                      "DISMISS",
                                      style: TextStyle(
                                        fontSize: h * 0.02,
                                        color: Color(0xff6954a6),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: h,
                              child: ListView.builder(
                                itemCount: BookMark.length,
                                itemBuilder: (context, i) => ListTile(
                                  title: Text("${BookMark[i]}"),
                                  trailing: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          BookMark.remove(BookMark[i]);
                                          Navigator.of(context).pop();
                                        });
                                      },
                                      icon: Icon(Icons.delete)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else if (val == "2") {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return StatefulBuilder(
                        builder: (context, setState) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          alignment: Alignment.center,
                          title: Center(
                              child: Text(
                                "Search Engine",
                                style: TextStyle(
                                  fontSize: h * 0.03,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              RadioListTile(
                                groupValue: PopupMenuItemURI,
                                value: "https://www.google.com/",
                                title: Text(
                                  "Google",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                activeColor: Color(0xff6054c1),
                                onChanged: (val) {
                                  setState(() {
                                    PopupMenuItemURI = val!;
                                    inAppWebViewController!.loadUrl(
                                      urlRequest: URLRequest(
                                        url: Uri.parse(PopupMenuItemURI),
                                      ),
                                    );
                                    Navigator.of(context).pop();
                                  });
                                },
                              ),
                              RadioListTile(
                                value: "https://www.yahoo.com/?guccounter=1",
                                groupValue: PopupMenuItemURI,
                                title: Text(
                                  "Yahoo",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                activeColor: Color(0xff6054c1),
                                onChanged: (val) {
                                  setState(() {
                                    PopupMenuItemURI = val!;
                                    inAppWebViewController!.loadUrl(
                                      urlRequest: URLRequest(
                                        url: Uri.parse(PopupMenuItemURI),
                                      ),
                                    );
                                    Navigator.of(context).pop();
                                  });
                                },
                              ),
                              RadioListTile(
                                value: "https://www.bing.com/",
                                groupValue: PopupMenuItemURI,
                                title: Text(
                                  "Bing",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                activeColor: Color(0xff6054c1),
                                onChanged: (val) {
                                  setState(() {
                                    PopupMenuItemURI = val!;
                                    inAppWebViewController!.loadUrl(
                                        urlRequest:
                                        URLRequest(url: Uri.parse(PopupMenuItemURI)));
                                    Navigator.of(context).pop();
                                  });
                                },
                              ),
                              RadioListTile(
                                value: "https://duckduckgo.com/",
                                groupValue: PopupMenuItemURI,
                                title: Text(
                                  "Duck Duck Go",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                activeColor: Color(0xff6054c1),
                                onChanged: (val) {
                                  setState(() {
                                    PopupMenuItemURI = val!;
                                    inAppWebViewController!.loadUrl(
                                        urlRequest:
                                        URLRequest(url: Uri.parse(PopupMenuItemURI)));
                                    Navigator.of(context).pop();
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              });
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            itemBuilder: (context) =>
            [
              PopupMenuItem(
                value: "1",
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                     Icon(Icons.bookmark,
                        color: Colors.grey),
                    SizedBox(
                      width: w * 0.05,
                    ),
                    Text("All BookMark",style: TextStyle(fontWeight: FontWeight.w600,),),
                  ],
                ),
              ),
              PopupMenuItem(
                value: "2",
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                     Icon(Icons.screen_search_desktop, color: Colors.grey),
                    SizedBox(
                      width: w * 0.05,
                    ),
                     Text("Search Engine",style: TextStyle(fontWeight: FontWeight.w600,),),
                  ],
                ),
              ),
            ],
          ),
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 16,
              child: InAppWebView(
                onLoadStart: (controller, url) {
                  setState(() {
                    inAppWebViewController = controller;
                    urlBookMark = url.toString();
                  });
                },
                initialUrlRequest: URLRequest(url: Uri.parse(webValue['uri'])),
              ),
            ),
            Expanded(
              flex: 2,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Search or type web address",
                  suffixIcon: Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.black38,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.blue.shade600,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () async {
                        await inAppWebViewController?.loadUrl(
                            urlRequest:
                                URLRequest(url: Uri.parse(webValue['uri'])));
                      },
                      icon: Icon(Icons.home_filled),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          //BookMark.add(inAppWebViewController?.getSelectedText());
                          BookMark.add(urlBookMark);
                          print("==========");
                          print(BookMark);
                          print("==========");
                        });
                      },
                      icon: Icon(Icons.bookmark_add_outlined),
                    ),
                    IconButton(
                      onPressed: () async {
                        if (await inAppWebViewController!.canGoBack()) {
                          await inAppWebViewController?.goBack();
                        }
                      },
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    IconButton(
                      onPressed: () async {
                        await inAppWebViewController?.reload();
                      },
                      icon: Icon(Icons.refresh),
                    ),
                    IconButton(
                      onPressed: () async {
                        if (await inAppWebViewController!.canGoForward()) {
                          await inAppWebViewController?.goForward();
                        }
                      },
                      icon: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

// PopupMenuItem(
// value: "Option 1",
// child: Row(
// children: [
// const Icon(
// Icons.bookmark,
// color: Colors.grey,
// ),
// SizedBox(
// width: w * 0.03,
// ),
// Text("All BookMark"),
// ],
// ),
// ),
