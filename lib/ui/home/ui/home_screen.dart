import 'package:citytech/res/app_colors.dart';
import 'package:citytech/ui/common_widgets/custom_appbar/custom_appbar.dart';
import 'package:citytech/ui/common_widgets/custom_appbar/widgets/icon_notification_button.dart';
import 'package:citytech/ui/common_widgets/custom_tabbar.dart';
import 'package:citytech/ui/common_widgets/first_tab_bar.dart';
import 'package:citytech/ui/home/model/my_tickets.dart';
import 'package:citytech/ui/home/model/tickets.dart';
import 'package:citytech/ui/home/repository/tickets_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> myTickets = ['day', 'week', 'month', 'year'];

  Tickets? _tickets;

  MyTickets? _myTickets;

  void initState() {
    super.initState();
    _getTickets();
  }

  _getTickets() async {
    _tickets = await TicketRepository.getAllTickets();
    _myTickets = await TicketRepository.getMyTickets();
    setState(() {});
  }

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      drawer: const Drawer(),
      appBar: const CustomAppBar(
        title: 'Home',
        isCenterTile: true,
        actionWidget: IconNotificationButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Stack(
            children: [
              FirstTabBar(tabItems: [
                'Home',
                'Tickets'
              ], tabViews: [
                CustomTabBar(
                  tabItems: ['Day', 'Week', 'Month', 'Year'],
                  tabViews: [
                    _buildGridView(0),
                    _buildGridView(1),
                    _buildGridView(2),
                    _buildGridView(3),
                  ],
                ),
                CustomTabBar(
                  tabItems: ['Day', 'Week', 'Month', 'Year'],
                  tabViews: [
                    _buildBarGraph(),
                    _buildBarGraph(),
                    _buildBarGraph(),
                    _buildBarGraph()
                  ],
                ),
              ]),
              Positioned(top: 6.h, child: const Text('Ticket Details'))
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _buildGridView(int selected) {
    return SizedBox(
      height: 700.h,
      width: 300.w,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2.7,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryGreen),
                borderRadius: BorderRadius.circular(20.r)),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  Icons.hourglass_bottom,
                  size: 18,
                ),
                _tickets == null
                    ? const CircularProgressIndicator()
                    : Column(
                        children: [
                          _getLabel(selected, index),
                          _getValue(selected, index),
                        ],
                      )
              ],
            ),
          );
        },
      ),
    );
  }

  Text _getValue(int selected, int index) {
    return Text(
      selected == 0
          ? _tickets!.data!.dist!.day![index].value ?? "No Data"
          : selected == 1
              ? _tickets!.data!.dist!.week![index].value ?? "No Data"
              : selected == 2
                  ? _tickets!.data!.dist!.month![index].value ?? "No data"
                  : _tickets!.data!.dist!.year![index].value ?? "No data",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 14.sp),
    );
  }

  Text _getLabel(int selected, int index) {
    return Text(
      selected == 0
          ? _tickets!.data!.dist!.day![index].label ?? "No Data"
          : selected == 1
              ? _tickets!.data!.dist!.week![index].label ?? "No Data"
              : selected == 2
                  ? _tickets!.data!.dist!.month![index].label ?? "No data"
                  : _tickets!.data!.dist!.year![index].label ?? "No data",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 14.sp),
    );
  }

  _buildBarGraph() {
    final List<ChartData> chartData = [
      ChartData(0, 0),
      ChartData(5, 228),
      ChartData(10, 134),
      ChartData(15, 392),
      ChartData(20, 940),
      ChartData(25, 640),
      ChartData(30, 140)
    ];
    return SizedBox(
      height: 400.h,
      width: 300.w,
      child: SfCartesianChart(series: <ChartSeries>[
        ColumnSeries<ChartData, double>(
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            // Width of the bars
            width: 0.6,
            // Spacing between the bars
            spacing: 0.3)
      ]),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final double x;
  final double y;
}
