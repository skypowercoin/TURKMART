import 'dart:convert';

Product1Detail productDetailFromJson(String str) =>
    Product1Detail.fromJson(json.decode(str));

String productDetailToJson(Product1Detail data) => json.encode(data.toJson());

class Product1Detail {
  Product1Detail({
    required this.isSuccess,
    required this.statusCode,
    required this.error,
    required this.result,
    required this.headers,
  });

  final bool? isSuccess;
  final int? statusCode;
  final dynamic error;
  final Result? result;
  final Headers? headers;

  factory Product1Detail.fromJson(Map<String, dynamic> json) => Product1Detail(
        isSuccess: json["isSuccess"],
        statusCode: json["statusCode"],
        error: json["error"],
        result: Result.fromJson(json["result"]),
        headers: Headers.fromJson(json["headers"]),
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "statusCode": statusCode,
        "error": error,
        "result": result!.toJson(),
        "headers": headers!.toJson(),
      };
}

class Headers {
  Headers({
    required this.tysidecarcachable,
  });

  final String tysidecarcachable;

  factory Headers.fromJson(Map<String, dynamic> json) => Headers(
        tysidecarcachable: json["tysidecarcachable"],
      );

  Map<String, dynamic> toJson() => {
        "tysidecarcachable": tysidecarcachable,
      };
}

class Result {
  Result({
    required this.attributes,
    required this.selectedVasAttributes,
    required this.alternativeVariants,
    required this.variants,
    required this.otherMerchants,
    required this.campaign,
    required this.category,
    required this.brand,
    required this.color,
    required this.metaBrand,
    required this.showVariants,
    required this.showSexualContent,
    required this.brandCategoryBanners,
    required this.isThereAnyCorporateInvoiceInOtherMerchants,
    required this.token,
    required this.buyMorePayLessPromotions,
    required this.categoryTopRankings,
    required this.isVasEnabled,
    required this.originalCategory,
    required this.landings,
    required this.id,
    required this.productCode,
    required this.name,
    required this.nameWithProductCode,
    required this.description,
    required this.contentDescriptions,
    required this.productGroupId,
    required this.tax,
    required this.businessUnit,
    required this.maxInstallment,
    required this.gender,
    required this.webGender,
    required this.url,
    required this.images,
    required this.isSellable,
    required this.isBasketDiscount,
    required this.hasStock,
    required this.price,
    required this.isFreeCargo,
    required this.isLongTermDelivery,
    required this.promotions,
    required this.merchant,
    required this.deliveryInformation,
    required this.cargoRemainingDays,
    required this.isMarketplace,
    required this.productStamps,
    required this.hasHtmlContent,
    required this.favoriteCount,
    required this.uxLayout,
    required this.isDigitalGood,
    required this.isRunningOut,
    required this.scheduledDelivery,
    required this.ratingScore,
    required this.showStarredAttributes,
    required this.reviewsUrl,
    required this.questionsUrl,
    required this.sellerQuestionEnabled,
    required this.sizeChartUrl,
    required this.sizeExpectationAvailable,
    required this.rushDeliveryMerchantListingExist,
    required this.isRushDelivery,
    required this.lowerPriceMerchantListingExist,
    required this.showValidFlashSales,
    required this.showExpiredFlashSales,
    required this.isArtWork,
    required this.isBlacklist,
    required this.filterableLabels,
  });

  final List<Attribute> attributes;
  final List<dynamic> selectedVasAttributes;
  final List<dynamic> alternativeVariants;
  final List<Variant> variants;
  final List<dynamic> otherMerchants;
  final Campaign campaign;
  final Category category;
  final Brand brand;
  final String? color;
  final Brand metaBrand;
  final bool showVariants;
  final bool showSexualContent;
  final List<dynamic> brandCategoryBanners;
  final bool isThereAnyCorporateInvoiceInOtherMerchants;
  final String token;
  final List<dynamic> buyMorePayLessPromotions;
  final CategoryTopRankings? categoryTopRankings;
  final bool isVasEnabled;
  final Category originalCategory;
  final List<dynamic> landings;
  final int id;
  final String productCode;
  final String name;
  final String nameWithProductCode;
  final String description;
  final List<ContentDescription> contentDescriptions;
  final int productGroupId;
  final int tax;
  final String businessUnit;
  final int maxInstallment;
  final Gender? gender;
  final Gender? webGender;
  final String url;
  final List<String> images;
  final bool isSellable;
  final bool isBasketDiscount;
  final bool hasStock;
  final Price price;
  final bool isFreeCargo;
  final bool isLongTermDelivery;
  final List<Promotion> promotions;
  final Merchant merchant;
  final DeliveryInformation deliveryInformation;
  final int cargoRemainingDays;
  final bool isMarketplace;
  final List<dynamic> productStamps;
  final bool hasHtmlContent;
  final int favoriteCount;
  final String uxLayout;
  final bool isDigitalGood;
  final bool isRunningOut;
  final bool scheduledDelivery;
  final RatingScore? ratingScore;
  final bool showStarredAttributes;
  final String reviewsUrl;
  final String questionsUrl;
  final bool sellerQuestionEnabled;
  final String sizeChartUrl;
  final bool sizeExpectationAvailable;
  final bool rushDeliveryMerchantListingExist;
  final bool isRushDelivery;
  final bool lowerPriceMerchantListingExist;
  final bool showValidFlashSales;
  final bool showExpiredFlashSales;
  final bool isArtWork;
  final bool? isBlacklist;
  final List<FilterableLabel> filterableLabels;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        attributes: List<Attribute>.from(
            json["attributes"].map((x) => Attribute.fromJson(x))),
        selectedVasAttributes:
            List<dynamic>.from(json["selectedVasAttributes"].map((x) => x)),
        alternativeVariants:
            List<dynamic>.from(json["alternativeVariants"].map((x) => x)),
        variants: List<Variant>.from(
            json["variants"].map((x) => Variant.fromJson(x))),
        otherMerchants:
            List<dynamic>.from(json["otherMerchants"].map((x) => x)),
        campaign: Campaign.fromJson(json["campaign"]),
        category: Category.fromJson(json["category"]),
        brand: Brand.fromJson(json["brand"]),
        color: json["color"],
        metaBrand: Brand.fromJson(json["metaBrand"]),
        showVariants: json["showVariants"],
        showSexualContent: json["showSexualContent"],
        brandCategoryBanners:
            List<dynamic>.from(json["brandCategoryBanners"].map((x) => x)),
        isThereAnyCorporateInvoiceInOtherMerchants:
            json["isThereAnyCorporateInvoiceInOtherMerchants"],
        token: json["token"],
        buyMorePayLessPromotions:
            List<dynamic>.from(json["buyMorePayLessPromotions"].map((x) => x)),
        categoryTopRankings:
            CategoryTopRankings.fromJson(json["categoryTopRankings"] ?? {}),
        isVasEnabled: json["isVasEnabled"],
        originalCategory: Category.fromJson(json["originalCategory"]),
        landings: List<dynamic>.from(json["landings"].map((x) => x)),
        id: json["id"],
        productCode: json["productCode"],
        name: json["name"],
        nameWithProductCode: json["nameWithProductCode"],
        description: json["description"],
        contentDescriptions: List<ContentDescription>.from(
            json["contentDescriptions"]
                .map((x) => ContentDescription.fromJson(x))),
        productGroupId: json["productGroupId"],
        tax: json["tax"],
        businessUnit: json["businessUnit"],
        maxInstallment: json["maxInstallment"],
        gender: Gender.fromJson(json["gender"]),
        webGender: Gender.fromJson(json["webGender"]),
        url: json["url"],
        images: List<String>.from(json["images"].map((x) => x)),
        isSellable: json["isSellable"],
        isBasketDiscount: json["isBasketDiscount"],
        hasStock: json["hasStock"],
        price: Price.fromJson(json["price"]),
        isFreeCargo: json["isFreeCargo"],
        isLongTermDelivery: json["isLongTermDelivery"],
        promotions: List<Promotion>.from(
            json["promotions"].map((x) => Promotion.fromJson(x))),
        merchant: Merchant.fromJson(json["merchant"]),
        deliveryInformation:
            DeliveryInformation.fromJson(json["deliveryInformation"]),
        cargoRemainingDays: json["cargoRemainingDays"],
        isMarketplace: json["isMarketplace"],
        productStamps: List<dynamic>.from(json["productStamps"].map((x) => x)),
        hasHtmlContent: json["hasHtmlContent"],
        favoriteCount: json["favoriteCount"],
        uxLayout: json["uxLayout"],
        isDigitalGood: json["isDigitalGood"],
        isRunningOut: json["isRunningOut"],
        scheduledDelivery: json["scheduledDelivery"],
        ratingScore: RatingScore.fromJson(json["ratingScore"]),
        showStarredAttributes: json["showStarredAttributes"],
        reviewsUrl: json["reviewsUrl"],
        questionsUrl: json["questionsUrl"],
        sellerQuestionEnabled: json["sellerQuestionEnabled"],
        sizeChartUrl: json["sizeChartUrl"],
        sizeExpectationAvailable: json["sizeExpectationAvailable"],
        rushDeliveryMerchantListingExist:
            json["rushDeliveryMerchantListingExist"],
        isRushDelivery: json["isRushDelivery"],
        lowerPriceMerchantListingExist: json["lowerPriceMerchantListingExist"],
        showValidFlashSales: json["showValidFlashSales"],
        showExpiredFlashSales: json["showExpiredFlashSales"],
        isArtWork: json["isArtWork"],
        isBlacklist: json["isBlacklist"],
        filterableLabels: List<FilterableLabel>.from(
            json["filterableLabels"].map((x) => FilterableLabel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
        "selectedVasAttributes":
            List<dynamic>.from(selectedVasAttributes.map((x) => x)),
        "alternativeVariants":
            List<dynamic>.from(alternativeVariants.map((x) => x)),
        "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
        "otherMerchants": List<dynamic>.from(otherMerchants.map((x) => x)),
        "campaign": campaign.toJson(),
        "category": category.toJson(),
        "brand": brand.toJson(),
        "color": color,
        "metaBrand": metaBrand.toJson(),
        "showVariants": showVariants,
        "showSexualContent": showSexualContent,
        "brandCategoryBanners":
            List<dynamic>.from(brandCategoryBanners.map((x) => x)),
        "isThereAnyCorporateInvoiceInOtherMerchants":
            isThereAnyCorporateInvoiceInOtherMerchants,
        "token": token,
        "buyMorePayLessPromotions":
            List<dynamic>.from(buyMorePayLessPromotions.map((x) => x)),
        "categoryTopRankings": categoryTopRankings?.toJson(),
        "isVasEnabled": isVasEnabled,
        "originalCategory": originalCategory.toJson(),
        "landings": List<dynamic>.from(landings.map((x) => x)),
        "id": id,
        "productCode": productCode,
        "name": name,
        "nameWithProductCode": nameWithProductCode,
        "description": description,
        "contentDescriptions":
            List<dynamic>.from(contentDescriptions.map((x) => x.toJson())),
        "productGroupId": productGroupId,
        "tax": tax,
        "businessUnit": businessUnit,
        "maxInstallment": maxInstallment,
        "gender": gender?.toJson(),
        "webGender": webGender?.toJson(),
        "url": url,
        "images": List<dynamic>.from(images.map((x) => x)),
        "isSellable": isSellable,
        "isBasketDiscount": isBasketDiscount,
        "hasStock": hasStock,
        "price": price.toJson(),
        "isFreeCargo": isFreeCargo,
        "isLongTermDelivery": isLongTermDelivery,
        "promotions": List<dynamic>.from(promotions.map((x) => x.toJson())),
        "merchant": merchant.toJson(),
        "deliveryInformation": deliveryInformation.toJson(),
        "cargoRemainingDays": cargoRemainingDays,
        "isMarketplace": isMarketplace,
        "productStamps": List<dynamic>.from(productStamps.map((x) => x)),
        "hasHtmlContent": hasHtmlContent,
        "favoriteCount": favoriteCount,
        "uxLayout": uxLayout,
        "isDigitalGood": isDigitalGood,
        "isRunningOut": isRunningOut,
        "scheduledDelivery": scheduledDelivery,
        "ratingScore": ratingScore?.toJson(),
        "showStarredAttributes": showStarredAttributes,
        "reviewsUrl": reviewsUrl,
        "questionsUrl": questionsUrl,
        "sellerQuestionEnabled": sellerQuestionEnabled,
        "sizeChartUrl": sizeChartUrl,
        "sizeExpectationAvailable": sizeExpectationAvailable,
        "rushDeliveryMerchantListingExist": rushDeliveryMerchantListingExist,
        "isRushDelivery": isRushDelivery,
        "lowerPriceMerchantListingExist": lowerPriceMerchantListingExist,
        "showValidFlashSales": showValidFlashSales,
        "showExpiredFlashSales": showExpiredFlashSales,
        "isArtWork": isArtWork,
        "isBlacklist": isBlacklist,
        "filterableLabels":
            List<dynamic>.from(filterableLabels.map((x) => x.toJson())),
      };
}

class Attribute {
  Attribute({
    required this.key,
    required this.value,
    required this.starred,
    required this.description,
    required this.mediaUrls,
  });

  final Gender key;
  final Gender value;
  final bool starred;
  final String description;
  final List<dynamic> mediaUrls;

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        key: Gender.fromJson(json["key"]),
        value: Gender.fromJson(json["value"]),
        starred: json["starred"],
        description: json["description"],
        mediaUrls: List<dynamic>.from(json["mediaUrls"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "key": key.toJson(),
        "value": value.toJson(),
        "starred": starred,
        "description": description,
        "mediaUrls": List<dynamic>.from(mediaUrls.map((x) => x)),
      };
}

class Gender {
  Gender({
    required this.name,
    required this.id,
  });

  final String? name;
  final int? id;

  factory Gender.fromJson(Map<String, dynamic>? json) => Gender(
        name: json?["name"],
        id: json?["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}

class Brand {
  Brand({
    required this.isVirtual,
    required this.beautifiedName,
    required this.id,
    required this.name,
    required this.path,
  });

  final bool? isVirtual;
  final String? beautifiedName;
  final int? id;
  final String? name;
  final String? path;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        isVirtual: json["isVirtual"],
        beautifiedName: json["beautifiedName"],
        id: json["id"],
        name: json["name"],
        path: json["path"],
      );

  Map<String, dynamic> toJson() => {
        "isVirtual": isVirtual,
        "beautifiedName": beautifiedName,
        "id": id,
        "name": name,
        "path": path,
      };
}

class Campaign {
  Campaign({
    required this.id,
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.isMultipleSupplied,
    required this.stockTypeId,
    required this.url,
    required this.showTimer,
  });

  final int id;
  final String name;
  final DateTime startDate;
  final DateTime endDate;
  final bool isMultipleSupplied;
  final int stockTypeId;
  final String url;
  final bool showTimer;

  factory Campaign.fromJson(Map<String, dynamic> json) => Campaign(
        id: json["id"],
        name: json["name"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        isMultipleSupplied: json["isMultipleSupplied"],
        stockTypeId: json["stockTypeId"],
        url: json["url"],
        showTimer: json["showTimer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "startDate": startDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        "isMultipleSupplied": isMultipleSupplied,
        "stockTypeId": stockTypeId,
        "url": url,
        "showTimer": showTimer,
      };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.hierarchy,
    required this.refundable,
    required this.beautifiedName,
    required this.isVasEnabled,
  });

  final int id;
  final String name;
  final String hierarchy;
  final bool refundable;
  final String beautifiedName;
  final bool isVasEnabled;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        hierarchy: json["hierarchy"],
        refundable: json["refundable"],
        beautifiedName: json["beautifiedName"],
        isVasEnabled: json["isVASEnabled"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "hierarchy": hierarchy,
        "refundable": refundable,
        "beautifiedName": beautifiedName,
        "isVASEnabled": isVasEnabled,
      };
}

class CategoryTopRankings {
  CategoryTopRankings({
    required this.name,
    required this.order,
    required this.url,
    required this.text,
  });

  final String? name;
  final int? order;
  final String? url;
  final String? text;

  factory CategoryTopRankings.fromJson(Map<String, dynamic> json) =>
      CategoryTopRankings(
        name: json["name"],
        order: json["order"],
        url: json["url"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "order": order,
        "url": url,
        "text": text,
      };
}

class ContentDescription {
  ContentDescription({
    required this.description,
    required this.bold,
  });

  final String description;
  final bool bold;

  factory ContentDescription.fromJson(Map<String, dynamic> json) =>
      ContentDescription(
        description: json["description"],
        bold: json["bold"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "bold": bold,
      };
}

class DeliveryInformation {
  DeliveryInformation({
    required this.isRushDelivery,
    required this.deliveryDate,
    required this.fastDeliveryOptions,
  });

  final bool isRushDelivery;
  final String deliveryDate;
  final List<FastDeliveryOption> fastDeliveryOptions;

  factory DeliveryInformation.fromJson(Map<String, dynamic> json) =>
      DeliveryInformation(
        isRushDelivery: json["isRushDelivery"],
        deliveryDate: json["deliveryDate"],
        fastDeliveryOptions: List<FastDeliveryOption>.from(
            json["fastDeliveryOptions"]
                .map((x) => FastDeliveryOption.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "isRushDelivery": isRushDelivery,
        "deliveryDate": deliveryDate,
        "fastDeliveryOptions":
            List<dynamic>.from(fastDeliveryOptions.map((x) => x.toJson())),
      };
}

class FastDeliveryOption {
  FastDeliveryOption({
    required this.type,
    required this.dailyCutoffHour,
    required this.deliveryTimeZone,
    required this.cutOffCountDown,
  });

  final String? type;
  final String? dailyCutoffHour;
  final String? deliveryTimeZone;
  final CutOffCountDown? cutOffCountDown;

  factory FastDeliveryOption.fromJson(Map<String, dynamic> json) =>
      FastDeliveryOption(
        type: json["type"],
        dailyCutoffHour: json["dailyCutoffHour"],
        deliveryTimeZone: json["deliveryTimeZone"],
        cutOffCountDown: CutOffCountDown.fromJson(json["cutOffCountDown"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "dailyCutoffHour": dailyCutoffHour,
        "deliveryTimeZone": deliveryTimeZone,
        "cutOffCountDown": cutOffCountDown!.toJson(),
      };
}

class CutOffCountDown {
  CutOffCountDown({
    required this.years,
    required this.months,
    required this.days,
    required this.hours,
    required this.minutes,
    required this.seconds,
  });

  final int? years;
  final int? months;
  final int? days;
  final int? hours;
  final int? minutes;
  final int? seconds;

  factory CutOffCountDown.fromJson(Map<String, dynamic> json) =>
      CutOffCountDown(
        years: json["years"],
        months: json["months"],
        days: json["days"],
        hours: json["hours"],
        minutes: json["minutes"],
        seconds: json["seconds"],
      );

  Map<String, dynamic> toJson() => {
        "years": years,
        "months": months,
        "days": days,
        "hours": hours,
        "minutes": minutes,
        "seconds": seconds,
      };
}

class FilterableLabel {
  FilterableLabel({
    required this.id,
    required this.name,
    required this.displayName,
    required this.visibleAgg,
  });

  final String? id;
  final String? name;
  final String? displayName;
  final bool? visibleAgg;

  factory FilterableLabel.fromJson(Map<String, dynamic> json) =>
      FilterableLabel(
        id: json["id"],
        name: json["name"],
        displayName: json["displayName"],
        visibleAgg: json["visibleAgg"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "displayName": displayName,
        "visibleAgg": visibleAgg,
      };
}

class Merchant {
  Merchant({
    required this.isSearchableMerchant,
    required this.stickers,
    required this.merchantBadges,
    required this.merchantMarkers,
    required this.id,
    required this.name,
    required this.officialName,
    required this.cityName,
    required this.taxNumber,
    required this.sellerScore,
    required this.sellerScoreColor,
    required this.deliveryProviderName,
    required this.corporateInvoiceApplicable,
    required this.locationBasedSales,
    required this.sellerLink,
  });

  final bool isSearchableMerchant;
  final List<dynamic> stickers;
  final List<dynamic> merchantBadges;
  final List<dynamic> merchantMarkers;
  final int? id;
  final String? name;
  final String? officialName;
  final String? cityName;
  final String? taxNumber;
  final double? sellerScore;
  final String? sellerScoreColor;
  final String? deliveryProviderName;
  final bool? corporateInvoiceApplicable;
  final bool? locationBasedSales;
  final String? sellerLink;

  factory Merchant.fromJson(Map<String, dynamic> json) => Merchant(
        isSearchableMerchant: json["isSearchableMerchant"],
        stickers: List<dynamic>.from(json["stickers"].map((x) => x)),
        merchantBadges:
            List<dynamic>.from(json["merchantBadges"].map((x) => x)),
        merchantMarkers:
            List<dynamic>.from(json["merchantMarkers"].map((x) => x)),
        id: json["id"],
        name: json["name"],
        officialName: json["officialName"],
        cityName: json["cityName"],
        taxNumber: json["taxNumber"],
        sellerScore: json["sellerScore"]?.toDouble(),
        sellerScoreColor: json["sellerScoreColor"],
        deliveryProviderName: json["deliveryProviderName"],
        corporateInvoiceApplicable: json["corporateInvoiceApplicable"],
        locationBasedSales: json["locationBasedSales"],
        sellerLink: json["sellerLink"],
      );

  Map<String, dynamic> toJson() => {
        "isSearchableMerchant": isSearchableMerchant,
        "stickers": List<dynamic>.from(stickers.map((x) => x)),
        "merchantBadges": List<dynamic>.from(merchantBadges.map((x) => x)),
        "merchantMarkers": List<dynamic>.from(merchantMarkers.map((x) => x)),
        "id": id,
        "name": name,
        "officialName": officialName,
        "cityName": cityName,
        "taxNumber": taxNumber,
        "sellerScore": sellerScore,
        "sellerScoreColor": sellerScoreColor,
        "deliveryProviderName": deliveryProviderName,
        "corporateInvoiceApplicable": corporateInvoiceApplicable,
        "locationBasedSales": locationBasedSales,
        "sellerLink": sellerLink,
      };
}

class Price {
  Price({
    required this.profitMargin,
    required this.discountedPrice,
    required this.sellingPrice,
    required this.originalPrice,
    required this.currency,
  });

  final int profitMargin;
  final DiscountedPriceClass discountedPrice;
  final DiscountedPriceClass sellingPrice;
  final DiscountedPriceClass originalPrice;
  final String currency;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        profitMargin: json["profitMargin"],
        discountedPrice: DiscountedPriceClass.fromJson(json["discountedPrice"]),
        sellingPrice: DiscountedPriceClass.fromJson(json["sellingPrice"]),
        originalPrice: DiscountedPriceClass.fromJson(json["originalPrice"]),
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "profitMargin": profitMargin,
        "discountedPrice": discountedPrice.toJson(),
        "sellingPrice": sellingPrice.toJson(),
        "originalPrice": originalPrice.toJson(),
        "currency": currency,
      };
}

class DiscountedPriceClass {
  DiscountedPriceClass({
    required this.text,
    required this.value,
  });

  final String text;
  final double value;

  factory DiscountedPriceClass.fromJson(Map<String, dynamic> json) =>
      DiscountedPriceClass(
        text: json["text"],
        value: json["value"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "value": value,
      };
}

class Promotion {
  Promotion({
    required this.promotionRemainingTime,
    required this.type,
    required this.text,
    required this.id,
    required this.promotionDiscountType,
    required this.link,
  });

  final String promotionRemainingTime;
  final int type;
  final String text;
  final int id;
  final String promotionDiscountType;
  final String link;

  factory Promotion.fromJson(Map<String, dynamic> json) => Promotion(
        promotionRemainingTime: json["promotionRemainingTime"],
        type: json["type"],
        text: json["text"],
        id: json["id"],
        promotionDiscountType: json["promotionDiscountType"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "promotionRemainingTime": promotionRemainingTime,
        "type": type,
        "text": text,
        "id": id,
        "promotionDiscountType": promotionDiscountType,
        "link": link,
      };
}

class RatingScore {
  RatingScore({
    required this.averageRating,
    required this.totalRatingCount,
    required this.totalCommentCount,
  });

  final String? averageRating;
  final String? totalRatingCount;
  final String? totalCommentCount;

  factory RatingScore.fromJson(Map<String, dynamic> json) => RatingScore(
        averageRating: json["averageRating"].toString(),
        totalRatingCount: json["totalRatingCount"].toString(),
        totalCommentCount: json["totalCommentCount"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "averageRating": averageRating,
        "totalRatingCount": totalRatingCount,
        "totalCommentCount": totalCommentCount,
      };
}

class Variant {
  Variant({
    required this.attributeId,
    required this.attributeName,
    required this.attributeType,
    required this.attributeValue,
    required this.stamps,
    required this.price,
    required this.fulfilmentType,
    required this.attributeBeautifiedValue,
    required this.isWinner,
    required this.listingId,
    required this.stock,
    required this.sellable,
    required this.availableForClaim,
    required this.barcode,
    required this.itemNumber,
    required this.discountedPriceInfo,
    required this.hasCollectable,
    required this.unitInfo,
    required this.rushDeliveryMerchantListingExist,
    required this.lowerPriceMerchantListingExist,
    required this.fastDeliveryOptions,
    required this.groupTagIds,
  });

  final int attributeId;
  final String attributeName;
  final String attributeType;
  final String attributeValue;
  final List<Stamp> stamps;
  final Price price;
  final String fulfilmentType;
  final String attributeBeautifiedValue;
  final bool isWinner;
  final String listingId;
  final dynamic stock;
  final bool sellable;
  final bool availableForClaim;
  final String barcode;
  final int itemNumber;
  final String discountedPriceInfo;
  final bool hasCollectable;
  final UnitInfo unitInfo;
  final bool rushDeliveryMerchantListingExist;
  final bool lowerPriceMerchantListingExist;
  final List<FastDeliveryOption?> fastDeliveryOptions;
  final List<dynamic> groupTagIds;

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        attributeId: json["attributeId"],
        attributeName: json["attributeName"],
        attributeType: json["attributeType"],
        attributeValue: json["attributeValue"],
        stamps: List<Stamp>.from(json["stamps"].map((x) => Stamp.fromJson(x))),
        price: Price.fromJson(json["price"]),
        fulfilmentType: json["fulfilmentType"],
        attributeBeautifiedValue: json["attributeBeautifiedValue"],
        isWinner: json["isWinner"],
        listingId: json["listingId"],
        stock: json["stock"],
        sellable: json["sellable"],
        availableForClaim: json["availableForClaim"],
        barcode: json["barcode"],
        itemNumber: json["itemNumber"],
        discountedPriceInfo: json["discountedPriceInfo"],
        hasCollectable: json["hasCollectable"],
        unitInfo: UnitInfo.fromJson(json["unitInfo"]),
        rushDeliveryMerchantListingExist:
            json["rushDeliveryMerchantListingExist"],
        lowerPriceMerchantListingExist: json["lowerPriceMerchantListingExist"],
        fastDeliveryOptions: List<FastDeliveryOption>.from(
            json["fastDeliveryOptions"]
                .map((x) => FastDeliveryOption.fromJson(x))),
        groupTagIds: List<dynamic>.from(json["groupTagIds"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "attributeId": attributeId,
        "attributeName": attributeName,
        "attributeType": attributeType,
        "attributeValue": attributeValue,
        "stamps": List<dynamic>.from(stamps.map((x) => x.toJson())),
        "price": price.toJson(),
        "fulfilmentType": fulfilmentType,
        "attributeBeautifiedValue": attributeBeautifiedValue,
        "isWinner": isWinner,
        "listingId": listingId,
        "stock": stock,
        "sellable": sellable,
        "availableForClaim": availableForClaim,
        "barcode": barcode,
        "itemNumber": itemNumber,
        "discountedPriceInfo": discountedPriceInfo,
        "hasCollectable": hasCollectable,
        "unitInfo": unitInfo.toJson(),
        "rushDeliveryMerchantListingExist": rushDeliveryMerchantListingExist,
        "lowerPriceMerchantListingExist": lowerPriceMerchantListingExist,
        "fastDeliveryOptions":
            List<dynamic>.from(fastDeliveryOptions.map((x) => x?.toJson())),
        "groupTagIds": List<dynamic>.from(groupTagIds.map((x) => x)),
      };
}

class Stamp {
  Stamp({
    required this.type,
    required this.text,
  });

  final int type;
  final String text;

  factory Stamp.fromJson(Map<String, dynamic> json) => Stamp(
        type: json["type"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "text": text,
      };
}

class UnitInfo {
  UnitInfo({
    required this.unitPrice,
    required this.unitPriceText,
  });

  final bool? unitPrice;
  final bool? unitPriceText;

  factory UnitInfo.fromJson(Map<String, dynamic> json) => UnitInfo(
        unitPrice: json["unitPrice"],
        unitPriceText: json["unitPriceText"],
      );

  Map<String, dynamic> toJson() => {
        "unitPrice": unitPrice,
        "unitPriceText": unitPriceText,
      };
}

class AllVariants {
  int? itemNumber;
  String? value;
  bool? inStock;
  String? currency;
  String? barcode;
  int? price;

  AllVariants(
      {required this.itemNumber,
      required this.value,
      required this.inStock,
      required this.currency,
      required this.barcode,
      required this.price});

  AllVariants.fromJson(Map<String, dynamic> json) {
    itemNumber = json['itemNumber'];
    value = json['value'];
    inStock = json['inStock'];
    currency = json['currency'];
    barcode = json['barcode'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemNumber'] = itemNumber;
    data['value'] = value;
    data['inStock'] = inStock;
    data['currency'] = currency;
    data['barcode'] = barcode;
    data['price'] = price;
    return data;
  }
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
