/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
import ObjectMapper

struct IssuesRequest : Mappable {
	var url : String?
	var repository_url : String?
	var labels_url : String?
	var comments_url : String?
	var events_url : String?
	var html_url : String?
	var id : Int?
	var node_id : String?
	var number : Int?
	var title : String?
	var user : User?
	var labels : [String]?
	var state : String?
	var locked : Bool?
	var assignee : String?
	var assignees : [String]?
	var milestone : String?
	var comments : Int?
	var created_at : String?
	var updated_at : String?
	var closed_at : String?
	var author_association : String?
	var pull_request : Pull_request?
	var body : String?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		url <- map["url"]
		repository_url <- map["repository_url"]
		labels_url <- map["labels_url"]
		comments_url <- map["comments_url"]
		events_url <- map["events_url"]
		html_url <- map["html_url"]
		id <- map["id"]
		node_id <- map["node_id"]
		number <- map["number"]
		title <- map["title"]
		user <- map["user"]
		labels <- map["labels"]
		state <- map["state"]
		locked <- map["locked"]
		assignee <- map["assignee"]
		assignees <- map["assignees"]
		milestone <- map["milestone"]
		comments <- map["comments"]
		created_at <- map["created_at"]
		updated_at <- map["updated_at"]
		closed_at <- map["closed_at"]
		author_association <- map["author_association"]
		pull_request <- map["pull_request"]
		body <- map["body"]
	}

}
