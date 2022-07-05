import 'package:flutter/material.dart';
import 'package:ropstam_flutter_task/data/models/post_model.dart';
import 'package:ropstam_flutter_task/utilities/pref_utilities.dart';
import 'package:ropstam_flutter_task/views/auth/login_view.dart';
import 'package:ropstam_flutter_task/views/home/home_vm.dart';
import 'package:provider/provider.dart';
import 'package:ropstam_flutter_task/configurations/size_config.dart';
import 'package:ropstam_flutter_task/constants/app_colors.dart';

class HomeView extends StatefulWidget {
  static const routeName = 'homeView';

  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    getPosts();
    super.initState();
  }

  void getPosts() async {
    await Provider.of<HomeVm>(context, listen: false).getPosts(context);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Consumer<HomeVm>(
      builder: (context, homeVm, _) {
        return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: AppColors.kWhiteColor,
              // leading: IconButton(
              //   icon: const Icon(
              //     Icons.arrow_back,
              //     color: AppColors.kBlackColor,
              //   ),
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              // ),
              title: Text(
                'All Posts',
                style: TextStyle(
                    color: AppColors.kBlackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.screenHeight! * 0.022),
              ),
              centerTitle: true,
              actions: <Widget>[
                Padding(
                  padding:  EdgeInsets.only(top: SizeConfig.screenHeight!*0.02,right:  SizeConfig.screenWidth!*0.05),
                  child: InkWell(
                      onTap: () {
                        PreferenceUtilities.clearAllPrefs(context);
                        Navigator.pushNamedAndRemoveUntil(
                            context, LogInView.routeName, (route) => false);
                      },
                      child: Text(
                        'LogOut',
                        style: TextStyle(
                            color: AppColors.kBlackColor,
                            fontWeight: FontWeight.w500,
                            fontSize: SizeConfig.screenHeight! * 0.022),
                      )),
                ),
              ],
            ),
            backgroundColor: AppColors.kGradientStartColor,
            body: homeVm.loading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.kGreenColor,
                    ),
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // SizedBox(
                      //   height: SizeConfig.screenHeight! * 0.02,
                      // ),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: homeVm.postList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return listItems(
                                list: homeVm.postList,
                                index: index,
                                onTap: () {});
                          },
                        ),
                      ),
                    ],
                  ));
      },
    );
  }

  Widget listItems({required List<Post> list, required int index, var onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 1.0,
        color: AppColors.kWhiteColor,
        margin: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth! * 0.04,
            vertical: SizeConfig.screenHeight! * 0.01),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth! * 0.04,
              vertical: SizeConfig.screenHeight! * 0.01),
          //TODO replace with post image in future...
          leading: CircleAvatar(
            radius: SizeConfig.screenHeight! * 0.03,
            backgroundColor: AppColors.kLightGreySlideToolTipColor,
          ),

          title: Text(
            list[index].id.toString(),
            style: const TextStyle(
                color: AppColors.kBlackColor, fontWeight: FontWeight.bold),
          ),

          subtitle: Text(list[index].title!,
              style: TextStyle(
                  color: AppColors.kBlackColor,
                  fontSize: SizeConfig.screenHeight! * 0.018)),
        ),
      ),
    );
  }
}
