import 'package:flutter/material.dart';
import 'package:miso/miso_second.dart';

import 'miso_first.dart';

/// Miso 메인 색상
Color misoPrimaryColor = Color.fromARGB(255, 38, 103, 240);

class Miso extends StatefulWidget {
  const Miso({Key? key}) : super(key: key);

  @override
  _MisoState createState() => _MisoState();
}

class _MisoState extends State<Miso> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex, // index 순서에 해당하는 child를 맨 위에 보여줌
        children: [
          MisoFirstPage(),
          MisoSecondPage(),
          MisoThirdPage(),
          MisoFourthPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex, // 현재 보여주는 탭
        onTap: (newIndex) {
          print("selected newIndex : $newIndex");
          // 다른 페이지로 이동
          setState(() {
            currentIndex = newIndex;
          });
        },
        selectedItemColor: misoPrimaryColor, // 선택된 아이콘 색상
        unselectedItemColor: Colors.grey, // 선택되지 않은 아이콘 색상
        showSelectedLabels: false, // 선택된 항목 label 숨기기
        showUnselectedLabels: false, // 선택되지 않은 항목 label 숨기기
        type: BottomNavigationBarType.fixed, // 선택시 아이콘 움직이지 않기
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.redeem), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }
}

/// 세 번째 페이지
class MisoThirdPage extends StatelessWidget {
  const MisoThirdPage({Key? key}) : super(key: key);

  /// 세 번째 화면 배경 이미지 URL
  final String backgroundImgUrl =
      "https://i.ibb.co/rxzkRTD/146201680-e1b73b36-aa1e-4c2e-8a3a-974c2e06fa9d.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: misoPrimaryColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            // Tip : 친구 추천하기 버튼에 width를 주지 않고 중앙 정렬하기
            alignment: Alignment.center,
            children: [
              /// 배경 이미지
              Positioned(
                bottom: 0,
                child: Container(
                  // 이미지 최대 크기 제한
                  constraints: BoxConstraints(maxWidth: 400),
                  child: Image.network(backgroundImgUrl),
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 64),

                  /// 타이틀
                  /// Tip : 10,000원만 bold 처리하기 위해 RitchText 위젯 사용
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      // 공통 스타일
                      style: TextStyle(
                        fontSize: 28,
                        height: 1.5, // 줄간격 한 줄의 1.5배
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                          text: "친구 추천할 때마다\n",
                        ),
                        TextSpan(
                          text: "10,000원 ",
                          // 개별 스타일
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "할인 쿠폰 지급!",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 64),

                  /// 자세히 보기
                  GestureDetector(
                    onTap: () {
                      print("자세히 보기 클릭 됨");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "자세히 보기",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              /// 친구 추천하기
              Positioned(
                bottom: 42,
                child: GestureDetector(
                  onTap: () {
                    print("친구 추천하기 클릭 됨");
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(64),
                      // 그림자
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          // 광원의 위치를 중심(0, 0)보다 위쪽(0, 5133)
                          offset: Offset(0, 5),
                          spreadRadius: 1,
                          blurRadius: 12,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.redeem,
                          color: misoPrimaryColor,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "친구 추천하기",
                          style: TextStyle(
                            color: misoPrimaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 네 번째 페이지
class MisoFourthPage extends StatelessWidget {
  const MisoFourthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        /// Tip: 작은 화면에서 넘친다면 스크롤 가능하도록
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 62,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "나의 정보",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 32,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "010-9999-9999",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 32),
              ListTile(
                onTap: () => print("주소 관리 클릭 됨"),
                contentPadding: EdgeInsets.all(0),
                leading: Icon(Icons.home_outlined, color: Colors.black),
                title: Text(
                  "주소 관리",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ListTile(
                onTap: () => print("결제 수단 관리 클릭 됨"),
                contentPadding: EdgeInsets.all(0),
                leading: Icon(Icons.credit_card_outlined, color: Colors.black),
                title: Text(
                  "결제 수단 관리",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ListTile(
                onTap: () => print("공지사항 클릭 됨"),
                contentPadding: EdgeInsets.all(0),
                leading: Icon(Icons.volume_mute_outlined, color: Colors.black),
                title: Text(
                  "공지사항",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ListTile(
                onTap: () => print("문의사항 클릭 됨"),
                contentPadding: EdgeInsets.all(0),
                leading: Icon(Icons.help_outline, color: Colors.black),
                title: Text(
                  "문의사항",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
