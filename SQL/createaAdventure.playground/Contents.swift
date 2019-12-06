import UIKit
import SQLite3

var str = "Hello, playground"

let density:Float  = 25 / 50
let intensity:Float = 75 / 50

let od:Float = density * 50
let oi:Float = intensity * 50


let height_restriction:Bool = true
let park:String = "Disneyland"

// Defaults for Rides Activities
let numDefaultActivities: Float = 10.0
let percentRides:Float = 0.50

//  These percentages are
let percentPinTrades:Float = 0.50
let percentCharMeets:Float = 0.25
let percentHiddenMickeys:Float = 0.25

// Determine number and breakdown of activies
var numTotalActvities:Float = floor(numDefaultActivities  * density)
var numRides:Float = floor(numTotalActvities * percentRides * intensity)
var numNonRideActivities = numTotalActvities - numRides
var numPinTrades:Float = floor(numNonRideActivities * percentPinTrades)
var numCharMeets:Float = floor(numNonRideActivities * percentCharMeets)
var numHiddenMickeys:Float = floor(numNonRideActivities * percentHiddenMickeys)


print ("Density \(od)")
print ("Intensity \(oi)")
print("")
print ("Total Activites \(numTotalActvities)")
print ("Rides \(numRides)")
print ("Non-Rides \(numNonRideActivities)")
print ("Pin Trades \(numPinTrades)")
print ("CharMeets \(numCharMeets)")
print ("HiddenMickeys \(numHiddenMickeys)")





func executeSQL(sql: String) -> Bool
{
    // open database handle
    var db: OpaquePointer? = nil
    if sqlite3_open("default.db", &db) == SQLITE_OK {
        print("Successfully opened connection to database.")
    }
    else {
          print("Unable to open database.")
          return false;
        }
    
    // Prepare And Execute SQL Statment
    var executeSQLStatement: OpaquePointer? = nil
    if sqlite3_prepare_v2(db, sql, -1, &executeSQLStatement, nil) == SQLITE_OK {
      if sqlite3_step(executeSQLStatement) == SQLITE_DONE {
        print("Contact table created.")
      } else {
        print("Contact table could not be created.")
        return false
      }
    } else {
      print("CREATE TABLE statement could not be prepared.")
        return false;
    }
    sqlite3_finalize(executeSQLStatement)
    
    // Close database handle
    sqlite3_close(db)
    
    // Successfilly Executed
    return true
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


/* Open DB Connection
var welcome = "Welcome to Mouse Tracker DB Testing"
print(welcome)
print ("Opening DB Connection")
var db: OpaquePointer? = nil
if sqlite3_open("default.db", &db) == SQLITE_OK {
    print("Successfully opened connection to database.")
}
else {
      print("Unable to open database.")
    }
sqlite3_close(db)
}
*/









