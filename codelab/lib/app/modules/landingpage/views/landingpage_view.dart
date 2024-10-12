import 'dart:ui';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:codelab/app/routes/app_pages.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:get/get.dart';
import 'navbarcoba.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ionicons/ionicons.dart';

class LandingpageView extends StatefulWidget {
  const LandingpageView({super.key});

  @override
  State<LandingpageView> createState() => _LandingpageViewState();
}

class _LandingpageViewState extends State<LandingpageView> {
  final List<String> imgList = ['assets/killjoy'];
  int visit = 0;
  double height = 30;
  Color color2 = const Color(0XFF96B1FD);
  Color bgColor = const Color(0XFF1752FE);
  List<TabItem> items = [
    const TabItem(
      icon: Icons.home,
      // title: 'Home',
    ),
    const TabItem(
      icon: Ionicons.logo_firebase,
      title: 'Bookmark  ',
    ),
    const TabItem(
      icon: Icons.settings,
      title: 'Setting',
    ),
  ];

  final List<Map<String, String>> bookfavorite = [
    {
      'image': 'assets/dummycover.jpg',
      'title': 'Book Title 1',
      'author': 'Author 1',
      'description': 'This is a description of Book 1.',
    },
    {
      'image': 'assets/dummycover.jpg',
      'title': 'Book Title 2',
      'author': 'Author 2',
      'description': 'This is a description of Book 2.',
    },
    {
      'image': 'assets/dummycover.jpg',
      'title': 'Book Title 3',
      'author': 'Author 3',
      'description': 'This is a description of Book 3.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: const Color.fromARGB(31, 77, 77, 77),
        elevation: 10,
        title: Text(
          'Terasaga',
          style: GoogleFonts.angkor(color: Color.fromARGB(255, 0, 34, 255)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: InkWell(
              onTap: () {
                Get.toNamed(Routes.PROFILE);
              },
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/reno.jpg'),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        // Wrap entire content in a scrollable view
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Selamat',
                  style: GoogleFonts.redressed(
                      fontSize: 35, color: Color.fromARGB(255, 0, 0, 255)),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Datang,',
                  style:
                      GoogleFonts.redressed(fontSize: 35, color: Colors.black),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 0), // Adjust padding as needed
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Pembaca Terasaga! Temukan cerita-cerita menarik yang siap membawa Anda ke dunia baru dan nikmati petualangan membaca tanpa batas.',
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 3,
                        blurRadius: 15,
                        offset: Offset(0, 9),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter text',
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 10,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color.fromARGB(255, 123, 191, 247),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    onPressed: () {},
                    child: const Icon(
                      Icons.navigation_sharp,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              child: const Text('Baru Nih!'),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 120,
                aspectRatio: 1,
                initialPage: 0,
                viewportFraction: 0.3,
                enableInfiniteScroll: true,
              ),
              items: [
                'assets/dummycover.jpg',
              ].map((imagePath) {
                return SizedBox(
                  width: 100, // Set width to smaller size for each image
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const SizedBox.shrink(),
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Color.fromARGB(230, 0, 0, 0),
                                  Color.fromARGB(150, 0, 0, 0),
                                  Color.fromARGB(0, 255, 255, 255),
                                ],
                                stops: [0.0, 0.13, 0.39],
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                            bottom: 7,
                            left: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'data',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  'data',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              child: const Text('Cerita Terpopuler'),
            ),
            SizedBox(
              height: 400, // Adjust the height to fit content
              child: ListView.builder(
                itemCount: bookfavorite.length,
                itemBuilder: (context, index) {
                  final book = bookfavorite[index];
                  return GestureDetector(
                    onTap: () {
                      // Aksi yang dilakukan ketika item list ditekan
                      print('Book tapped!');
                      Get.toNamed(Routes.BACA);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Book Image (di sisi kiri)
                          Container(
                            width: 60,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(book['image']!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                              width: 10), // Spasi antara gambar dan detail buku

                          // Book Details (di tengah) dan Bookmark Icon (di ujung kanan dalam Expanded)
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Detail Buku
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Book Title
                                      Text(
                                        book['title']!,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      // Author Name
                                      Text(
                                        'by ${book['author']}',
                                        style: const TextStyle(
                                          fontSize: 10,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      // Book Description
                                      Text(
                                        book['description']!,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.black87,
                                        ),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                // Icon Bookmark di sisi kanan
                                IconButton(
                                  onPressed: () {
                                    // Aksi untuk tombol bookmark
                                  },
                                  icon: const Icon(Ionicons.bookmark_outline),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBarInspiredOutside(
        items: items,
        backgroundColor: bgColor,
        color: color2,
        colorSelected: Colors.white,
        indexSelected: visit,
        onTap: (int index) => setState(() {
          visit = index;
        }),
        top: -28,
        animated: false,
        itemStyle: ItemStyle.circle,
        chipStyle: const ChipStyle(notchSmoothness: NotchSmoothness.sharpEdge),
      ),
    );
  }
}
