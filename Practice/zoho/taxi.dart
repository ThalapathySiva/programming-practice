// 1) Design a Call taxi booking application
// -There are n number of taxi’s. For simplicity, assume 4. But it should work for any number of taxi’s.
// -The are 6 points(A,B,C,D,E,F)
// -All the points are in a straight line, and each point is 15kms away from the adjacent points.
// -It takes 60 mins to travel from one point to another
// -Each taxi charges Rs.100 minimum for the first 5 kilometers and Rs.10 for the subsequent kilometers.
// -For simplicity, time can be entered as absolute time. Eg: 9hrs, 15hrs etc.
// -All taxi’s are initially stationed at A.
// -When a customer books a Taxi, a free taxi at that point is allocated
// -If no free taxi is available at that point, a free taxi at the nearest point is allocated.
// -If two taxi’s are free at the same point, one with lower earning is allocated
// -Note that the taxi only charges the customer from the pickup point to the drop point. Not the distance it travels from an adjacent point to pickup the customer.
// -If no taxi is free at that time, booking is rejected

// Design modules for

// 1)    Call taxi booking
// Input 1:
// Customer ID: 1
// Pickup Point: A
// Drop Point: B
// Pickup Time: 9

// Output 1:
// Taxi can be allotted.
// Taxi-1 is allotted

// Input 2:
// Customer ID: 2
// Pickup Point: B
// Drop Point: D
// Pickup Time: 9

// Output 1:
// Taxi can be allotted.
// Taxi-2 is allotted
// (Note: Since Taxi-1 would have completed its journey when second booking is done, so Taxi-2 from nearest point A which is free is allocated)

// Input 3:
// Customer ID: 3
// Pickup Point: B
// Drop Point: C
// Pickup Time: 12

// Output 1:
// Taxi can be allotted.
// Taxi-1 is allotted
// 2) Display the Taxi details

// Taxi No:    Total Earnings:
// BookingID    CustomerID    From    To    PickupTime    DropTime    Amount

// Output:
// Taxi-1    Total Earnings: Rs. 400

// 1     1     A    B    9    10    200
// 3    3    B    C    12    13    200

// Taxi-2 Total Earnings: Rs. 350
// 2    2    B    D    9    11    350
//

void main() {
  List<Booking> bookings = [
    Booking(1, 'D', 'A', 9),
    Booking(2, 'B', 'F', 9),
    Booking(3, 'C', 'B', 12),
    Booking(3, 'E', 'A', 15),
  ];
  List<Taxi> taxi = [
    Taxi(taxiName: "Taxi 1", booking: []),
    Taxi(taxiName: "Taxi 2", booking: []),
    Taxi(taxiName: "Taxi 3", booking: []),
    Taxi(taxiName: "Taxi 4", booking: []),
  ];

  for (Booking booking in bookings) {
    final List<Taxi> filtereddTaxi = taxi
        .where((element) => element.dropTime! <= booking.pickTime!)
        .toList();
    Taxi assignedTaxi = getNearestTaxi(filtereddTaxi, booking.pickPoint!);
    assignedTaxi.allotedCustomer = booking.custId;
    booking.bookingCost =
        calculateAmount(booking.pickPoint!, booking.dropPoint!);
    assignedTaxi.wallet +=
        calculateAmount(booking.pickPoint!, booking.dropPoint!);
    assignedTaxi.dropTime =
        getDropCount(booking.pickPoint!, booking.dropPoint!) +
            booking.pickTime!;
    assignedTaxi.dropPoint = booking.dropPoint;
    assignedTaxi.booking.add(booking);
  }

  print(taxi);
}

Taxi getNearestTaxi(List<Taxi> filterTaxi, String pickUpPoint) {
  int minDist = 10;
  Taxi? nearestTaxi;

  for (final taxi in filterTaxi) {
    int kms = getDropCount(pickUpPoint, taxi.dropPoint!);

    if (minDist > kms) {
      minDist = kms;
      nearestTaxi = taxi;
    } else if (kms == minDist) {
      if (taxi.wallet < nearestTaxi!.wallet) {
        nearestTaxi = taxi;
      }
    }
  }

  return nearestTaxi!;
}

int calculateAmount(String pickUpPoint, String dropPoint) {
  int kms = getDropCount(pickUpPoint, dropPoint) * 15;
  return (kms - 5) * 10 + 100;
}

int getDropCount(String pickUpPoint, String dropPoint) {
  String points = "abcdef";
  return (points.indexOf(pickUpPoint.toLowerCase()) -
          points.indexOf(dropPoint.toLowerCase()))
      .abs();
}

class Booking extends BaseArgs {
  int bookingCost;

  Booking(int? custId, String? dropPoint, String? pickPoint, int? pickTime,
      {this.bookingCost = 0})
      : super(
            custId: custId,
            dropPoint: dropPoint,
            pickPoint: pickPoint,
            pickTime: pickTime);

  @override
  String toString() => 'Booking(bookingCost: $bookingCost)';
}

class Taxi extends BaseArgs {
  int wallet;
  int? allotedCustomer;
  String? taxiName;
  List<Booking> booking;
  String? availableAt;
  Taxi({
    int? custId,
    String? dropPoint = "A",
    String? pickPoint,
    this.wallet = 0,
    int? pickTime,
    int? dropTime = 0,
    this.allotedCustomer,
    this.taxiName,
    this.availableAt = 'A',
    required this.booking,
  }) : super(
            custId: custId,
            dropPoint: dropPoint,
            pickPoint: pickPoint,
            pickTime: pickTime,
            dropTime: dropTime);

  @override
  String toString() =>
      'Taxi(wallet: $wallet, allotedCustomer: $allotedCustomer, taxiName: $taxiName taxiDropTime: $dropTime Booking : $booking )';
}

abstract class BaseArgs {
  int? custId;
  String? pickPoint;
  String? dropPoint;
  int? pickTime;
  int? dropTime;
  BaseArgs(
      {this.custId,
      this.dropPoint = "A",
      this.pickPoint,
      this.pickTime,
      this.dropTime});

  @override
  String toString() {
    return 'BaseArgs(custId: $custId, pickPoint: $pickPoint, dropPoint: $dropPoint, pickTime: $pickTime, dropTime: $dropTime)';
  }
}

extension ListExtension<E> on Iterable<E> {
  E? firstWhereOrNull(bool Function(E) test) {
    for (E element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}
