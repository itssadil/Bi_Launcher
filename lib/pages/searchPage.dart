import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Application>? _apps;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadApps();
  }

  Future<void> _loadApps() async {
    List<Application> apps = await DeviceApps.getInstalledApplications(
      includeSystemApps: true,
      onlyAppsWithLaunchIntent: true,
      includeAppIcons: true,
      // sort: ApplicationSortOrder.NAME,
    );
    setState(() {
      _apps = apps;
    });
  }

  void _search(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  List<Application>? _filteredApps() {
    if (_apps == null) {
      return null;
    }
    if (_searchQuery.isEmpty) {
      return _apps;
    }
    return _apps!
        .where((app) =>
            app.appName.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF060131),
                Color(0xFF18122B),
                Color(0xFF18122B),
                Color(0xFFD21312),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.blue,
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          onChanged: _search,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 12.0),
                            enabled: true,
                            label: Text('Search apps...'),
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(
                              Icons.search,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: _buildBody()),
              ],
            ),
          )),
    );
  }

  Widget _buildBody() {
    if (_apps == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    List<Application>? apps = _filteredApps();
    if (apps == null || apps.isEmpty) {
      return Center(
        child: Text('No apps found'),
      );
    }
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1.5,
      ),
      itemCount: apps.length,
      itemBuilder: (BuildContext context, int index) {
        Application app = apps[index];
        return InkWell(
          onTap: () {
            DeviceApps.openApp(app.packageName);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.memory(
                (app as ApplicationWithIcon).icon,
                width: 64,
                height: 64,
              ),
              SizedBox(height: 4),
              Text(
                app.appName,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        );
      },
    );
  }
}
