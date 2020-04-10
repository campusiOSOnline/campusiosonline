//
//  ManagerConnections.swift
//  TheBestsMovies
//
//  Created by Sergio Becerril on 02/02/2020.
//  Copyright © 2020 Sergio Becerril. All rights reserved.
//

import Foundation
import RxSwift

enum APIError: Error {
    case errorConnection(String)
}

class ManagerConnections {
    /**
     Retrieve list of popular movies
     - Returns: A Single of an array of popular movies
     */
    func getPopularMovies() -> Observable<[Movie]> {
        return Observable.create { observer in
            
            let session = URLSession.shared
            var request = URLRequest(url:URL(string:Constants.URL.urlListMovies+Constants.apiKey)!)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField:
                "Content-Type")
            session.dataTask(with: request) { (data, response, error) in
                guard let data = data, error == nil, let response = response as? HTTPURLResponse else { return }
                if response.statusCode == 200 {
                    do {
                        let decoder = JSONDecoder()
                        let movies = try decoder.decode(Movies.self, from: data)
                        
                        observer.onNext(movies.listOfmovies)
                    } catch {
                        //MARK: observer onNext event
                        observer.onError(APIError.errorConnection("Server code: \(response.statusCode)"))
                    }
                }
                //MARK: observer onCompleted event
                observer.onCompleted()
            }.resume()
            //MARK: return our disposable
            return Disposables.create {
                session.finishTasksAndInvalidate()
            }
        }
    }
    
    /**
     Retrieve extended info when user selected a one movie
     - Parameter movieID: The ID for the selected movie
     - Returns: A Single of a MovieDetail
     */
    func getDetailMovie(movieID: String) -> Observable<MovieDetail> {
                return Observable.create { observer in
            
            let session = URLSession.shared
                    var request = URLRequest(url:URL(string:Constants.URL.urlDetailMovie+movieID+Constants.apiKey)!)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField:
                "Content-Type")
            session.dataTask(with: request) { (data, response, error) in
                guard let data = data, error == nil, let response = response as? HTTPURLResponse else { return }
                if response.statusCode == 200 {
                    do {
                        let decoder = JSONDecoder()
                        let detailMovie = try decoder.decode(MovieDetail.self, from: data)
                        print("Tengo la peli: \(detailMovie.title)")
                        observer.onNext(detailMovie)
                    } catch {
                        //MARK: observer onNext event
                        observer.onError(error)
                    }
                }
                //MARK: observer onCompleted event
                observer.onCompleted()
            }.resume()
            //MARK: return our disposable
            return Disposables.create {
                session.finishTasksAndInvalidate()
            }
        }
    }
}
