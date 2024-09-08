class SampleData {
  SampleData({
    this.customerEstimateFlow,
  });

  final List<CustomerEstimateFlow>? customerEstimateFlow;

  factory SampleData.fromJson(Map<String, dynamic> json) {
    return SampleData(
      customerEstimateFlow: json["Customer_Estimate_Flow"] == null
          ? []
          : List<CustomerEstimateFlow>.from(json["Customer_Estimate_Flow"]!
              .map((x) => CustomerEstimateFlow.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "Customer_Estimate_Flow":
            customerEstimateFlow?.map((x) => x.toJson()).toList(),
      };
}

class CustomerEstimateFlow {
  CustomerEstimateFlow({
    this.estimateId,
    this.userId,
    this.movingFrom,
    this.movingTo,
    this.movingOn,
    this.distance,
    this.propertySize,
    this.oldFloorNo,
    this.newFloorNo,
    this.oldElevatorAvailability,
    this.newElevatorAvailability,
    this.oldParkingDistance,
    this.newParkingDistance,
    this.unpackingService,
    this.packingService,
    this.items,
    this.oldHouseAdditionalInfo,
    this.newHouseAdditionalInfo,
    this.totalItems,
    this.status,
    this.orderDate,
    this.dateCreated,
    this.dateOfComplete,
    this.dateOfCancel,
    this.estimateStatus,
    this.customStatus,
    this.estimateComparison,
    this.estimateAmount,
    this.successfulPayments,
    this.orderReviewed,
    this.callBack,
    this.moveDateFlexible,
    this.fromAddress,
    this.toAddress,
    this.serviceType,
    this.storageItems,
  });

  final String? estimateId;
  final String? userId;
  final String? movingFrom;
  final String? movingTo;
  final DateTime? movingOn;
  final String? distance;
  final String? propertySize;
  final String? oldFloorNo;
  final String? newFloorNo;
  final String? oldElevatorAvailability;
  final String? newElevatorAvailability;
  final String? oldParkingDistance;
  final String? newParkingDistance;
  final String? unpackingService;
  final String? packingService;
  final Items? items;
  final String? oldHouseAdditionalInfo;
  final String? newHouseAdditionalInfo;
  final String? totalItems;
  final String? status;
  final DateTime? orderDate;
  final DateTime? dateCreated;
  final dynamic dateOfComplete;
  final dynamic dateOfCancel;
  final String? estimateStatus;
  final String? customStatus;
  final dynamic estimateComparison;
  final dynamic estimateAmount;
  final List<dynamic>? successfulPayments;
  final String? orderReviewed;
  final String? callBack;
  final String? moveDateFlexible;
  final FromAddress? fromAddress;
  final ToAddress? toAddress;
  final String? serviceType;
  final dynamic storageItems;

  factory CustomerEstimateFlow.fromJson(Map<String, dynamic> json) {
    return CustomerEstimateFlow(
      estimateId: json["estimate_id"],
      userId: json["user_id"],
      movingFrom: json["moving_from"],
      movingTo: json["moving_to"],
      movingOn: DateTime.tryParse(json["moving_on"] ?? ""),
      distance: json["distance"],
      propertySize: json["property_size"],
      oldFloorNo: json["old_floor_no"],
      newFloorNo: json["new_floor_no"],
      oldElevatorAvailability: json["old_elevator_availability"],
      newElevatorAvailability: json["new_elevator_availability"],
      oldParkingDistance: json["old_parking_distance"],
      newParkingDistance: json["new_parking_distance"],
      unpackingService: json["unpacking_service"],
      packingService: json["packing_service"],
      items: json["items"] == null ? null : Items.fromJson(json["items"]),
      oldHouseAdditionalInfo: json["old_house_additional_info"],
      newHouseAdditionalInfo: json["new_house_additional_info"],
      totalItems: json["total_items"],
      status: json["status"],
      orderDate: DateTime.tryParse(json["order_date"] ?? ""),
      dateCreated: DateTime.tryParse(json["date_created"] ?? ""),
      dateOfComplete: json["date_of_complete"],
      dateOfCancel: json["date_of_cancel"],
      estimateStatus: json["estimate_status"],
      customStatus: json["custom_status"],
      estimateComparison: json["estimate_comparison"],
      estimateAmount: json["estimateAmount"],
      successfulPayments: json["successfulPayments"] == null
          ? []
          : List<dynamic>.from(json["successfulPayments"]!.map((x) => x)),
      orderReviewed: json["order_reviewed"],
      callBack: json["call_back"],
      moveDateFlexible: json["move_date_flexible"],
      fromAddress: json["from_address"] == null
          ? null
          : FromAddress.fromJson(json["from_address"]),
      toAddress: json["to_address"] == null
          ? null
          : ToAddress.fromJson(json["to_address"]),
      serviceType: json["service_type"],
      storageItems: json["storage_items"],
    );
  }

  Map<String, dynamic> toJson() => {
        "estimate_id": estimateId,
        "user_id": userId,
        "moving_from": movingFrom,
        "moving_to": movingTo,
        "moving_on": movingOn?.toIso8601String(),
        "distance": distance,
        "property_size": propertySize,
        "old_floor_no": oldFloorNo,
        "new_floor_no": newFloorNo,
        "old_elevator_availability": oldElevatorAvailability,
        "new_elevator_availability": newElevatorAvailability,
        "old_parking_distance": oldParkingDistance,
        "new_parking_distance": newParkingDistance,
        "unpacking_service": unpackingService,
        "packing_service": packingService,
        "items": items?.toJson(),
        "old_house_additional_info": oldHouseAdditionalInfo,
        "new_house_additional_info": newHouseAdditionalInfo,
        "total_items": totalItems,
        "status": status,
        "order_date": orderDate?.toIso8601String(),
        "date_created": dateCreated?.toIso8601String(),
        "date_of_complete": dateOfComplete,
        "date_of_cancel": dateOfCancel,
        "estimate_status": estimateStatus,
        "custom_status": customStatus,
        "estimate_comparison": estimateComparison,
        "estimateAmount": estimateAmount,
        "successfulPayments": successfulPayments?.map((x) => x).toList(),
        "order_reviewed": orderReviewed,
        "call_back": callBack,
        "move_date_flexible": moveDateFlexible,
        "from_address": fromAddress?.toJson(),
        "to_address": toAddress?.toJson(),
        "service_type": serviceType,
        "storage_items": storageItems,
      };
}

class FromAddress {
  FromAddress({
    this.firstName,
    this.lastName,
    this.fromAddress,
    this.fromLocality,
    this.fromCity,
    this.fromState,
    this.pincode,
  });

  final String? firstName;
  final String? lastName;
  final String? fromAddress;
  final String? fromLocality;
  final String? fromCity;
  final String? fromState;
  final String? pincode;

  factory FromAddress.fromJson(Map<String, dynamic> json) {
    return FromAddress(
      firstName: json["firstName"],
      lastName: json["lastName"],
      fromAddress: json["fromAddress"],
      fromLocality: json["fromLocality"],
      fromCity: json["fromCity"],
      fromState: json["fromState"],
      pincode: json["pincode"],
    );
  }

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "fromAddress": fromAddress,
        "fromLocality": fromLocality,
        "fromCity": fromCity,
        "fromState": fromState,
        "pincode": pincode,
      };
}

class Items {
  Items({
    this.inventory,
    this.customItems,
  });

  final List<Inventory> ?inventory;
  final CustomItems? customItems;

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
      inventory: json["inventory"] == null
          ? []
          : List<Inventory>.from(
              json["inventory"]!.map((x) => Inventory.fromJson(x))),
      customItems: json["customItems"] == null
          ? null
          : CustomItems.fromJson(json["customItems"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "inventory": inventory?.map((x) => x.toJson()).toList(),
        "customItems": customItems?.toJson(),
      };
}

class CustomItems {
  CustomItems({
    this.units,
    this.items,
  });

  final String? units;
  final List<CustomItemsItem>? items;

  factory CustomItems.fromJson(Map<String, dynamic> json) {
    return CustomItems(
      units: json["units"],
      items: json["items"] == null
          ? []
          : List<CustomItemsItem>.from(
              json["items"]!.map((x) => CustomItemsItem.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "units": units,
        "items": items?.map((x) => x.toJson()).toList(),
      };
}

class CustomItemsItem {
  CustomItemsItem({
    this.id,
    this.itemHeight,
    this.itemLength,
    this.itemQty,
    this.itemWidth,
    this.itemDescription,
    this.itemName,
  });

  final String? id;
  final String? itemHeight;
  final String? itemLength;
  final String? itemQty;
  final String? itemWidth;
  final String? itemDescription;
  final String? itemName;

  factory CustomItemsItem.fromJson(Map<String, dynamic> json) {
    return CustomItemsItem(
      id: json["id"],
      itemHeight: json["item_height"],
      itemLength: json["item_length"],
      itemQty: json["item_qty"],
      itemWidth: json["item_width"],
      itemDescription: json["item_description"],
      itemName: json["item_name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "item_height": itemHeight,
        "item_length": itemLength,
        "item_qty": itemQty,
        "item_width": itemWidth,
        "item_description": itemDescription,
        "item_name": itemName,
      };
}

class Inventory {
  Inventory({
    this.id,
    this.order,
    this.name,
    this.displayName,
    this.category,
  });

  final String? id;
  final int? order;
  final String? name;
  final String? displayName;
  final List<Category>? category;

  factory Inventory.fromJson(Map<String, dynamic> json) {
    return Inventory(
      id: json["id"],
      order: json["order"],
      name: json["name"],
      displayName: json["displayName"],
      category: json["category"] == null
          ? []
          : List<Category>.from(
              json["category"]!.map((x) => Category.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "order": order,
        "name": name,
        "displayName": displayName,
        "category": category?.map((x) => x.toJson()).toList(),
      };
}

class Category {
  Category({
    this.id,
    this.order,
    this.name,
    this.displayName,
    this.items,
  });

  final String? id;
  final int? order;
  final String? name;
  final String? displayName;
  final List<ChildItemElement>? items;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      order: json["order "],
      name: json["name"],
      displayName: json["displayName"],
      items: json["items"] == null
          ? []
          : List<ChildItemElement>.from(
              json["items"]!.map((x) => ChildItemElement.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "order ": order,
        "name": name,
        "displayName": displayName,
        "items": items?.map((x) => x.toJson()).toList(),
      };
}

class ChildItemElement {
  ChildItemElement({
    this.size,
    this.childItems,
    this.typeOptions,
    this.meta,
    this.uniquieId,
    this.name,
    this.displayName,
    this.order,
    this.nameOld,
    this.qty,
    this.type,
    this.id,
  });

  final List<Size>? size;
  final List<ChildItemElement> ? childItems;
  final String? typeOptions;
  final Meta? meta;
  final int? uniquieId;
  final String? name;
  final String? displayName;
  final int? order;
  final String? nameOld;
  final int? qty;
  final List<Type>? type;
  final String? id;

  factory ChildItemElement.fromJson(Map<String, dynamic> json) {
    return ChildItemElement(
      size: json["size"] == null
          ? []
          : List<Size>.from(json["size"]!.map((x) => Size.fromJson(x))),
      childItems: json["childItems"] == null
          ? []
          : List<ChildItemElement>.from(
              json["childItems"]!.map((x) => ChildItemElement.fromJson(x))),
      typeOptions: json["typeOptions"],
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      uniquieId: json["uniquieId"],
      name: json["name"],
      displayName: json["displayName"],
      order: json["order"],
      nameOld: json["name_old"],
      qty: json["qty"],
      type: json["type"] == null
          ? []
          : List<Type>.from(json["type"]!.map((x) => Type.fromJson(x))),
      id: json["id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "size": size?.map((x) => x.toJson()).toList(),
        "childItems": childItems?.map((x) => x.toJson()).toList(),
        "typeOptions": typeOptions,
        "meta": meta?.toJson(),
        "uniquieId": uniquieId,
        "name": name,
        "displayName": displayName,
        "order": order,
        "name_old": nameOld,
        "qty": qty,
        "type": type?.map((x) => x.toJson()).toList(),
        "id": id,
      };
}

class Meta {
  Meta({
    this.hasType,
    this.selectType,
    this.hasVariation,
    this.hasSize,
  });

  final bool? hasType;
  final String? selectType;
  final bool? hasVariation;
  final bool? hasSize;

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      hasType: json["hasType"],
      selectType: json["selectType"],
      hasVariation: json["hasVariation"],
      hasSize: json["hasSize"],
    );
  }

  Map<String, dynamic> toJson() => {
        "hasType": hasType,
        "selectType": selectType,
        "hasVariation": hasVariation,
        "hasSize": hasSize,
      };
}

class Size {
  Size({
    this.option,
    this.tooltip,
    this.selected,
  });

  final String? option;
  final String? tooltip;
  final bool? selected;

  factory Size.fromJson(Map<String, dynamic> json) {
    return Size(
      option: json["option"],
      tooltip: json["tooltip"],
      selected: json["selected"],
    );
  }

  Map<String, dynamic> toJson() => {
        "option": option,
        "tooltip": tooltip,
        "selected": selected,
      };
}

class Type {
  Type({
    this.id,
    this.option,
    this.selected,
  });

  final String? id;
  final String? option;
  final bool? selected;

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(
      id: json["id"],
      option: json["option"],
      selected: json["selected"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "option": option,
        "selected": selected,
      };
}

class ToAddress {
  ToAddress({
    this.firstName,
    this.lastName,
    this.toAddress,
    this.toLocality,
    this.toCity,
    this.toState,
    this.pincode,
  });

  final String? firstName;
  final String? lastName;
  final String? toAddress;
  final String? toLocality;
  final String? toCity;
  final String? toState;
  final String? pincode;

  factory ToAddress.fromJson(Map<String, dynamic> json) {
    return ToAddress(
      firstName: json["firstName"],
      lastName: json["lastName"],
      toAddress: json["toAddress"],
      toLocality: json["toLocality"],
      toCity: json["toCity"],
      toState: json["toState"],
      pincode: json["pincode"],
    );
  }

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "toAddress": toAddress,
        "toLocality": toLocality,
        "toCity": toCity,
        "toState": toState,
        "pincode": pincode,
      };
}
