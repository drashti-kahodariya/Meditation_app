import 'dart:async';
import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';
import 'package:meditation_app/Controllers/authentication_controller.dart';
import 'package:meditation_app/Data/API/api_manager.dart';
import 'package:meditation_app/Repository/authentication_repository.dart';
import 'package:meditation_app/Screens/in_app_purchase_screen.dart';

class PremiumController extends GetxController {
  final authenticationRepository = AuthenticationRepository(APIManager());
  var authenticationController = Get.put(AuthenticationController());

  static const bool _kAutoConsume = true;

  static const String _kConsumableAndroidId = 'com.peter.relax_music.premium';
  static const String _kConsumableIOSId = "com.felix.meditate.monthly";

  static const List<String> _kProductIds = <String>[
    _kConsumableAndroidId,
  ];

  static const List<String> _kProductIdsIos = <String>[
    _kConsumableIOSId,
  ];

  final _inAppPurchase = InAppPurchase.instance;
  late StreamSubscription<List<PurchaseDetails>> _subscription;
  List<ProductDetails> _products = [];
  List<PurchaseDetails> _purchases = [];
  List<String> _consumables = [];
  bool _isAvailable = false;
  bool _purchasePending = false;
  String? _queryProductError;

  setPremium() {
    final Stream<List<PurchaseDetails>> purchaseUpdated =
        _inAppPurchase.purchaseStream;
    _inAppPurchase.purchaseStream.listen((event) {
      print("event $event");
    });
    _subscription = purchaseUpdated.listen((purchaseDetailsList) {
      listenToPurchaseUpdated(purchaseDetailsList);
    }, onDone: () {
      _subscription.cancel();
    }, onError: (error) {
      // handle error here.
    });
  }

  Future<void> initStoreInfo() async {
    EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.black);

    final bool isAvailable = await _inAppPurchase.isAvailable();
    if (!isAvailable) {
      _isAvailable = isAvailable;
      _products = [];
      _purchases = [];
      _consumables = [];
      _purchasePending = false;
      return;
    }

    if (Platform.isIOS) {
      var iosPlatformAddition = _inAppPurchase
          .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      await iosPlatformAddition.setDelegate(ExamplePaymentQueueDelegate());
    }
    ProductDetailsResponse productDetailResponse =
        await _inAppPurchase.queryProductDetails(
            Platform.isIOS ? _kProductIdsIos.toSet() : _kProductIds.toSet());

    print("Amit ${productDetailResponse.productDetails}");

    if (productDetailResponse.error != null) {
      _queryProductError = productDetailResponse.error!.message;
      _isAvailable = isAvailable;
      _products = productDetailResponse.productDetails;
      _purchases = [];
      _consumables = [];
      _purchasePending = false;
      return;
    }

    if (productDetailResponse.productDetails.isEmpty) {
      _queryProductError = null;
      _isAvailable = isAvailable;
      _products = productDetailResponse.productDetails;
      _purchases = [];
      _consumables = [];
      _purchasePending = false;
      return;
    }
    _isAvailable = isAvailable;
    _products = productDetailResponse.productDetails;
    // _consumables = consumables;
    _purchasePending = false;
    print("PRODUCTS::::$_products");

    var transactions = await SKPaymentQueueWrapper().transactions();
    print(transactions);
    transactions.forEach((skPaymentTransactionWrapper) {
      SKPaymentQueueWrapper().finishTransaction(skPaymentTransactionWrapper);
    });
    setPremium();
    EasyLoading.dismiss();
  }

  getPremium() async {
    ProductDetails productDetails = _products[0];
    PurchaseParam purchaseParam = GooglePlayPurchaseParam(
        productDetails: productDetails, applicationUserName: null);
    if (productDetails.id == _kConsumableAndroidId) {
      print("done");
      _inAppPurchase.buyConsumable(
          purchaseParam: purchaseParam,
          autoConsume: _kAutoConsume || Platform.isIOS);
    } else {
      _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
    }
  }

  void listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        print("pending");
        // showPendingUI();
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          // handleError(purchaseDetails.error!);
          print(purchaseDetails.error);
        } else if (purchaseDetails.status == PurchaseStatus.purchased) {
          print("Succccccesssssffffffuuullll");

          _inAppPurchase.restorePurchases();

          bool valid = await _verifyPurchase(purchaseDetails);
          if (valid) {
            deliverProduct();
          } else {
            print("Not valid");
            return;
          }
        }
        if (Platform.isAndroid) {
          if (!_kAutoConsume &&
              purchaseDetails.productID == _kConsumableAndroidId) {
            final InAppPurchaseAndroidPlatformAddition androidAddition =
                _inAppPurchase.getPlatformAddition<
                    InAppPurchaseAndroidPlatformAddition>();
            await androidAddition.consumePurchase(purchaseDetails);
          }
        }
        if (purchaseDetails.pendingCompletePurchase) {
          await _inAppPurchase.completePurchase(purchaseDetails);
        }
      }
    });
  }

  _verifyPurchase(PurchaseDetails purchaseDetails) async {
    // await _getPastPurchases();
    // final PurchaseDetails purchase = _hasPurchased(purchaseDetails.productID);
    // if (purchase != null) {
    //   if (purchase.status == PurchaseStatus.purchased) {
    //     return true;
    //   }
    // } else {
    return true;
    // }
  }

  Future<void> _getPastPurchases() async {
    // final QueryPurchaseDetailsResponse response =
    //     await _inAppPurchase.restorePurchases();
    // setState(() {
    //   _purchases = response.pastPurchases;
    // });
    // for (var i = 0; i < _purchases.length; i++) {
    //   print("_purchses from Past ------------" + _purchases[i].productID);
    // }
  }

  PurchaseDetails _hasPurchased(String productID) {
    print("_purchses ID from _hasPurchased ------------" + productID);
    for (var i = 0; i < _purchases.length; i++) {
      print("_purchses from _hasPurchased ------------" +
          _purchases[i].productID);
    }
    return _purchases.firstWhere((purchase) => purchase.productID == productID);
  }

  Future<void> deliverProduct() async {
    print("IN DELIVERED");
    await authenticationRepository.getPremiumVideo(
        userId: authenticationController.currentUserData.value.sId);
    await authenticationController.getAndSetUser();
    print("IN DELIVERED BOTTOM");

    update();
    Get.back();
  }
}
