// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:profi_neon/src/features/admin_orders/data/data_sources/request_data_source.dart';
// import 'package:profi_neon/src/features/admin_orders/data/repositories/request_repository_impl.dart';
// import 'package:profi_neon/src/features/admin_orders/domain/entities/request_entity.dart';

// class MockFirebaseOrders extends Mock implements RequestDataSource {}

// final resultList = <RequestEntity>[
//   RequestEntity(
//       imageUrl: 'fakeUrl',
//       userName: 'FakeName1',
//       phone: 'FakePhone1',
//       address: '',
//       clientComment: 'clientComment',
//       kitchenSize: 'kitchenSize',
//       herd: true,
//       haenge: true,
//       waschmaschine: true,
//       spuelmaschine: true,
//       platte: true,
//       gebraucht: true,
//       documentID: 'documentID',
//       installationDate: 'installationDate',
//       requestDate: 'requestDate',
//       email: 'email',
//       totalPrice: 'totalPrice',
//       adminComment: 'adminComment'),
//   RequestEntity(
//       imageUrl: 'fakeUrl',
//       userName: 'FakeName2',
//       phone: 'FakePhone2',
//       address: 'address',
//       clientComment: 'clientComment',
//       kitchenSize: 'kitchenSize',
//       herd: false,
//       haenge: false,
//       waschmaschine: false,
//       spuelmaschine: false,
//       platte: false,
//       gebraucht: false,
//       documentID: 'documentID',
//       installationDate: 'installationDate',
//       requestDate: 'requestDate',
//       email: 'email',
//       totalPrice: 'totalPrice',
//       adminComment: 'adminComment')
// ];

// @GenerateMocks([RequestDataSource])
// void main() {
//   RequestRepositoryImpl requestRepositoryImpl;
//   MockFirebaseOrders mockFirebaseOrders;

//   // assert
//   test('should return a list of requests from FireStore', () async {
//     mockFirebaseOrders = MockFirebaseOrders();
//     requestRepositoryImpl =
//         RequestRepositoryImpl(requestDataSource: mockFirebaseOrders);

//     final result = await requestRepositoryImpl.getPosts();

//     expect(result, resultList);
//   });
// }
