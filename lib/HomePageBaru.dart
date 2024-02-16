import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_model.dart';
import 'user_provider.dart';
import 'ApiService.dart';

class HomePageBaru extends StatefulWidget {
  @override
  _HomePageBaruState createState() => _HomePageBaruState();
}

class _HomePageBaruState extends State<HomePageBaru> {
  List<Map<String, dynamic>> products = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      ApiService apiService = ApiService();
      List<Map<String, dynamic>> productList = await apiService.getProducts();

      setState(() {
        products = productList;
      });
    } catch (e) {
      // Handle error
      print('Failed to load data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    UserModel? user = context.watch<UserProvider>().user;

    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 200.0,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text('Header'),
                  background: Image.asset(
                    'assets/galaxy.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                bottom: PreferredSize(
                  child: Container(
                    color: Colors.blueAccent,
                    height: 10.0,
                  ),
                  preferredSize: Size.fromHeight(10.0),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    elevation: 0,
                    child: Center(
                      child: Text(
                        "Selamat Datang",
                        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverHeaderDelegate(
                  minHeight: 130,
                  maxHeight: 130,
                  child: Container(
                    color: Colors.white,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Card(
                          elevation: 8.0,
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(user?.nama ?? 'Nama Anda'),
                                subtitle: Text(user?.nomor??'Detail Akun Anda'),
                                leading: Icon(Icons.star),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.abc),
                                  Icon(Icons.adb),
                                  Icon(Icons.add_a_photo_sharp),
                                  Icon(Icons.add_home),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    Map<String, dynamic> product = products[index];

                    return ListTile(
                      leading: Image.network(
                        'http://your_base_url/' + product['foto'], // Adjust the field name accordingly
                        width: 80.0,
                        height: 80.0,
                        fit: BoxFit.cover,
                      ),
                      title: Text(product['nama']),
                      subtitle: Text(product['deskripsi']),
                    );
                  },
                  childCount: products.length,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  _SliverHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
