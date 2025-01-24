import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/utils.dart';
import '../../widgets/widgets.dart';
import 'package:re_anime_app/ui/ui.dart';
import 'package:re_anime_app/ui/theme/theme.dart';

@RoutePage()
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late final TextEditingController emailController;
  late final TextEditingController usernameController;

  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool obscurePassword = true;
  bool confirmObscurePassword = true;
  @override
  void initState() {
    emailController = TextEditingController();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
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
              floating: true,
              // title: Text(
              //   'Sign in',
              //   style: theme.textTheme.headlineLarge,
              // ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                width: double.infinity,
                child: ReAnimeWidget(),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                width: double.infinity,
              ),
            ),
            SliverToBoxAdapter(
              child: BaseContainerWidget(
                borderRadius: BorderRadius.circular(16),
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    spacing: 16,
                    children: [
                      BaseTextFieldWidget(
                        controller: emailController,
                        hintText: 'example@gmail.com',
                        keyboardType: TextInputType.emailAddress,
                        helperText: 'email',
                        validator: (value) =>
                            FormValidators.emailValidator(value),
                      ),
                      BaseTextFieldWidget(
                        controller: usernameController,
                        hintText: 'John Doe',
                        keyboardType: TextInputType.text,
                        helperText: 'username',
                        validator: (value) =>
                            FormValidators.usernameValidator(value),
                      ),
                      BaseTextFieldWidget(
                        controller: passwordController,
                        helperText: 'password',
                        hintText: 'At least 8 characters',
                        keyboardType: TextInputType.text,
                        obscureText: obscurePassword,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscurePassword = !obscurePassword;
                            });
                          },
                          icon: Icon(
                            obscurePassword
                                // ? visibilityOutlined
                                // : visibilityOffOutlined,
                                ? CupertinoIcons.eye
                                : CupertinoIcons.eye_slash,
                          ),
                        ),
                        validator: (value) =>
                            FormValidators.passwordValidator(value),
                      ),
                      BaseTextFieldWidget(
                        controller: confirmPasswordController,
                        helperText: 'confirm password',
                        hintText: 'At least 8 characters',
                        keyboardType: TextInputType.text,
                        obscureText: confirmObscurePassword,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              confirmObscurePassword = !confirmObscurePassword;
                            });
                          },
                          icon: Icon(
                            confirmObscurePassword
                                // ? visibilityOutlined
                                // : visibilityOffOutlined,
                                ? CupertinoIcons.eye
                                : CupertinoIcons.eye_slash,
                          ),
                        ),
                        validator: (value) =>
                            FormValidators.confirmPasswordValidator(
                                value, passwordController.text),
                      ),
                      BaseButtonWidget(
                        onPressed: () {
                          login();
                        },
                        child: Text(
                          'Sign in',
                          style: theme.textTheme.titleMedium,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 20),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: theme.dividerColor,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Or sign in with ',
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: theme.dividerColor,
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: BaseContainerWidget(
                borderRadius: BorderRadius.circular(16),
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(16),
                child: Column(
                  spacing: 16,
                  children: [
                    ButtonAuthWidget(
                      textColor: Colors.black,
                      color: Colors.white,
                      image: AppConst.googleSvg,
                      onTap: () {},
                      text: 'Sign in with Google',
                    ),
                    ButtonAuthWidget(
                      color: Colors.black,
                      image: AppConst.appleSvg,
                      onTap: () {},
                      text: 'Sign in with Apple',
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Do you already have an account? ',
                    style: theme.textTheme.bodyMedium,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text('Sign in',
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(color: AppColors.linkColors)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void login() {
    if (_formKey.currentState!.validate()) {}
  }
}
