enum SessionRoom {
  room1,
  room2,
  room3,
  room4;

  String get name {
    return switch (this) {
      SessionRoom.room1 => 'Room 1',
      SessionRoom.room2 => 'Room 2',
      SessionRoom.room3 => 'Room 3',
      SessionRoom.room4 => 'Room 4',
    };
  }

  String get id {
    return switch (this) {
      SessionRoom.room1 => 'venue1',
      SessionRoom.room2 => 'venue2',
      SessionRoom.room3 => 'venue3',
      SessionRoom.room4 => 'venue4',
    };
  }
}
