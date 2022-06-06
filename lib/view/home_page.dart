import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:infoskies/core/Api/dataModel.dart';
import 'package:infoskies/core/Api/http_services.dart';
import 'package:infoskies/core/constantwidgets/textwidget.dart';
import 'package:infoskies/view/location_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int activeIndex = 0;
final carouselController = CarouselController();
HttpServices httpServices = HttpServices();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    buildIndicator() {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          effect: ExpandingDotsEffect(
              activeDotColor: Theme.of(context).colorScheme.secondary,
              dotWidth: 8,
              dotHeight: 8),
          count: 6,
        ),
      );
    }

    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
              future: httpServices.getReq(),
              builder: (
                BuildContext context,
                AsyncSnapshot<List<DataModel?>?> snapshot,
              ) {
                if (snapshot.hasData) {
                  return CarouselSlider.builder(
                    carouselController: carouselController,
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      final data = snapshot.data![index];

                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                          child: SizedBox(
                            height: 600,
                            width: 350,
                            child: Image.network("${data!.urls!.full}",
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            }),
                          ),
                        ),
                      );
                    },
                    itemCount: 6,
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        setState(() {
                          activeIndex = index;
                        });
                      },
                      height: 400,
                      viewportFraction: 1,
                      enableInfiniteScroll: false,
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          buildIndicator(),
          const SizedBox(
            height: 70,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => const LocationScreen()));
              },
              child: const TextWidget(txt: "Next Screen"))
        ],
      ),
    ));
  }
}
