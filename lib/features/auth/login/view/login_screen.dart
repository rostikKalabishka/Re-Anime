import 'package:flutter/material.dart';
import 'package:re_anime_app/ui/ui.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              floating: true,
              centerTitle: true,
              surfaceTintColor: Colors.transparent,
              title: Text('Login'),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                width: double.infinity,
              ),
            ),
            SliverToBoxAdapter(
                child: BaseContainerWidget(
                    borderRadius: 16,
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      spacing: 16,
                      children: [
                        BaseTextFieldWidget(controller: emailController),
                        BaseTextFieldWidget(controller: passwordController),
                        BaseButtonWidget(
                          onPressed: () {},
                          child: Text(
                            'dasdasd',
                            style: theme.textTheme.titleMedium,
                          ),
                        )
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
