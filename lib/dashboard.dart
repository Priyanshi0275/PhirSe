import 'package:flutter/material.dart';

// Dashboard Screen - Main container with bottom navigation
class DashboardScreen extends StatefulWidget {
  final String phoneNumber;
  
  const DashboardScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  
  // List of pages for each tab
  late List<Widget> _pages;
  
  @override
  void initState() {
    super.initState();
    _pages = [
      OrdersTab(phoneNumber: widget.phoneNumber),
      StoreTab(),
      CallScheduleTab(),
      ProfileTab(phoneNumber: widget.phoneNumber),
      InsightsTab(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xFF6C5CE7),
          unselectedItemColor: Color(0xFFA0AEC0),
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 11,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              activeIcon: Icon(Icons.shopping_cart),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.store_outlined),
              activeIcon: Icon(Icons.store),
              label: 'Store',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.schedule_outlined),
              activeIcon: Icon(Icons.schedule),
              label: 'Calls',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.insights_outlined),
              activeIcon: Icon(Icons.insights),
              label: 'Insights',
            ),
          ],
        ),
      ),
    );
  }
}

// 1️⃣ Orders Tab - Default Screen
class OrdersTab extends StatelessWidget {
  final String phoneNumber;
  
  const OrdersTab({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF667eea),
                    Color(0xFF6C5CE7),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome, Priyanshi ji!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Here\'s your regulars',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            
            // Orders List
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: 3, // Placeholder data
                itemBuilder: (context, index) {
                  return _buildOrderCard(context, index);
                },
              ),
            ),
          ],
        ),
      ),
      
      // Floating Add Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to add item screen
        },
        backgroundColor: Color(0xFF6C5CE7),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
  
  Widget _buildOrderCard(BuildContext context, int index) {
    final items = [
      {'name': 'Dettol Soap', 'frequency': 'Every Friday', 'nextOrder': '25 Jun 2025'},
      {'name': 'Milk - 1L', 'frequency': 'Daily', 'nextOrder': '22 Jun 2025'},
      {'name': 'Bread Loaf', 'frequency': 'Every 3 days', 'nextOrder': '23 Jun 2025'},
    ];
    
    final item = items[index];
    
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.check_circle,
                color: Color(0xFF10B981),
                size: 20,
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  item['name']!,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2D3748),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Icon(
                Icons.repeat,
                color: Color(0xFF6C5CE7),
                size: 16,
              ),
              SizedBox(width: 4),
              Text(
                item['frequency']!,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF718096),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.calendar_today,
                color: Color(0xFF6C5CE7),
                size: 16,
              ),
              SizedBox(width: 4),
              Text(
                'Next: ${item['nextOrder']}',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF718096),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.edit, size: 16),
                  label: Text('Edit'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Color(0xFF6C5CE7),
                    side: BorderSide(color: Color(0xFF6C5CE7)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.pause, size: 16),
                  label: Text('Pause'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Color(0xFFEF4444),
                    side: BorderSide(color: Color(0xFFEF4444)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// 2️⃣ Store Tab
class StoreTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Current Store',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D3748),
                ),
              ),
              SizedBox(height: 16),
              _buildCurrentStoreCard(),
              SizedBox(height: 24),
              Text(
                'Available Stores Near You',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2D3748),
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) => _buildStoreCard(index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildCurrentStoreCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF667eea), Color(0xFF6C5CE7)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.store, color: Colors.white, size: 24),
              SizedBox(width: 8),
              Text(
                'Reliance Fresh',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            '📍 123 Main Street, Lucknow',
            style: TextStyle(color: Colors.white.withOpacity(0.9)),
          ),
          SizedBox(height: 4),
          Text(
            '📞 +91 98765 43210',
            style: TextStyle(color: Colors.white.withOpacity(0.9)),
          ),
        ],
      ),
    );
  }
  
  Widget _buildStoreCard(int index) {
    final stores = [
      {'name': 'Big Bazaar', 'address': '456 Mall Road, Lucknow'},
      {'name': 'More Supermarket', 'address': '789 Civil Lines, Lucknow'},
      {'name': 'Spencer\'s', 'address': '321 Gomti Nagar, Lucknow'},
    ];
    
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.store_outlined, color: Color(0xFF6C5CE7)),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stores[index]['name']!,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  stores[index]['address']!,
                  style: TextStyle(
                    color: Color(0xFF718096),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFFA0AEC0)),
        ],
      ),
    );
  }
}

// 3️⃣ Call Schedule Tab
class CallScheduleTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Next Reorder Call',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D3748),
                ),
              ),
              SizedBox(height: 16),
              _buildNextCallCard(),
              SizedBox(height: 24),
              _buildCallSettings(),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildNextCallCard() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF667eea), Color(0xFF6C5CE7)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(Icons.phone_callback, color: Colors.white, size: 32),
          SizedBox(height: 12),
          Text(
            'Tomorrow, 10:00 AM',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'DTMF Input Preferred',
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildCallSettings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Settings',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2D3748),
          ),
        ),
        SizedBox(height: 16),
        _buildSettingTile('Reschedule Call', Icons.schedule, () {}),
        _buildSettingTile('Mute Calls', Icons.volume_off, () {}),
        _buildSettingTile('Manual Call Now', Icons.phone, () {}),
      ],
    );
  }
  
  Widget _buildSettingTile(String title, IconData icon, VoidCallback onTap) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: Color(0xFF6C5CE7)),
        title: Text(title),
        onTap: onTap,
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

// 4️⃣ Profile Tab
class ProfileTab extends StatelessWidget {
  final String phoneNumber;
  
  const ProfileTab({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              // Profile Header
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Color(0xFF6C5CE7).withOpacity(0.1),
                      child: Text(
                        'P',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6C5CE7),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Priyanshi',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      phoneNumber,
                      style: TextStyle(
                        color: Color(0xFF718096),
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '123 Main Street, Lucknow',
                      style: TextStyle(
                        color: Color(0xFF718096),
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.edit),
                      label: Text('Edit Profile'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF6C5CE7),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              
              // Menu Items
              _buildMenuItem('FAQ / Support', Icons.help_outline, () {}),
              _buildMenuItem('Logout', Icons.logout, () {}),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildMenuItem(String title, IconData icon, VoidCallback onTap) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: Color(0xFF6C5CE7)),
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

// 5️⃣ Insights Tab
class InsightsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Savings Header
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF10B981), Color(0xFF059669)],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Icon(Icons.savings, color: Colors.white, size: 32),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'This Month You Saved',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '₹78!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              
              // Stats Grid
              Row(
                children: [
                  Expanded(child: _buildStatCard('Orders Placed', '12', Icons.shopping_cart)),
                  SizedBox(width: 12),
                  Expanded(child: _buildStatCard('Calls Answered', '10', Icons.phone)),
                ],
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildStatCard('Calls Missed', '2', Icons.phone_missed)),
                  SizedBox(width: 12),
                  Expanded(child: _buildStatCard('Money Saved', '₹78', Icons.attach_money)),
                ],
              ),
              SizedBox(height: 24),
              
              // Loyalty Perks
              Text(
                'Loyalty Perks',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2D3748),
                ),
              ),
              SizedBox(height: 16),
              _buildLoyaltyCard(),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildStatCard(String title, String value, IconData icon) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: Color(0xFF6C5CE7), size: 24),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3748),
            ),
          ),
          SizedBox(height: 4),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF718096),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildLoyaltyCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFfbbf24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.local_offer, color: Color(0xFFfbbf24), size: 24),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '₹10 off Dettol',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Valid till 30 June 2025',
                  style: TextStyle(
                    color: Color(0xFF718096),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text('Use Now'),
            style: TextButton.styleFrom(
              foregroundColor: Color(0xFF6C5CE7),
            ),
          ),
        ],
      ),
    );
  }
}