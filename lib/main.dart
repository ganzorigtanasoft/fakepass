import 'dart:ui'; // Required for BackdropFilter
import 'package:flutter/material.dart';
import 'package:fake_passport/components/menulist.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [Image.asset('assets/images/emongolia.jpg', height: 40)],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Color(0xFF1356c5)),
            onPressed: () {},
          ),
          SizedBox(width: 16),
          IconButton(
            icon: Icon(Icons.menu, color: Color(0xFF1356c5)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Миний бичиг баримтууд',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3e5983),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Шинэчлэх',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3e5983),
                      ),
                    ),
                    SizedBox(width: 4),
                    Image.asset("assets/images/refresh.png", height: 16),
                  ],
                ),
              ],
            ),
            SizedBox(height: 2),
            GestureDetector(
              onTap: () => _showPassportModal(context),
              child: Image.asset('assets/images/passport.jpg'),
            ),
            SizedBox(height: 16),
            Text(
              'Төрд байгаа миний мэдээлэл',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3e5983),
              ),
            ),
            SizedBox(height: 16),
            Column(
              children: [
                Menulist(
                  imagePath: "assets/images/answer.png",
                  text: "Санал асуулга",
                ),
                SizedBox(height: 8),
                Menulist(
                  imagePath: "assets/images/chingis.png",
                  text: '"Чингис Хаан" Үндэсний Баялгийн Сан',
                ),
                SizedBox(height: 8),
                Menulist(
                  imagePath: "assets/images/info.png",
                  text: "Нийгмийн даатгалын мэдээлэл",
                ),
                SizedBox(height: 8),
                Menulist(
                  imagePath: "assets/images/pension.png",
                  text: "Миний тэтгэврийн мөнгөн хуримтлал",
                ),
                SizedBox(height: 8),
                Menulist(
                  imagePath: "assets/images/loan.png",
                  text: "Зээлийн мэдээлэл",
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 56,
        width: 56,
        decoration: BoxDecoration(
          color: Color(0xFF2968fc),
          shape: BoxShape.circle,
        ),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color(0xFF2968fc),
          elevation: 0,
          child: Icon(Icons.qr_code_scanner, color: Colors.white, size: 28),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: MediaQuery.of(context).size.width / 2 - 30,
              child: Container(
                width: 60,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildNavItem('assets/images/home.png', 'Нүүр', false),
                  _buildNavItem('assets/images/four.png', 'Үйлчилгээ', false),
                  SizedBox(width: 60),
                  _buildNavItem('assets/images/chat.png', 'Чат', false),
                  _buildNavItem('assets/images/profile.png', 'Профайл', true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPassportModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      barrierLabel: "PassportModal",
      barrierColor: Colors.black.withOpacity(0.4),
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          // This container will fill the screen
          color: Colors.transparent,
          child: Stack(
            children: [
              // Blurred background that covers the entire screen
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(color: Colors.black.withOpacity(0.2)),
                ),
              ),
              // Modal content anchored at the bottom
              DraggableScrollableSheet(
                initialChildSize: 0.75, // Initial height (75% of screen)
                minChildSize: 0.5, // Minimum height when dragged up
                maxChildSize: 0.9, // Maximum height when dragged up
                builder: (_, controller) {
                  return PassportModal();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNavItem(String imagePath, String label, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Image.asset(imagePath, width: 28, height: 28),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: isSelected ? Colors.blue : Color(0xFF3e5983),
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

class PassportModal extends StatefulWidget {
  @override
  _PassportModalState createState() => _PassportModalState();
}

class _PassportModalState extends State<PassportModal>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _flipAnimation;
  bool _isShowingBack = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 400), // Faster animation (was 800ms)
      vsync: this,
    );

    _flipAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _flipPassport() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
      setState(() {
        _isShowingBack = false;
      });
    } else {
      _animationController.forward();
      setState(() {
        _isShowingBack = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75, // 75% of screen height
      width: double.infinity, // Full width
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Ensure column takes only needed space
        children: [
          Container(
            margin: EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Иргэний үнэмлэх',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3e5983),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: GestureDetector(
                onTap: _flipPassport,
                child: AnimatedBuilder(
                  animation: _flipAnimation,
                  builder: (context, child) {
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(_flipAnimation.value * 3.14159),
                      child: _flipAnimation.value < 0.5
                          ? Image.asset('assets/images/passport.jpg')
                          : Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.identity()..rotateY(3.14159),
                              child: Image.asset('assets/images/back.jpg'),
                            ),
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 36, vertical: 18),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff1e6fff),
                      padding: EdgeInsets.symmetric(
                        vertical: 24,
                        horizontal: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Дахин захиалах',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff1e6fff)),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onPressed: _flipPassport, // Flip on button tap
                    icon: Image.asset(
                      'assets/images/back2.png',
                      width: 24,
                      height: 24,
                    ),
                    padding: EdgeInsets.all(12),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                'Хаах',
                style: TextStyle(fontSize: 16, color: Color(0xFF3e5983)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: HomeScreen()));
}
