import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Shimmer.fromColors(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  child: Row(
                    children: [
                      CircleAvatar(),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 10,
                            width: 250,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 10,
                            width: 250,
                            color: Colors.white,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: 10,
          ),
          baseColor: Color.fromARGB(255, 95, 96, 97),
          highlightColor: Color.fromARGB(255, 183, 185, 188)),
    );
  }
}
