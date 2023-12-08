//
//  NewsViewController.swift
//  pomodoro ios project
//
//  Created by kuet on 19/11/23.
//

import UIKit
import Foundation

class NewsViewController: UIViewController {


    
    @IBOutlet var NewsTitle: UILabel!
    
    @IBOutlet var NewsSource: UILabel!
    
    
    @IBOutlet var author: UILabel!
    
    @IBOutlet var desc: UILabel!
    
    @IBOutlet var img: UIImageView!
    
    var activityIndicator: UIActivityIndicatorView!
    
    var newsLink:String!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            setupActivityIndicator()
            dataFetching()
        }

    func setupActivityIndicator() {
            activityIndicator = UIActivityIndicatorView(style: .large)
            activityIndicator.center = self.view.center
            self.view.addSubview(activityIndicator)
        }
    
    func dataFetching() {
            activityIndicator.startAnimating()
            self.view.isUserInteractionEnabled = false
            let headers = [
                "X-RapidAPI-Key": "kk1",
                "X-RapidAPI-Host": "live-fitness-and-health-news.p.rapidapi.com"
            ]

            let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=kk2")!

            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.allHTTPHeaderFields = headers

            let session = URLSession.shared
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                } else if let data = data {
                    do {
                        // Parse the JSON response
                        if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                           let articles = jsonObject["articles"] as? [[String: Any]],
                           let firstArticle = articles.randomElement(),
                           let source = firstArticle["source"] as? [String: Any] {

                            DispatchQueue.main.async {
                                // Access data from the source
                                if let sourceName = source["name"] as? String {
                                    self.NewsSource.text = "Source: \(sourceName)"
                                }

                                if let title = firstArticle["title"] as? String {
                                    self.NewsTitle.text = "Title : \(title)"
                                }

                                if let author = firstArticle["author"] as? String {
                                    self.author.text = "Author : \(author)"
                                }

                                if let description = firstArticle["description"] as? String {
                                    self.desc.text = description
                                }
                                
                                if let imageUrlString = firstArticle["urlToImage"] as? String, let imageUrl = URL(string: imageUrlString)
                                {
                                    self.setImage(from: imageUrl)
                                }
                                
                                if let articleUrl = firstArticle["url"] as? String {
                                    self.newsLink = articleUrl
                                }
                                
                                self.activityIndicator.stopAnimating()
                                self.view.isUserInteractionEnabled = true
                            }
                        } else {
                            print("Invalid JSON format: Expected structure not found.")
                        }
                    } catch {
                        print("Error parsing JSON: \(error)")
                    }
                }
            }

            dataTask.resume()
        }
    
    func setImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() {
                self.img.image = UIImage(data: data)
            }
        }.resume()
    }

    @IBAction func goToNews(_ sender: Any) {
        if let urlString = newsLink, let url = URL(string: urlString) {
                UIApplication.shared.open(url)
            } else {
                print("Invalid URL or no news link available")
            }
    }
}
// https://newsapi.org/s/us-health-news-api
// replace kk1 with this 7cd-ec7-e852-msh-32b76-64-656-a683-0p1f0-1d-fjsn5-b87-85-216-636 to get actual functionable app . remove all hyphens.
// replace kk2 with this 012-3-681-d0f-e94e-1797-020d2-c150-d818-0 to get actual functionable app . remove all hyphens.
