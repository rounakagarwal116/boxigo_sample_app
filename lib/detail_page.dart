import 'package:boxigo_sample_app/common_widgets/bottom_nav_bar.dart';
import 'package:boxigo_sample_app/model/sample_data.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final CustomerEstimateFlow? customerEstimateFlow;

  const DetailPage({Key? key, this.customerEstimateFlow}) : super(key: key);
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  int currentIndex = 1;
  late TabController _tabController;
  CustomerEstimateFlow? _customerData;
  Inventory? _furnitureInventory;
  CustomItems? _customItems;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _customerData = widget.customerEstimateFlow;
    _furnitureInventory = _customerData?.items?.inventory?[0];
    _customItems = _customerData?.items?.customItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          title: const Text('New Leads'),
          actions: const [
            Icon(Icons.notifications_none),
            SizedBox(width: 10),
            Icon(Icons.search),
            SizedBox(width: 10),
          ],
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Items'),
              Tab(text: 'Floor Info'),
              Tab(text: 'Send Quote'),
            ],
            labelColor: Colors.red,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.red,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            ItemsTab(
              furniture: _furnitureInventory,
              customItems: _customItems,
            ),
            FloorTab(
              customerData: _customerData,
            ),
            const Center(child: Text("Send Quote")),
          ],
        ),
        bottomNavigationBar: CustomBottomNavBar());
  }
}

class ItemsTab extends StatelessWidget {
  Inventory? furniture;
  CustomItems? customItems;

  ItemsTab({super.key, this.furniture, this.customItems});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExpansionTile(
              collapsedBackgroundColor: Colors.grey[400],
              title: tileHeader("Living Room"),
              children: [
                SectionHeader('Furniture'),
                ItemRow(
                    furniture?.category?[0].displayName,
                    ' ${furniture?.category?[0].items?[0].typeOptions ?? "NA"}',
                    furniture?.category?[0].order,
                    Icons.chair),
                ItemRow(
                    furniture?.category?[1].displayName,
                    ' ${furniture?.category?[1].items?[0].typeOptions ?? "NA"}',
                    furniture?.category?[1].order,
                    Icons.table_restaurant),
                ItemRow(
                    furniture?.category?[2].displayName,
                    ' ${furniture?.category?[2].items?[0].typeOptions ?? "NA"}',
                    furniture?.category?[2].order,
                    Icons.chair),
                ItemRow(
                    furniture?.category?[3].displayName,
                    ' ${furniture?.category?[3].items?[0].typeOptions ?? "NA"}',
                    furniture?.category?[3].order,
                    Icons.bed),
                ItemRow(
                    furniture?.category?[4].displayName,
                    ' ${furniture?.category?[4].items?[0].typeOptions ?? "NA"}',
                    furniture?.category?[4].order,
                    Icons.bed_outlined),
                ItemRow(
                    furniture?.category?[5].displayName,
                    ' ${furniture?.category?[5].items?[0].typeOptions ?? "NA"}',
                    furniture?.category?[5].order,
                    Icons.shelves),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExpansionTile(
              collapsedBackgroundColor: Colors.grey[400],
              title: tileHeader("Bed Room"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExpansionTile(
              collapsedBackgroundColor: Colors.grey[400],
              title: tileHeader("Custom Items"),
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: customItems?.items?.length ?? 0,
                  itemBuilder: (context, index) {
                    CustomItemsItem? item = customItems?.items![index];
                    return CustomItemRow(
                      item?.itemName,
                      item?.itemDescription,
                      'L: ${item?.itemLength}',
                      'W: ${item?.itemWidth}',
                      'H:${item?.itemHeight}',
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  SectionHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class ItemRow extends StatelessWidget {
  final String? title;
  final String? description;
  final int? quantity;
  final IconData? icon;

  ItemRow(this.title, this.description, this.quantity, this.icon);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title!),
      subtitle: Text(description!),
      trailing: Text(quantity.toString()),
    );
  }
}

class CustomItemRow extends StatelessWidget {
  final String? title;
  final String? description;
  final String? length;
  final String? width;
  final String? height;

  CustomItemRow(
      this.title, this.description, this.length, this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title!,
              style:
                  const TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
          const SizedBox(height: 5),
          Text(
            description!,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 5),
          Text('$length ft  $width ft $height ft',
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const Divider(),
        ],
      ),
    );
  }
}

Widget tileHeader(String name) {
  return Text(
    name,
    style: const TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.bold,
      fontSize: 22,
    ),
  );
}

class FloorTab extends StatelessWidget {
  CustomerEstimateFlow? customerData;
  FloorTab({super.key, this.customerData});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExpansionTile(
              collapsedBackgroundColor: Colors.grey[400],
              title: tileHeader("Existing House Details"),
              children: [
                HouseDetail(
                  floor: customerData?.oldFloorNo,
                  additionalInfo: customerData?.oldHouseAdditionalInfo,
                  elevatorAvailable: customerData?.oldElevatorAvailability,
                  packingRequired: customerData?.packingService,
                  parkingDistance: customerData?.oldParkingDistance,
                  packingType: "Packing Required",
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExpansionTile(
              collapsedBackgroundColor: Colors.grey[400],
              title: tileHeader("New House Details"),
              children: [
                HouseDetail(
                  floor: customerData?.newFloorNo,
                  additionalInfo: customerData?.newHouseAdditionalInfo,
                  elevatorAvailable: customerData?.newElevatorAvailability,
                  packingRequired: customerData?.unpackingService,
                  parkingDistance: customerData?.newParkingDistance,
                  packingType: "Unpacking Required",
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HouseDetail extends StatelessWidget {
  String? floor;
  String? elevatorAvailable;
  String? packingRequired;
  String? parkingDistance;
  String? additionalInfo;
  String? packingType;
  HouseDetail(
      {super.key,
      this.floor,
      this.elevatorAvailable,
      this.packingRequired,
      this.parkingDistance,
      this.additionalInfo,
      this.packingType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailRow(label: "Floor No.", value: floor!),
          DetailRow(label: "Elevator Available", value: elevatorAvailable!),
          DetailRow(label: packingType!, value: packingRequired!),
          DetailRow(
              label: "Distance from door to truck", value: parkingDistance!),
          const SizedBox(height: 20),
          const Text(
            "Additional Information",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 18),
          ),
          const SizedBox(height: 5),
          Text(
            additionalInfo!,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const DetailRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 18),
          ),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
