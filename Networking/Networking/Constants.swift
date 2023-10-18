public enum Constants {
    public enum API {
        public enum EndPoint: String {
            case prod

            var baseURL: String {
                switch self {
                case .prod: return "https://http://194.85.169.95:9226/api/v1"
                }
            }
        }
        public static var baseURL: URL { URL(string: EndPoint.prod.baseURL)! }
    }
}
