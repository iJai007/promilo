import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:promilo/desc.dart';

class IndividualMeetupScreen extends StatefulWidget {
  const IndividualMeetupScreen({super.key});

  @override
  _IndividualMeetupScreenState createState() => _IndividualMeetupScreenState();
}

class _IndividualMeetupScreenState extends State<IndividualMeetupScreen> {
  final CarouselController _controller = CarouselController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: const Text('Individual Meetup'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              decoration: InputDecoration(
                  prefix: const Row(
                    children: [Icon(Icons.search_rounded), Text('Search')],
                  ),
                  suffixIcon: const Icon(Icons.mic),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
          CarouselSlider.builder(
            itemCount: 3,
            itemBuilder: (context, index, realIndex) {
              List<String> place = ['India', 'US', 'UK'];
              return Card(
                margin: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        'assets/images/getty_473909426_129584 (1).jpg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(158, 0, 0, 0),
                            Color.fromARGB(26, 0, 0, 0),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Popular Meetups',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'in ${place.elementAt(index)}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            options: CarouselOptions(
              aspectRatio: 18 / 9,
              viewportFraction: 1.0,
              scrollDirection: Axis.horizontal,
              padEnds: true,
              enableInfiniteScroll: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            carouselController: _controller,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(index),
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index ? Colors.amber : Colors.grey,
                  ),
                ),
              );
            }),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Trending Popular People',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 205,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  width: 275,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Card(
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    color: Colors.white,
                    elevation: 0,
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.account_circle_outlined,
                                size: 50,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Author',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('1,028 Meetups'),
                              ],
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: SizedBox(
                            height: 2,
                            width: 250,
                            child: ColoredBox(color: Colors.grey),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                width: 45,
                                height: 45,
                                decoration:
                                    const BoxDecoration(shape: BoxShape.circle),
                                clipBehavior: Clip.antiAlias,
                                child: Image.asset(
                                    scale: 30,
                                    fit: BoxFit.fill,
                                    'assets/images/entrevo-keypersonofinfluence-write-by-hand.jpg'),
                              ),
                              Container(
                                width: 45,
                                height: 45,
                                decoration:
                                    const BoxDecoration(shape: BoxShape.circle),
                                clipBehavior: Clip.antiAlias,
                                child: Image.asset(
                                    scale: 30,
                                    fit: BoxFit.fill,
                                    'assets/images/person-writing-letter-with-metal-quill.jpg'),
                              ),
                              Container(
                                width: 45,
                                height: 45,
                                decoration:
                                    const BoxDecoration(shape: BoxShape.circle),
                                clipBehavior: Clip.antiAlias,
                                child: Image.asset(
                                    scale: 30,
                                    fit: BoxFit.fill,
                                    'assets/images/entrevo-keypersonofinfluence-write-by-hand.jpg'),
                              ),
                              Container(
                                width: 45,
                                height: 45,
                                decoration:
                                    const BoxDecoration(shape: BoxShape.circle),
                                clipBehavior: Clip.antiAlias,
                                child: Image.asset(
                                    scale: 30,
                                    fit: BoxFit.fill,
                                    'assets/images/person-writing-letter-with-metal-quill.jpg'),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 125),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)))),
                              onPressed: () {},
                              child: const Text(
                                'See More',
                                style: TextStyle(fontSize: 15),
                              )),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Top Trending Meetups',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Desc(),
                          ));
                    },
                    child: Container(
                      height: 150,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                'assets/images/1200px-What_type_of_person_are_you_quiz_pic.png',
                                fit: BoxFit.fill,
                                //width: double.infinity,
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              color: Colors.white,
                              child: Text(
                                (index + 1).toString(),
                                style: const TextStyle(
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        backgroundColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(255, 0, 42, 64),
        selectedItemColor: Colors.blue,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Prolet'),
          BottomNavigationBarItem(
              icon: Icon(Icons.handshake_outlined), label: 'Meetup'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded), label: 'Account'),
        ],
        currentIndex: 2,
        onTap: (index) {
          // Handle bottom navigation tap
        },
      ),
    );
  }
}
