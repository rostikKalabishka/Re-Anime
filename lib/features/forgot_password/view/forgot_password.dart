import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:re_anime_app/ui/ui.dart';

@RoutePage()
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late final TextEditingController forgotPasswordController;
  @override
  void initState() {
    forgotPasswordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Forgot password'),
          ),
          SliverToBoxAdapter(
            child: BaseContainerWidget(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Column(
                  children: [
                    Text('asdasdasdsadasdasdsadsasad'),
                    BaseTextFieldWidget(controller: forgotPasswordController)
                  ],
                )),
          )
        ],
      ),
    );
  }
}
