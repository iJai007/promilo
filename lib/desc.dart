import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:share_plus/share_plus.dart';

class Desc extends StatefulWidget {
  const Desc({super.key});

  @override
  State<Desc> createState() => _DescState();
}

class _DescState extends State<Desc> {
  final CarouselController _controller = CarouselController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: const Text('Description'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Card(
            color: Colors.grey,
            child: Column(
              children: [
                Stack(alignment: Alignment.bottomCenter, children: [
                  CarouselSlider.builder(
                    itemCount: 3,
                    itemBuilder: (context, index, realIndex) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/getty_473909426_129584.jpg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      );
                    },
                    options: CarouselOptions(
                      aspectRatio: 4 / 3,
                      viewportFraction: 1.0,
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
                          width: 15.0,
                          height: 15.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == index
                                ? Colors.white
                                : Colors.grey,
                          ),
                        ),
                      );
                    }),
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.download_rounded),
                      const SizedBox(width: 10),
                      const Icon(Icons.bookmark),
                      const SizedBox(width: 10),
                      const Icon(Icons.favorite),
                      const SizedBox(width: 10),
                      const Icon(Icons.fullscreen_rounded),
                      const SizedBox(width: 10),
                      const Icon(Icons.star),
                      const SizedBox(width: 10),
                      IconButton(
                        icon: const Icon(Icons.share),
                        onPressed: () {
                          Share.share('Check out this meetup!',
                              subject: 'Meetup Details');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.bookmark,
                  ),
                  Text('1035')
                ],
              ),
              Row(
                children: [Icon(Icons.favorite), Text('1035')],
              ),
              Card(
                color: Colors.grey,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.blue,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.blue,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.blue,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.blue,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '4.0',
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Actor Name',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 8.0),
            child: Text('Indian Actress', style: TextStyle(fontSize: 15)),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.timer),
                SizedBox(width: 10),
                Text('Duration 20 Mins'),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.account_balance_wallet_outlined),
                SizedBox(width: 10),
                Text('Total Average Fees ₹9,999'),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'About',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'From cardiovascular health to fitness, flexibility, balance, stress relief, better sleep, increased cognitive performance, and more, you can reap all of these benefits in just one session out on the waves. So, you may find yourself wondering what are the benefits of going on a surf camp.',
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(260, 8, 8, 8),
            child: InkWell(
              onTap: () {},
              child: const Text(
                'See More',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: const Color.fromARGB(255, 0, 42, 64),
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Prolet'),
          BottomNavigationBarItem(
              icon: Icon(Icons.handshake_outlined), label: 'Meetup'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Account'),
        ],
        currentIndex: 2,
        onTap: (index) {
          // Handle bottom navigation tap
        },
      ),
    );
  }
}
