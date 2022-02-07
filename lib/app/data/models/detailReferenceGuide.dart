// To parse this JSON data, do
//
//     final detailReferenceGuide = detailReferenceGuideFromJson(jsonString);

import 'dart:convert';

DetailReferenceGuide detailReferenceGuideFromJson(String str) =>
    DetailReferenceGuide.fromJson(json.decode(str));

String detailReferenceGuideToJson(DetailReferenceGuide data) =>
    json.encode(data.toJson());

class DetailReferenceGuide {
  DetailReferenceGuide({
    this.found,
    this.message,
    this.referralGuide,
  });

  bool? found;
  String? message;
  ReferralGuide? referralGuide;

  factory DetailReferenceGuide.fromJson(Map<String, dynamic> json) =>
      DetailReferenceGuide(
        found: json["found"],
        message: json["message"],
        referralGuide: ReferralGuide.fromJson(json["referralGuide"]),
      );

  Map<String, dynamic> toJson() => {
        "found": found,
        "message": message,
        "referralGuide": referralGuide?.toJson(),
      };
}

class ReferralGuide {
  ReferralGuide({
    this.consecutiveId,
    this.serie,
    this.originStoreId,
    this.originStore,
    this.originUbigeoId,
    this.originUbigeoCode,
    this.originUbigeoName,
    this.destinyStoreId,
    this.destinyUbigeoId,
    this.destinyUbigeoCode,
    this.destinyUbigeoName,
    this.carrierId,
    this.carrierDocumentNumber,
    this.carrierPlateNumber,
    this.packages,
    this.packagesWeight,
    this.packageUnitMeasureId,
    this.packageUnitMeasureCode,
    this.modality,
    this.motiveId,
    this.motiveDescription,
    this.motiveCode,
    this.portCode,
    this.containerNumber,
    this.scheduledTransfer,
    this.referenceDocumentId,
    this.referenceDocumentNumber,
    this.referenceDocumentCode,
    this.observations,
    this.statusElectronicDoc,
    this.rejectionMotives,
    this.pdfLink,
    this.qrLink,
    this.items,
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

  int? consecutiveId;
  String? serie;
  int? originStoreId;
  String? originStore;
  int? originUbigeoId;
  String? originUbigeoCode;
  String? originUbigeoName;
  int? destinyStoreId;
  int? destinyUbigeoId;
  String? destinyUbigeoCode;
  String? destinyUbigeoName;
  int? carrierId;
  String? carrierDocumentNumber;
  String? carrierPlateNumber;
  int? packages;
  int? packagesWeight;
  int? packageUnitMeasureId;
  String? packageUnitMeasureCode;
  String? modality;
  int? motiveId;
  String? motiveDescription;
  String? motiveCode;
  dynamic portCode;
  dynamic containerNumber;
  bool? scheduledTransfer;
  dynamic referenceDocumentId;
  dynamic referenceDocumentNumber;
  dynamic referenceDocumentCode;
  dynamic observations;
  String? statusElectronicDoc;
  dynamic rejectionMotives;
  dynamic pdfLink;
  dynamic qrLink;
  List<Item>? items;
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

  factory ReferralGuide.fromJson(Map<String, dynamic> json) => ReferralGuide(
        consecutiveId: json["consecutiveId"],
        serie: json["serie"],
        originStoreId: json["originStoreId"],
        originStore: json["originStore"],
        originUbigeoId: json["originUbigeoId"],
        originUbigeoCode: json["originUbigeoCode"],
        originUbigeoName: json["originUbigeoName"],
        destinyStoreId: json["destinyStoreId"],
        destinyUbigeoId: json["destinyUbigeoId"],
        destinyUbigeoCode: json["destinyUbigeoCode"],
        destinyUbigeoName: json["destinyUbigeoName"],
        carrierId: json["carrierId"],
        carrierDocumentNumber: json["carrierDocumentNumber"],
        carrierPlateNumber: json["carrierPlateNumber"],
        packages: json["packages"],
        packagesWeight: json["packagesWeight"],
        packageUnitMeasureId: json["packageUnitMeasureId"],
        packageUnitMeasureCode: json["packageUnitMeasureCode"],
        modality: json["modality"],
        motiveId: json["motiveId"],
        motiveDescription: json["motiveDescription"],
        motiveCode: json["motiveCode"],
        portCode: json["portCode"],
        containerNumber: json["containerNumber"],
        scheduledTransfer: json["scheduledTransfer"],
        referenceDocumentId: json["referenceDocumentId"],
        referenceDocumentNumber: json["referenceDocumentNumber"],
        referenceDocumentCode: json["referenceDocumentCode"],
        observations: json["observations"],
        statusElectronicDoc: json["statusElectronicDoc"],
        rejectionMotives: json["rejectionMotives"],
        pdfLink: json["pdfLink"],
        qrLink: json["qrLink"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
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
        "consecutiveId": consecutiveId,
        "serie": serie,
        "originStoreId": originStoreId,
        "originStore": originStore,
        "originUbigeoId": originUbigeoId,
        "originUbigeoCode": originUbigeoCode,
        "originUbigeoName": originUbigeoName,
        "destinyStoreId": destinyStoreId,
        "destinyUbigeoId": destinyUbigeoId,
        "destinyUbigeoCode": destinyUbigeoCode,
        "destinyUbigeoName": destinyUbigeoName,
        "carrierId": carrierId,
        "carrierDocumentNumber": carrierDocumentNumber,
        "carrierPlateNumber": carrierPlateNumber,
        "packages": packages,
        "packagesWeight": packagesWeight,
        "packageUnitMeasureId": packageUnitMeasureId,
        "packageUnitMeasureCode": packageUnitMeasureCode,
        "modality": modality,
        "motiveId": motiveId,
        "motiveDescription": motiveDescription,
        "motiveCode": motiveCode,
        "portCode": portCode,
        "containerNumber": containerNumber,
        "scheduledTransfer": scheduledTransfer,
        "referenceDocumentId": referenceDocumentId,
        "referenceDocumentNumber": referenceDocumentNumber,
        "referenceDocumentCode": referenceDocumentCode,
        "observations": observations,
        "statusElectronicDoc": statusElectronicDoc,
        "rejectionMotives": rejectionMotives,
        "pdfLink": pdfLink,
        "qrLink": qrLink,
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
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

class Item {
  Item({
    this.id,
    this.line,
    this.productId,
    this.sku,
    this.productName,
    this.productFamily,
    this.unitMeasureId,
    this.unitMeasure,
    this.unitMeasureCode,
    this.quantity,
    this.ostId,
    this.ostNumber,
  });

  int? id;
  int? line;
  int? productId;
  String? sku;
  String? productName;
  String? productFamily;
  int? unitMeasureId;
  String? unitMeasure;
  String? unitMeasureCode;
  int? quantity;
  int? ostId;
  String? ostNumber;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        line: json["line"],
        productId: json["productId"],
        sku: json["sku"],
        productName: json["productName"],
        productFamily: json["productFamily"],
        unitMeasureId: json["unitMeasureId"],
        unitMeasure: json["unitMeasure"],
        unitMeasureCode: json["unitMeasureCode"],
        quantity: json["quantity"],
        ostId: json["ostId"],
        ostNumber: json["ostNumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "line": line,
        "productId": productId,
        "sku": sku,
        "productName": productName,
        "productFamily": productFamily,
        "unitMeasureId": unitMeasureId,
        "unitMeasure": unitMeasure,
        "unitMeasureCode": unitMeasureCode,
        "quantity": quantity,
        "ostId": ostId,
        "ostNumber": ostNumber,
      };
}
