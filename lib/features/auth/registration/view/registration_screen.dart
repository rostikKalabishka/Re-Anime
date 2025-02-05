import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re_anime_app/blocs/authorization_by_another_bloc/auth_by_another_bloc.dart';
import 'package:re_anime_app/features/auth/registration/bloc/registration_bloc.dart';
import 'package:re_anime_app/router/router.dart';

import '../../../../utils/utils.dart';
import '../../widgets/widgets.dart';
import 'package:re_anime_app/ui/ui.dart';

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
        body: BlocListener<RegistrationBloc, RegistrationState>(
          listener: (context, state) {
            if (state is RegistrationSuccess) {
              AutoRouter.of(context)
                  .pushAndPopUntil(LoaderRoute(), predicate: (router) => false);
            }
          },
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                snap: true,
                floating: true,
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
                                confirmObscurePassword =
                                    !confirmObscurePassword;
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
                            registration();
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
                child: BlocListener<AuthByAnotherBloc, AuthByAnotherState>(
                  listener: (BuildContext context, state) {
                    if (state is AuthByAnotherSuccess) {
                      AutoRouter.of(context).pushAndPopUntil(LoaderRoute(),
                          predicate: (router) => false);
                    }
                  },
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
                          onTap: () {
                            context
                                .read<AuthByAnotherBloc>()
                                .add(AuthWithGoogleEvent());
                          },
                          text: 'Sign in with Google',
                        ),
                        // ButtonAuthWidget(
                        //   color: Colors.black,
                        //   image: AppConst.appleSvg,
                        //   onTap: () {
                        //     context
                        //         .read<AuthByAnotherBloc>()
                        //         .add(AuthWithAppleEvent());
                        //   },
                        //   text: 'Sign in with Apple',
                        // )
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
                      'Do you already have an account? ',
                      style: theme.textTheme.bodyMedium,
                    ),
                    GestureDetector(
                      onTap: () {
                        AutoRouter.of(context).pushAndPopUntil(LoginRoute(),
                            predicate: (router) => false);
                      },
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
      ),
    );
  }

  void registration() {
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();
    final email = emailController.text.trim();
    final username = usernameController.text.trim();
    if (_formKey.currentState!.validate() && confirmPassword == password) {
      context.read<RegistrationBloc>().add(
            RegistrationRequired(
                password: password, email: email, username: username),
          );
    }
  }
}
