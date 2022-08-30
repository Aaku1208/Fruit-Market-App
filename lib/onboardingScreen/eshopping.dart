import 'package:flutter/material.dart';
import 'package:fruit_market2/onboardingScreen/slidermodel.dart';
import '../Colors/color.dart';
import '../StartingPage/verificationpage.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<SliderModel> slides = <SliderModel>[];
  int currentIndex = 0;
  PageController _pageViewcontroller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _pageViewcontroller = PageController(initialPage: 0);
    slides = getSlides();
  }
  @override
  void dispose(){
    _pageViewcontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: _pageViewcontroller,
                scrollDirection: Axis.horizontal,
                onPageChanged: (value){
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemCount: slides.length,
                itemBuilder: (context, index){
                  // contents of slider
                  return Slider(
                    text: slides[index].getText(),
                    image: slides[index].getImage(),
                    title: slides[index].getTitle(),
                    description: slides[index].getDescription(),

                  );
                }
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(slides.length, (index) => buildDot(index, context),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(30),
            child: MaterialButton(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
              elevation: 5,
              minWidth: 120,
              height: 42,
              color: myColor,
              onPressed: (){
                if(currentIndex == slides.length - 1){

                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const VerificationPage()));
                }
                _pageViewcontroller.nextPage(duration: const Duration(milliseconds: 1000), curve: Curves.fastOutSlowIn);
              },
              child: Text(
                  currentIndex == slides.length - 1 ? "Get Started": "Next",
                  style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

// container created for dots
  Container buildDot(int index, BuildContext context){
    return Container(
      height: 10,
      width: currentIndex == index ? 20 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color:  const Color(0xff69A03A),
      ),
    );
  }
}


// slider declared
class Slider extends StatelessWidget {
  String text;
  String image;
  String title;
  String description;
  Slider({Key? key,
    required this.text, required this.image, required this.title, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizeheight = MediaQuery.of(context).size.height;
    double sizewidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const VerificationPage()));
          },
          child: Container(
            padding: const EdgeInsets.all(45),
            margin: EdgeInsets.only(left: sizewidth*0.65,top: sizeheight*0.03),
            child: const Text("Skip",style: TextStyle(color: Colors.grey)),
          ),
        ),
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Image(image: AssetImage(image)),
            ),
            const SizedBox(height: 30),
            Column(
              children: [
                Text(title, style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text(description, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}


