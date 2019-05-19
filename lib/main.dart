import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp',
      home: MyHomePage(title: 'Whatsapp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum popUp { group, setting,logout }

class _MyHomePageState extends State<MyHomePage> {
  // var choice = ['New Group','Setting','Logout'];
  popUp selection;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Chat App'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                tooltip: 'Search',
                onPressed: () {
                  print('Searched');
                },
              ),
              PopupMenuButton<popUp>(
                onSelected: (popUp result) {
                  setState(() {
                    selection = result;
                    debugPrint('select $selection');
                  });
                },
                itemBuilder: (BuildContext context)=><PopupMenuEntry<popUp>>[
                  const PopupMenuItem<popUp>(
                    value: popUp.group,
                    child: Text('New Group'),
                  ),

                  const PopupMenuItem<popUp>(
                    value: popUp.setting,
                    child: Text('Setting') ,
                  ),

                   const PopupMenuItem<popUp>(
                    value: popUp.logout,
                    child: Text('Logout') ,
                  )
                ],
              )
            ],
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: 'CHATS',
                ),
                Tab(
                  text: 'STATUS',
                ),
                Tab(
                  text: 'CALLS',
                )
              ],
            ),
            backgroundColor: Colors.green,
          ),
          body: TabBarView(
            children: <Widget>[
              getChatListView(),
              getStatusList(),
              getCallList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget getChatListView() {
    var chatList = ListView(
      children: <Widget>[
        ListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
              backgroundColor: Colors.green,
            ),
            title:
                Text('Number 2', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Hi Number 1. i have to tell..'),
            trailing: Text('14.00')),
        ListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
              backgroundColor: Colors.green,
            ),
            title:
                Text('Number 3', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Hi Number 1. i have to tell..'),
            trailing: Text('16.00')),
        ListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
              backgroundColor: Colors.green,
            ),
            title:
                Text('Number 4', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Hi Number 1. i have to tell..'),
            trailing: Text('18.00')),
        ListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
              backgroundColor: Colors.green,
            ),
            title:
                Text('Number 5', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Hi Number 1. i have to tell..'),
            trailing: Text('19.00'))
      ],
    );
    return chatList;
  }

  Widget getStatusList() {
    var statusList = ListView(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            child: Icon(
              Icons.photo_camera,
              color: Colors.white,
            ),
            backgroundColor: Colors.green,
          ),
          title:
              Text('My Status', style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('Today, 15:11'),
        ),
        Text(
          'Recent Updates',
          style: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              backgroundColor: Colors.white24),
        ),
        ListTile(
          leading: CircleAvatar(
            child: Icon(
              Icons.photo_camera,
              color: Colors.white,
            ),
            backgroundColor: Colors.green,
          ),
          title:
              Text('Number 2', style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('Today, 16:11'),
        ),
        ListTile(
          leading: CircleAvatar(
            child: Icon(
              Icons.photo_camera,
              color: Colors.white,
            ),
            backgroundColor: Colors.green,
          ),
          title:
              Text('Number 3', style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('Today, 17:30'),
        ),
      ],
    );

    return statusList;
  }

  Widget getCallList() {
    var callList = ListView(
      children: <Widget>[
        ListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
              backgroundColor: Colors.green,
            ),
            title:
                Text('Number 2', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Today, 13:45'),
            trailing: Icon(
              Icons.call,
              color: Colors.green,
            )),
        ListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
              backgroundColor: Colors.green,
            ),
            title:
                Text('Number 3', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Today, 14:35'),
            trailing: Icon(
              Icons.call,
              color: Colors.green,
            )),
        ListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
              backgroundColor: Colors.green,
            ),
            title:
                Text('Number 4', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Yesterday, 12.00'),
            trailing: Icon(
              Icons.call,
              color: Colors.green,
            )),
        ListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
              backgroundColor: Colors.green,
            ),
            title:
                Text('Number 5', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Yesterday, 09:00'),
            trailing: Icon(
              Icons.call,
              color: Colors.green,
            ))
      ],
    );
    return callList;
  }


  void showSnackBar(BuildContext context, popUp result){
    var snackBar = SnackBar(
      content: Text('selected $result'),
      action: SnackBarAction(
        label:'UNDO',
        onPressed: (){
          debugPrint('Performing dummy UNDO OPERATION');
        },
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}

