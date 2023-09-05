import Foundation
import Alamofire

func fetchDataFromAPI() {
    // Замените URL на фактический адрес вашего API
    let apiUrl = "http://194.85.169.95:9226/api/v1/user"
    
    AF.request(apiUrl).responseDecodable(of: [Post].self) { response in
        switch response.result {
        case .success(let data):
            // Обработайте успешный ответ, где data - это массив вашей декодируемой модели
            print(data)
        case .failure(let error):
            // Обработайте ошибку
            print("Ошибка: \(error.localizedDescription)")
        }
    }
}


