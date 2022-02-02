import 'dart:convert';

List<ReferenceGuides> referenceGuidesFromJson(String str) =>
    List<ReferenceGuides>.from(
        json.decode(str).map((x) => ReferenceGuides.fromJson(x)));

String referenceGuidesToJson(List<ReferenceGuides> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReferenceGuides {
  ReferenceGuides({
    this.id,
    this.correlative,
    this.emissionDate,
    this.transferDate,
    this.destinyStore,
    this.destinyAddress,
    this.originAddress,
    this.carrier,
    this.motive,
    this.status,
    this.cancelled,
    this.registeredAt,
    this.registeredByUser,
    this.updatedAt,
    this.updatedByUser,
  });

  int? id;
  String? correlative;
  String? emissionDate;
  String? transferDate;
  String? destinyStore;
  String? destinyAddress;
  String? originAddress;
  String? carrier;
  String? motive;
  String? status;
  bool? cancelled;
  String? registeredAt;
  String? registeredByUser;
  String? updatedAt;
  String? updatedByUser;

  factory ReferenceGuides.fromJson(Map<String, dynamic> json) =>
      ReferenceGuides(
        id: json["id"],
        correlative: json["correlative"],
        emissionDate: json["emissionDate"],
        transferDate: json["transferDate"],
        destinyStore: json["destinyStore"],
        destinyAddress: json["destinyAddress"],
        originAddress: json["originAddress"],
        carrier: json["carrier"],
        motive: json["motive"],
        status: json["status"],
        cancelled: json["cancelled"],
        registeredAt: json["registeredAt"],
        registeredByUser: json["registeredByUser"],
        updatedAt: json["updatedAt"],
        updatedByUser: json["updatedByUser"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "correlative": correlative,
        "emissionDate": emissionDate,
        "transferDate": transferDate,
        "destinyStore": destinyStore,
        "destinyAddress": destinyAddress,
        "originAddress": originAddress,
        "carrier": carrier,
        "motive": motive,
        "status": status,
        "cancelled": cancelled,
        "registeredAt": registeredAt,
        "registeredByUser": registeredByUser,
        "updatedAt": updatedAt,
        "updatedByUser": updatedByUser,
      };
}
