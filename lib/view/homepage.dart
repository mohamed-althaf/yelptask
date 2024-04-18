import 'package:flutter/material.dart';
import 'package:yelptask/view/business_details.dart';
import 'package:yelptask/view_model/business_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BusinessViewModel _businessViewModel = BusinessViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Home Page",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder(
        future: _businessViewModel.fetchBusinessData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 8,
              childAspectRatio: 2.5 / 2.7,
            ),
            itemCount: _businessViewModel.businessListData.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BusinessDetails(
                      business: _businessViewModel.businessListData[index],
                    ),
                  ),
                ),
                child: Card(
                  color: Colors.white,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                  child: Column(
                    children: [
                      Image.network(
                        _businessViewModel.businessListData[index].image_url,
                        height: 150,
                      ),
                      ListTile(
                        title: Center(
                          child: Text(
                            "${_businessViewModel.businessListData[index].name}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
