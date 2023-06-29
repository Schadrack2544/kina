import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kina/screens/oneononechatscreen.dart';

import '../utils/generalDrawer.dart';

class FriendScreen extends StatefulWidget {
  const FriendScreen({super.key});

  @override
  State<FriendScreen> createState() => _FriendScreenState();
}

class _FriendScreenState extends State<FriendScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Map<String, dynamic>> friendList = [
    {
      "id": "1",
      "name": "John Doe",
      "email": "john.doe@gmail.com",
      "profile":
          "https://cdn.pixabay.com/photo/2018/02/21/08/40/woman-3169726_1280.jpg"
    },
    {
      "id": "2",
      "name": "Jane Doe",
      "email": "john.doe@gmail.com",
      "profile":
          "https://cdn.pixabay.com/photo/2015/07/09/00/29/woman-837156_1280.jpg"
    },
    {
      "id": "3",
      "name": "Kimberly Scott",
      "email": "john.doe@gmail.com",
      "profile":
          "https://cdn.pixabay.com/photo/2015/07/09/00/29/woman-837156_1280.jpg"
    },
    {
      "id": "4",
      "name": "Travis Noah",
      "email": "traviscott@gmail.com",
      "profile":
          "https://cdn.pixabay.com/photo/2015/07/09/00/29/woman-837156_1280.jpg"
    },
  ];

  List<Map<String, String>> suggestions = [
    {
      "id": "1",
      "name": "Kylian Mbappe",
      "email": "kylian.mbape@gmail.com",
      "profile":
          "https://cdn.pixabay.com/photo/2018/02/21/08/40/woman-3169726_1280.jpg"
    },
    {
      "id": "2",
      "name": "Justin Trudeau",
      "email": "canada.justin@gmail.com",
      "profile":
          "https://cdn.pixabay.com/photo/2015/07/09/00/29/woman-837156_1280.jpg"
    },
    {
      "id": "3",
      "name": "Devrick Kante",
      "email": "kante.devrick@gmail.com",
      "profile":
          "https://cdn.pixabay.com/photo/2015/06/22/08/40/child-817373_1280.jpg"
    },
    {
      "id": "4",
      "name": "Trevor Noah",
      "email": "traviscott@gmail.com",
      "profile":
          "https://cdn.pixabay.com/photo/2015/07/09/00/29/woman-837156_1280.jpg"
    },
    {
      "id": "5",
      "name": "Patrick Shmurda",
      "email": "p.shmurda@gmail.com",
      "profile":
          "https://cdn.pixabay.com/photo/2016/11/29/03/36/woman-1867093_1280.jpg"
    },
  ];
  List<Map<String, dynamic>> contacts = [
    {"name": "Umugwaneza Jacqueline", "phone": "0781234567"},
    {"name": "Abijuru Sandra", "phone": "0722098765"},
    {"name": "Munyana Raissa", "phone": "0735464612"},
    {"name": "Miguel de Cervantes", "phone": "0755787614"},
    {"name": "Rundolph Gregory", "phone": "0723644748"}
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.pink,
        title: const Text("Friends",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        elevation: 0.0,
        actions: const [],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              child: Text(
                "My Friends",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Tab(
              child: Text("My Contact"),
            ),
          ],
        ),
      ),
      drawer: const GeneralDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: [
          // My Friends Tab Content
          Expanded(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const SearchBar(
                  leading: Icon(Icons.search),
                  hintText: "Search games",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Suggested friends"),
                    TextButton(onPressed: () {}, child: const Text("View All"))
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: suggestions.length,
                      itemBuilder: (context, index) {
                        final su = suggestions[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Column(
                              children: [
                                CachedNetworkImage(imageUrl: su['profile']!),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(su['name']!),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.add_outlined))
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("My Friends"),
                    TextButton(onPressed: () {}, child: const Text("View All"))
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: friendList.length,
                      itemBuilder: (context, index) {
                        return Card(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      friendList[index]['profile']),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(friendList[index]['name']!),
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const OneOnOneChatScreen()));
                                },
                                icon: const Icon(Icons.message))
                          ],
                        ));
                      }),
                )
              ],
            ),
          ),
          // My Contacts Tab Content
          Expanded(
            child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text(contacts[index]['name']),
                        Text(contacts[index]['phone']),
                      ]));
                }),
          ),
        ],
      ),
    );
  }
}
