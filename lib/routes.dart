import 'package:get/get.dart';
import 'package:semo/core/constant/routes.dart';
import 'package:semo/screens/cart.dart';
import 'package:semo/screens/dessert_screen.dart';
import 'package:semo/screens/home_screen.dart';
import 'package:semo/screens/inbox_screen.dart';
import 'package:semo/screens/login_screen.dart';
import 'package:semo/screens/menu_page.dart';
import 'package:semo/screens/myorder_screen.dart';
import 'package:semo/screens/navbar.dart';
import 'package:semo/screens/new_pwscreen.dart';
import 'package:semo/screens/profile.dart';
import 'package:semo/screens/sent_otpscreen.dart';
import 'package:semo/screens/signup_screen.dart';
import 'package:semo/screens/splash_screen.dart';
import 'package:semo/screens/track_wsl.dart';
import 'package:semo/widgets/change_screen/delete_account.dart';
import 'package:semo/widgets/change_screen/email.dart';
import 'package:semo/widgets/change_screen/password.dart';
import 'package:semo/widgets/change_screen/phone.dart';
import 'package:semo/widgets/change_screen/username.dart';
import 'card.dart';
import 'screens/orders/details.dart';
import 'screens/orders/pending.dart';
import 'screens/payment.dart';
import 'screens/restaurants_categories.dart';
import 'view/tracking.dart';
import 'widgets/address/adddetails.dart';
import 'widgets/address/view.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const NavBar()),
// GetPage(name:"/", page:()=> const  SplashScreen(),middlewares: [
//   MyMiddleWare(),
// ]),

  // ========================= Auth =========================\\
  GetPage(
    name: AppRoutes.login,
    page: () => const LoginScreen(),
  ),
  GetPage(name: AppRoutes.developer, page: () => const Card()),
  GetPage(
    name: AppRoutes.trackWsl,
    page: () => const TrackWsl(),
  ),
  GetPage(
    name: AppRoutes.deleteAccountPage,
    page: () => const DeleteAccount(),
  ),
  GetPage(
      name: AppRoutes.restaurantCategories,
      page: () => const RestaurantsCategories()),
  GetPage(
    name: AppRoutes.cart,
    page: () => const Cart(),
  ),
  // GetPage(
  //   name: AppRoutes.menu,
  //   page: () => const Menu(),
  // ),
  GetPage(
    name: AppRoutes.menuPage,
    page: () => const MenuPage(),
  ),

  GetPage(
    name: AppRoutes.changeEmail,
    page: () => const ChangeEmail(),
  ),
  GetPage(
    name: AppRoutes.changePassword,
    page: () => const ChangePassword(),
  ),
  GetPage(
    name: AppRoutes.changeUserName,
    page: () => const ChangeUserName(),
  ),

  GetPage(
    name: AppRoutes.changePhone,
    page: () => const ChangePhone(),
  ),
    GetPage(
    name: AppRoutes.payment,
    page: () => const Payment(),
  ),


  GetPage(
    name: AppRoutes.signUp,
    page: () => SignUpScreen(),
  ),
  // GetPage(
  //   name: AppRoutes.verviyCodeSignUp,
  //   page: () => const VerviyCodeSignUp(),
  // ),
  // GetPage(
  //   name: AppRoutes.successSignUp,
  //   page: () => const SuccessSignUp(),
  // ),
  GetPage(
    name: AppRoutes.verfiyCode,
    page: () => const SendOTPScreen(),
  ),
  // ========================= Start =========================\\
  GetPage(
    name: AppRoutes.splashScreenone,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: AppRoutes.dessertScreen,
    page: () => const DessertScreen(),
  ),
  GetPage(
    name: AppRoutes.navbar,
    page: () => const NavBar(),
  ),
  GetPage(
    name: AppRoutes.homePage,
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: AppRoutes.newPwScreen,
    page: () => const NewPwScreen(),
  ),
  GetPage(
    name: AppRoutes.sendOTPScreen,
    page: () => const SendOTPScreen(),
  ),

  GetPage(
    name: AppRoutes.profile,
    page: () => const Profile(),
  ),
  GetPage(
    name: AppRoutes.myorderscreen,
    page: () => const MyOrderScreen(),
  ),
  GetPage(
    name: AppRoutes.inboxScreen,
    page: () => const InboxScreen(),
  ),
  GetPage(
    name: AppRoutes.tracking,
    page: () => const Tracking(),
  ),
  GetPage(
    name: AppRoutes.addressadddetails,
    page: () => const AddressAddDetails(),
  ),
 
  // ========================= Address =========================\\
  GetPage(name: AppRoutes.addressview, page: () => const AddressView()),

  // GetPage(name: AppRoutes.addressadd, page: () => const AddressAdd()),
  GetPage(
      name: AppRoutes.addressadddetails, page: () => const AddressAddDetails()),

  // ========================= Checkout =========================\\
  GetPage(name: AppRoutes.orderspending, page: () => const OrdersPending()),
  // GetPage(name: AppRoutes.ordersarchive, page: () => const OrdersArchiveView()),
  GetPage(name: AppRoutes.ordersdetails, page: () => const OrdersDetails()),
];



// Map<String, Widget Function(BuildContext)> routess = {
//   AppRoutes.homeScreen: (context) => const HomeScreen(),
//   AppRoutes.splashScreen: (context) => const SplashScreen(),
//   AppRoutes.login: (context) => const Login(),
//   AppRoutes.signUp: (context) => const SignUp(),
//   AppRoutes.forgetPassword: (context) => const ForgetPassword(),
//   AppRoutes.verfiyCode: (context) => const VerfiyCode(),
//   AppRoutes.resetPassword: (context) => const ResetPassword(),
//   AppRoutes.successResetPassword: (context) => const SuccessResetPassword(),
//   AppRoutes.successSignUp: (context) => const SuccessSignUp(),
//   AppRoutes.verviyCodeSignUp: (context) => const VerviyCodeSignUp(),
// };
