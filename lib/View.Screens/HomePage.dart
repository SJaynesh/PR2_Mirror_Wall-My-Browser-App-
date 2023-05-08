import 'package:flutter/material.dart';
import 'package:mirror_wall_code/Utills/All_Atributes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Multiple Browser",
          style: TextStyle(
            fontSize: h * 0.025,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xff0e022a),
      ),
      body: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(BackgroundImagePath),
          fit: BoxFit.cover,
        )),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // crossAxisSpacing: w * 0.01,
            // mainAxisSpacing: h * 0.01,
          ),
          itemCount: MyWebBrowser.length,
          padding: EdgeInsets.all(18),
          itemBuilder: (context, i) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('WebBrowserPage',arguments: MyWebBrowser[i]);
                },
                child: Container(
                  height: h * 0.13,
                  width: w * 0.3,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("${MyWebBrowser[i]['image']}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                "${MyWebBrowser[i]['name']}",
                style: TextStyle(
                  fontSize: h * 0.025,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
