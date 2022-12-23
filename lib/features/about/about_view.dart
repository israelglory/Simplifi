import 'package:simplifi/components/custom_avatar.dart';
import 'package:simplifi/features/about/about_controller.dart';
import 'package:simplifi/routes/exports.dart';
import 'package:simplifi/utils/utils.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutController>(
      init: AboutController(),
      initState: (state) {},
      builder: (controller) {
        return SafeArea(
          top: true,
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppHeightSizedBox(height: 25),
                  //Avatar with cmera
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: AppColors.primaryColor, width: 2)),
                      child: const CustomAvatar(
                        url:
                            'https://firebasestorage.googleapis.com/v0/b/simplifi-9e561.appspot.com/o/userProfileImage%2FGloryOlaifa.jpg?alt=media&token=eeae9ba8-6a91-411b-807e-0390ca6a52e5',
                        height: 170,
                        width: 170,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  //FullName
                  Center(
                    child: AppText(
                      'Glory Olaifa',
                      size: 35,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Center(
                    child: AppText(
                      'Mobile Engineer',
                      size: 25,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  ///Description
                  Container(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: const AppText(
                      '''I’m a mobile engineer  (Android native & Flutter). I love to explore new technologies and try to choose the best for whatever I want to build. 
I enjoy building communities and contributing to the tech ecosystem to help people grow. Formerly in my Android Developer role, my successes have stemmed from essential skills, including quality control and many more. 
I have enhanced my communication abilities and cultivated a reputation as a major contributor through critical thinking and problem-solving. I am a collaborative team player who is always searching for opportunities to impart valuable insights. 
            
With these qualities, I am able to facilitate positive change and impact outcomes. Identifying innovative approaches and improved solutions to business challenges both motivate and drive me. Observation, inspiration, and determination are my foundation for success. My philosophy is that introducing fresh perspectives and new techniques allow businesses to evolve and grow. My goal is to remain on the cutting-edge of advancements. ''',
                      size: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          launchUrlStart(url: 'https://github.com/israelglory');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: AppText(
                            'Click to visit my Github',
                            size: 20,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          launchUrlStart(
                            url:
                                'https://www.linkedin.com/in/glory-olaifa-1b7297188/',
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: AppText(
                            'Click to visit my LinkedIn Profile',
                            size: 20,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
