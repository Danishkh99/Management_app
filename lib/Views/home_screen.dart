import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:management_app/Views/new_task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List imageList = ["assets/samosa.png", "assets/car.png"];
  List titleList = ["Aftaari Items", "Honda City Fixes"];
  bool _isButton1Pressed = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff202635),
      appBar: AppBar(
        title: const Text('Schedule'),
        leading: const Icon(Icons.drag_handle),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: size.height * 0.1,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NewTask()));
        },
        child: Icon(
          Icons.add,
          color: const Color(0xff202635),
          size: 30,
        ), //icon inside button
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomAppBar(
          height: size.height * 0.08,
          //bottom navigation bar on scaffold
          color: const Color(0xff292F3F).withOpacity(0.5),
          shape: CircularNotchedRectangle(), //shape of notch
          notchMargin:
              5, //notche margin between floating button and bottom appbar
          child: Row(
            //children inside bottom appbar
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.002,
            ),
            const Text(
              "Hi Sahibzada.",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 28,
                  color: Colors.white),
            ),
            const Text(
              "Good Morning",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 180.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.all(10.0),
                    width: 210.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage(imageList[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        titleList[index],
                        style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isButton1Pressed = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _isButton1Pressed ? Color(0xff202635) : Colors.white,
                      // onPrimary: Colors.black,
                      fixedSize: const Size(165, 55),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      'Task List',
                      style: TextStyle(
                        color: !_isButton1Pressed ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isButton1Pressed = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          !_isButton1Pressed ? Color(0xff202635) : Colors.white,
                      // onPrimary: Colors.black,
                      fixedSize: Size(165, 55),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      'Completed',
                      style: TextStyle(
                        color: _isButton1Pressed ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: size.height / 3,
              padding: EdgeInsets.all(10),
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
                itemCount: 3,
                padding: EdgeInsets.all(5),
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.all(5),
                    tileColor: const Color(0xff292F3F).withOpacity(0.5),
                    leading: Icon(
                      Icons.ac_unit,
                      color: Colors.redAccent,
                    ),
                    title: Text(
                      "Project Meeting",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    subtitle: Text(
                      "9am to 5pm",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    trailing: PopupMenuButton(
                      color: Colors.white,
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: "edit",
                          child: Text("Edit"),
                        ),
                        PopupMenuItem(
                          value: "delete",
                          child: Text("Delete"),
                        ),
                      ],
                      onSelected: (value) {},
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
