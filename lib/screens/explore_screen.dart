import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> with TickerProviderStateMixin {
  // 상단 토글 상태 관리 (0: 추천, 1: 직접 찾기)
  int selectedTabIndex = 0;
  
  // 선택된 카드들을 관리하는 Map
  Map<String, List<int>> selectedCards = {
    '아동/어린이': [1], // 두 번째 카드가 선택된 상태
    '환경': [0],
    '동물': [0],
  };

  // 펼쳐진 카드들을 관리하는 Map
  Map<String, List<int>> expandedCards = {
    '아동/어린이': [1], // 두 번째 카드가 펼쳐진 상태
    '환경': [],
    '동물': [],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 122),
                // 선택된 탭에 따른 컨텐츠 표시
                if (selectedTabIndex == 0) _buildRecommendedContent(),
                if (selectedTabIndex == 1) _buildDirectSearchContent(),
              ],
            ),
          ),
          // Top Navigation
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 130,
              color: const Color(0xFFF6F6F6),
              child: Column(
                children: [
                  const SizedBox(height: 65),
                  // Tab Bar Style
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFFE8EBF1),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        // 추천 탭
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedTabIndex = 0;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: selectedTabIndex == 0 ? const Color(0xFF1C1B1F) : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/star_shine.svg',
                                    width: 18,
                                    height: 18,
                                    colorFilter: ColorFilter.mode(
                                      selectedTabIndex == 0 ? const Color(0xFF1C1B1F) : const Color(0xFF969696),
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    '추천',
                                    style: TextStyle(
                                      fontFamily: 'Pretendard',
                                      fontSize: 18,
                                      fontWeight: selectedTabIndex == 0 ? FontWeight.w600 : FontWeight.w500,
                                      color: selectedTabIndex == 0 ? const Color(0xFF1C1B1F) : const Color(0xFF969696),
                                      letterSpacing: -0.4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // 직접 찾기 탭
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedTabIndex = 1;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: selectedTabIndex == 1 ? const Color(0xFF1C1B1F) : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                              ),
                              child: Text(
                                '직접 찾기',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Pretendard',
                                  fontSize: 16,
                                  fontWeight: selectedTabIndex == 1 ? FontWeight.w600 : FontWeight.w500,
                                  color: selectedTabIndex == 1 ? const Color(0xFF1C1B1F) : const Color(0xFF969696),
                                  letterSpacing: -0.4,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bottom Section (only show for recommended tab)
          if (selectedTabIndex == 0)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white.withValues(alpha: 0),
                      Colors.white.withValues(alpha: 0.6),
                      Colors.white,
                    ],
                    stops: const [0.0, 0.3, 1.0],
                  ),
                ),
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(45, 20, 45, 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '남은 기부금 5,300원',
                            style: TextStyle(
                              fontFamily: 'Pretendard',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF969696),
                              letterSpacing: -0.3,
                            ),
                          ),
                          Row(
                            children: [
                              const Text(
                                '지금 사용',
                                style: TextStyle(
                                  fontFamily: 'Pretendard',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF969696),
                                  letterSpacing: -0.3,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                '5,200원',
                                style: TextStyle(
                                  fontFamily: 'Pretendard',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1C1B1F),
                                  letterSpacing: -0.5,
                                ),
                              ),
                              const SizedBox(width: 8),
                              SvgPicture.asset(
                                'assets/images/error.svg',
                                width: 20,
                                height: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        height: 58,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1C1B1F),
                          borderRadius: BorderRadius.circular(500),
                        ),
                        child: const Center(
                          child: Text(
                            '이대로 기부하기',
                            style: TextStyle(
                              fontFamily: 'Pretendard',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: -0.4,
                            ),
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
    );
  }

  Widget _buildCategoryCard({
    required String title,
    required String percentage,
    required Color color,
    required String image,
    double? width,
  }) {
    return SizedBox(
      width: 190,
      height: 280,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Background rounded square
          Positioned(
            top: 40,
            left: 0,
            child: Container(
              width: 190,
              height: 190,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(36),
              ),
            ),
          ),
          // Image at the top - overlapping the card
          Positioned(
            top: 0,
            left: (190 - 79) / 2, // Center the image
            child: Container(
              width: 79,
              height: 78,
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Stats container with border - positioned behind badge
          Positioned(
            top: 120,
            left: (190 - 162) / 2, // Center the stats container
            child: Container(
              width: 162,
              height: 99,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: const Color(0xFFF2F2F2)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '내 기부금의',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF969696),
                      letterSpacing: -0.375,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$percentage 전달',
                    style: const TextStyle(
                      fontFamily: 'Pretendard',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1C1B1F),
                      letterSpacing: -0.6,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Category badge - positioned on top with highest z-index
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: color == const Color(0xFFFF9000) ? const Color(0xFFFFEFD0)
                        : color == const Color(0xFF009C38) ? const Color(0xFFD5F4E6)
                        : const Color(0xFFDEEAFF),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: color,
                    letterSpacing: -0.4,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDonationSection({
    required String number,
    required String category,
    required String percentage,
    required String amount,
    required Color color,
    required Color backgroundColor,
    required bool isSelected,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: const Color(0xED1C1B1F),
                    borderRadius: BorderRadius.circular(35.62),
                  ),
                  child: Center(
                    child: Text(
                      number,
                      style: const TextStyle(
                        fontFamily: 'Pretendard',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: -0.35,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  category,
                  style: const TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1C1B1F),
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '남은 기부금의 $percentage',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: color,
                      letterSpacing: -0.3,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  amount,
                  style: const TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1C1B1F),
                    letterSpacing: -0.4,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Donation Cards
        Column(
          children: List.generate(
            3,
            (index) => Padding(
              padding: EdgeInsets.only(bottom: index < 2 ? 16 : 0),
              child: _buildFigmaDonationCard(
                index: index,
                category: category,
                isSelected: selectedCards[category]?.contains(index) ?? false,
                isExpanded: expandedCards[category]?.contains(index) ?? false,
                borderColor: color,
                checkColor: color,
                checkBackground: backgroundColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFigmaDonationCard({
    required int index,
    required String category,
    required bool isSelected,
    required bool isExpanded,
    required Color borderColor,
    required Color checkColor,
    required Color checkBackground,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 왼쪽 선택 버튼
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: GestureDetector(
            onTap: () {
              setState(() {
                if (isSelected) {
                  selectedCards[category]?.remove(index);
                } else {
                  if (selectedCards[category] == null) {
                    selectedCards[category] = [];
                  }
                  selectedCards[category]!.add(index);
                }
              });
            },
            child: Container(
              width: 21,
              height: 21,
              decoration: BoxDecoration(
                color: isSelected 
                    ? (category == '환경' ? const Color(0xFF009C38) 
                       : category == '동물' ? const Color(0xFF3E85FF)
                       : const Color(0xFFFF9000))
                    : const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(4),
              ),
              child: isSelected
                  ? const Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 16,
                      ),
                    )
                  : null,
            ),
          ),
        ),
        // 오른쪽 카드 내용
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: isSelected 
                    ? Border.all(
                        color: category == '환경' ? const Color(0xFF009C38) 
                               : category == '동물' ? const Color(0xFF3E85FF)
                               : const Color(0xFFFF9000), 
                        width: 1
                      ) 
                    : null,
              ),
              child: Column(
              children: [
                // 메인 카드 내용
                Container(
                  constraints: const BoxConstraints(minHeight: 169),
                  padding: const EdgeInsets.all(23),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // 매칭률 뱃지
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: category == '환경' ? const Color(0xFFD5F4E6)
                                : category == '동물' ? const Color(0xFFDEEAFF)
                                : const Color(0xFFFFEFD0),
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                color: category == '환경' ? const Color(0xFF009C38)
                                       : category == '동물' ? const Color(0xFF3E85FF)
                                       : const Color(0xFFFF9000),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 10,
                              ),
                            ),
                            const SizedBox(width: 2),
                            Text(
                              '매칭률 87%',
                              style: TextStyle(
                                fontFamily: 'Pretendard',
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: category == '환경' ? const Color(0xFF009C38)
                                       : category == '동물' ? const Color(0xFF3E85FF)
                                       : const Color(0xFFFF9000),
                                letterSpacing: -0.325,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      // 제목
                      const Flexible(
                        child: Text(
                          '우리는 지금, 마지막 고래를 보고 있을지도 모릅니다',
                          style: TextStyle(
                            fontFamily: 'Pretendard',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1C1B1F),
                            letterSpacing: -0.5,
                            height: 1.4,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // 기관 정보
                      Flexible(
                        child: Row(
                          children: [
                            Container(
                              width: 31,
                              height: 31,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: const Color(0xFFE8EBF1)),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  'assets/images/organization_logo.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Expanded(
                              child: Text(
                                '환경운동연합',
                                style: TextStyle(
                                  fontFamily: 'Pretendard',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF969696),
                                  letterSpacing: -0.4,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // 펼치기/접기 버튼 섹션
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(top: BorderSide(color: Color(0xFFF2F2F2), width: 1)),
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (isExpanded) {
                              expandedCards[category]?.remove(index);
                            } else {
                              if (expandedCards[category] == null) {
                                expandedCards[category] = [];
                              }
                              expandedCards[category]!.add(index);
                            }
                          });
                        },
                        child: Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '소중한 기부금 이렇게 사용합니다',
                                style: TextStyle(
                                  fontFamily: 'Pretendard',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF969696),
                                  letterSpacing: -0.375,
                                ),
                              ),
                              Transform.rotate(
                                angle: isExpanded ? 3.14159 : 0,
                                child: const Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 24,
                                  color: Color(0xFF969696),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // 펼쳐진 내용
                      if (isExpanded)
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.fromLTRB(23, 0, 23, 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '고래 서식지 현장 조사\n7,000,000원\n해양포유류보호법 제정을 위한 국회 토론회\n2,000,000원\n생태보전 활동가 활동비 (3개월)\n6,000,000원',
                                  style: TextStyle(
                                    fontFamily: 'Pretendard',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF969696),
                                    letterSpacing: -0.4,
                                    height: 1.4,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              const SizedBox(height: 24),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '자세히 보기',
                                  style: TextStyle(
                                    fontFamily: 'Pretendard',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF969696),
                                    letterSpacing: -0.375,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // 추천 탭 컨텐츠
  Widget _buildRecommendedContent() {
    return Column(
      children: [
        // Hero Section
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(29, 34, 29, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 300,
                  child: Text(
                    '지금까지 당신의 기부는 이렇게 흘러왔어요',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1C1B1F),
                      height: 1.3,
                      letterSpacing: -0.8,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 26),
            // Cards Row - Horizontal Scrollable
            SizedBox(
              height: 280,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 29),
                child: Row(
                  children: [
                    _buildCategoryCard(
                      title: '아동/어린이',
                      percentage: '80%',
                      color: const Color(0xFFFF9000),
                      image: 'assets/images/kids.png',
                      width: null,
                    ),
                    const SizedBox(width: 20),
                    _buildCategoryCard(
                      title: '환경',
                      percentage: '12%',
                      color: const Color(0xFF009C38),
                      image: 'assets/images/nature.png',
                      width: null,
                    ),
                    const SizedBox(width: 20),
                    _buildCategoryCard(
                      title: '동물',
                      percentage: '8%',
                      color: const Color(0xFF3E85FF),
                      image: 'assets/images/animal.png',
                      width: null,
                    ),
                    const SizedBox(width: 29), // 오른쪽 패딩
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 54),
        // Tooltip positioned absolutely
        Padding(
          padding: const EdgeInsets.only(left: 29),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14.25, vertical: 8.55),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C1B1F),
                    borderRadius: BorderRadius.circular(35.62),
                  ),
                  child: const Text(
                    '나에게 딱 맞는 이달의 기부',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xEDFFFFFF),
                      letterSpacing: -0.35,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(24, -1),
                  child: Transform.rotate(
                    angle: 3.14159,
                    child: SvgPicture.asset(
                      'assets/images/polygon.svg',
                      width: 21.25,
                      height: 21.25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        // Donation List
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 29),
          child: Column(
            children: [
              _buildDonationSection(
                number: '1',
                category: '아동/어린이',
                percentage: '80%',
                amount: '4,200원',
                color: const Color(0xFFFFAA00),
                backgroundColor: const Color(0xFFFFEFD0),
                isSelected: true,
              ),
              const SizedBox(height: 54),
              _buildDonationSection(
                number: '2',
                category: '환경',
                percentage: '12%',
                amount: '600원',
                color: const Color(0xFF009C38),
                backgroundColor: const Color(0xFFD5F4E6),
                isSelected: true,
              ),
              const SizedBox(height: 54),
              _buildDonationSection(
                number: '3',
                category: '동물',
                percentage: '8%',
                amount: '400원',
                color: const Color(0xFF3E85FF),
                backgroundColor: const Color(0xFFDEEAFF),
                isSelected: true,
              ),
              const SizedBox(height: 200),
            ],
          ),
        ),
      ],
    );
  }

  // 직접 찾기 탭 컨텐츠
  Widget _buildDirectSearchContent() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(29, 34, 29, 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '관심 있는 분야를 직접 찾아보세요',
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1C1B1F),
              height: 1.3,
              letterSpacing: -0.8,
            ),
          ),
          const SizedBox(height: 32),
          // 검색 바
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: '기부처 또는 키워드를 검색해보세요',
                hintStyle: const TextStyle(
                  fontFamily: 'Pretendard',
                  fontSize: 16,
                  color: Color(0xFF969696),
                  letterSpacing: -0.4,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xFF969696),
                  size: 24,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              ),
            ),
          ),
          const SizedBox(height: 32),
          // 카테고리 필터
          const Text(
            '카테고리별 찾기',
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1C1B1F),
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _buildCategoryChip('아동/어린이', const Color(0xFFFFAA00)),
              _buildCategoryChip('환경', const Color(0xFF009C38)),
              _buildCategoryChip('동물', const Color(0xFF3E85FF)),
              _buildCategoryChip('의료', const Color(0xFFFF6B6B)),
              _buildCategoryChip('교육', const Color(0xFF4ECDC4)),
              _buildCategoryChip('문화예술', const Color(0xFF9B59B6)),
              _buildCategoryChip('노인복지', const Color(0xFFE67E22)),
              _buildCategoryChip('장애인', const Color(0xFF2ECC71)),
            ],
          ),
          const SizedBox(height: 32),
          // 추천 기부처 목록
          const Text(
            '인기 기부처',
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1C1B1F),
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 16),
          ...List.generate(5, (index) => _buildOrganizationCard(index)),
        ],
      ),
    );
  }

  // 카테고리 칩 위젯
  Widget _buildCategoryChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'Pretendard',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: color,
          letterSpacing: -0.35,
        ),
      ),
    );
  }

  // 기부처 카드 위젯
  Widget _buildOrganizationCard(int index) {
    final organizations = [
      {'name': '유니세프', 'description': '전 세계 어린이를 위한 구호활동'},
      {'name': '그린피스', 'description': '환경보호와 평화를 위한 캠페인'},
      {'name': '월드비전', 'description': '아동복지와 지역개발 사업'},
      {'name': '굿네이버스', 'description': '국내외 아동보호 및 지원'},
      {'name': '환경운동연합', 'description': '한국의 대표적인 환경보호단체'},
    ];

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFF7F8FA),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.favorite,
              color: Color(0xFF969696),
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  organizations[index]['name']!,
                  style: const TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1C1B1F),
                    letterSpacing: -0.4,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  organizations[index]['description']!,
                  style: const TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 14,
                    color: Color(0xFF969696),
                    letterSpacing: -0.35,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF969696),
            size: 16,
          ),
        ],
      ),
    );
  }

}