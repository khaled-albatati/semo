class AppLink {
  // static const String server ="localhost:8000/Haz4u";
  static const String server = "https://semodelivery.com/"; //for emulator
  // static const String server ="http://127.0.0.1/semoo"; //for emulator
  static const String imagesstatic = "https://semodelivery.com/images"; //for emulator


  static const String test = "$server/test.php";
  //================== Images ==================\\


  static const String restaurantImage = "$imagesstatic/restaurants"; //for emulator
  static const String categoriesImage = "$imagesstatic/categories";
  static const String foodImage = "$imagesstatic/food";




  /// ITEMS \\\
  static const String itemsImage = "$imagesstatic/";



  //================|| PHP ||================\\

  //================== AUTH ==================\\
  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String deleteAccount = "$server/delete_account.php";
  static const String editUserName= "$server/auth/edit/editUserName.php";
  static const String editPhone = "$server/auth/edit/editPhone.php";
  static const String editEmail= "$server/auth/edit/editEmail.php";
  static const String editPassword= "$server/auth/edit/editPassword.php";
  static const String profile = "$server/auth/profile.php";

  //================== Display ==================\\
  static const String restaurantHome = "$server/restaurants/restaurantsListAll.php";
  static const String restaurantLast = "$server/restaurants/restaurantsList.php";
  static const String foodsLast = "$server/foods/foodsLast.php";
  static const String foodsList = "$server/foods/foodsList.php";
  static const String menu= "$server/restaurants/menu.php";
  static const String menufamily= "$server/restaurants/menufamily.php";
  static const String menurestaurant= "$server/restaurants/menurestaurant.php";
  static const String menucat= "$server/restaurants/menucat.php";
  static const String menucatlist= "$server/restaurants/menucatlist.php";
  static const String menucatlist3= "$server/restaurants/menucatlist3.php";
  static const String menucatlistcount= "$server/restaurants/menucatlistcount.php";

  static const String restaurantCategories = "$server/restaurants/restaurantsCategories.php";
  static const String restaurantsHomeMenu = "$server/restaurants/restaurantsHomeMenu.php";


  static const String categoriesHome= "$server/categories/categoriesHome.php";


  static const String homePage = "$server/home.php";
  static const String womenhomePage = "$server/categories/view.php";
  static const String homehomePage = "$server/categories/homehome.php";

  //================== Offer =====================\\

  // static const String categories ="$server/categories/view.php";
  static const String items = "$server/items/items.php";
  static const String itemstest = "$server/items/itemtest.php";
  static const String itemstest1 = "$server/items/itemtest1.php";

  static const String itemshome = "$server/items/itemshome.php";

  static const String itemsWithFavorite = "$server/items/items1.php";
  static const String itemsDetails = "$server/items/itemsdetails.php";

  //====================Data================\\
  static const String favorite = "$server/items/favorite.php";
  static const String deletefromfav = "$server/favorite/deletefromfav.php";
  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String users = "$server/users.php";


  //====================Cart================\\
  static const String cartview = "$server/cart/view.php";
  static const String cartadd = "$server/cart/add.php";
  static const String cartdelete = "$server/cart/delete.php";
  static const String cartgetcountitems = "$server/cart/getcountitems.php";

  //================== Search ==================\\
  static const String searchitems = "$server/items/search.php";
  // Address
  //================== Address ==================\\
  static const String addressView = "$server/address/view.php";
  static const String addressViewPrice = "$server/address/view_price.php";
  static const String addAddressPrice= "$server/address/addAddress.php";
  static const String addressAdd = "$server/address/add.php";
  static const String addressEdit = "$server/address/edit.php";
  static const String addressDelete = "$server/address/delete.php";
  static const String addressToAddress = "$server/address/from_to.php";
  static const String addressPrice = "$server/address/price.php";
  static const String sendAddressToAddress = "$server/address/from_to_send.php";

  //================== Coupon ==================\\
  static const String checkcoupon = "$server/coupon/checkcoupon(1).php";
  static const String validateCoupon = "$server/coupon/validateCoupon.php";

  //================== Checkout ==================\\
  static const String checkout = "$server/orders/checkout.php";
  static const String deleteCount= "$server/cart/deleteCount.php";

  static const String pendingorders = "$server/orders/pending.php";
  static const String ordersarchive = "$server/orders/archive.php";
  static const String ordersdetails = "$server/orders/details.php";
  static const String ordersdelete = "$server/orders/delete.php";
  static const String addressOrders = "$server/orders/address_orders.php";

  static const String trackWsl = "$server/orders/trackWsl.php";



  static const String notif = "$server/noti/noti.php";


static const String wallet = "$server/wallet/wallet.php";
static const String eWallet = "$server/wallet/eWallet.php";

  //================== Rating ==================\\
  static const String rating = "$server/rating.php";
}
