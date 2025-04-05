class ProductModel {
  final int? id;
  final String? title;
  final String? description;
  final String? category;
  final double? price;
  final double? discountPercentage;
  final double? rating;
  final int? stock;
  final List<String>? tags;
  final String? brand;
  final String? sku;
  final int? weight;
  final Dimensions? dimensions;
  final String? warrantyInformation;
  final String? shippingInformation;
  final String? availabilityStatus;
  final List<Reviews>? reviews;
  final String? returnPolicy;
  final int? minimumOrderQuantity;
  final Meta? meta;
  final List<String>? images;
  final String? thumbnail;

  ProductModel({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] ?? 0,
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        category: json['category'] ?? '',
        price: json['price'] ?? 0.0,
        discountPercentage: json['discountPercentage'] ?? 0.0,
        rating: json['rating'] ?? 0.0,
        stock: json['stock'] ?? 0,
        tags: (json['tags'] as List<dynamic>?)?.cast<String>() ?? [],
        brand: json['brand'] ?? '',
        sku: json['sku'] ?? '',
        weight: json['weight'] ?? 0,
        dimensions: json['dimensions'] != null
            ? Dimensions.fromJson(json['dimensions'])
            : null,
        warrantyInformation: json['warrantyInformation'] ?? '',
        shippingInformation: json['shippingInformation'] ?? '',
        availabilityStatus: json['availabilityStatus'] ?? '',
        reviews: (json['reviews'] as List<dynamic>?)
                ?.map((e) => Reviews.fromJson(e))
                .toList() ??
            [],
        returnPolicy: json['returnPolicy'] ?? '',
        minimumOrderQuantity: json['minimumOrderQuantity'] ?? 0,
        meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
        images: (json['images'] as List<dynamic>?)?.cast<String>() ?? [],
        thumbnail: json['thumbnail'] ?? '',
      );
}

class Dimensions {
  final double? width;
  final double? height;
  final double? depth;

  Dimensions({
    this.width,
    this.height,
    this.depth,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        width: json['width'] ?? 0.0,
        height: json['height'] ?? 0.0,
        depth: json['depth'] ?? 0.0,
      );
}

class Reviews {
  final int? rating;
  final String? comment;
  final String? date;
  final String? reviewerName;
  final String? reviewerEmail;

  Reviews({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
        rating: json['rating'] ?? 0,
        comment: json['comment'] ?? '',
        date: json['date'] ?? '',
        reviewerName: json['reviewerName'] ?? '',
        reviewerEmail: json['reviewerEmail'] ?? '',
      );
}

class Meta {
  final String? createdAt;
  final String? updatedAt;
  final String? barcode;
  final String? qrCode;

  Meta({
    this.createdAt,
    this.updatedAt,
    this.barcode,
    this.qrCode,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        createdAt: json['createdAt'] ?? '',
        updatedAt: json['updatedAt'] ?? '',
        barcode: json['barcode'] ?? '',
        qrCode: json['qrCode'] ?? '',
      );
}
