import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kina/screens/joingamescreen.dart';

import '../utils/generalDrawer.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // CalendarController _calendarController;
  final List<Map<String, dynamic>> dataList = [
    {
      'image':
          'https://cdn.pixabay.com/photo/2014/10/14/20/24/soccer-488700_1280.jpg',
      'price': '\$50',
      'location': 'Kigali Arena',
      'number_of_people': 3,
      'maximum_number_of_people': 10,
      'time_to_occur': '9:00 AM',
      'distance': '2.5 miles',
    },
    {
      'image':
          'https://cdn.pixabay.com/photo/2022/03/08/15/44/boy-7056003_1280.jpg',
      'price': '\$20',
      'location': 'Nyamirambo Rafiki',
      'number_of_people': 2,
      'maximum_number_of_people': 10,
      'time_to_occur': '2:30 PM',
      'distance': '1.2 miles',
    },
    // Add more elements here...
  ];

  @override
  void initState() {
    super.initState();
    // _calendarController = CalendarController();
  }

  @override
  void dispose() {
    // _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        title: const Text("Open Games",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        elevation: 0.0,
        actions: const [],
      ),
      drawer: const GeneralDrawer(),
      body: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            final item = dataList[index];
            return Card(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: item['image'],
                  placeholder:(context,url)=>const CircularProgressIndicator(value:null,color: Colors.pink,),
                ),
                Text('Price: ${item['price']}'),
                Text('Location: ${item['location']}'),
                Text('Number of People: ${item['number_of_people']}'),
                Text(
                    'Max Number of People: ${item['maximum_number_of_people']}'),
                Text('Time to Occur: ${item['time_to_occur']}'),
                Text('Distance: ${item['distance']}'),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const JoinGameScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20.0), // Change the border radius here
                      ),
                    ),
                    child: const Text("Join"),
                  ),
                )
              ],
            ));
            // return ListTile(
            //     leading: Image.network(
            //       item['image'],
            //       width: 80,
            //       height: 80,
            //       fit: BoxFit.cover,
            //     ),
            //     title: Text('Price: ${item['price']}'),
            //     subtitle: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text('Location: ${item['location']}'),
            //         Text(
            //             'Number of People: ${item['number_of_people']}'),
            //         Text(
            //             'Max Number of People: ${item['maximum_number_of_people']}'),
            //         Text('Time to Occur: ${item['time_to_occur']}'),
            //         Text('Distance: ${item['distance']}'),
            //         ElevatedButton(onPressed: (){

            //         }, child:const Text("Join"))
            //       ],
            //     )
            //     );
          }),
    );
  }
}
