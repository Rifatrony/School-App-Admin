import 'package:flutter/material.dart';
import 'package:srmm/app/data/bar_graph_data.dart';
import 'package:srmm/app/module/dashboard/view/widget/custom_card.dart';
import 'package:srmm/app/utils/responsive.dart';

class BarGraphCard extends StatelessWidget {
  const BarGraphCard({super.key});

  @override
  Widget build(BuildContext context) {

    final barGraphData = BarGraphData();

    return GridView.builder(
      shrinkWrap: true,
      itemCount: barGraphData.data.length,
      physics: ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Responsive.isMobile(context) ? 1 : 3,
        crossAxisSpacing: 15,
        mainAxisSpacing: 12.0,
        childAspectRatio: 5/4,
      ),
      itemBuilder: (context, index){
        return CustomCard(
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  barGraphData.data[index].label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 12,),
            ],
          ),
        );
      },
    );
  }
}
