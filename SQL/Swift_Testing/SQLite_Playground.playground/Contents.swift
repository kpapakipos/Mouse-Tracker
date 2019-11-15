import UIKit
import SQLite3

var welcome = "Welcome to Mouse Tracker DB Testing"
print(welcome)


// Open DB Connection
print ("Opening DB Connection")
var db: OpaquePointer? = nil
if sqlite3_open("mousetracker.db", &db) == SQLITE_OK {
    print("Successfully opened connection to database.")
}
else {
      print("Unable to open database.")
    }

//
//var SQL = "create table disney_test2 (test_id PRIMARY KEY, test_value TEXT);"

/* Creating Test Table
var createTableStatement: OpaquePointer? = nil
if sqlite3_prepare_v2(db, SQL, -1, &createTableStatement, nil) == SQLITE_OK {
  if sqlite3_step(createTableStatement) == SQLITE_DONE {
    print("Contact table created.")
  } else {
    print("Contact table could not be created.")
  }
} else {
  print("CREATE TABLE statement could not be prepared.")
}
sqlite3_finalize(createTableStatement)
 */





sqlite3_close(db)
