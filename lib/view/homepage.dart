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
            "Business List",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: FutureBuilder(
          future: _businessViewModel.fetchBusinessData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive());
            }
            return ListView.builder(
              itemCount: _businessViewModel.businessListData.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                  child: ListTile(
                    leading: CircleAvatar(child: Text(" ${index + 1}")),
                    title: Text(
                      "${_businessViewModel.businessListData[index].name}",
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      _businessViewModel
                          .businessListData[index].location.display_address.last
                          .toString(),
                      style: const TextStyle(fontSize: 10),
                    ),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BusinessDetails(
                              business:
                                  _businessViewModel.businessListData[index]),
                        )),
                  ),
                );
              },
            );
          },
        ));
  }
}
