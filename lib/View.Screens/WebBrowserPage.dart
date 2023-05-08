import 'package:flutter/material.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall_code/Controllers/LinerValue_Provider.dart';
import 'package:mirror_wall_code/Controllers/PopupMenuItemSelect_Provider.dart';
import 'package:mirror_wall_code/Utills/All_Atributes.dart';

import 'package:provider/provider.dart';

class WebBrowserPage extends StatefulWidget {
  const WebBrowserPage({Key? key}) : super(key: key);

  @override
  State<WebBrowserPage> createState() => _WebBrowserPageState();
}

class _WebBrowserPageState extends State<WebBrowserPage> {
  InAppWebViewController? inAppWebViewController;
  late PullToRefreshController? pullToRefreshController;

  TextEditingController SearchWebView = TextEditingController();

  @override
  void initState() {
    super.initState();
    pullToRefreshController = PullToRefreshController(
        options: PullToRefreshOptions(
          color: Color(0xff6054c1),
        ),
        onRefresh: () async {
          await inAppWebViewController?.reload();
        });
  }

  @override
  Widget build(BuildContext context) {
    Map webValue = ModalRoute.of(context)!.settings.arguments as Map;

    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${webValue['name']}",
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
              Provider.of<PopupMenuItemSelect_Provider>(context, listen: false)
                  .getValueSelect(val);
              // PopupMenuItemSelect = val;
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
                            child: (BookMark.isNotEmpty)
                                ? ListView.builder(
                                    itemCount: BookMark.length,
                                    itemBuilder: (context, i) => ListTile(
                                      onTap: () {
                                        inAppWebViewController?.loadUrl(
                                            urlRequest:
                                                URLRequest(url: BookMark[i]));
                                        Navigator.pop(context);
                                      },
                                      title: Text(
                                        "${BookMarkName[i]}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: Text("${BookMark[i]}"),
                                      trailing: IconButton(
                                          onPressed: () {
                                            BookMark.remove(BookMark[i]);
                                            BookMarkName.remove(
                                                BookMarkName[i]);
                                            Navigator.of(context).pop();
                                          },
                                          icon: Icon(Icons.delete)),
                                    ),
                                  )
                                : Center(
                                    child: Text(
                                      "No Any Bookmarks Yet... 😓😓",
                                      style: TextStyle(
                                        fontSize: h * 0.02,
                                        fontWeight: FontWeight.w400,
                                      ),
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
                              groupValue:
                                  Provider.of<PopupMenuItemSelect_Provider>(
                                          context,
                                          listen: false)
                                      .p1
                                      .PopupMenuItemURI,
                              value: "https://www.google.com/",
                              title: Text(
                                "Google",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              activeColor: Color(0xff6054c1),
                              onChanged: (val) {
                                  // PopupMenuItemURI = val!;
                                  Provider.of<PopupMenuItemSelect_Provider>(
                                          context,
                                          listen: false)
                                      .getValueURI(val);
                                  inAppWebViewController?.loadUrl(
                                    urlRequest: URLRequest(
                                      url: Uri.parse(Provider.of<
                                                  PopupMenuItemSelect_Provider>(
                                              context,
                                              listen: false)
                                          .p1
                                          .PopupMenuItemURI),
                                    ),
                                  );
                                  Navigator.of(context).pop();
                              },
                            ),
                            RadioListTile(
                              value: "https://www.yahoo.com/?guccounter=1",
                              groupValue:
                                  Provider.of<PopupMenuItemSelect_Provider>(
                                          context,
                                          listen: false)
                                      .p1
                                      .PopupMenuItemURI,
                              title: Text(
                                "Yahoo",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              activeColor: Color(0xff6054c1),
                              onChanged: (val) {
                                  //PopupMenuItemURI = val!;
                                  Provider.of<PopupMenuItemSelect_Provider>(
                                          context,
                                          listen: false)
                                      .getValueURI(val);
                                  inAppWebViewController?.loadUrl(
                                    urlRequest: URLRequest(
                                      url: Uri.parse(Provider.of<
                                                  PopupMenuItemSelect_Provider>(
                                              context,
                                              listen: false)
                                          .p1
                                          .PopupMenuItemURI),
                                    ),
                                  );
                                  Navigator.of(context).pop();
                              },
                            ),
                            RadioListTile(
                              value: "https://www.bing.com/",
                              groupValue:
                                  Provider.of<PopupMenuItemSelect_Provider>(
                                          context,
                                          listen: false)
                                      .p1
                                      .PopupMenuItemURI,
                              title: Text(
                                "Bing",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              activeColor: Color(0xff6054c1),
                              onChanged: (val) {
                                  //PopupMenuItemURI = val!;
                                  Provider.of<PopupMenuItemSelect_Provider>(
                                          context,
                                          listen: false)
                                      .getValueURI(val);
                                  inAppWebViewController?.loadUrl(
                                      urlRequest: URLRequest(
                                          url: Uri.parse(Provider.of<
                                                      PopupMenuItemSelect_Provider>(
                                                  context,
                                                  listen: false)
                                              .p1
                                              .PopupMenuItemURI)));
                                  Navigator.of(context).pop();
                              },
                            ),
                            RadioListTile(
                              value: "https://duckduckgo.com/",
                              groupValue:
                                  Provider.of<PopupMenuItemSelect_Provider>(
                                          context,
                                          listen: false)
                                      .p1
                                      .PopupMenuItemURI,
                              title: Text(
                                "Duck Duck Go",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              activeColor: Color(0xff6054c1),
                              onChanged: (val) {
                                  // PopupMenuItemURI = val!;
                                  Provider.of<PopupMenuItemSelect_Provider>(
                                          context,
                                          listen: false)
                                      .getValueURI(val);
                                  inAppWebViewController?.loadUrl(
                                      urlRequest: URLRequest(
                                          url: Uri.parse(Provider.of<
                                                      PopupMenuItemSelect_Provider>(
                                                  context,
                                                  listen: false)
                                              .p1
                                              .PopupMenuItemURI)));
                                  Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: "1",
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.bookmark, color: Colors.grey),
                    SizedBox(
                      width: w * 0.05,
                    ),
                    Text(
                      "All BookMark",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
                    Text(
                      "Search Engine",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
                pullToRefreshController: pullToRefreshController,
                onLoadStart: (controller, url) {
                  inAppWebViewController = controller;
                },
                onLoadStop: (controller, uri) async {
                  await pullToRefreshController?.endRefreshing();
                },
                onProgressChanged: (controller, progress) {
                  Provider.of<LinerValue_Provider>(context, listen: false)
                      .ChangeProgress(progress);
                  if (progress == 100) {
                    pullToRefreshController?.endRefreshing();
                  }
                },
                initialUrlRequest: URLRequest(url: Uri.parse(webValue['uri'])),
              ),
            ),
            Expanded(
              flex: 2,
              child: TextFormField(
                controller: SearchWebView,
                decoration: InputDecoration(
                  hintText: "Search or type web address",
                  suffixIcon: IconButton(
                    onPressed: () async {
                      String searchUri = SearchWebView.text;
                      inAppWebViewController?.loadUrl(
                          urlRequest: URLRequest(
                              url: Uri.parse(
                                  "${webValue['search']}$searchUri")));
                    },
                    icon: Icon(Icons.search),
                  ),
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
            (Provider.of<LinerValue_Provider>(context).l1.WebProgress < 1.0)
                ? Transform.scale(
                    scale: 1.5,
                    child: LinearProgressIndicator(
                      color: Color(0xff6054c1),
                      backgroundColor: Colors.indigo.shade100,
                      value: Provider.of<LinerValue_Provider>(context)
                          .l1
                          .WebProgress,
                    ),
                  )
                : Container(),
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
                        SearchWebView.clear();
                      },
                      icon: Icon(Icons.home_filled),
                    ),
                    IconButton(
                      onPressed: () async {
                        BookMarkName.add(
                            await inAppWebViewController?.getTitle());
                        BookMark.add(await inAppWebViewController?.getUrl());
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
