import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomOrderShimmer extends StatelessWidget {
  const CustomOrderShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 15,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            height: 100,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.grey.shade200,
                    period: const Duration(milliseconds: 1000),
                    child: CircleAvatar(backgroundColor: Colors.grey.shade300, radius: 45)),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      buildShimmer(context),
                      buildShimmer(context),
                      Row(
                        children: [
                          const SizedBox(width: 50),
                          Expanded(child: buildShimmer(context)),
                          Expanded(child: buildShimmer(context)),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  Shimmer buildShimmer(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.grey.shade300,
      period: const Duration(milliseconds: 1000),
      child: Container(
        margin: const EdgeInsets.all(5),
        color: Colors.grey.shade300,
        height: 20,
        width: MediaQuery.sizeOf(context).width,
      ),
    );
  }
}
