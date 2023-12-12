import Moya
import Domain

let provider = MoyaProvider<YourAPI>()

provider.request(.profile) { result in
    switch result {
    case .success(let response):
        do {
            // Обработка успешного ответа
            let userProfile = try response.map(ProfileResponse.self)
            print("User profile: \(userProfile)")
        } catch {
            print("Ошибка при парсинге данных: \(error)")
        }
    case .failure(let error):
        print("Ошибка запроса: \(error.localizedDescription)")
    }
}
