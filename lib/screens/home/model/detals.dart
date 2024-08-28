class ProductDetail {
  ProductDetail({
    required this.isSuccess,
    required this.statusCode,
    this.error,
    required this.result,
    required this.headers,
  });
  late final bool isSuccess;
  late final int statusCode;
  late final Null error;
  late final Result result;
  late final Headers headers;

  ProductDetail.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    statusCode = json['statusCode'];
    error = json['error'];
    result = Result.fromJson(json['result']);
    headers = Headers.fromJson(json['headers']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['isSuccess'] = isSuccess;
    _data['statusCode'] = statusCode;
    _data['error'] = error;
    _data['result'] = result.toJson();
    _data['headers'] = headers.toJson();
    return _data;
  }
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
    required this.allVariants,
    required this.otherMerchantVariants,
    required this.token,
    required this.isThereAnyCorporateInvoiceInOtherMerchants,
    this.advertProduct,
    this.categoryTopRankings,
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

    ///required this.webGender,
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
    required this.crossPromotionAward,
    required this.rushDeliveryMerchantListingExist,
    required this.isRushDelivery,
    required this.lowerPriceMerchantListingExist,
    required this.showValidFlashSales,
    required this.showExpiredFlashSales,
    required this.walletRebate,
    required this.isArtWork,
    required this.buyMorePayLessPromotions,
    required this.filterableLabels,
    required this.customValues,
  });
  late final List<Attributes> attributes;
  late final List<dynamic> selectedVasAttributes;
  late final List<dynamic> alternativeVariants;
  late final List<Variants> variants;
  late final List<dynamic> otherMerchants;
  late final Campaign campaign;
  late final Category category;
  late final Brand brand;
  late final String? color;
  late final MetaBrand metaBrand;
  late final bool showVariants;
  late final bool showSexualContent;
  late final List<dynamic> brandCategoryBanners;
  late final List<AllVariants> allVariants;
  late final List<dynamic> otherMerchantVariants;
  late final String token;
  late final bool isThereAnyCorporateInvoiceInOtherMerchants;
  late final Null advertProduct;
  late final Null categoryTopRankings;
  late final bool isVasEnabled;
  late final OriginalCategory originalCategory;
  late final List<dynamic> landings;
  late final int id;
  late final String productCode;
  late final String name;
  late final String nameWithProductCode;
  late final List<Descriptions> description;
  late final List<ContentDescriptions> contentDescriptions;
  late final int productGroupId;
  late final int tax;
  late final String businessUnit;
  late final int maxInstallment;
  late final Gender? gender;
  late final dynamic webGender;
  late final String url;
  late final List<String> images;
  late final bool isSellable;
  late final bool isBasketDiscount;
  late final bool hasStock;
  late final Price price;
  late final bool isFreeCargo;
  late final bool isLongTermDelivery;
  late final List<Promotions> promotions;
  late final Merchant merchant;
  late final DeliveryInformation deliveryInformation;
  late final int cargoRemainingDays;
  late final bool isMarketplace;
  late final List<dynamic> productStamps;
  late final bool hasHtmlContent;
  late final int favoriteCount;
  late final String uxLayout;
  late final bool isDigitalGood;
  late final bool isRunningOut;
  late final bool scheduledDelivery;
  late final RatingScore ratingScore;
  late final bool showStarredAttributes;
  late final String reviewsUrl;
  late final String questionsUrl;
  late final bool sellerQuestionEnabled;
  late final String sizeChartUrl;
  late final bool sizeExpectationAvailable;
  late final CrossPromotionAward crossPromotionAward;
  late final bool rushDeliveryMerchantListingExist;
  late final bool isRushDelivery;
  late final bool lowerPriceMerchantListingExist;
  late final bool showValidFlashSales;
  late final bool showExpiredFlashSales;
  late final WalletRebate walletRebate;
  late final bool isArtWork;
  late final List<dynamic> buyMorePayLessPromotions;
  late final List<FilterableLabels> filterableLabels;
  late final List<CustomValues> customValues;

  Result.fromJson(Map<String, dynamic> json) {
    attributes = List.from(json['attributes'])
        .map((e) => Attributes.fromJson(e))
        .toList();
    selectedVasAttributes =
        List.castFrom<dynamic, dynamic>(json['selectedVasAttributes']);
    alternativeVariants =
        List.castFrom<dynamic, dynamic>(json['alternativeVariants']);
    variants =
        List.from(json['variants']).map((e) => Variants.fromJson(e)).toList();
    otherMerchants = List.castFrom<dynamic, dynamic>(json['otherMerchants']);
    campaign = Campaign.fromJson(json['campaign']);
    category = Category.fromJson(json['category']);
    brand = Brand.fromJson(json['brand']);
    color = json['color'];
    metaBrand = MetaBrand.fromJson(json['metaBrand']);
    showVariants = json['showVariants'];
    showSexualContent = json['showSexualContent'];
    brandCategoryBanners =
        List.castFrom<dynamic, dynamic>(json['brandCategoryBanners']);
    allVariants = List.from(json['allVariants'])
        .map((e) => AllVariants.fromJson(e))
        .toList();
    otherMerchantVariants =
        List.castFrom<dynamic, dynamic>(json['otherMerchantVariants']);
    token = json['token'];
    isThereAnyCorporateInvoiceInOtherMerchants =
        json['isThereAnyCorporateInvoiceInOtherMerchants'];
    advertProduct = null;
    categoryTopRankings = null;
    isVasEnabled = json['isVasEnabled'];
    originalCategory = OriginalCategory.fromJson(json['originalCategory']);
    landings = List.castFrom<dynamic, dynamic>(json['landings']);
    id = json['id'];
    productCode = json['productCode'];
    name = json['name'];
    nameWithProductCode = json['nameWithProductCode'];
    
		if (json['descriptions'] != null) {
			description = <Descriptions>[];
			json['descriptions'].forEach((v) { description!.add(new Descriptions.fromJson(v)); });}
    
    
    productGroupId = json['productGroupId'];
    tax = json['tax'];
    businessUnit = json['businessUnit'];
    maxInstallment = json['maxInstallment'];
    gender = Gender.fromJson(json['gender']);

    ///webGender = WebGender.fromJson(json['webGender']);
    url = json['url'];
    images = List.castFrom<dynamic, String>(json['images']);
    isSellable = json['isSellable'];
    isBasketDiscount = json['isBasketDiscount'];
    hasStock = json['hasStock'];
    price = Price.fromJson(json['price']);
    isFreeCargo = json['isFreeCargo'];
    ///isLongTermDelivery = json['isLongTermDelivery'];
    promotions = List.from(json['promotions'])
        .map((e) => Promotions.fromJson(e))
        .toList();
    merchant = Merchant.fromJson(json['merchant']);
   // deliveryInformation =
   //     DeliveryInformation.fromJson(json['deliveryInformation']);
    //cargoRemainingDays = json['cargoRemainingDays'];
    //isMarketplace = json['isMarketplace'];
   // productStamps = List.castFrom<dynamic, dynamic>(json['productStamps']);
    hasHtmlContent = json['hasHtmlContent'];
    favoriteCount = json['favoriteCount'];
    uxLayout = json['uxLayout'];
    isDigitalGood = json['isDigitalGood'];
    isRunningOut = json['isRunningOut'];
    //scheduledDelivery = json['scheduledDelivery'];
    ratingScore = RatingScore.fromJson(json['ratingScore']);
    showStarredAttributes = json['showStarredAttributes'];
    reviewsUrl = json['reviewsUrl'];
    questionsUrl = json['questionsUrl'];
    sellerQuestionEnabled = json['sellerQuestionEnabled'];
    sizeChartUrl = json['sizeChartUrl'];
    sizeExpectationAvailable = json['sizeExpectationAvailable'];
    crossPromotionAward =
        CrossPromotionAward.fromJson(json['crossPromotionAward']);
    rushDeliveryMerchantListingExist = json['rushDeliveryMerchantListingExist'];
    //isRushDelivery = json['isRushDelivery'];
    lowerPriceMerchantListingExist = json['lowerPriceMerchantListingExist'];
    showValidFlashSales = json['showValidFlashSales'];
    showExpiredFlashSales = json['showExpiredFlashSales'];
    walletRebate = WalletRebate.fromJson(json['walletRebate']);
    isArtWork = json['isArtWork'];
    buyMorePayLessPromotions = (json['buyMorePayLessPromotions']);
    filterableLabels = List.from(json['filterableLabels'])
        .map((e) => FilterableLabels.fromJson(e))
        .toList();
    customValues = List.from(json['customValues'])
        .map((e) => CustomValues.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['attributes'] = attributes.map((e) => e.toJson()).toList();
    _data['selectedVasAttributes'] = selectedVasAttributes;
    _data['alternativeVariants'] = alternativeVariants;
    _data['variants'] = variants.map((e) => e.toJson()).toList();
    _data['otherMerchants'] = otherMerchants;
    _data['campaign'] = campaign.toJson();
    _data['category'] = category.toJson();
    _data['brand'] = brand.toJson();
    _data['color'] = color;
    _data['metaBrand'] = metaBrand.toJson();
    _data['showVariants'] = showVariants;
    _data['showSexualContent'] = showSexualContent;
    _data['brandCategoryBanners'] = brandCategoryBanners;
    _data['allVariants'] = allVariants.map((e) => e.toJson()).toList();
    _data['otherMerchantVariants'] = otherMerchantVariants;
    _data['token'] = token;
    _data['isThereAnyCorporateInvoiceInOtherMerchants'] =
        isThereAnyCorporateInvoiceInOtherMerchants;
    _data['advertProduct'] = advertProduct;
    _data['categoryTopRankings'] = categoryTopRankings;
    _data['isVasEnabled'] = isVasEnabled;
    _data['originalCategory'] = originalCategory.toJson();
    _data['landings'] = landings;
    _data['id'] = id;
    _data['productCode'] = productCode;
    _data['name'] = name;
    _data['nameWithProductCode'] = nameWithProductCode;
    _data['description'] = description;
    _data['contentDescriptions'] =
        contentDescriptions.map((e) => e.toJson()).toList();
    _data['productGroupId'] = productGroupId;
    _data['tax'] = tax;
    _data['businessUnit'] = businessUnit;
    _data['maxInstallment'] = maxInstallment;
    _data['gender'] = gender!.toJson();
    _data['webGender'] = webGender!.toJson();
    _data['url'] = url;
    _data['images'] = images;
    _data['isSellable'] = isSellable;
    _data['isBasketDiscount'] = isBasketDiscount;
    _data['hasStock'] = hasStock;
    _data['price'] = price.toJson();
    _data['isFreeCargo'] = isFreeCargo;
    _data['isLongTermDelivery'] = isLongTermDelivery;
    _data['promotions'] = promotions.map((e) => e.toJson()).toList();
    _data['merchant'] = merchant.toJson();
    _data['deliveryInformation'] = deliveryInformation.toJson();
    _data['cargoRemainingDays'] = cargoRemainingDays;
    _data['isMarketplace'] = isMarketplace;
    _data['productStamps'] = productStamps;
    _data['hasHtmlContent'] = hasHtmlContent;
    _data['favoriteCount'] = favoriteCount;
    _data['uxLayout'] = uxLayout;
    _data['isDigitalGood'] = isDigitalGood;
    _data['isRunningOut'] = isRunningOut;
    _data['scheduledDelivery'] = scheduledDelivery;
    _data['ratingScore'] = ratingScore.toJson();
    _data['showStarredAttributes'] = showStarredAttributes;
    _data['reviewsUrl'] = reviewsUrl;
    _data['questionsUrl'] = questionsUrl;
    _data['sellerQuestionEnabled'] = sellerQuestionEnabled;
    _data['sizeChartUrl'] = sizeChartUrl;
    _data['sizeExpectationAvailable'] = sizeExpectationAvailable;
    _data['crossPromotionAward'] = crossPromotionAward.toJson();
    _data['rushDeliveryMerchantListingExist'] =
        rushDeliveryMerchantListingExist;
    _data['isRushDelivery'] = isRushDelivery;
    _data['lowerPriceMerchantListingExist'] = lowerPriceMerchantListingExist;
    _data['showValidFlashSales'] = showValidFlashSales;
    _data['showExpiredFlashSales'] = showExpiredFlashSales;
    _data['walletRebate'] = walletRebate.toJson();
    _data['isArtWork'] = isArtWork;
    _data['buyMorePayLessPromotions'] = buyMorePayLessPromotions;
    _data['filterableLabels'] =
        filterableLabels.map((e) => e.toJson()).toList();
    _data['customValues'] = customValues.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Attributes {
  Attributes({
    required this.key,
    required this.value,
    required this.starred,
    required this.description,
    required this.mediaUrls,
  });
  late final Key key;
  late final Value value;
  late final bool starred;
  late final String description;
  late final List<dynamic> mediaUrls;

  Attributes.fromJson(Map<String, dynamic> json) {
    key = Key.fromJson(json['key']);
    value = Value.fromJson(json['value']);
    starred = json['starred'];
    description = json['description'];
    mediaUrls = List.castFrom<dynamic, dynamic>(json['mediaUrls']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['key'] = key.toJson();
    _data['value'] = value.toJson();
    _data['starred'] = starred;
    _data['description'] = description;
    _data['mediaUrls'] = mediaUrls;
    return _data;
  }
}

class Key {
  Key({
    required this.name,
    required this.id,
  });
  late final String name;
  late final int id;

  Key.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['id'] = id;
    return _data;
  }
}

class Value {
  Value({
    required this.name,
    required this.id,
  });
  late final String name;
  late final int id;

  Value.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['id'] = id;
    return _data;
  }
}

class Variants {
  Variants({
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
    this.stock,
    required this.sellable,
    required this.availableForClaim,
    required this.barcode,
    required this.itemNumber,
    required this.discountedPriceInfo,
    required this.hasCollectable,
    required this.unitInfo,
    required this.rushDeliveryMerchantListingExist,
    required this.lowerPriceMerchantListingExist,
    
    required this.groupTagIds,
  });
  late final int attributeId;
  late final String attributeName;
  late final String attributeType;
  late final String attributeValue;
  late final List<Stamps> stamps;
  late final Price price;
  late final String fulfilmentType;
  late final String attributeBeautifiedValue;
  late final bool isWinner;
  late final String listingId;
  late final Null stock;
  late final bool sellable;
  late final bool availableForClaim;
  late final String barcode;
  late final int itemNumber;
  late final String discountedPriceInfo;
  late final bool hasCollectable;
  late final UnitInfo unitInfo;
  late final bool rushDeliveryMerchantListingExist;
  late final bool lowerPriceMerchantListingExist;
  late final LowestPriceDuration? lowestPriceDuration;
  late final List<dynamic> fastDeliveryOptions;
  late final List<dynamic> groupTagIds;

  Variants.fromJson(Map<String, dynamic> json) {
    attributeId = json['attributeId'];
    attributeName = json['attributeName'];
    attributeType = json['attributeType'];
    attributeValue = json['attributeValue'];
    stamps = List.from(json['stamps']).map((e) => Stamps.fromJson(e)).toList();
    price = Price.fromJson(json['price']);
    fulfilmentType = json['fulfilmentType'];
    attributeBeautifiedValue = json['attributeBeautifiedValue'];
    isWinner = json['isWinner'];
    listingId = json['listingId'];
    stock = null;
    sellable = json['sellable'];
    availableForClaim = json['availableForClaim'];
    barcode = json['barcode'];
    itemNumber = json['itemNumber'];
    discountedPriceInfo = json['discountedPriceInfo'];
    hasCollectable = json['hasCollectable'];
    unitInfo = UnitInfo.fromJson(json['unitInfo']);
    rushDeliveryMerchantListingExist = json['rushDeliveryMerchantListingExist'];
    lowerPriceMerchantListingExist = json['lowerPriceMerchantListingExist'];
    lowestPriceDuration = json['lowestPriceDuration'] != null ? new LowestPriceDuration.fromJson(json['lowestPriceDuration']) : null;

    
    groupTagIds = List.castFrom<dynamic, dynamic>(json['groupTagIds']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['attributeId'] = attributeId;
    _data['attributeName'] = attributeName;
    _data['attributeType'] = attributeType;
    _data['attributeValue'] = attributeValue;
    _data['stamps'] = stamps.map((e) => e.toJson()).toList();
    _data['price'] = price.toJson();
    _data['fulfilmentType'] = fulfilmentType;
    _data['attributeBeautifiedValue'] = attributeBeautifiedValue;
    _data['isWinner'] = isWinner;
    _data['listingId'] = listingId;
    _data['stock'] = stock;
    _data['sellable'] = sellable;
    _data['availableForClaim'] = availableForClaim;
    _data['barcode'] = barcode;
    _data['itemNumber'] = itemNumber;
    _data['discountedPriceInfo'] = discountedPriceInfo;
    _data['hasCollectable'] = hasCollectable;
    _data['unitInfo'] = unitInfo.toJson();
    _data['rushDeliveryMerchantListingExist'] =
        rushDeliveryMerchantListingExist;
    _data['lowerPriceMerchantListingExist'] = lowerPriceMerchantListingExist;
    _data['fastDeliveryOptions'] = fastDeliveryOptions;
    _data['groupTagIds'] = groupTagIds;
    return _data;
  }
}

class Stamps {
  Stamps({
    required this.type,
    required this.text,
  });
  late final int type;
  late final String text;

  Stamps.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['text'] = text;
    return _data;
  }
}

class Price {
  Price({
    required this.profitMargin,
    required this.discountedPrice,
    required this.sellingPrice,
    required this.originalPrice,
    required this.currency,
  });
  late final int profitMargin;
  late final DiscountedPrice discountedPrice;
  late final SellingPrice sellingPrice;
  late final OriginalPrice originalPrice;
  late final String currency;

  Price.fromJson(Map<String, dynamic> json) {
    profitMargin = json['profitMargin'];
    discountedPrice = DiscountedPrice.fromJson(json['discountedPrice']);
    sellingPrice = SellingPrice.fromJson(json['sellingPrice']);
    originalPrice = OriginalPrice.fromJson(json['originalPrice']);
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['profitMargin'] = profitMargin;
    _data['discountedPrice'] = discountedPrice.toJson();
    _data['sellingPrice'] = sellingPrice.toJson();
    _data['originalPrice'] = originalPrice.toJson();
    _data['currency'] = currency;
    return _data;
  }
}

class DiscountedPrice {
  DiscountedPrice({
    required this.text,
    required this.value,
  });
  late final String text;
  late final dynamic value;

  DiscountedPrice.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['text'] = text;
    _data['value'] = value;
    return _data;
  }
}

class SellingPrice {
  SellingPrice({
    required this.text,
    required this.value,
  });
  late final String text;
  late final dynamic value;

  SellingPrice.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['text'] = text;
    _data['value'] = value;
    return _data;
  }
}

class OriginalPrice {
  OriginalPrice({
    required this.text,
    required this.value,
  });
  late final String text;
  late final dynamic value;

  OriginalPrice.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['text'] = text;
    _data['value'] = value;
    return _data;
  }
}
class LowestPriceDuration {
	int? duration;

	LowestPriceDuration({this.duration});

	LowestPriceDuration.fromJson(Map<String, dynamic> json) {
		duration = json['duration'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['duration'] = this.duration;
		return data;
	}
}

class UnitInfo {
  UnitInfo({
    required this.unitPrice,
    required this.unitPriceText,
  });
  late final bool unitPrice;
  late final bool unitPriceText;

  UnitInfo.fromJson(Map<String, dynamic> json) {
    unitPrice = json['unitPrice'];
    unitPriceText = json['unitPriceText'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['unitPrice'] = unitPrice;
    _data['unitPriceText'] = unitPriceText;
    return _data;
  }
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
  late final int id;
  late final String name;
  late final String startDate;
  late final String endDate;
  late final bool isMultipleSupplied;
  late final int stockTypeId;
  late final String url;
  late final bool showTimer;

  Campaign.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    isMultipleSupplied = json['isMultipleSupplied'];
    stockTypeId = json['stockTypeId'];
    url = json['url'];
    showTimer = json['showTimer'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['startDate'] = startDate;
    _data['endDate'] = endDate;
    _data['isMultipleSupplied'] = isMultipleSupplied;
    _data['stockTypeId'] = stockTypeId;
    _data['url'] = url;
    _data['showTimer'] = showTimer;
    return _data;
  }
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.hierarchy,
    required this.refundable,
    required this.beautifiedName,
    required this.isVASEnabled,
  });
  late final int id;
  late final String name;
  late final String hierarchy;
  late final bool refundable;
  late final String beautifiedName;
  late final bool isVASEnabled;

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    hierarchy = json['hierarchy'];
    refundable = json['refundable'];
    beautifiedName = json['beautifiedName'];
    isVASEnabled = json['isVASEnabled'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['hierarchy'] = hierarchy;
    _data['refundable'] = refundable;
    _data['beautifiedName'] = beautifiedName;
    _data['isVASEnabled'] = isVASEnabled;
    return _data;
  }
}

class Brand {
  Brand({
    required this.isVirtual,
    required this.beautifiedName,
    required this.id,
    required this.name,
    required this.path,
  });
  late final bool isVirtual;
  late final String beautifiedName;
  late final int id;
  late final String name;
  late final String path;

  Brand.fromJson(Map<String, dynamic> json) {
    isVirtual = json['isVirtual'];
    beautifiedName = json['beautifiedName'];
    id = json['id'];
    name = json['name'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['isVirtual'] = isVirtual;
    _data['beautifiedName'] = beautifiedName;
    _data['id'] = id;
    _data['name'] = name;
    _data['path'] = path;
    return _data;
  }
}

class MetaBrand {
  MetaBrand({
    required this.id,
    required this.name,
    required this.beautifiedName,
    required this.isVirtual,
    required this.path,
  });
  late final int id;
  late final String name;
  late final String beautifiedName;
  late final bool isVirtual;
  late final String path;

  MetaBrand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    beautifiedName = json['beautifiedName'];
    isVirtual = json['isVirtual'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['beautifiedName'] = beautifiedName;
    _data['isVirtual'] = isVirtual;
    _data['path'] = path;
    return _data;
  }
}

class AllVariants {
  AllVariants({
    required this.itemNumber,
    required this.value,
    required this.inStock,
    required this.currency,
    required this.barcode,
    required this.price,
  });
  late final int? itemNumber;
  late final String? value;
  late final bool? inStock;
  late final String? currency;
  late final String? barcode;
  late final dynamic price;

  AllVariants.fromJson(Map<String, dynamic> json) {
    itemNumber = json['itemNumber'];
    value = json['value'];
    inStock = json['inStock'];
    currency = json['currency'];
    barcode = json['barcode'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['itemNumber'] = itemNumber;
    _data['value'] = value;
    _data['inStock'] = inStock;
    _data['currency'] = currency;
    _data['barcode'] = barcode;
    _data['price'] = price;
    return _data;
  }
}

class OriginalCategory {
  OriginalCategory({
    required this.id,
    required this.name,
    required this.hierarchy,
    required this.refundable,
    required this.beautifiedName,
    required this.isVASEnabled,
  });
  late final int id;
  late final String name;
  late final String hierarchy;
  late final bool refundable;
  late final String beautifiedName;
  late final bool isVASEnabled;

  OriginalCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    hierarchy = json['hierarchy'];
    refundable = json['refundable'];
    beautifiedName = json['beautifiedName'];
    isVASEnabled = json['isVASEnabled'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['hierarchy'] = hierarchy;
    _data['refundable'] = refundable;
    _data['beautifiedName'] = beautifiedName;
    _data['isVASEnabled'] = isVASEnabled;
    return _data;
  }
}

class ContentDescriptions {
  ContentDescriptions({
    required this.description,
    required this.bold,
  });
  late final String description;
  late final bool bold;

  ContentDescriptions.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    bold = json['bold'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['description'] = description;
    _data['bold'] = bold;
    return _data;
  }
}
class Descriptions {
	String? text;
	int? priority;

	Descriptions({this.text, this.priority});

	Descriptions.fromJson(Map<String, dynamic> json) {
		text = json['text'];
		priority = json['priority'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['text'] = this.text;
		data['priority'] = this.priority;
		return data;
	}
}

class TextComponents {
	String? pre;
	String? mid;
	String? post;

	TextComponents({this.pre, this.mid, this.post});

	TextComponents.fromJson(Map<String, dynamic> json) {
		pre = json['pre'];
		mid = json['mid'];
		post = json['post'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['pre'] = this.pre;
		data['mid'] = this.mid;
		data['post'] = this.post;
		return data;
	}
}


class Gender {
  Gender({
    required this.name,
    required this.id,
  });
  late final dynamic name;
  late final dynamic id;

  Gender.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['id'] = id;
    return _data;
  }
}

class WebGender {
  WebGender({
    required this.name,
    required this.id,
  });
  late final dynamic name;
  late final dynamic id;

  WebGender.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<dynamic, dynamic> toJson() {
    final _data = <dynamic, dynamic>{};
    _data['name'] = name;
    _data['id'] = id;
    return _data;
  }
}

class Promotions {
  Promotions({
    required this.promotionRemainingTime,
    required this.type,
    required this.text,
    required this.id,
    required this.promotionDiscountType,
    required this.link,
  });
  late final String promotionRemainingTime;
  late final int type;
  late final String text;
  late final int id;
  late final String promotionDiscountType;
  late final String link;

  Promotions.fromJson(Map<String, dynamic> json) {
    promotionRemainingTime = json['promotionRemainingTime'];
    type = json['type'];
    text = json['text'];
    id = json['id'];
    promotionDiscountType = json['promotionDiscountType'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['promotionRemainingTime'] = promotionRemainingTime;
    _data['type'] = type;
    _data['text'] = text;
    _data['id'] = id;
    _data['promotionDiscountType'] = promotionDiscountType;
    _data['link'] = link;
    return _data;
  }
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
    required this.centralRegistrationSystemNumber,
    required this.taxNumber,
    required this.sellerScore,
    required this.sellerScoreColor,
    required this.deliveryProviderName,
    required this.corporateInvoiceApplicable,
    required this.locationBasedSales,
    required this.sellerLink,
  });
  late final bool? isSearchableMerchant;
  late final List<dynamic> stickers;
  late final List<MerchantBadges> merchantBadges;
  late final List<dynamic> merchantMarkers;
  late final int? id;
  late final String? name;
  late final String? officialName;
  late final String? cityName;
  late final String? centralRegistrationSystemNumber;
  late final String? taxNumber;
  late final dynamic sellerScore;
  late final String? sellerScoreColor;
  late final String? deliveryProviderName;
  late final bool? corporateInvoiceApplicable;
  late final bool? locationBasedSales;
  late final String? sellerLink;

  Merchant.fromJson(Map<String, dynamic> json) {
    isSearchableMerchant = json['isSearchableMerchant'];
    stickers = List.castFrom<dynamic, dynamic>(json['stickers']);
    merchantBadges = List.from(json['merchantBadges'])
        .map((e) => MerchantBadges.fromJson(e))
        .toList();
    merchantMarkers = List.castFrom<dynamic, dynamic>(json['merchantMarkers']);
    id = json['id'];
    name = json['name'];
    officialName = json['officialName'];
    cityName = json['cityName'];
    centralRegistrationSystemNumber = json['centralRegistrationSystemNumber'];
    taxNumber = json['taxNumber'];
    sellerScore = json['sellerScore'];
    sellerScoreColor = json['sellerScoreColor'];
    deliveryProviderName = json['deliveryProviderName'];
    corporateInvoiceApplicable = json['corporateInvoiceApplicable'];
    locationBasedSales = json['locationBasedSales'];
    sellerLink = json['sellerLink'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['isSearchableMerchant'] = isSearchableMerchant;
    _data['stickers'] = stickers;
    _data['merchantBadges'] = merchantBadges.map((e) => e.toJson()).toList();
    _data['merchantMarkers'] = merchantMarkers;
    _data['id'] = id;
    _data['name'] = name;
    _data['officialName'] = officialName;
    _data['cityName'] = cityName;
    _data['centralRegistrationSystemNumber'] = centralRegistrationSystemNumber;
    _data['taxNumber'] = taxNumber;
    _data['sellerScore'] = sellerScore;
    _data['sellerScoreColor'] = sellerScoreColor;
    _data['deliveryProviderName'] = deliveryProviderName;
    _data['corporateInvoiceApplicable'] = corporateInvoiceApplicable;
    _data['locationBasedSales'] = locationBasedSales;
    _data['sellerLink'] = sellerLink;
    return _data;
  }
}

class MerchantBadges {
  MerchantBadges({
    required this.webImageUrl,
    required this.mobileImageUrl,
    required this.type,
  });
  late final String webImageUrl;
  late final String mobileImageUrl;
  late final String type;

  MerchantBadges.fromJson(Map<String, dynamic> json) {
    webImageUrl = json['webImageUrl'];
    mobileImageUrl = json['mobileImageUrl'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['webImageUrl'] = webImageUrl;
    _data['mobileImageUrl'] = mobileImageUrl;
    _data['type'] = type;
    return _data;
  }
}

class DeliveryInformation {
  DeliveryInformation({
    required this.isRushDelivery,
    required this.deliveryDate,
    required this.fastDeliveryOptions,
  });
  late final bool isRushDelivery;
  late final String deliveryDate;
  late final List<dynamic> fastDeliveryOptions;

  DeliveryInformation.fromJson(Map<String, dynamic> json) {
    isRushDelivery = json['isRushDelivery'];
    deliveryDate = json['deliveryDate'];
    fastDeliveryOptions =
        List.castFrom<dynamic, dynamic>(json['fastDeliveryOptions']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['isRushDelivery'] = isRushDelivery;
    _data['deliveryDate'] = deliveryDate;
    _data['fastDeliveryOptions'] = fastDeliveryOptions;
    return _data;
  }
}

class RatingScore {
  RatingScore({
    required this.averageRating,
    required this.totalRatingCount,
    required this.totalCommentCount,
  });
  late final dynamic averageRating;
  late final int totalRatingCount;
  late final int totalCommentCount;

  RatingScore.fromJson(Map<String, dynamic> json) {
    averageRating = json['averageRating'];
    totalRatingCount = json['totalRatingCount'];
    totalCommentCount = json['totalCommentCount'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['averageRating'] = averageRating;
    _data['totalRatingCount'] = totalRatingCount;
    _data['totalCommentCount'] = totalCommentCount;
    return _data;
  }
}

class CrossPromotionAward {
  CrossPromotionAward({
    this.awardType,
    this.awardValue,
    required this.contentId,
    required this.merchantId,
  });
  late final Null awardType;
  late final Null awardValue;
  late final int contentId;
  late final int merchantId;

  CrossPromotionAward.fromJson(Map<String, dynamic> json) {
    awardType = null;
    awardValue = null;
    contentId = json['contentId'];
    merchantId = json['merchantId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['awardType'] = awardType;
    _data['awardValue'] = awardValue;
    _data['contentId'] = contentId;
    _data['merchantId'] = merchantId;
    return _data;
  }
}

class WalletRebate {
  WalletRebate({
    required this.minPrice,
    required this.maxPrice,
    required this.rebateRatio,
  });
  late final int minPrice;
  late final int maxPrice;
  late final double rebateRatio;

  WalletRebate.fromJson(Map<String, dynamic> json) {
    minPrice = json['minPrice'];
    maxPrice = json['maxPrice'];
    rebateRatio = json['rebateRatio'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['minPrice'] = minPrice;
    _data['maxPrice'] = maxPrice;
    _data['rebateRatio'] = rebateRatio;
    return _data;
  }
}

class FilterableLabels {
  FilterableLabels({
    required this.id,
    required this.name,
    required this.displayName,
    required this.visibleAgg,
  });
  late final String id;
  late final String name;
  late final String displayName;
  late final bool visibleAgg;

  FilterableLabels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    displayName = json['displayName'];
    visibleAgg = json['visibleAgg'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['displayName'] = displayName;
    _data['visibleAgg'] = visibleAgg;
    return _data;
  }
}

class CustomValues {
  CustomValues({
    required this.key,
    required this.value,
  });
  late final String key;
  late final String value;

  CustomValues.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['key'] = key;
    _data['value'] = value;
    return _data;
  }
}

class Headers {
  Headers({
    required this.tysidecarcachable,
  });
  late final String tysidecarcachable;

  Headers.fromJson(Map<String, dynamic> json) {
    tysidecarcachable = json['tysidecarcachable'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['tysidecarcachable'] = tysidecarcachable;
    return _data;
  }
}

