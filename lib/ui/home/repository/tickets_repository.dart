import 'package:citytech/ui/home/model/my_tickets.dart';
import 'package:citytech/ui/home/model/tickets.dart';
import 'package:citytech/ui/ticket_details/endpoints.dart';
import 'package:dio/dio.dart';

class TicketRepository {
  static Future<Tickets> getAllTickets() async {
    final Dio _dio = Dio();

    Response ticketsData =
        await _dio.get(BaseUrl.baseUrl + Endpoints.getAllTickets);

    print('User Info: ${ticketsData.data}');

    Tickets tickets = Tickets.fromJson(ticketsData.data);

    return tickets;
  }

  static Future<MyTickets> getMyTickets() async {
    final Dio _dio = Dio();

    Response ticketsData = await _dio
        .get(BaseUrl.baseUrl + Endpoints.getMyTickets + '/test@gmail.com');

    print('User Info: ${ticketsData.data}');

    MyTickets tickets = MyTickets.fromJson(ticketsData.data);

    return tickets;
  }
}
