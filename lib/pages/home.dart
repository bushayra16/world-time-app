import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {}; // declare an empty Map object therefore it cannot be null

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    //set background
   
    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor = data['isDaytime'] ? Colors.white : Colors.black;

    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/$bgImage'), fit: BoxFit.cover),
              ),
              child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 120.0, 0, 0),
                  child: Column(
                    children: <Widget>[
                      TextButton.icon(
                        onPressed: () async {
                          dynamic result =
                              await Navigator.pushNamed(context, '/location');
                          setState(() {
                            data = {
                              'time': result['time'],
                              'location': result['location'],
                              'flag': result['flag'],
                              'isDaytime': result['isDaytime'],
                            };
                          });
                        },
                        icon: Icon(Icons.edit_location, color: Colors.white),
                        label: Text(
                          'Edit Location',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: (MainAxisAlignment.center),
                        children: [
                          Text(
                            data['location'],
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.white,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        child: Text(
                          data['time'],
                          style: TextStyle(
                            fontSize: 50.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ))),
        ));
  }
}
