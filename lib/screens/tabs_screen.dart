import 'package:flutter/material.dart';


import './new_tasks_screen.dart';
import './finished_tasks_screen.dart';
import './account_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}



class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, dynamic>> bodyWidgets;
  void initState() {
      bodyWidgets = [
      {
        'page': FisnishedTasksScreen(),
        'title': 'Finished Tasks',
      },
      {
        'page': NewTasksScreen(),
        'title': 'ToDo List',
      },
      {
        'page': AccountScreen(),
        'title': 'Account',
      },
    ];
      super.initState();
    }



  int widgetIndex = 0;

  void selectPage(int index) {
      setState(() {
        widgetIndex = index;
      });
    }
  



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              bodyWidgets[widgetIndex]['title'],
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          body: bodyWidgets[widgetIndex]['page'],
          bottomNavigationBar: BottomNavigationBar(
            onTap: selectPage,
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.yellow,
            currentIndex: widgetIndex,
            backgroundColor: Theme.of(context).primaryColor,
            items: [
            BottomNavigationBarItem(icon: Icon(Icons.check_circle,color: Colors.yellow),title: Text("Finished"),),
            BottomNavigationBarItem(icon: Icon(Icons.check_circle_outline,color: Colors.yellow),title: Text("New"),),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle,color: Colors.yellow),title: Text("Account"),),
          ]),
        ));
  }
}
