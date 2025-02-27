import SQLite3

class QrScanDao{
    
    let dataPath: String = "app_database"
    var db: OpaquePointer?
    init(){
           db = openDatabase()
           createUserTable()
    }
    // Create DB
        func openDatabase()->OpaquePointer?{
            let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(dataPath)
            
            var db: OpaquePointer? = nil
            if sqlite3_open(filePath.path, &db) != SQLITE_OK{
                debugPrint("Cannot open DB.")
                return nil
            }
            else{
                print("DB successfully created.")
                return db
            }
        }
    // Create qrScan table
        func createUserTable() {
            let createTableString = """
                CREATE TABLE IF NOT EXISTS qr_table (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    qrData TEXT,
                    date INTEGER
                );
            """

            var createTableStatement: OpaquePointer? = nil

            if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
                if sqlite3_step(createTableStatement) == SQLITE_DONE {
                    print("qrScan table is created successfully.")
                } else {
                    print("qrScan table creation failed.")
                }
            } else {
                print("qrScan table creation failed.")
            }

            sqlite3_finalize(createTableStatement)
        }
    
    
    func insertUser(request: QrEntity) -> Bool{
            
            let insertStatementString = "INSERT INTO qr_table (qrData, date) VALUES (?, ?);"
            var insertStatement: OpaquePointer? = nil
            
            if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                sqlite3_bind_text(insertStatement, 1, (request.qrData as NSString).utf8String, -1, nil)
                //sqlite3_bind_text(insertStatement, 2,  (request.date as NSInteger), -1, nil)

                if sqlite3_step(insertStatement) == SQLITE_DONE {
                    print("QrScan is created successfully.")
                    sqlite3_finalize(insertStatement)
                    return true
                } else {
                    print("Could not add.")
                    return false
                }
            } else {
                print("INSERT statement is failed.")
                return false
            }
        }
}
