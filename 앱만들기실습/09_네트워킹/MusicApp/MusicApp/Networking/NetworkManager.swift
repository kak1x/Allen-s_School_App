//
//  NetworkManager.swift
//  MusicApp
//
//  Created by kaki on 2022/12/11.
//

import Foundation


// MARK: - 네트워크에서 발생할 수 있는 에러 정의
enum NetworkError: Error {
    case networkingError
    case dataError
    case parseError
}


// MARK: - Networking (서버와 통신하는) 클래스 모델
final class NetworkManager {
    
    // 여러 화면에서 통신을 한다면, 일반적으로 싱글톤으로 만듦
    static let shared = NetworkManager()
    // 여러 객체를 추가적으로 생성하지 못하도록 설정
    private init() {}
    
    typealias NetworkCompletionHandler = (Result<[Music], NetworkError>) -> Void
    
    // 네트워킹 요청하는 함수 (음악 데이터 가져오기)
    func fetchMusic(searchTerm: String, completionHandler: @escaping NetworkCompletionHandler) {
        let urlString = "\(MusicApi.reqeustUrl)\(MusicApi.mediaParam)&term=\(searchTerm)"
        
        performRequest(with: urlString) { result in
            completionHandler(result)
        }
        
    }
    
    // 실제 Request하는 함수 (비동기적 실행 ==> 클로저 방식으로 끝난 시점을 전달 받도록 설계)
    private func performRequest(with urlString: String, completionHandler: @escaping NetworkCompletionHandler) {
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error!)
                completionHandler(.failure(.networkingError))
                return
            }
            
            guard let safeData = data else {
                completionHandler(.failure(.dataError))
                return
            }
            
            // 메서드 실행해서 결과를 받음
            if let musics = self.parseJSON(safeData) {
                completionHandler(.success(musics))
            } else {
                completionHandler(.failure(.parseError))
            }
        }
        task.resume()
    }
    
    // 받아본 데이터 분석하는 함수 (동기적 실행)
    private func parseJSON(_ musicData: Data) -> [Music]? {
        
        // 성공
        do {
            // 만들어 놓은 구조체(클래스 등)로 변환하는 객체와 메서드 (JSON 데이터 ==> MusicData 구조체
            let musicData = try JSONDecoder().decode(MusicData.self, from: musicData)
            return musicData.results
        } catch {
            // 실패
            print(error.localizedDescription)
            return nil
        }
    }
}
