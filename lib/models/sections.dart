import 'package:flutter/material.dart';
import 'package:News_App/helper/data_new.dart';
import 'package:News_App/pages/widgets/news_tile.dart';

class All extends StatefulWidget {
  @override
  _AllState createState() => _AllState();
}

class _AllState extends State<All> {
  final bgColor = const Color(0xFFffffff);
  final txtColor = const Color(0xFF171717);
  final up = const Color(0xFFff416c);
  final down = const Color(0xFFff4b2b);
  var allarticles = [];
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    fetchNews();
  }

  Future<void> fetchNews() async {
    Data newsClass = Data();
    await newsClass.getData();
    allarticles = newsClass.articles;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Container(
            height: 300,
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: new AlwaysStoppedAnimation<Color>(down),
              ),
            ),
          )
        : ListView.builder(
            itemCount: allarticles.length,
            itemBuilder: (context, index) {
              return Tile(
                img: allarticles[index].img.toString(),
                head: allarticles[index].head,
                des: allarticles[index].url,
              );
            });
  }
}

class Business extends StatefulWidget {
  @override
  _BusinessState createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  final bgColor = const Color(0xFFffffff);
  final txtColor = const Color(0xFF171717);
  final up = const Color(0xFFff416c);
  final down = const Color(0xFFff4b2b);
  var allarticles1 = [];
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    fetchNews();
  }

  Future<void> fetchNews() async {
    Data1 newsClass1 = Data1();
    await newsClass1.getData();
    allarticles1 = newsClass1.articles1;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Container(
            height: 300,
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: new AlwaysStoppedAnimation<Color>(down),
              ),
            ),
          )
        : ListView.builder(
            itemCount: allarticles1.length,
            itemBuilder: (context, index) {
              return Tile(
                img: allarticles1[index].img,
                head: allarticles1[index].head,
                des: allarticles1[index].url,
              );
            });
  }
}

// ignore: must_be_immutable
class Sports extends StatefulWidget {
  ScrollController controller = ScrollController();

  @override
  _SportsState createState() => _SportsState();
}

class _SportsState extends State<Sports> {
  final bgColor = const Color(0xFFffffff);
  final txtColor = const Color(0xFF171717);
  final up = const Color(0xFFff416c);
  final down = const Color(0xFFff4b2b);
  var allarticles2 = [];
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    fetchNews();
  }

  Future<void> fetchNews() async {
    Data2 newsClass2 = Data2();
    await newsClass2.getData();
    allarticles2 = newsClass2.articles2;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Container(
            height: 300,
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: new AlwaysStoppedAnimation<Color>(down),
              ),
            ),
          )
        : ListView.builder(
            itemCount: allarticles2.length,
            itemBuilder: (context, index) {
              return Tile(
                img: allarticles2[index].img,
                head: allarticles2[index].head,
                des: allarticles2[index].url,
              );
            });
  }
}

class Health extends StatefulWidget {
  @override
  _HealthState createState() => _HealthState();
}

class _HealthState extends State<Health> {
  final bgColor = const Color(0xFFffffff);
  final txtColor = const Color(0xFF171717);
  final up = const Color(0xFFff416c);
  final down = const Color(0xFFff4b2b);
  var allarticles3 = [];
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    fetchNews();
  }

  Future<void> fetchNews() async {
    Data3 newsClass3 = Data3();
    await newsClass3.getData();
    allarticles3 = newsClass3.articles3;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Container(
            height: 300,
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: new AlwaysStoppedAnimation<Color>(down),
              ),
            ),
          )
        : ListView.builder(
            itemCount: allarticles3.length,
            itemBuilder: (context, index) {
              return Tile(
                img: allarticles3[index].img,
                head: allarticles3[index].head,
                des: allarticles3[index].url,
              );
            });
  }
}

class Entertainment extends StatefulWidget {
  @override
  _EntertainmentState createState() => _EntertainmentState();
}

class _EntertainmentState extends State<Entertainment> {
  final bgColor = const Color(0xFFffffff);
  final txtColor = const Color(0xFF171717);
  final up = const Color(0xFFff416c);
  final down = const Color(0xFFff4b2b);
  var allarticles4 = [];
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    fetchNews();
  }

  Future<void> fetchNews() async {
    Data4 newsClass4 = Data4();
    await newsClass4.getData();
    allarticles4 = newsClass4.articles4;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Container(
            height: 300,
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: new AlwaysStoppedAnimation<Color>(down),
              ),
            ),
          )
        : ListView.builder(
            itemCount: allarticles4.length,
            itemBuilder: (context, index) {
              return Tile(
                img: allarticles4[index].img,
                head: allarticles4[index].head,
                des: allarticles4[index].url,
              );
            });
  }
}

class Science extends StatefulWidget {
  @override
  _ScienceState createState() => _ScienceState();
}

class _ScienceState extends State<Science> {
  final bgColor = const Color(0xFFffffff);
  final txtColor = const Color(0xFF171717);
  final up = const Color(0xFFff416c);
  final down = const Color(0xFFff4b2b);
  var allarticles4 = [];
  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = true;
    fetchNews();
  }

  Future<void> fetchNews() async {
    Data5 newsClass4 = Data5();
    await newsClass4.getData();
    allarticles4 = newsClass4.articles4;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Container(
            height: 300,
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: new AlwaysStoppedAnimation<Color>(down),
              ),
            ),
          )
        : ListView.builder(
            itemCount: allarticles4.length,
            itemBuilder: (context, index) {
              return Tile(
                img: allarticles4[index].img,
                head: allarticles4[index].head,
                des: allarticles4[index].url,
              );
            });
  }
}
