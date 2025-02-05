import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re_anime_app/blocs/reset_password_bloc/reset_password_bloc.dart';
import 'package:re_anime_app/ui/ui.dart';
import 'package:re_anime_app/utils/utils.dart';

@RoutePage()
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late final TextEditingController forgotPasswordController;
  double _formOpacity = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    forgotPasswordController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _formOpacity = 1.0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: AnimatedOpacity(
            opacity: _formOpacity,
            duration: Duration(milliseconds: 1000),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Text('Forgot password'),
                ),
                SliverToBoxAdapter(
                  child: ReAnimeWidget(),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                SliverToBoxAdapter(
                  child: BaseContainerWidget(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        spacing: 12,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Reset password',
                            style: theme.textTheme.headlineSmall,
                          ),
                          Text(
                            'Enter the email address you used to log in to your account and we will send you information on the next steps to reset your password.',
                            style: theme.textTheme.labelLarge,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email address',
                                style: theme.textTheme.titleMedium,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              BaseTextFieldWidget(
                                validator: (value) =>
                                    FormValidators.emailValidator(value),
                                controller: forgotPasswordController,
                                hintText: 'What is your email address?',
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  BaseButtonWidget(
                                      width: 150,
                                      onPressed: () {
                                        final email = forgotPasswordController
                                            .text
                                            .trim();
                                        if (_formKey.currentState!.validate() &&
                                            email.isNotEmpty) {
                                          context.read<ResetPasswordBloc>().add(
                                              ResetPasswordEvent(email: email));
                                        }
                                      },
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            state is ResetPasswordProcess
                                                ? CircularProgressIndicator
                                                    .adaptive()
                                                : SizedBox.shrink(),
                                            Text(
                                              'Continue',
                                              style:
                                                  theme.textTheme.titleMedium,
                                            ),
                                          ])),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Cancel',
                                          style: theme.textTheme.titleMedium))
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
