import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hair_heist/app/ui/home/view/home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'SPLASH SCREEN',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => HomePage());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child: Text(
                      'sign-in with email',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('sign-in with google'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('sign-in with apple account'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
