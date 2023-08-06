

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ConnectionStatus { connected, disconnected, busy,out }


class Header extends StatefulWidget implements PreferredSizeWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 200.0);
}

class _HeaderState extends State<Header> {
  ConnectionStatus _currentStatus = ConnectionStatus.connected;

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      toolbarHeight: 120.0,
      backgroundColor: Colors.black12,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Contacts',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Material(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(50.0),
            elevation: 10.0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Circular Avatar Image
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/ellipse.png'),
                  ),
                ),
                const SizedBox(width: 12.0,),
                Flexible(
                  //width: 15.0,
                  //height: 500.0,
                  child: DropdownButton<ConnectionStatus>(
                    padding: EdgeInsets.zero,
                    borderRadius: BorderRadius.circular(50.0),
                    value: _currentStatus,
                    onChanged: (ConnectionStatus? newValue) {
                      setState(() {
                        _currentStatus = newValue ?? ConnectionStatus.connected;
                      });
                    },
                    items: [
                      dropdownMenuItem(ConnectionStatus.connected,'assets/icons/greenflag.png'),
                      dropdownMenuItem(ConnectionStatus.disconnected,'assets/icons/greyflag.png'),
                      dropdownMenuItem(ConnectionStatus.busy,'assets/icons/orangeflag.png'),
                      dropdownMenuItem(ConnectionStatus.out,'assets/icons/blueflag.png'),

                    ],
                    icon: SizedBox(),
                    underline: SizedBox(),
                  ),
                ),
                const SizedBox(width: 12.0,),
                PopupMenuButton<Item>(
                  padding: EdgeInsets.zero,

                  icon: const Icon(Icons.more_vert),
                  onSelected: (item) {
                    // Handle the selected menu item here
                  },
                  itemBuilder: (context) => [
                    popupMenuItem(Item.newMessage,Icons.add_comment_outlined, 'New message'),
                    popupMenuItem(Item.deleteMessage,Icons.delete_outlined, 'Delete message'),
                    // Add more menu items as needed
                  ],
                  offset: Offset(0, 70), // Add space between the popup menu and the big container
                ),
              ],
            ),
          )

        ],
      ),
      bottom: PreferredSize(
        preferredSize:Size.fromHeight(60.0) ,
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search_outlined),
            hintText: 'Search',

          ),


        ),


      ),


    );
  }
  DropdownMenuItem<ConnectionStatus> dropdownMenuItem(ConnectionStatus status, String path) {
    return DropdownMenuItem<ConnectionStatus>(
      value: status,
      child: Image.asset(path,),
    );
  }

  PopupMenuEntry<Item> popupMenuItem(Item value,IconData icon, String title) {
    return PopupMenuItem<Item>(
      value: value,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(icon,color: Theme.of(context).primaryColor,) ,
        title:Text(title)//,style: Theme.of(context).textTheme.bodyMedium,),
      ),
    );
  }
 
}

enum Item {
  newMessage,
  deleteMessage
}