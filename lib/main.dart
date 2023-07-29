import 'package:carousel_slider/carousel_slider.dart';
import 'package:comment_tree/comment_tree.dart';
import 'package:comment_tree/widgets/comment_tree_widget.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:ui_test/configs/AppAssets.dart';
import 'package:ui_test/configs/AppColors.dart';
import 'package:ui_test/elements/BaseAppBar.dart';
import 'package:ui_test/elements/ContentText.dart';
import 'package:ui_test/elements/TitleText.dart';

import 'model/HashChipsData.dart';
import 'HashChips.dart';
import 'configs/AppConst.dart';
import 'elements/ButtonWidget.dart';
import 'elements/IconView.dart';
import 'elements/TitleTextRoboto.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int imgIndex = 0;
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar:const BaseAppBar(title:'자유톡'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal :12.0,vertical: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Row(
                   mainAxisSize: MainAxisSize.max,
                   children: [
                     const IconView(icon:AppAssets.img_profile,iconHeight: 34,iconWidth: 34),
                     Padding(
                       padding: const EdgeInsets.only(left:6.0),
                       child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                       Row(
                         mainAxisSize: MainAxisSize.min,
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children:  const [
                         TitleText(text: '안녕 나 응애',textSize: 14,),
                         Padding(
                           padding: EdgeInsets.symmetric(horizontal: 3.0),
                           child: IconView(icon:AppAssets.ic_expert,iconHeight: 13,iconWidth: 13),
                         ),
                         TitleText(text: '1일전',textSize: 10,fontWeight: FontWeight.w500,color: AppColors.normal,),
                       ],),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children:  const [
                         ContentText(text:'165cm'),
                         Padding(
                           padding: EdgeInsets.symmetric(horizontal: 2.0),
                           child: IconView(icon:AppAssets.ic_expert,iconHeight: 2,iconWidth: 2),
                         ),
                         ContentText(text:'53kg'),
                       ],)
                   ],),
                     ),
                   const Spacer(),
                   ButtonWidget(
                     text: '팔로우',
                     onPressed: () {},
                   ),
                 ],),
                  const SizedBox(height: 12),
                  const TitleText(text:'지난 월요일에 했던 이벤트 중 가장 괜찮은 상품 뭐야?',textSize: 14,),
                  const SizedBox(height: 10),
                  const TitleText(text:'지난 월요일에 2023년 S/S 트렌드 알아보기 이벤트 참석했던 팝들아~ 혹시 어떤 상품이 제일 괜찮았어? \n\n후기 올라오는거 보면 로우라이즈? 그게 제일 반응 좋고 그 테이블이 제일 재밌었다던데 맞아???\n\n올해 로우라이즈가 트렌드라길래 나도 도전해보고 싶은데 말라깽이가 아닌 사람들도 잘 어울릴지 너무너무 궁금해ㅜㅜ로우라이즈 테이블에 있었던 팝들 있으면 어땠는지 후기 좀 공유해주라~~!',textSize: 12,color: AppColors.normaltext,fontWeight: FontWeight.w500,),
                  const SizedBox(height: 12),
                  buildHashtags(),
                  const SizedBox(height: 15),
                  ImageSlider(),
                  const SizedBox(height: 10,),
                  Row(children: const [
                    IconView(icon: AppAssets.ic_like,),
                    TitleTextRoboto(text:"5",),
                    IconView(icon:AppAssets.ic_comment),
                    TitleTextRoboto(text:"5",),
                    IconView(icon:AppAssets.ic_collection),
                    IconView(icon:AppAssets.ic_more_Frame),
                    // IconView(icon:AppAssets.ic_more,iconHeight: 6,iconWidth: 20,)
                  ],),

                ],
              ),
            ),
            const Divider(
              color: AppColors.hashBG,
              thickness: 2,
            ),
            Padding(padding:const EdgeInsets.symmetric(horizontal: 12,vertical: 5),
            child: Column(children: [
              // commentSection()
              commentTree()
            ],),)
          ],
        ),
      ),
      bottomNavigationBar: bottomlayout()
    
    );
  }
  final double spacing = 10;
  List<HashChipsData> Hashtags = HashChips.all;


  Widget ImageSlider() {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CarouselSlider.builder(
            carouselController: buttonCarouselController,
            itemCount: imageList.length,
            itemBuilder: (context, index, realIndex) {
              final image = imageList[index];
              return  Image.network(
                image,
                fit: BoxFit.cover,
              );
            },
            options: CarouselOptions(
              viewportFraction: 1,
              initialPage: 0,
              onPageChanged: (index,reason){
                setState(() {
                  imgIndex = index;
                });
              },
              reverse: false,
              autoPlay: false,
            )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: DotsIndicator(
            dotsCount: imageList.length,
            position: imgIndex,
            decorator: const DotsDecorator(activeColor: AppColors.white,color: Colors.grey ,spacing:EdgeInsets.all(2),size: Size(6,6),activeSize: Size(6,6)),
            reversed: false,
          ),
        ),
      ],
    );
  }
  Widget buildHashtags() => Wrap(
    spacing: 10,
    runSpacing: spacing,
    children: Hashtags
        .map((choiceChip) => ChoiceChip(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: const EdgeInsets.symmetric(horizontal: 5,),
      label: TitleTextRoboto(text:choiceChip.label,textSize: 14,color: AppColors.normalRoboto,fontWeight: FontWeight.w500,),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(999.0),
        side: const BorderSide(color: AppColors.hashborder, width: 0.5),
      ),
      onSelected: (isSelected) =>{},
      shadowColor: Colors.transparent,
      backgroundColor: AppColors.hashBG, selected: false,
    ))
        .toList(),
  );
  
  Widget bottomlayout() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 1, color: AppColors.hashBG),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppAssets.ic_image_selection,height: 24,width: 24,),
            const Expanded(child: Padding(
              padding: EdgeInsets.only(left: 13.0),
              child: TitleText(text:'댓글을 남겨주세요.',textSize: 12,color: AppColors.normalShade1,fontWeight: FontWeight.w400,),
            )),
            const TitleText(text:'등록',textSize: 12,color: AppColors.normalShade1,fontWeight: FontWeight.w500),
          ],
        ),
      ),
    );
  }

  Widget commentSection(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              TitleText(text: '안녕 나 응애',textSize: 14,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.0),
                child: IconView(icon:AppAssets.ic_expert,iconHeight: 13,iconWidth: 13),
              ),
              TitleText(text: '1일전',textSize: 10,fontWeight: FontWeight.w500,color: AppColors.normal,),
              const Spacer(),
              const IconView(icon:AppAssets.ic_more,iconHeight: 3,iconWidth: 13,),
            ],),
        ),
        const TitleText(text:'어머 제가 있던 테이블이 제일 반응이 좋았나보네요🤭 우짤래미님도 아시겠지만 저도 일반인 몸매 그 이상도 이하도아니잖아요?! 그런 제가 기꺼이 도전해봤는데 생각보다괜찮았어요! 오늘 중으로 라이브 리뷰 올라온다고 하니꼭 봐주세용~!',textSize: 12,color: AppColors.normaltext,fontWeight: FontWeight.w400),
        Row(children: const [
          IconView(icon: AppAssets.ic_like,iconWidth:25 ,iconHeight: 25),
          TitleTextRoboto(text:"5",),
          IconView(icon:AppAssets.ic_comment,iconHeight:25 ,iconWidth: 25),
          TitleTextRoboto(text:"5",),
          // IconView(icon:AppAssets.ic_more,iconHeight: 6,iconWidth: 20,)
        ],),

      ],
    );
  }

  Widget commentTree(){
    return CommentTreeWidget<Comment, Comment>(
      Comment(
          avatar: 'null',
          userName: 'null',
          content: 'felangel made felangel/cubit_and_beyond public '),
      [
        Comment(
            avatar: 'null',
            userName: 'null',
            content: 'A Dart template generator which helps teams'),

      ],
      treeThemeData: const TreeThemeData(lineColor: Colors.transparent, lineWidth: 0),
      avatarRoot: (context, data) => profileWidget(),
      avatarChild: (context, data) => profileWidget(),
      contentChild: (context, data) {
        return commentSection();
      },
      contentRoot: (context, data) {
        return commentSection();
      },
    );
  }

  PreferredSize profileWidget(){
    return const PreferredSize(
      preferredSize: Size.fromRadius(12),
      child: CircleAvatar(
        radius: 18,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(AppAssets.img_avtar),
      ),
    );
  }

}
