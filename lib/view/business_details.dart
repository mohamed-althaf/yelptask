import 'package:flutter/material.dart';
import 'package:yelptask/model/business.dart';

class BusinessDetails extends StatelessWidget {
  const BusinessDetails({super.key, required this.business});

  final Business business;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Business Details",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  business.image_url,
                  cacheWidth: (MediaQuery.of(context).size.width * 0.8).toInt(),
                ),
              ),
            ),
            const SizedBox(height: 12),
            ListTile(
              leading:
                  const Icon(Icons.location_city, color: Colors.deepPurple),
              title: Text(business.name.toString()),
            ),
            ListTile(
              leading:
                  const Icon(Icons.currency_exchange, color: Colors.deepPurple),
              title: Text(business.price),
            ),
            ListTile(
              leading: const Icon(Icons.shopify, color: Colors.deepPurple),
              title: Text(business.is_closed ? "Shop Closed" : "Shop Open"),
            ),
            ListTile(
              leading: const Icon(Icons.phone_android_rounded,
                  color: Colors.deepPurple),
              title: Text(business.phone),
            ),
            ListTile(
              leading: const Icon(Icons.rate_review, color: Colors.deepPurple),
              title: Text("Rating - ${business.rating}"),
            ),
            ListTile(
              leading: const Icon(Icons.near_me, color: Colors.deepPurple),
              title: Text(business.location.display_address.join(" ")),
            ),
          ],
        ),
      ),
    );
  }
}
