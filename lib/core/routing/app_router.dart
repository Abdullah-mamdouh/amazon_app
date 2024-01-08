import 'package:amazon_app/features/auth/logic/sign-up_cubit/sign_up_cubit.dart';
import 'package:amazon_app/features/auth/ui/sign_up_page.dart';
import 'package:amazon_app/features/get_products/logic/cubit.dart';
import 'package:amazon_app/features/get_products/ui/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../di/dependency_injection.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => Container(color: Colors.red,),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignUpPage(),
          ),
        );
      case Routes.getProductScren:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<GetProductCubit>(),
            child: const ProductScreen(),
          ),
        );
        // case Routes.homeScreen:
        // return MaterialPageRoute(
        //   builder: (_) => const HomeScreen(),
        // );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
