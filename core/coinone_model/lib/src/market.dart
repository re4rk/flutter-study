class Market{
    Market({
        required this.quoteCurrency,
        required this.targetCurrency,
        required this.priceUnit,
        required this.qtyUnit,
        required this.maxOrderAmount,
        required this.maxPrice,
        required this.maxQty,
        required this.minOrderAmount,
        required this.minPrice,
        required this.minQty,
        required this.orderBookUnits,
        required this.maintenanceStatus,
        required this.tradeStatus,
        required this.orderTypes,
    });

    String quoteCurrency;
    String targetCurrency;
    double priceUnit;
    double qtyUnit;
    double maxOrderAmount;
    double maxPrice;
    double maxQty;
    double minOrderAmount;
    double minPrice;
    double minQty;
    List<double> orderBookUnits;
    int maintenanceStatus;
    int tradeStatus;
    List<String> orderTypes;

    factory Market.fromJson(Map<String, dynamic> json) => Market(
        quoteCurrency: json["quote_currency"],
        targetCurrency: json["target_currency"],
        priceUnit: double.parse(json["price_unit"]),
        qtyUnit: double.parse(json["qty_unit"]),
        maxOrderAmount: double.parse(json["max_order_amount"]),
        maxPrice: double.parse(json["max_price"]),
        maxQty: double.parse(json["max_qty"]),
        minOrderAmount: double.parse(json["min_order_amount"]),
        minPrice: double.parse(json["min_price"]),
        minQty: double.parse(json["min_qty"]),
        orderBookUnits: List<double>.from(json["order_book_units"].map((x) => double.parse(x))),
        maintenanceStatus: json["maintenance_status"],
        tradeStatus: json["trade_status"],
        orderTypes: List<String>.from(json["order_types"].map((x) => x)),
    );
}
