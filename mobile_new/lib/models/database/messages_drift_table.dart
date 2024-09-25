part of 'database.dart';

@DataClassName('Message')
class MessagesTable extends Table {
  TextColumn get id => text().withLength(min: 1, max: 50)();
  TextColumn get from => text().withLength(min: 1, max: 50)();
  TextColumn get to => text().withLength(min: 1, max: 50)();
  TextColumn get message => text().withLength(min: 1, max: 500)();
  IntColumn get messageType => integer().withDefault(Constant(0))();
  TextColumn get timestamp => text().withLength(min: 1, max: 50)();
  TextColumn get chatId => text().withLength(min: 1, max: 50)();

  @override
  Set<Column> get primaryKey => {id};
}
