
import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:updent/core/util/blured_router.dart';
import 'package:updent/features/onborading/presentation/onboarding_screen.dart';

class Routers {
  Routers._(); //priv cons

  static const String splash = "/";
  static const String onboardingSCreen = "/onboardingScreen";
  static const String welcomeSCreen = "/welcomeScreen";

  static const String homeScreen = "/homeScreen";
  static const String dashboardScreen = "/dashboardScreen";
  static const String loginScreen = "/loginScreen";
  static const String sendOTPScreen = "/sendOTPScreen";
  static const String vehcileFitmentScreen = "/vehicleFitmentScreen";
  static const String searchMakeScreen = "/searchMakeScreen";
  static const String searchModelScreen = "/searchModelsScreen";
  static const String searchOriginScreen = "/searchOriginScreen";
  static const String searchYearScreen = "/searchYearScreen";
  static const String searchEngineScreen = "/searchEngineScreen";
  static const String partScreen = "/partScreen";
  static const String productListScreen = "/productListScreen";
  static const String searchProductScreen = "/searchProductScreen";
  static const String cartListScreen = "/cartListScreen";

  static const String productDetailScreen = "/productDetailScreen";
  static const String verifyOTPScreen = "/verifyOTPScreen";
  static const String manageAddressScreen = "/manageAddressScreen";
  static const String locationScreen = "/locationScreen";
  static const String addAddressScreen = "/addAdressScreen";
  static const String paymentMethodScreen = "/paymentMethodScreen";
  static const String orderPageScreen = "/orderPageScreen";
  static const String myOrdersScreem = "/myOrdersScreem";

  static const String productRequestScreen = "/productRequestScreen";
  static const String productRequestListScreen = "/productRequestListScreen";


  static String currentRoute = splash;
  static String previousCustomerRoute = splash;
  static Route? onGenerateRouted(RouteSettings routeSettings) {
    previousCustomerRoute = currentRoute;
    currentRoute = routeSettings.name ?? "";
    log("CURRENT ROUTE $currentRoute");

    switch (routeSettings.name) {
      // case splash:
      //   return Splash.route(routeSettings);
      case onboardingSCreen:
        return Onboarding.route(routeSettings);
      // case welcomeSCreen:
      //   return WelcomeScreen.route(routeSettings);
      // case loginScreen:
      //   return LoginScreen.route(routeSettings);
      // case sendOTPScreen:
      //   return SignUpScreen.route(routeSettings);
      // case dashboardScreen:
      //   return Dashboard.route(routeSettings);

      // case searchMakeScreen:
      //   return SearchMakeScreen.route(routeSettings);
      // case searchModelScreen:
      //   return SearchModelScreen.route(routeSettings);

      // case partScreen:
      //   return PartsPage.route(routeSettings);

      // case verifyOTPScreen:
      //   return VerifyOtp.route(routeSettings);

      // case searchEngineScreen:
      //   return SearchEngineScreen.route(routeSettings);
      // // case loginScreen:

      // case productListScreen:
      //   return ProductListScreen.route(routeSettings);

      // case productDetailScreen:
      //   return ProductDetailScreen.route(routeSettings);

      // case searchProductScreen:
      //   return SearchProductScreen.route(routeSettings);

      // case cartListScreen:
      //   return CartScreen.route(routeSettings);

      // case manageAddressScreen:
      //   return ManageAddress.route(routeSettings);

      // case locationScreen:
      //   return GoogleMapsScreen.route(routeSettings);

      // case addAddressScreen:
      //   return AddAddress.route(routeSettings);

      // case paymentMethodScreen:
      //   return PaymentScreen.route(routeSettings);

      // case orderPageScreen:
      //   return OrderDetailPage.route(routeSettings);

      // case myOrdersScreem:
      //   return MyOrder.route(routeSettings);

      // case productRequestScreen:
      //   return RequestProductScreen.route(routeSettings);

      //    case productRequestListScreen:
      //   return ProductRequestsScreen.route(routeSettings);

        

      ///default
      default:
        return BlurredRouter(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text("No page found"),
              ),
            );
          },
        );
      // case splash:
      //   return BlurredRouter(builder: ((context) => const SplashScreen()));
    }
  }
}
