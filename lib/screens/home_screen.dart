import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/bubble_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  bool _isMailboxOpen = false;
  bool _isCharacterSmiling = false;
  bool _showBubbles = false; // 말풍선 표시 상태
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleMailbox() {
    setState(() {
      _isMailboxOpen = !_isMailboxOpen;
      // 우편함을 열 때 캐릭터도 웃는 표정으로 변경하고 유지
      if (_isMailboxOpen) {
        _isCharacterSmiling = true;
        _showBubbles = true; // 말풍선 표시
      }
    });
    
    if (_isMailboxOpen) {
      _animationController.forward();
      // 3초 후에 우편함과 말풍선 닫기 (캐릭터는 계속 웃는 표정 유지)
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted && _isMailboxOpen) {
          setState(() {
            _isMailboxOpen = false;
            _showBubbles = false; // 말풍선 숨기기
          });
          _animationController.reverse();
        }
      });
    } else {
      _animationController.reverse();
      setState(() {
        _showBubbles = false; // 말풍선 숨기기
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9FC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 캐릭터 존 배경과 중간 정보를 Stack으로 겹치기
              Stack(
                clipBehavior: Clip.none, // Positioned가 Stack 밖으로 나갈 수 있도록
                children: [
                  // 캐릭터 존 배경
                  LayoutBuilder(
                    builder: (context, constraints) {
                      double horizontalMargin = (constraints.maxWidth * 0.05).clamp(12.0, 19.0);
                      return Container(
                        margin: EdgeInsets.fromLTRB(horizontalMargin, 46, horizontalMargin, 0),
                        width: double.infinity,
                        height: 390,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xFFFFFFFF), Color(0xFFDDEBF8)],
                          ),
                        ),
                        child: Stack(
                          children: [
                            // 상단 정보 (레벨, 기부금)
                            Positioned(
                              top: 23,
                              left: 27,
                              right: 27,
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      // 레벨 정보
                                      Flexible(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFE2E4E6),
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: const Text(
                                                '레벨 1',
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF4E5968),
                                                  letterSpacing: -0.22,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            const Flexible(
                                              child: Text(
                                                '열일하는 냥',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF505050),
                                                  letterSpacing: -0.32,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // 기부금 잔액
                                      Flexible(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset(
                                              'assets/images/money_bag.png',
                                              width: 24,
                                              height: 24,
                                            ),
                                            const SizedBox(width: 4),
                                            const Flexible(
                                              child: Text(
                                                '99,999원',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF505050),
                                                  letterSpacing: -0.32,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            
                            // 캐릭터 영역과 우편함 영역
                            Positioned(
                              top: 104,
                              left: 0,
                              right: 0,
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  // 사용 가능한 너비 계산
                                  double availableWidth = constraints.maxWidth - 40; // 좌우 여백 20px씩
                                  double characterWidth = (availableWidth * 0.6).clamp(150.0, 202.0);
                                  double mailboxWidth = (availableWidth * 0.3).clamp(100.0, 124.0);
                                  double spacing = (availableWidth * 0.1).clamp(10.0, 19.0);
                                  
                                  return Center(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        // 캐릭터 영역 (Stack으로 말풍선 추가)
                                        Container(
                                          width: characterWidth,
                                          height: 202,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Stack(
                                            alignment: Alignment.center,
                                            clipBehavior: Clip.none,
                                            children: [
                                              // 캐릭터 이미지
                                              Image.asset(
                                                _isCharacterSmiling 
                                                  ? 'assets/images/character_1_smile.png'
                                                  : 'assets/images/character_1_normal.png',
                                                fit: BoxFit.contain,
                                              ),
                                              // 말풍선들 (조건부 렌더링)
                                              if (_showBubbles) ...[
                                                // 말풍선 1: 왼쪽 위
                                                Positioned(
                                                  top: 20,
                                                  left: (characterWidth * 0.05).clamp(5.0, 10.0),
                                                  child: const BubbleAnimation(
                                                    text: '뿌듯해~',
                                                    offset: Offset(0, 0.2),
                                                  ),
                                                ),
                                                // 말풍선 2: 오른쪽 위
                                                Positioned(
                                                  top: 30,
                                                  right: (characterWidth * 0.025).clamp(2.5, 5.0),
                                                  child: const BubbleAnimation(
                                                    text: '다음에 또 해야지!',
                                                    offset: Offset(0, 0.2),
                                                  ),
                                                ),
                                                // 말풍선 3: 왼쪽 아래
                                                Positioned(
                                                  bottom: 40,
                                                  left: (characterWidth * 0.1).clamp(10.0, 20.0),
                                                  child: const BubbleAnimation(
                                                    text: '좋았어!',
                                                    offset: Offset(0, 0.2),
                                                  ),
                                                ),
                                              ],
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: spacing),
                                        // 우편함 영역 (Stack으로 우편함 + 툴팁)
                                        SizedBox(
                                          width: mailboxWidth,
                                          height: 202,
                                          child: Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              // 우편함 이미지
                                              GestureDetector(
                                                onTap: _toggleMailbox,
                                                child: Container(
                                                  width: mailboxWidth,
                                                  height: 202,
                                                  decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      // 닫힌 우편함 (기본 상태)
                                                      AnimatedOpacity(
                                                        opacity: _isMailboxOpen ? 0.0 : 1.0,
                                                        duration: const Duration(milliseconds: 500),
                                                        child: Center(
                                                          child: Image.asset(
                                                            'assets/images/mailbox_closed.png',
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ),
                                                      // 열린 우편함 (클릭 시)
                                                      AnimatedOpacity(
                                                        opacity: _isMailboxOpen ? 1.0 : 0.0,
                                                        duration: const Duration(milliseconds: 500),
                                                        child: Center(
                                                          child: Image.asset(
                                                            'assets/images/mailbox_open.png',
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              // 툴팁 (우편이 도착했어요!)
                                              Positioned(
                                                bottom: 150, // 우편함 위쪽에 위치
                                                left: 0,
                                                right: 0,
                                                child: Center(
                                                  child: SizedBox(
                                                    width: 150,
                                                    height: 49,
                                                    child: Stack(
                                                      children: [
                                                        // 말풍선 배경
                                                        SvgPicture.asset(
                                                          'assets/images/union.svg',
                                                          width: 150,
                                                          height: 49,
                                                        ),
                                                        // 말풍선 내용
                                                        Center(
                                                          child: Transform.translate(
                                                            offset: const Offset(0, -4), // 텍스트를 4px 위로 이동
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                const Text(
                                                                  '우편이 도착했어요!',
                                                                  style: TextStyle(
                                                                    fontSize: 13,
                                                                    fontWeight: FontWeight.w700,
                                                                    color: Colors.white,
                                                                    letterSpacing: -0.325,
                                                                  ),
                                                                ),
                                                                const SizedBox(width: 4),
                                                                SvgPicture.asset(
                                                                  'assets/images/mark_email_unread.svg',
                                                                  width: 20,
                                                                  height: 20,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  // 중간 정보 (안내 메시지 + 그래프) - 겹치도록 위치
                  Positioned(
                    bottom: -30, // 50px 아래로 내림 (20 - 50 = -30)
                    left: 0,
                    right: 0,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double horizontalPadding = (constraints.maxWidth * 0.12).clamp(20.0, 46.0);
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                          child: Column(
                            children: [
                              // 안내 메시지
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/contact_support.png',
                                    width: 20,
                                    height: 20,
                                  ),
                                  const SizedBox(width: 2),
                                  const Text(
                                    '우편함을 열면 마음이 따뜻해져요!',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF969696),
                                      letterSpacing: -0.26,
                                    ),
                                  ),
                                ],
                              ),
                              
                              const SizedBox(height: 12),
                              
                              // 그래프 카드
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.05),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/images/favorite_simple.svg',
                                          width: 20,
                                          height: 20,
                                        ),
                                        const SizedBox(width: 2),
                                        const Text(
                                          '32',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFFF75647),
                                            letterSpacing: -0.32,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 9),
                                    Expanded(
                                      child: Container(
                                        height: 6,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFEFF3F6),
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 52,
                                              height: 6,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFF75647),
                                                borderRadius: BorderRadius.circular(50),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 9),
                                    const Text(
                                      '100',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF969696),
                                        letterSpacing: -0.32,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 80), // Stack으로 인한 겹침 보상
              
              // 미션 배경
              LayoutBuilder(
                builder: (context, constraints) {
                  double horizontalMargin = (constraints.maxWidth * 0.05).clamp(12.0, 19.0);
                  return Container(
                    margin: EdgeInsets.fromLTRB(horizontalMargin, 0, horizontalMargin, 40),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(36),
                    ),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double horizontalPadding = (constraints.maxWidth * 0.1).clamp(24.0, 56.0);
                        return Padding(
                          padding: EdgeInsets.fromLTRB(horizontalPadding, 37, horizontalPadding, 37),
                          child: Column(
                            children: [
                              // 미션 1: 결제 수단 등록
                              Row(
                                children: [
                                  Container(
                                    width: 61,
                                    height: 61,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF8F9FA),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          '결제 수단 등록',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF505050),
                                            letterSpacing: -0.32,
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFE3F3FF),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: const Text(
                                            '1,000원',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFF008DFF),
                                              letterSpacing: -0.26,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              
                              const SizedBox(height: 30),
                              
                              // 미션 2: 매주 기부 도전 중 (Figma 스펙)
                              Column(
                                children: [
                                  // 상단 헤더
                                  Row(
                                    children: [
                                      Container(
                                        width: 61,
                                        height: 61,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF8F9FA),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '매주 기부 도전 중',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xFF505050),
                                                    letterSpacing: -0.32,
                                                  ),
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                  '이번 주 목표 달성!',
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xFF737679),
                                                    letterSpacing: -0.26,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SvgPicture.asset(
                                              'assets/images/arrow_forward_ios.svg',
                                              width: 20,
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  
                                  const SizedBox(height: 16),
                                  
                                  // 진행도 스텝 체인
                                  Column(
                                    children: [
                                      LayoutBuilder(
                                        builder: (context, constraints) {
                                          // 화면 크기에 따라 연결선 길이 계산
                                          double availableWidth = constraints.maxWidth - (5 * 23); // 5개 원형 아이콘 너비
                                          double connectionWidth = availableWidth / 4; // 4개의 연결선
                                          
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              // 스텝 1 (완료된 체크 아이콘)
                                              Column(
                                                children: [
                                                  // 상단 화살표 (삼각형)
                                                  Transform.rotate(
                                                    angle: 3.14159, // 180도 회전
                                                    child: SvgPicture.asset(
                                                      'assets/images/polygon5.svg',
                                                      width: 11,
                                                      height: 11,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  // 목표 달성 불 아이콘
                                                  Image.asset(
                                                    'assets/images/goal_done_fire.png',
                                                    width: 23,
                                                    height: 23,
                                                  ),
                                                ],
                                              ),
                                              
                                              // 연결선 1
                                              Container(
                                                width: connectionWidth,
                                                height: 3,
                                                margin: const EdgeInsets.only(top: 20),
                                                decoration: BoxDecoration(
                                                  color: const Color(0xFFE9ECEF),
                                                  borderRadius: BorderRadius.circular(1),
                                                ),
                                              ),
                                              
                                              // 스텝 2 (완료된 체크)
                                              Column(
                                                children: [
                                                  // 상단 화살표 (삼각형)
                                                  Transform.rotate(
                                                    angle: 3.14159,
                                                    child: SvgPicture.asset(
                                                      'assets/images/polygon5.svg',
                                                      width: 11,
                                                      height: 11,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  // 원형 체크 아이콘
                                                  SizedBox(
                                                    width: 23,
                                                    height: 23,
                                                    child: Stack(
                                                      children: [
                                                        SvgPicture.asset(
                                                          'assets/images/group1000011228.svg',
                                                          width: 23,
                                                          height: 23,
                                                        ),
                                                        Center(
                                                          child: SvgPicture.asset(
                                                            'assets/images/check_small.svg',
                                                            width: 19,
                                                            height: 19,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              
                                              // 연결선 2
                                              Container(
                                                width: connectionWidth,
                                                height: 3,
                                                margin: const EdgeInsets.only(top: 20),
                                                decoration: BoxDecoration(
                                                  color: const Color(0xFFE9ECEF),
                                                  borderRadius: BorderRadius.circular(1),
                                                ),
                                              ),
                                              
                                              // 스텝 3 (완료된 체크)
                                              Column(
                                                children: [
                                                  Transform.rotate(
                                                    angle: 3.14159,
                                                    child: SvgPicture.asset(
                                                      'assets/images/polygon5.svg',
                                                      width: 11,
                                                      height: 11,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  SizedBox(
                                                    width: 23,
                                                    height: 23,
                                                    child: Stack(
                                                      children: [
                                                        SvgPicture.asset(
                                                          'assets/images/group1000011228.svg',
                                                          width: 23,
                                                          height: 23,
                                                        ),
                                                        Center(
                                                          child: SvgPicture.asset(
                                                            'assets/images/check_small.svg',
                                                            width: 19,
                                                            height: 19,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              
                                              // 연결선 3
                                              Container(
                                                width: connectionWidth,
                                                height: 3,
                                                margin: const EdgeInsets.only(top: 20),
                                                decoration: BoxDecoration(
                                                  color: const Color(0xFFE9ECEF),
                                                  borderRadius: BorderRadius.circular(1),
                                                ),
                                              ),
                                              
                                              // 스텝 4 (완료된 체크)
                                              Column(
                                                children: [
                                                  Transform.rotate(
                                                    angle: 3.14159,
                                                    child: SvgPicture.asset(
                                                      'assets/images/polygon5.svg',
                                                      width: 11,
                                                      height: 11,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  SizedBox(
                                                    width: 23,
                                                    height: 23,
                                                    child: Stack(
                                                      children: [
                                                        SvgPicture.asset(
                                                          'assets/images/group1000011228.svg',
                                                          width: 23,
                                                          height: 23,
                                                        ),
                                                        Center(
                                                          child: SvgPicture.asset(
                                                            'assets/images/check_small.svg',
                                                            width: 19,
                                                            height: 19,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              
                                              // 연결선 4
                                              Container(
                                                width: connectionWidth,
                                                height: 3,
                                                margin: const EdgeInsets.only(top: 20),
                                                decoration: BoxDecoration(
                                                  color: const Color(0xFFE9ECEF),
                                                  borderRadius: BorderRadius.circular(1),
                                                ),
                                              ),
                                              
                                              // 스텝 5 (완료된 체크)
                                              Column(
                                                children: [
                                                  Transform.rotate(
                                                    angle: 3.14159,
                                                    child: SvgPicture.asset(
                                                      'assets/images/polygon5.svg',
                                                      width: 11,
                                                      height: 11,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  SizedBox(
                                                    width: 23,
                                                    height: 23,
                                                    child: Stack(
                                                      children: [
                                                        SvgPicture.asset(
                                                          'assets/images/group1000011228.svg',
                                                          width: 23,
                                                          height: 23,
                                                        ),
                                                        Center(
                                                          child: SvgPicture.asset(
                                                            'assets/images/check_small.svg',
                                                            width: 19,
                                                            height: 19,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                      
                                      const SizedBox(height: 8),
                                      
                                      // 하단 진행도 텍스트
                                      const Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '이번 주 목표 달성!',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF737679),
                                              letterSpacing: -0.26,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '1',
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF008DFF),
                                                  letterSpacing: -0.26,
                                                ),
                                              ),
                                              Text(
                                                ' / 5번',
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF737679),
                                                  letterSpacing: -0.26,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              
                              const SizedBox(height: 30),
                              
                              // 미션 3: 가장 좋아하는 친환경 브랜드는?
                              Row(
                                children: [
                                  Container(
                                    width: 61,
                                    height: 61,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF8F9FA),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '가장 좋아하는 친환경 브랜드는?',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xFF505050),
                                                letterSpacing: -0.32,
                                              ),
                                            ),
                                            SizedBox(height: 8),
                                            Text(
                                              '꾸미기 아이템 받기',
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF737679),
                                                letterSpacing: -0.26,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SvgPicture.asset(
                                          'assets/images/arrow_forward_ios.svg',
                                          width: 20,
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}