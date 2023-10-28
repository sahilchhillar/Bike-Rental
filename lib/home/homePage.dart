import 'package:bike_rental/home/destinationPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              centerTitle: true,
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.car_rental_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Rides",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )
                ],
              ),
            ),
            backgroundColor: Colors.black,
            body: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DestinationSearchBox(),
                SizedBox(height: 15),
                SearchLocationButton()
              ],
            )));
  }
}

class DestinationSearchBox extends StatefulWidget {
  const DestinationSearchBox({super.key});

  @override
  State<StatefulWidget> createState() => _DestinationSearchBox();
}

class _DestinationSearchBox extends State<DestinationSearchBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
      child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: 50,
          child: TextField(
            cursorColor: Colors.grey,
            obscureText: false,
            style: const TextStyle(fontSize: 15, color: Colors.white),
            decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 62, 62, 62),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                hintText: "Where to?",
                hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                )),
          )),
    );
  }
}

class SearchLocationButton extends StatelessWidget {
  const SearchLocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              foregroundColor: Colors.black,
              textStyle: const TextStyle(color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50))),
          onPressed: () {
            Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DestinationPage()));
          },
          child: const Center(
            child: Text("Submit"),
          )),
    );
  }
}
