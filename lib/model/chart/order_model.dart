class OrderModel {
  OrderModel({
    required this.xAxis,
    required this.yAxis,
  });

  final double xAxis;
  final double yAxis;

  static List<OrderModel> orderModel = <OrderModel>[
    OrderModel(xAxis: 10.00, yAxis: 9),
    OrderModel(xAxis: 11.00, yAxis: 8),
    OrderModel(xAxis: 12.00, yAxis: 10),
    OrderModel(xAxis: 13.00, yAxis: 7),
    OrderModel(xAxis: 14.00, yAxis: 5),
    OrderModel(xAxis: 15.00, yAxis: 0.0),
    OrderModel(xAxis: 16.00, yAxis: 0.0),
    OrderModel(xAxis: 17.00, yAxis: 0.0),
    OrderModel(xAxis: 18.00, yAxis: 0.0),
    OrderModel(xAxis: 19.00, yAxis: 0.0),
    OrderModel(xAxis: 20.00, yAxis: 0.0),
    OrderModel(xAxis: 21.00, yAxis: 0.0),
    OrderModel(xAxis: 22.00, yAxis: 0.0),
    OrderModel(xAxis: 23.00, yAxis: 0.0),
    OrderModel(xAxis: 24.00, yAxis: 0.0),
  ];
}
