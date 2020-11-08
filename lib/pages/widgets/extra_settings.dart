import 'package:News_App/constants.dart';
import 'package:flutter/material.dart';
import 'package:News_App/components/gradient.dart';
import 'package:News_App/views/article_view.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RadiantGradientMask(
              child: Text(
                "Daily",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'PoppinsBold',
                    color: txtColor),
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
              "ABOUT US",
              style: TextStyle(
                fontFamily: "PoppinsSemiBold",
                fontSize: 20,
                color: txtColor,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 32,
            height: MediaQuery.of(context).size.height * 0.75,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Our App\n",
                      style: TextStyle(
                          fontFamily: "PoppinsSemiBold",
                          color: txtColor,
                          fontSize: 16),
                    ),
                    Text(
                      "- Daily is developed to spread positivity and knowledge.There are various features like Feed, Articles, Tips & Tricks and Daily Challenges.\n- Daily pushes you special motivating and positive notifications twice a day.\n- Do check out the amazing Tips & Tricks and also complete the challenges.\n\n",
                      style: TextStyle(
                          fontFamily: "Poppins", color: txtColor, fontSize: 12),
                    ),
                    Text(
                      "Our Vision\n",
                      style: TextStyle(
                          fontFamily: "PoppinsSemiBold",
                          color: txtColor,
                          fontSize: 16),
                    ),
                    Text(
                      "Daily promotes the habit of good reading and positivity.It helps you stay physically and mentally fit. It provides you with tons of knowledge regarding every field and also simple tips to ease your life. It can also help our youth to come out of the social media trap these days, and have a day full of knowledge and positivity.\n\n",
                      style: TextStyle(
                          fontFamily: "Poppins", color: txtColor, fontSize: 12),
                    ),
                    Text(
                      "Our Team\n",
                      style: TextStyle(
                          fontFamily: "PoppinsSemiBold",
                          color: txtColor,
                          fontSize: 16),
                    ),
                    Text(
                      "Daily has been founded by Varun Lohade ,Durgesh Kudalkar and Akshita Joshi, who are currently pursuing Computer Science from Walchand Institute of Technology,Solapur.\n\nWe believe in spreading knowledge and positivity. We innovate and develop websites and applications to ease your life and catch up with trends.\nIn times of this pandemic all we need is some positivity in some or the other form. We present this application to you to get aware of your surroundings but also maintain your santiy by giving you positive dose of Articles and Daily Challenges.\n\n",
                      style: TextStyle(
                          fontFamily: "Poppins", color: txtColor, fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "by",
                  style: TextStyle(
                    fontFamily: "PoppinsSemiBold",
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  "I N V O F I N I T Y",
                  style: TextStyle(
                    fontFamily: "NeonBold",
                    fontSize: 18,
                    color: txtColor,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RadiantGradientMask(
              child: Text(
                "Daily",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'PoppinsBold',
                    color: txtColor),
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
              "HELP & FAQ",
              style: TextStyle(
                fontFamily: "PoppinsSemiBold",
                fontSize: 20,
                color: txtColor,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 32,
            height: MediaQuery.of(context).size.height * 0.75,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "1. Why is the app not working? \n",
                    style: TextStyle(
                      fontFamily: "PoppinsBold",
                      color: txtColor,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "Kindly check your internet connection. If the problem continues feel free to report.",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      color: txtColor,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "\n\n2. What is the content of Feed section? \n",
                    style: TextStyle(
                      fontFamily: "PoppinsBold",
                      color: txtColor,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "The Feed section keeps you updated with the on-goings in different sectors all around the globe.",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      color: txtColor,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "\n\n3. What are the challenges? \n",
                    style: TextStyle(
                      fontFamily: "PoppinsBold",
                      color: txtColor,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "We include different challenges to make small changes- both physically and mentally- to create gains for your overall health and well-being. Fight hard the battle of life and take the challenges with courage, determination and perseverance.",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      color: txtColor,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "\n\n4. Are the Tips & Tricks effective? \n",
                    style: TextStyle(
                      fontFamily: "PoppinsBold",
                      color: txtColor,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "Tips & Tricks section includes simple life hacks, technical tips and various other tricks to ease your life. They are effective if practised properly.",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      color: txtColor,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "\n\n5. What topics are included in the Articles section? \n",
                    style: TextStyle(
                      fontFamily: "PoppinsBold",
                      color: txtColor,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "The Articles section has varieties to topics like Business, Health, Science & Technology, General, Finanace, etc. All articles help you enhance your knowledge.",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      color: txtColor,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "\n\n6. When will I get quotes notification? \n",
                    style: TextStyle(
                      fontFamily: "PoppinsBold",
                      color: txtColor,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "The quotes notifications will be received twice daily. We push positive notifications to boost your motivation and inspire you everyday.",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      color: txtColor,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "\n\n7. Can I turn off the notifications? \n",
                    style: TextStyle(
                      fontFamily: "PoppinsBold",
                      color: txtColor,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "Yes, you ca turn off the notifications in the Settings. Although we recommend you to keep the notifications on to receive amazing quotes to kick start your day with positivity and motivation & also end your day peacefully.",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      color: txtColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "by",
                  style: TextStyle(
                    fontFamily: "PoppinsSemiBold",
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  "I N V O F I N I T Y",
                  style: TextStyle(
                    fontFamily: "NeonBold",
                    fontSize: 18,
                    color: txtColor,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class Terms extends StatefulWidget {
  @override
  _TermsState createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RadiantGradientMask(
              child: Text(
                "Daily",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'PoppinsBold',
                    color: txtColor),
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
              "TERMS & CONDITIONS",
              style: TextStyle(
                fontFamily: "PoppinsSemiBold",
                fontSize: 20,
                color: txtColor,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 32,
            height: MediaQuery.of(context).size.height * 0.75,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                      "By downloading or using the app, these terms will automatically apply to you – you should make sure therefore that you read them carefully before using the app. You’re not allowed to copy, or modify the app, any part of the app, or our trademarks in any way. You’re not allowed to attempt to extract the source code of the app, and you also shouldn’t try to translate the app into other languages, or make derivative versions. The app itself, and all the trade marks, copyright, database rights and other intellectual property rights related to it, still belong to Invofinity.\n\nInvofinity is committed to ensuring that the app is as useful and efficient as possible. For that reason, we reserve the right to make changes to the app or to charge for its services, at any time and for any reason. We will never charge you for the app or its services without making it very clear to you exactly what you’re paying for.\n\nThe 'Daily by Invofinity' app stores and processes personal data that you have provided to us, in order to provide our Service. It’s your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions and limitations imposed by the official operating system of your device. It could make your phone vulnerable to malware/viruses/malicious programs, compromise your phone’s security features and it could mean that the Daily by Invofinity app won’t work properly or at all.\n\nThe app does use third party services that declare their own Terms and Conditions.\n\n",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        color: txtColor,
                        fontSize: 12,
                      )),
                  Text(
                    "Link to Terms and Conditions of third party service providers used by the app\n",
                    style: TextStyle(
                        fontFamily: "PoppinsSemiBold",
                        color: txtColor,
                        fontSize: 16),
                  ),
                  Text(
                    "- [Google Play Services](https://policies.google.com/terms)\n\n- [Google Analytics for Firebase](https://firebase.google.com/terms/analytics)\n\n- [Facebook](https://www.facebook.com/legal/terms/plain_text_terms)\n\n",
                    style: TextStyle(
                        fontFamily: "Poppins", color: txtColor, fontSize: 12),
                  ),
                  Text(
                    "You should be aware that there are certain things that Invofinity will not take responsibility for. Certain functions of the app will require the app to have an active internet connection. The connection can be Wi-Fi, or provided by your mobile network provider, but Invofinity cannot take responsibility for the app not working at full functionality if you don’t have access to Wi-Fi, and you don’t have any of your data allowance left.\n\nIf you’re using the app outside of an area with Wi-Fi, you should remember that your terms of the agreement with your mobile network provider will still apply. As a result, you may be charged by your mobile provider for the cost of data for the duration of the connection while accessing the app, or other third party charges. In using the app, you’re accepting responsibility for any such charges, including roaming data charges if you use the app outside of your home territory (i.e. region or country) without turning off data roaming. If you are not the bill payer for the device on which you’re using the app, please be aware that we assume that you have received permission from the bill payer for using the app.\n\nAlong the same lines, Invofinity cannot always take responsibility for the way you use the app i.e. You need to make sure that your device stays charged – if it runs out of battery and you can’t turn it on to avail the Service, Invofinity cannot accept responsibility.\n\nWith respect to Invofinity’s responsibility for your use of the app, when you’re using the app, it’s important to bear in mind that although we endeavour to ensure that it is updated and correct at all times, we do rely on third parties to provide information to us so that we can make it available to you. Invofinity accepts no liability for any loss, direct or indirect, you experience as a result of relying wholly on this functionality of the app.\n\nAt some point, we may wish to update the app. The app is currently available on Android – the requirements for system(and for any additional systems we decide to extend the availability of the app to) may change, and you’ll need to download the updates if you want to keep using the app. Invofinity does not promise that it will always update the app so that it is relevant to you and/or works with the Android version that you have installed on your device. However, you promise to always accept updates to the application when offered to you, We may also wish to stop providing the app, and may terminate use of it at any time without giving notice of termination to you. Unless we tell you otherwise, upon any termination, (a) the rights and licenses granted to you in these terms will end; (b) you must stop using the app, and (if needed) delete it from your device.\n\n",
                    style: TextStyle(
                        fontFamily: "Poppins", color: txtColor, fontSize: 12),
                  ),
                  Text(
                    "Changes to This Terms and Conditions\n\n",
                    style: TextStyle(
                        fontFamily: "PoppinsSemiBold",
                        color: txtColor,
                        fontSize: 16),
                  ),
                  Text(
                    "We may update our Terms and Conditions from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Terms and Conditions on this page.\n\nThese terms and conditions are effective as of 2020-10-12\n\n",
                    style: TextStyle(
                        fontFamily: "Poppins", color: txtColor, fontSize: 12),
                  ),
                  Text(
                    "Contact Us\n\n",
                    style: TextStyle(
                        fontFamily: "PoppinsSemiBold",
                        color: txtColor,
                        fontSize: 16),
                  ),
                  Text(
                    "If you have any questions or suggestions about our Terms and Conditions, do not hesitate to contact us at -- Invofinity@gmail.com.\n",
                    style: TextStyle(
                        fontFamily: "Poppins", color: txtColor, fontSize: 12),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "by",
                  style: TextStyle(
                    fontFamily: "PoppinsSemiBold",
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  "I N V O F I N I T Y",
                  style: TextStyle(
                    fontFamily: "NeonBold",
                    fontSize: 18,
                    color: txtColor,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class PrivacyPolicy extends StatefulWidget {
  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RadiantGradientMask(
              child: Text(
                "Daily",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'PoppinsBold',
                    color: txtColor),
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
              "PRIVACY POLICY",
              style: TextStyle(
                fontFamily: "PoppinsSemiBold",
                fontSize: 20,
                color: txtColor,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 32,
            height: MediaQuery.of(context).size.height * 0.75,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Invofinity built the Daily by Invofinity app as a Free app. This SERVICE is provided by Invofinity at no cost and is intended for use as is.\nThis page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service.\nIf you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.\nThe terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at Daily by Invofinity unless otherwise defined in this Privacy Policy.\n\n",
                    style: TextStyle(
                        fontFamily: "Poppins", color: txtColor, fontSize: 12),
                  ),
                  Text(
                    "Information Collection and Use\n\n",
                    style: TextStyle(
                        fontFamily: "PoppinsSemiBold",
                        color: txtColor,
                        fontSize: 16),
                  ),
                  Text(
                    "For a better experience, while using our Service, we may require you to provide us with certain personally identifiable information. The information that we request will be retained by us and used as described in this privacy policy.\nThe app does use third party services that may collect information used to identify you.Link to privacy policy of third party service providers used by the app\n",
                    style: TextStyle(
                        fontFamily: "Poppins", color: txtColor, fontSize: 12),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ArticleView(
                                    blogUrl:
                                        "https://policies.google.com/privacy",
                                  )));
                    },
                    child: Text(
                      "Google Play Services",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          color: Colors.blue,
                          fontSize: 12),
                    ),
                  ),
                  Text(
                    "\nLog Data\n\n",
                    style: TextStyle(
                        fontFamily: "PoppinsSemiBold",
                        color: txtColor,
                        fontSize: 16),
                  ),
                  Text(
                      "We want to inform you that whenever you use our Service, in a case of an error in the app we collect data and information (through third party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing our Service, the time and date of your use of the Service, and other statistics.\n\n",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          color: txtColor,
                          fontSize: 12)),
                  Text(
                    "Cookies\n\n",
                    style: TextStyle(
                        fontFamily: "PoppinsSemiBold",
                        color: txtColor,
                        fontSize: 16),
                  ),
                  Text(
                      "Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device's internal memory.\nThis Service does not use these “cookies” explicitly. However, the app may use third party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.\n\n",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          color: txtColor,
                          fontSize: 12)),
                  Text(
                    "Service Providers\n\n",
                    style: TextStyle(
                        fontFamily: "PoppinsSemiBold",
                        color: txtColor,
                        fontSize: 16),
                  ),
                  Text(
                      "We may employ third-party companies and individuals due to the following reasons:\n- To facilitate our Service\n- To provide the Service on our behalf\n- To perform Service-related services\n- To assist us in analyzing how our Service is used\n\nWe want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.\n\n",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          color: txtColor,
                          fontSize: 12)),
                  Text(
                    "Security\n\n",
                    style: TextStyle(
                        fontFamily: "PoppinsSemiBold",
                        color: txtColor,
                        fontSize: 16),
                  ),
                  Text(
                      "We value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.\n\n",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          color: txtColor,
                          fontSize: 12)),
                  Text(
                    "Links to Other Sites\n\n",
                    style: TextStyle(
                        fontFamily: "PoppinsSemiBold",
                        color: txtColor,
                        fontSize: 16),
                  ),
                  Text(
                      "This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.\n\n",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          color: txtColor,
                          fontSize: 12)),
                  Text(
                    "Children’s Privacy\n\n",
                    style: TextStyle(
                        fontFamily: "PoppinsSemiBold",
                        color: txtColor,
                        fontSize: 16),
                  ),
                  Text(
                      "These Services do not address anyone under the age of 13. We do not knowingly collect personally identifiable information from children under 13. In the case we discover that a child under 13 has provided us with personal information, we immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we will be able to do necessary actions.\n\n",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          color: txtColor,
                          fontSize: 12)),
                  Text(
                    "Changes to This Privacy Policy\n\n",
                    style: TextStyle(
                        fontFamily: "PoppinsSemiBold",
                        color: txtColor,
                        fontSize: 16),
                  ),
                  Text(
                      "We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page.\nThis policy is effective as of 2020-10-10\n\n",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          color: txtColor,
                          fontSize: 12)),
                  Text(
                    "Contact Us\n\n",
                    style: TextStyle(
                        fontFamily: "PoppinsSemiBold",
                        color: txtColor,
                        fontSize: 16),
                  ),
                  Text(
                      "If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us at Invofinity@gmail.com.\n",
                      style: TextStyle(
                          fontFamily: "Poppins", color: txtColor, fontSize: 12))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "by",
                    style: TextStyle(
                      fontFamily: "PoppinsSemiBold",
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    "I N V O F I N I T Y",
                    style: TextStyle(
                      fontFamily: "NeonBold",
                      fontSize: 18,
                      color: txtColor,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
