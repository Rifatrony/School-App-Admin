import 'package:flutter/material.dart';
import 'package:srmm/app/module/dashboard/model/bar_graph_model.dart';
import 'package:srmm/app/module/dashboard/model/graph_model.dart';

class BarGraphData {
  final data = [
    BarGraphModel(
      label: "Activity",
      color: Colors.amber,
      graph: [
        GraphModel(x: 0, y: 8),
        GraphModel(x: 1, y: 10),
        GraphModel(x: 2, y: 7),
        GraphModel(x: 3, y: 4),
        GraphModel(x: 4, y: 4),
        GraphModel(x: 5, y: 6),
      ],
    ),

    BarGraphModel(
      label: "Nutrition",
      color: Colors.pink.shade100,
      graph: [
        GraphModel(x: 0, y: 8),
        GraphModel(x: 1, y: 10),
        GraphModel(x: 2, y: 9),
        GraphModel(x: 3, y: 6),
        GraphModel(x: 4, y: 9),
        GraphModel(x: 5, y: 7),
      ],
    ),

    BarGraphModel(
      label: "Hydration Level",
      color: Colors.amber,
      graph: [
        GraphModel(x: 0, y: 7),
        GraphModel(x: 1, y: 10),
        GraphModel(x: 2, y: 7),
        GraphModel(x: 3, y: 4),
        GraphModel(x: 4, y: 4),
        GraphModel(x: 5, y: 10),
      ],
    ),
  ];

  final label = ['M', 'T', 'W', 'T', 'F', 'S'];
}