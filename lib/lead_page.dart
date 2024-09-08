import 'package:boxigo_sample_app/bloc/sample_bloc.dart';
import 'package:boxigo_sample_app/common_widgets/app_bar.dart';
import 'package:boxigo_sample_app/common_widgets/bottom_nav_bar.dart';
import 'package:boxigo_sample_app/detail_page.dart';
import 'package:boxigo_sample_app/model/sample_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class LeadsPage extends StatelessWidget {
  const LeadsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sampleDataBloc = BlocProvider.of<SampleDataBloc>(context);
    List<CustomerEstimateFlow>? customerList = [];
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar(context, "Lead"),
        body: BlocBuilder<SampleDataBloc, SampleDataState>(
            bloc: sampleDataBloc,
            builder: (context, state) {
              if (state is SampleDataLoadedState) {
                customerList = state.sampleData.customerEstimateFlow;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: customerList?.length ?? 0,
                    itemBuilder: (context, index) {
                      return LeadCard(customerData: customerList?[index]);
                    },
                  ),
                );
              }
              return Center(child: Text('Loading....'));
            }),
        bottomNavigationBar: CustomBottomNavBar());
  }
}

class LeadCard extends StatelessWidget {
  final CustomerEstimateFlow? customerData;
  const LeadCard({super.key, this.customerData});

  @override
  Widget build(BuildContext context) {
    DateTime? dateTime = customerData?.movingOn;
    String monthName =
        DateFormat('MMMM').format(DateTime(2024, dateTime!.month));
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      monthName.substring(0, 3),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${dateTime.day}',
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      child: Text(
                        '${dateTime.hour}:${dateTime.minute}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Bangalore',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${customerData?.estimateId}',
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '${customerData?.movingFrom}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _buildIconWithLabel(
                                Icons.arrow_downward, ' ', Colors.red,
                                iconSize: 50),
                            _buildIconWithLabel(Icons.home,
                                '${customerData?.propertySize}', Colors.red),
                            _buildIconWithLabel(
                                Icons.card_giftcard,
                                '${customerData?.totalItems} Items',
                                Colors.red),
                            _buildIconWithLabel(
                                Icons.inventory_2,
                                '${customerData?.totalItems} Boxes',
                                Colors.red),
                            _buildIconWithLabel(Icons.location_on,
                                '${customerData?.distance}', Colors.red),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Bangalore',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '${customerData?.movingTo}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailPage(
                        customerEstimateFlow: customerData,
                      ),
                    ));
                  },
                  style: OutlinedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    side: const BorderSide(color: Colors.red),
                  ),
                  child: const Text(
                    'View Details',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: const Text(
                    'Submit Quote',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildIconWithLabel(IconData icon, String label, Color color,
      {double iconSize = 25}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 2, 0, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: iconSize),
          const SizedBox(height: 5),
          Text(label, textAlign: TextAlign.center),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
