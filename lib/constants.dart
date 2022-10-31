import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class Constants {
  static int colorpadrao = 0xFF1B2838;
  static int colorThemePurple = 0xFF6408CC;
  static int colorappbar = 0xFFB3B1B6;


  //titulo
  static String titulo = 'LookStart';

  //URL
  static String urltopgames = 'https://api.rawg.io/api/games?key=e34347145e534d248d800b0b8f9547e9&metacritic=90,100';
  static String urlPC = 'https://api.rawg.io/api/games?key=e34347145e534d248d800b0b8f9547e9&metacritic=90,100&platforms=4';
  static String urlPS5 = 'https://api.rawg.io/api/games?key=e34347145e534d248d800b0b8f9547e9&metacritic=90,100&platforms=187';
  static String urlPS4 = 'https://api.rawg.io/api/games?key=e34347145e534d248d800b0b8f9547e9&metacritic=90,100&platforms=18';
  static String urlNintendo = 'https://api.rawg.io/api/games?key=e34347145e534d248d800b0b8f9547e9&metacritic=90,100&platforms=7';
  static String urlXboxs = 'https://api.rawg.io/api/games?key=e34347145e534d248d800b0b8f9547e9&metacritic=90,100&platforms=186';
  static String urlXboxx = 'https://api.rawg.io/api/games?key=e34347145e534d248d800b0b8f9547e9&metacritic=90,100&platforms=186';
  static String urlandroid = 'https://api.rawg.io/api/games?key=e34347145e534d248d800b0b8f9547e9&metacritic=90,100&platforms=21';
  static String urlOIS = 'https://api.rawg.io/api/games?key=e34347145e534d248d800b0b8f9547e9&metacritic=90,100&platforms=3';

  //IMAGENS
  static String logo = 'assets/logo.png';
  static String android = 'assets/android.jpg';
  static String ios = 'assets/ios.jpg';
  static String pc = 'assets/pc.jpg';
  static String ps4 = 'assets/ps4.png';
  static String ps5 = 'assets/ps5.jpg';
  static String nintendo = 'assets/switch.jpg';
  static String xboxs = 'assets/xboxseries.jpg';
  static String xboxx = 'assets/xboxseriex.jpg';

  // TRANSLATE
  static String findplace = 'Encontre um lugar ...';
  static String searchingText = 'Por favor, aguarde ...';

  static String appFont = 'Proxima';
  static String appFontBold = 'ProximaBold';

  static String registrationOTP = 'regOTP';
  static String registrationEmail = 'regEmail';
  static String registrationPhone = 'regPhone';
  static String registrationUserId = 'userId';

  static String bankIFSC = 'bank_IFSC';
  static String bankMICR = 'bank_MICR';
  static String bankACCName = 'bank_ACC_Name';
  static String bankACCNumber = 'bank_ACC_Number';

  static String loginOTP = 'loginOTP';
  static String loginEmail = 'loginEmail';
  static String loginPhone = 'loginPhone';
  static String loginUserId = 'loggeduserId';
  static String loginUserImage = 'loggedImage';
  static String loginUserName = 'loggedName';

  static String headerToken = 'Token de cabeçalho';
  static String isLoggedIn = 'Está logado';
  static String stripePaymentToken = 'Stripe Token de pagamento';

  static String selectedAddress = 'Endereço selecionado';
  static String selectedAddressId = 'ID de endereço selecionado';
  static String recentSearch = 'Pesquisa recente';

  static String appSettingCurrency = 'Moeda de configuração do aplicativo';
  static String appSettingCurrencySymbol = 'App definindo o símbolo de moeda';
  static String appSettingPrivacyPolicy = 'appSettingPrivacyPolicy';
  static String appSettingTerm = 'appSettingTerm';
  static String appAboutCompany = 'appAboutCompany';
  static String appSettingHelp = 'appSettingHelp';
  static String appSettingAboutUs = 'appSettingAboutUs';
  static String appSettingDriverAutoRefresh = 'appSettingDriverAutoRefresh';
  static String appSettingBusinessAvailability =
      'appSettingBusiness_availability';
  static String appSettingBusinessMessage = 'appSettingBusiness_message';
  static String appSettingCustomerAppId = 'appSettingCustomerAppId';
  static String appSettingAndroidCustomerVersion =
      'appSetting_android_customer_version';
  static String appSettingIsPickup = 'appSetting_isPickup';
  static String appPushOneSingleToken = 'push_oneSingleToken';

  static String previousLat = 'previousLat';
  static String previousLng = 'previousLng';

  // payment Setting
  static String appPaymentWallet = 'appPaymentWallet';
  static String appPaymentCOD = 'appPaymentCOD';
  static String appPaymentStripe = 'appPaymentStripe';
  static String appPaymentRozerPay = 'appPaymentRozerPay';
  static String appPaymentPaypal = 'appPaymentPaypal';
  static String appStripePublishKey = 'appStripePublishKey';
  static String appStripeSecretKey = 'appStripeSecretKey';
  static String appPaypalProduction = 'appPaypalProducation';
  static String appPaypalClientId = 'appPaypal_client_id';
  static String appPaypalSecretKey = 'appPaypal_secret_key';
  static String appPaypalSendBox = 'appPaypalSendbox';
  static String appRozerpayPublishKey = 'appRozerpayPublishKey';

  static Future<bool> checkNetwork(context) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // ignore: avoid_print
      print('Conectado com Mobile');
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // ignore: avoid_print
      print('Conectado com Wifi');
      return true;
    } else {
      Constants.snackbarpage("Sem conexão com a internet", context);
      return false;
    }
  }

  static snackbarpage(String msg, context) {
    final snackBar = SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 6),
      action: SnackBarAction(
        label: 'Sair',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
