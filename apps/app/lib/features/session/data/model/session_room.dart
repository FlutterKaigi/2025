/// セッションルームのEnum
///
/// UIで使いやすいようにEnum化し、実際のVenue IDとマッピングする
enum SessionRoom {
  room1('e1a11efe-b1eb-43e1-ae60-9d2233e5dfe7', 'Room A'),
  room2('0505c447-b699-4803-aab9-9cbdf9452c1b', 'Room B'),
  room3('6426cd21-f1fe-4d84-b74b-ff459cc0d3e2', 'Room C'),
  room4('98807fe6-b381-40a7-8c33-30a024b9ca4f', 'Room D');

  const SessionRoom(this.id, this.name);

  final String id;
  final String name;

  /// Venue IDからSessionRoomを取得する
  static SessionRoom? fromVenueId(String venueId) {
    for (final room in SessionRoom.values) {
      if (room.id == venueId) {
        return room;
      }
    }
    return null;
  }
}
