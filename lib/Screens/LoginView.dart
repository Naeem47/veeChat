import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:veechat/Constants/colors.dart';
import 'package:veechat/Constants/style.dart';
import 'package:veechat/Provider/Loginprovider.dart';
import 'package:veechat/Screens/Signupview.dart';
import 'package:veechat/Widgets/Textfieldforemail.dart';
import 'package:veechat/Widgets/button.dart';
import 'package:veechat/Widgets/iconbutton.dart';
import 'package:veechat/Widgets/textfieldpassword.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.sizeOf(context).height;
        final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    // final _width = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Consumer<LoginProvider>(
            builder: (context, value, child) => Form(
              key:_formKey ,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, right: 10, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Let's Sign You In",
                        style: stysaans.copyWith(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: _height * 0.02,
                      ),
                      Text(
                        "Welcome You've Been Missed ",
                        style: stysaans.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: ColorConstants.grey),
                      ),
                      SizedBox(
                        height: _height * 0.06,
                      ),
                      TextfieldEmail(
                          validate: (value) {
                  if (value!.isEmpty) {
                    return 'Field cannot be empty';
                  }
                  return null;
                },
                        controller: value.email,
                        hinttext: 'Email',
                      ),
                      SizedBox(
                        height: _height * 0.03,
                      ),
                      TextfieldPassword(
                        validate: (value) {
                  if (value!.isEmpty) {
                    return 'Field cannot be empty';
                  }
                  return null;
                },
                        onatp: (){
                          value.forbool();
                        },
                        sicon:value.get() == true? const Icon(Icons.visibility_off):const Icon(Icons.visibility),
                        controller: value.password,
                        hinttext: 'Password',
                        obsecure: value.get(),
                      ),
                      SizedBox(
                        height: _height * 0.05,
                      ),
                      Button(
                        color: ColorConstants.purple,
                        onpressed: () {
                          if(_formKey.currentState!.validate()){

                          value.login(context);
                          }
                        },
                        text: "SignIn",
                      ),
                      SizedBox(
                        height: _height * 0.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Or Continue with social account",
                            textAlign: TextAlign.center,
                            style: stysaans.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: ColorConstants.grey),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: _height * 0.03,
                      ),
                      const Divider(
                        height: 4,
                        color: ColorConstants.black,
                      ),
                      SizedBox(
                        height: _height * 0.03,
                      ),
                      CustomIconButton(
                          text: "Continue with Google",
                          onpressed: () {},
                          color: ColorConstants.blue,
                          icon: FontAwesomeIcons.google),
                      SizedBox(
                        height: _height * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Dont  have an account ",
                            textAlign: TextAlign.center,
                            style: stysaans.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: ColorConstants.grey),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Singupview(),
                                  ));
                            },
                            child: Text(
                              "SingUp",
                              textAlign: TextAlign.center,
                              style: stysaans.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstants.purple),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
