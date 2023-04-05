import 'package:flutter/material.dart';
import 'package:web_app/constants.dart';
import 'package:web_app/sections/about/about_section.dart';
import 'package:web_app/sections/contact/contact_section.dart';
import 'package:web_app/sections/feedback/feedback_section.dart';
import 'package:web_app/sections/recent_work/recent_work_section.dart';
import 'package:web_app/sections/service/service_section.dart';
import 'package:web_app/sections/topSection/top_section.dart';
import 'package:web_app/components/section_title.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopSection(),
            SizedBox(height: kDefaultPadding * 2),
            AboutSection(),
            ServiceSection(),
            RecentWorkSection(),
            FeedbackSection(),
            SizedBox(height: kDefaultPadding),
            ContactSection(),
            SizedBox(
              height: 300,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                color: Colors.blueGrey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/portfolio-logo.png',
                    width: 100,),
                    Text('Our generation is the power.',style: TextStyle(color: Colors.white),),
                    //Text('Milan Paczai', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                  Image.asset('assets/images/signature-white-nobg.png', width: 100,)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
