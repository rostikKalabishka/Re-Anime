import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re_anime_app/blocs/authorization_by_another_bloc/auth_by_another_bloc.dart';
import 'package:re_anime_app/features/auth/login/bloc/login_bloc.dart';
import 'package:re_anime_app/router/router.dart';

import '../../../../utils/utils.dart';
import '../../widgets/widgets.dart';
import 'package:re_anime_app/ui/ui.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool obscurePassword = true;
  double _formOpacity = 0.0;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _formOpacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              AutoRouter.of(context)
                  .pushAndPopUntil(LoaderRoute(), predicate: (router) => false);
            }
          },
          child: AnimatedOpacity(
            opacity: _formOpacity,
            duration: Duration(milliseconds: 1000),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  snap: true,
                  floating: true,
                ),
                SliverToBoxAdapter(
                  child: const SizedBox(height: 16),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    width: double.infinity,
                    child: ReAnimeWidget(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: const SizedBox(
                    width: double.infinity,
                  ),
                ),
                SliverToBoxAdapter(
                  child: BaseContainerWidget(
                    borderRadius: BorderRadius.circular(16),
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(16),
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
                                    ? CupertinoIcons.eye
                                    : CupertinoIcons.eye_slash,
                              ),
                            ),
                            validator: (value) =>
                                FormValidators.passwordValidator(value),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: InkWell(
                                onTap: () {
                                  AutoRouter.of(context).push(
                                    ForgotPasswordRoute(),
                                  );
                                },
                                child: Text(
                                  'Forgot Password?',
                                  style: theme.textTheme.bodyMedium
                                      ?.copyWith(color: AppColors.linkColors),
                                )),
                          ),
                          BaseButtonWidget(
                            onPressed: () {
                              login(context);
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  child: BlocListener<AuthByAnotherBloc, AuthByAnotherState>(
                    listener: (BuildContext context, state) {
                      if (state is AuthByAnotherSuccess) {
                        AutoRouter.of(context).pushAndPopUntil(LoaderRoute(),
                            predicate: (router) => false);
                      }
                    },
                    child: BaseContainerWidget(
                      borderRadius: BorderRadius.circular(16),
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        spacing: 16,
                        children: [
                          ButtonAuthWidget(
                            textColor: Colors.black,
                            color: Colors.white,
                            image: AppConst.googleSvg,
                            onTap: () {
                              context
                                  .read<AuthByAnotherBloc>()
                                  .add(AuthWithGoogleEvent());
                            },
                            text: 'Sign in with Google',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont you have an account? ',
                        style: theme.textTheme.bodyMedium,
                      ),
                      GestureDetector(
                        onTap: () {
                          AutoRouter.of(context).pushAndPopUntil(
                              RegistrationRoute(),
                              predicate: (router) => false);
                        },
                        child: Text('Sign up',
                            style: theme.textTheme.bodyMedium
                                ?.copyWith(color: AppColors.linkColors)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final String email = emailController.text.trim();
      final String password = passwordController.text.trim();
      context
          .read<LoginBloc>()
          .add(LoginRequired(email: email, password: password));
    }
  }
}
