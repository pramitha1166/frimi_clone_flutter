import 'package:flutter/material.dart';
import 'package:frimi_clone/application/screens/CardsAndAccounts.dart';
import 'package:frimi_clone/application/screens/DirectDebit.dart';
import 'package:frimi_clone/application/screens/Help.dart';
import 'package:frimi_clone/application/screens/Home.dart';
import 'package:frimi_clone/application/screens/LiveChat.dart';
import 'package:frimi_clone/application/screens/Settings.dart';
import 'package:frimi_clone/application/screens/Transaction.dart';
import 'package:frimi_clone/application/shared/app_colors.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);
//#1e1d1b
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  List menus = [
    {"icon": Icons.home, "name": "Home"},
    {"icon": Icons.history, "name": "Transaction History"},
    {"icon": Icons.credit_card, "name": "Cards and Accounts"},
    {"icon": Icons.money, "name": "Direct Debit"},
    {"icon": Icons.chat_bubble, "name": "Live Chat"},
    {"icon": Icons.help, "name": "Help"},
    {"icon": Icons.settings, "name": "Settings"},
    {"icon": Icons.logout, "name": "Logout"}
  ];

  int selected_index = 0;

  double value = 0;

  List<Widget> screens = [
    Home(),
    TransactionScreen(),
    CardsAndAccountsScreen(),
    DirectDebitScreen(),
    LiveChatScreen(),
    HelpScrren(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: primaryColor),
          ),
          SafeArea(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 300,
                    decoration: BoxDecoration(color: secondaryOrange),
                    child: DrawerHeader(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(
                              "https://png.pngtree.com/png-vector/20190704/ourlarge/pngtree-businessman-user-avatar-free-vector-png-image_1538405.jpg",
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Senanayake Wanigathne",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "FriMI ID: 23423234343",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: List.generate(menus.length, (index) {
                        return Container(
                          decoration: BoxDecoration(
                              color: selected_index == index
                                  ? Colors.grey[850]
                                  : primaryColor),
                          child: ListTile(
                            onTap: () {
                              setState(() {
                                selected_index = index;
                                value = 0;
                              });
                            },
                            leading: Icon(
                              menus[index]["icon"],
                              color: Colors.white,
                            ),
                            title: Text(
                              menus[index]["name"],
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
          ),
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: value),
            duration: Duration(microseconds: 500),
            builder: (_, double val, __) {
              return Transform(
                transform: Matrix4.identity()..setEntry(0, 3, 300 * val),
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: primaryColor,
                    leading: IconButton(
                      onPressed: () {
                        setState(() {
                          if (value == 0) {
                            value = 1;
                          } else {
                            value = 0;
                          }
                        });
                      },
                      icon: Icon(Icons.menu),
                    ),
                    actions: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.email)),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.notifications))
                    ],
                  ),
                  body: screens[selected_index],
                ),
              );
            },
          ),
          GestureDetector(
            onHorizontalDragUpdate: (e) {
              if (e.delta.dx < 1) {
                setState(() {
                  value = 0;
                });
              }
            },
          )
        ],
      ),
    );
  }
}
