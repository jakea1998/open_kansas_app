import 'package:open_kansas/models/opioid_model.dart';

///
/// Important!!!
/// For horizontal and vertical directions order is:
/// 1.oxycodone,
/// 2.hydrocodone,
/// 3.morphine (oral),
/// 4.hydromorphone (oral),
/// 5.fentanyl (iv),
/// 6.morphine (iv),
/// 7.hydromorphone (iv)
///

List<OpioidType> opioidTypes = [
  OpioidType(name: "Oxycodone", value: 0),
  OpioidType(name: "Hydrocodone", value: 1),
  OpioidType(name: "Morphine (Oral)", value: 2),
  OpioidType(name: "Hydromorphone (Oral)", value: 3),
  OpioidType(name: "Fentanyl (IV)", value: 4),
  OpioidType(name: "Morphine (IV)", value: 5),
  OpioidType(name: "Hydromorphone (IV)", value: 6)
];

List<List<double>> conversionTable = [
  [1.0,1.0,1.5,0.375,5.0,0.5,0.075],
  [1.0,1.0,1.5,0.375,5.0,0.5,0.075],
  [0.6667,0.6667,1.0,0.25,3.3,0.3334,0.05],
  [2.5,2.5,4.0,1.0,0.25,1.25,0.2],
  [0.2,0.2,0.3,0.075,1.0,0.1,0.015],
  [2.0,2.0,3.0,0.75,10.0,1.0,0.15],
  [10.0,10.0,15.0,4.0,50.0,6.6667,1.0],
];
