import Foundation
import Flutter

class QrPluginImpl: QrApi {
    
    func setQrData(request: SaveQrScan) throws {
       
        print("Entro a registrar el QR")
    }
    
    func getListScan(completion: @escaping (Result<[SaveQrScan], any Error>) -> Void) {
        print("Entro a buscar los datos")
    
        DispatchQueue.global(qos: .background).async {
            
        }
    }
}
