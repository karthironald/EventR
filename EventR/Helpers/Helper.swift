//
//  Helper.swift
//  EventR
//
//  Created by Karthick Selvaraj on 08/09/21.
//

import Foundation
import UIKit

class Helper {
    
    /// For live preview
    static func fetchSampleEvents() -> EventResponse {
        do {
            if let jsonData = sampleJSon.data(using: .utf8) {
                let eventResponse = try JSONDecoder().decode(EventResponse.self, from: jsonData)
                return eventResponse
            }
        } catch {
            print(error.localizedDescription)
        }
        return EventResponse(events: [], meta: Meta(total: 0, took: 0, page: 0, perPage: 0))
    }
    
    static func format(dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "E, dd MMM yyyy h:mm a"
            let formatterString = dateFormatter.string(from: date)
            return formatterString
        }
        return nil
    }
    
}


/// For live preview
let sampleJSon = """
    {
        "events": [
            {
                "type": "tennis",
                "id": 5349649,
                "datetime_utc": "2021-09-07T16:00:00",
                "venue": {
                    "state": "NY",
                    "name_v2": "Arthur Ashe Stadium",
                    "postal_code": "11368",
                    "name": "Arthur Ashe Stadium",
                    "links": [],
                    "timezone": "America/New_York",
                    "url": "https://seatgeek.com/venues/arthur-ashe-stadium/tickets",
                    "score": 0.88,
                    "location": {
                        "lat": 40.7397,
                        "lon": -73.8408
                    },
                    "address": "Flushing Meadow Corona Park",
                    "country": "US",
                    "has_upcoming_events": true,
                    "num_upcoming_events": 7,
                    "city": "Flushing",
                    "slug": "arthur-ashe-stadium",
                    "extended_address": "Flushing, NY 11368",
                    "id": 2978,
                    "popularity": 0,
                    "access_method": {
                        "method": "QRCODE_TM",
                        "created_at": "2018-09-03T16:51:17Z",
                        "employee_only": false
                    },
                    "metro_code": 501,
                    "capacity": 22547,
                    "display_location": "Flushing, NY"
                },
                "datetime_tbd": false,
                "performers": [
                    {
                        "type": "tennis",
                        "name": "US Open Tennis",
                        "image": "https://seatgeek.com/images/performers-landscape/us-open-tennis-d8ffc6/5702/3182/huge.jpg",
                        "id": 5702,
                        "images": {
                            "huge": "https://seatgeek.com/images/performers-landscape/us-open-tennis-d8ffc6/5702/3182/huge.jpg"
                        },
                        "divisions": null,
                        "has_upcoming_events": true,
                        "primary": true,
                        "stats": {
                            "event_count": 10
                        },
                        "taxonomies": [
                            {
                                "id": 1000000,
                                "name": "sports",
                                "parent_id": null,
                                "document_source": {
                                    "source_type": "ELASTIC",
                                    "generation_type": "FULL"
                                },
                                "rank": 0
                            },
                            {
                                "id": 1090000,
                                "name": "tennis",
                                "parent_id": 1000000,
                                "document_source": {
                                    "source_type": "ELASTIC",
                                    "generation_type": "FULL"
                                },
                                "rank": 0
                            }
                        ],
                        "image_attribution": null,
                        "url": "https://seatgeek.com/us-open-tennis-tickets",
                        "score": 0.75,
                        "slug": "us-open-tennis",
                        "home_venue_id": null,
                        "short_name": "US Open Tennis",
                        "num_upcoming_events": 10,
                        "colors": null,
                        "image_license": null,
                        "popularity": 0,
                        "location": null
                    },
                    {
                        "type": "tennis",
                        "name": "Daniil Medvedev",
                        "image": "https://seatgeek.com/images/performers-landscape/generic-tennis-3afc11/677173/32424/huge.jpg",
                        "id": 794583,
                        "images": {
                            "huge": "https://seatgeek.com/images/performers-landscape/generic-tennis-3afc11/677173/32424/huge.jpg"
                        },
                        "divisions": null,
                        "has_upcoming_events": false,
                        "stats": {
                            "event_count": 0
                        },
                        "taxonomies": [
                            {
                                "id": 1000000,
                                "name": "sports",
                                "parent_id": null,
                                "document_source": {
                                    "source_type": "ELASTIC",
                                    "generation_type": "FULL"
                                },
                                "rank": 0
                            },
                            {
                                "id": 1090000,
                                "name": "tennis",
                                "parent_id": 1000000,
                                "document_source": {
                                    "source_type": "ELASTIC",
                                    "generation_type": "FULL"
                                },
                                "rank": 0
                            }
                        ],
                        "image_attribution": null,
                        "url": "https://seatgeek.com/daniil-medvedev-tickets",
                        "score": 0.77,
                        "slug": "daniil-medvedev",
                        "home_venue_id": null,
                        "short_name": "Daniil Medvedev",
                        "num_upcoming_events": 0,
                        "colors": null,
                        "image_license": null,
                        "popularity": 0,
                        "location": null
                    },
                    {
                        "type": "tennis",
                        "name": "Elina Svitolina",
                        "image": "https://seatgeek.com/images/performers-landscape/generic-tennis-3afc11/677173/32424/huge.jpg",
                        "id": 794680,
                        "images": {
                            "huge": "https://seatgeek.com/images/performers-landscape/generic-tennis-3afc11/677173/32424/huge.jpg"
                        },
                        "divisions": null,
                        "has_upcoming_events": false,
                        "stats": {
                            "event_count": 0
                        },
                        "taxonomies": [
                            {
                                "id": 1000000,
                                "name": "sports",
                                "parent_id": null,
                                "document_source": {
                                    "source_type": "ELASTIC",
                                    "generation_type": "FULL"
                                },
                                "rank": 0
                            },
                            {
                                "id": 1090000,
                                "name": "tennis",
                                "parent_id": 1000000,
                                "document_source": {
                                    "source_type": "ELASTIC",
                                    "generation_type": "FULL"
                                },
                                "rank": 0
                            }
                        ],
                        "image_attribution": null,
                        "url": "https://seatgeek.com/elina-svitolina-tickets",
                        "score": 0.81,
                        "slug": "elina-svitolina",
                        "home_venue_id": null,
                        "short_name": "Elina Svitolina",
                        "num_upcoming_events": 0,
                        "colors": null,
                        "image_license": null,
                        "popularity": 0,
                        "location": null
                    }
                ],
                "is_open": false,
                "links": [],
                "datetime_local": "2021-09-07T12:00:00",
                "time_tbd": false,
                "short_title": "US Open Tennis Session 17 - Men's and Women's Quarterfinals",
                "visible_until_utc": "2021-09-08T21:00:00",
                "stats": {
                    "listing_count": 3,
                    "average_price": 240,
                    "lowest_price_good_deals": 112,
                    "lowest_price": 112,
                    "highest_price": 344,
                    "visible_listing_count": 3,
                    "dq_bucket_counts": [
                        0,
                        1,
                        1,
                        0,
                        0,
                        1,
                        0,
                        0
                    ],
                    "median_price": 269,
                    "lowest_sg_base_price": 81,
                    "lowest_sg_base_price_good_deals": 81
                },
                "taxonomies": [
                    {
                        "id": 1000000,
                        "name": "sports",
                        "parent_id": null,
                        "rank": 0
                    },
                    {
                        "id": 1090000,
                        "name": "tennis",
                        "parent_id": 1000000,
                        "rank": 0
                    }
                ],
                "url": "https://seatgeek.com/us-open-tennis-session-17-mens-and-womens-quarterfinals-tickets/tennis/2021-09-07-12-pm/5349649",
                "score": 0.757,
                "announce_date": "2020-12-10T00:00:00",
                "created_at": "2020-12-10T16:00:56",
                "date_tbd": false,
                "title": "US Open Tennis Session 17 - Men's and Women's Quarterfinals",
                "popularity": 0.932,
                "description": "",
                "status": "normal",
                "access_method": {
                    "method": "QRCODE_TM",
                    "created_at": "2018-09-03T16:51:17Z",
                    "employee_only": false
                },
                "event_promotion": null,
                "announcements": {
                    "checkout_disclosures": {
                        "messages": [
                            {
                                "text": "All purchases are 100% guaranteed. Prices set by the seller may be above or below face value."
                            }
                        ]
                    }
                },
                "conditional": false,
                "enddatetime_utc": "2021-09-08T21:00:00",
                "themes": [],
                "domain_information": []
            },
            {
                "type": "concert",
                "id": 5259817,
                "datetime_utc": "2021-09-08T07:30:00",
                "venue": {
                    "state": "NB",
                    "name_v2": "Casino New Brunswick",
                    "postal_code": "E1G 0R7",
                    "name": "Casino New Brunswick",
                    "links": [],
                    "timezone": "America/Toronto",
                    "url": "https://seatgeek.com/venues/casino-new-brunswick/tickets",
                    "score": 0.32,
                    "location": {
                        "lat": 46.1279,
                        "lon": -64.8797
                    },
                    "address": "21 Casino Dr",
                    "country": "Canada",
                    "has_upcoming_events": true,
                    "num_upcoming_events": 1,
                    "city": "Moncton",
                    "slug": "casino-new-brunswick",
                    "extended_address": "Moncton, Canada",
                    "id": 5670,
                    "popularity": 0,
                    "access_method": null,
                    "metro_code": 0,
                    "capacity": 0,
                    "display_location": "Moncton, Canada"
                },
                "datetime_tbd": true,
                "performers": [
                    {
                        "type": "band",
                        "name": "Daughtry",
                        "image": "https://seatgeek.com/images/performers-landscape/daughtry-ec5a6c/544/19766/huge.jpg",
                        "id": 544,
                        "images": {
                            "huge": "https://seatgeek.com/images/performers-landscape/daughtry-ec5a6c/544/19766/huge.jpg"
                        },
                        "divisions": null,
                        "has_upcoming_events": true,
                        "primary": true,
                        "stats": {
                            "event_count": 43
                        },
                        "taxonomies": [
                            {
                                "id": 2000000,
                                "name": "concerts",
                                "parent_id": null,
                                "document_source": {
                                    "source_type": "ELASTIC",
                                    "generation_type": "FULL"
                                },
                                "rank": 0
                            }
                        ],
                        "image_attribution": "Gary Gershoff / WireImage / Getty Images",
                        "url": "https://seatgeek.com/daughtry-tickets",
                        "score": 0.5,
                        "slug": "daughtry",
                        "home_venue_id": null,
                        "short_name": "Daughtry",
                        "num_upcoming_events": 43,
                        "colors": null,
                        "image_license": "rightsmanaged",
                        "genres": [
                            {
                                "id": 456,
                                "name": "Rock",
                                "slug": "rock",
                                "primary": true,
                                "images": {
                                    "1200x525": "https://seatgeek.com/images/performers-landscape/david-byrne-s-american-utopia-55186a/555/1200x525.jpg",
                                    "1200x627": "https://seatgeek.com/images/performers-landscape/david-byrne-s-american-utopia-1bf631/555/1200x627.jpg",
                                    "136x136": "https://seatgeek.com/images/performers-landscape/david-byrne-s-american-utopia-8d3cec/555/136x136.jpg",
                                    "500_700": "https://seatgeek.com/images/performers-landscape/david-byrne-s-american-utopia-22c331/555/500_700.jpg",
                                    "800x320": "https://seatgeek.com/images/performers-landscape/david-byrne-s-american-utopia-1d63b6/555/800x320.jpg",
                                    "banner": "https://seatgeek.com/images/performers-landscape/david-byrne-s-american-utopia-f0d8df/555/banner.jpg",
                                    "block": "https://seatgeek.com/images/performers-landscape/david-byrne-s-american-utopia-4797cb/555/block.jpg",
                                    "criteo_130_160": "https://seatgeek.com/images/performers-landscape/david-byrne-s-american-utopia-c9a3ed/555/criteo_130_160.jpg",
                                    "criteo_170_235": "https://seatgeek.com/images/performers-landscape/david-byrne-s-american-utopia-aeb18e/555/criteo_170_235.jpg",
                                    "criteo_205_100": "https://seatgeek.com/images/performers-landscape/david-byrne-s-american-utopia-3b5355/555/criteo_205_100.jpg",
                                    "criteo_400_300": "https://seatgeek.com/images/performers-landscape/david-byrne-s-american-utopia-9c63f0/555/criteo_400_300.jpg",
                                    "fb_100x72": "https://seatgeek.com/images/performers-landscape/david-byrne-s-american-utopia-897119/555/fb_100x72.jpg",
                                    "fb_600_315": "https://seatgeek.com/images/performers-landscape/david-byrne-s-american-utopia-ecf4c7/555/fb_600_315.jpg",
                                    "huge": "https://seatgeek.com/images/performers-landscape/david-byrne-s-american-utopia-51bbeb/555/huge.jpg",
                                    "ipad_event_modal": "https://seatgeek.com/images/performers-landscape/david-byrne-s-american-utopia-5fb144/555/ipad_event_modal.jpg",
                                    "ipad_header": "https://seatgeek.com/images/performers-landscape/david-byrne-s-american-utopia-549df9/555/ipad_header.jpg",
                                    "ipad_mini_explore": "https://seatgeek.com/images/performers-landscape/david-byrne-s-american-utopia-4ada20/555/ipad_mini_explore.jpg",
                                    "mongo": "https://seatgeek.com/images/performers-landscape/david-byrne-s-american-utopia-f65973/555/mongo.jpg",
                                    "square_mid": "https://seatgeek.com/images/performers-landscape/david-byrne-s-american-utopia-393dec/555/square_mid.jpg",
                                    "triggit_fb_ad": "https://seatgeek.com/images/performers-landscape/david-byrne-s-american-utopia-941fc8/555/triggit_fb_ad.jpg"
                                },
                                "image": "https://seatgeek.com/images/performers-landscape/david-byrne-s-american-utopia-51bbeb/555/huge.jpg",
                                "document_source": {
                                    "source_type": "ELASTIC",
                                    "generation_type": "FULL"
                                }
                            },
                            {
                                "id": 452,
                                "name": "Pop",
                                "slug": "pop",
                                "primary": false,
                                "images": {
                                    "1200x525": "https://seatgeek.com/images/performers-landscape/harry-styles-e80466/621559/1200x525.jpg",
                                    "1200x627": "https://seatgeek.com/images/performers-landscape/harry-styles-2de6e1/621559/1200x627.jpg",
                                    "136x136": "https://seatgeek.com/images/performers-landscape/harry-styles-8551a0/621559/136x136.jpg",
                                    "500_700": "https://seatgeek.com/images/performers-landscape/harry-styles-c7ee7d/621559/500_700.jpg",
                                    "800x320": "https://seatgeek.com/images/performers-landscape/harry-styles-994af6/621559/800x320.jpg",
                                    "banner": "https://seatgeek.com/images/performers-landscape/harry-styles-1679f3/621559/banner.jpg",
                                    "block": "https://seatgeek.com/images/performers-landscape/harry-styles-728d3f/621559/block.jpg",
                                    "criteo_130_160": "https://seatgeek.com/images/performers-landscape/harry-styles-2aa6e1/621559/criteo_130_160.jpg",
                                    "criteo_170_235": "https://seatgeek.com/images/performers-landscape/harry-styles-fd6e33/621559/criteo_170_235.jpg",
                                    "criteo_205_100": "https://seatgeek.com/images/performers-landscape/harry-styles-71b41a/621559/criteo_205_100.jpg",
                                    "criteo_400_300": "https://seatgeek.com/images/performers-landscape/harry-styles-98a620/621559/criteo_400_300.jpg",
                                    "fb_100x72": "https://seatgeek.com/images/performers-landscape/harry-styles-a462d0/621559/fb_100x72.jpg",
                                    "fb_600_315": "https://seatgeek.com/images/performers-landscape/harry-styles-d5ec5b/621559/fb_600_315.jpg",
                                    "huge": "https://seatgeek.com/images/performers-landscape/harry-styles-1758b0/621559/huge.jpg",
                                    "ipad_event_modal": "https://seatgeek.com/images/performers-landscape/harry-styles-fa67d5/621559/ipad_event_modal.jpg",
                                    "ipad_header": "https://seatgeek.com/images/performers-landscape/harry-styles-5ce848/621559/ipad_header.jpg",
                                    "ipad_mini_explore": "https://seatgeek.com/images/performers-landscape/harry-styles-6be308/621559/ipad_mini_explore.jpg",
                                    "mongo": "https://seatgeek.com/images/performers-landscape/harry-styles-e01a0b/621559/mongo.jpg",
                                    "square_mid": "https://seatgeek.com/images/performers-landscape/harry-styles-91efdc/621559/square_mid.jpg",
                                    "triggit_fb_ad": "https://seatgeek.com/images/performers-landscape/harry-styles-dccf1c/621559/triggit_fb_ad.jpg"
                                },
                                "image": "https://seatgeek.com/images/performers-landscape/harry-styles-1758b0/621559/huge.jpg",
                                "document_source": {
                                    "source_type": "ELASTIC",
                                    "generation_type": "FULL"
                                }
                            }
                        ],
                        "popularity": 0,
                        "location": null
                    }
                ],
                "is_open": false,
                "links": [],
                "datetime_local": "2021-09-08T03:30:00",
                "time_tbd": true,
                "short_title": "Daughtry",
                "visible_until_utc": "2021-09-09T04:00:00",
                "stats": {
                    "listing_count": null,
                    "average_price": null,
                    "lowest_price_good_deals": null,
                    "lowest_price": null,
                    "highest_price": null,
                    "visible_listing_count": null,
                    "dq_bucket_counts": null,
                    "median_price": null,
                    "lowest_sg_base_price": null,
                    "lowest_sg_base_price_good_deals": null
                },
                "taxonomies": [
                    {
                        "id": 2000000,
                        "name": "concert",
                        "parent_id": null,
                        "rank": 0
                    }
                ],
                "url": "https://seatgeek.com/daughtry-tickets/moncton-canada-casino-new-brunswick-2021-09-08-3-30-am/concert/5259817",
                "score": 0,
                "announce_date": "2020-03-24T00:00:00",
                "created_at": "2020-03-24T16:01:20",
                "date_tbd": true,
                "title": "Daughtry",
                "popularity": 0,
                "description": "",
                "status": "normal",
                "access_method": null,
                "event_promotion": null,
                "announcements": {},
                "conditional": false,
                "enddatetime_utc": null,
                "themes": [],
                "domain_information": []
            },
            {
                "type": "theater",
                "id": 5327967,
                "datetime_utc": "2021-09-08T07:30:00",
                "venue": {
                    "state": "FL",
                    "name_v2": "Broward Center Amaturo",
                    "postal_code": "33312",
                    "name": "Broward Center Amaturo",
                    "links": [],
                    "timezone": "America/New_York",
                    "url": "https://seatgeek.com/venues/broward-center-amaturo-1/tickets",
                    "score": 0.67,
                    "location": {
                        "lat": 26.1199,
                        "lon": -80.1493
                    },
                    "address": "201 SW 5th Ave",
                    "country": "US",
                    "has_upcoming_events": true,
                    "num_upcoming_events": 65,
                    "city": "Fort Lauderdale",
                    "slug": "broward-center-amaturo-1",
                    "extended_address": "Fort Lauderdale, FL 33312",
                    "id": 586,
                    "popularity": 0,
                    "access_method": null,
                    "metro_code": 528,
                    "capacity": 590,
                    "display_location": "Fort Lauderdale, FL"
                },
                "datetime_tbd": true,
                "performers": [
                    {
                        "type": "theater",
                        "name": "Abby Wambach",
                        "image": "https://seatgeek.com/images/performers-landscape/abby-wambach-39f568/701912/huge.jpg",
                        "id": 701912,
                        "images": {
                            "huge": "https://seatgeek.com/images/performers-landscape/abby-wambach-39f568/701912/huge.jpg"
                        },
                        "divisions": null,
                        "has_upcoming_events": true,
                        "primary": true,
                        "stats": {
                            "event_count": 1
                        },
                        "taxonomies": [
                            {
                                "id": 3000000,
                                "name": "theater",
                                "parent_id": null,
                                "document_source": {
                                    "source_type": "ELASTIC",
                                    "generation_type": "FULL"
                                },
                                "rank": 0
                            }
                        ],
                        "image_attribution": "null",
                        "url": "https://seatgeek.com/abby-wambach-tickets",
                        "score": 0.34,
                        "slug": "abby-wambach",
                        "home_venue_id": null,
                        "short_name": "Abby Wambach",
                        "num_upcoming_events": 1,
                        "colors": null,
                        "image_license": "null",
                        "popularity": 0,
                        "location": null
                    }
                ],
                "is_open": false,
                "links": [],
                "datetime_local": "2021-09-08T03:30:00",
                "time_tbd": true,
                "short_title": "Abby Wambach - Fort Lauderdale",
                "visible_until_utc": "2021-09-09T04:00:00",
                "stats": {
                    "listing_count": null,
                    "average_price": null,
                    "lowest_price_good_deals": null,
                    "lowest_price": null,
                    "highest_price": null,
                    "visible_listing_count": null,
                    "dq_bucket_counts": null,
                    "median_price": null,
                    "lowest_sg_base_price": null,
                    "lowest_sg_base_price_good_deals": null
                },
                "taxonomies": [
                    {
                        "id": 3000000,
                        "name": "theater",
                        "parent_id": null,
                        "rank": 0
                    }
                ],
                "url": "https://seatgeek.com/abby-wambach-fort-lauderdale-tickets/theater/2021-09-08-3-30-am/5327967",
                "score": 0.379,
                "announce_date": "2020-09-04T00:00:00",
                "created_at": "2020-09-04T16:27:45",
                "date_tbd": true,
                "title": "Abby Wambach - Fort Lauderdale",
                "popularity": 0.597,
                "description": "",
                "status": "normal",
                "access_method": null,
                "event_promotion": null,
                "announcements": {},
                "conditional": false,
                "enddatetime_utc": null,
                "themes": [],
                "domain_information": []
            },
            {
                "type": "broadway_tickets_national",
                "id": 5426908,
                "datetime_utc": "2021-09-08T14:30:00",
                "venue": {
                    "state": "MD",
                    "name_v2": "Toby's Dinner Theatre",
                    "postal_code": "21044",
                    "name": "Toby's Dinner Theatre",
                    "links": [],
                    "timezone": "America/New_York",
                    "url": "https://seatgeek.com/venues/toby-s-dinner-theatre/tickets",
                    "score": 0.54,
                    "location": {
                        "lat": 39.2089,
                        "lon": -76.8585
                    },
                    "address": "5900 Symphony Woods Rd",
                    "country": "US",
                    "has_upcoming_events": true,
                    "num_upcoming_events": 133,
                    "city": "Columbia",
                    "slug": "toby-s-dinner-theatre",
                    "extended_address": "Columbia, MD 21044",
                    "id": 6953,
                    "popularity": 0,
                    "access_method": null,
                    "metro_code": 512,
                    "capacity": 0,
                    "display_location": "Columbia, MD"
                },
                "datetime_tbd": false,
                "performers": [
                    {
                        "type": "theater_broadway_national_tours",
                        "name": "Godspell",
                        "image": "https://seatgeek.com/images/performers-landscape/godspell-2991f3/10367/huge.jpg",
                        "id": 10367,
                        "images": {
                            "huge": "https://seatgeek.com/images/performers-landscape/godspell-2991f3/10367/huge.jpg"
                        },
                        "divisions": null,
                        "has_upcoming_events": true,
                        "primary": true,
                        "stats": {
                            "event_count": 62
                        },
                        "taxonomies": [
                            {
                                "id": 3000000,
                                "name": "theater",
                                "parent_id": null,
                                "document_source": {
                                    "source_type": "ELASTIC",
                                    "generation_type": "FULL"
                                },
                                "rank": 0
                            },
                            {
                                "id": 3030000,
                                "name": "broadway_tickets_national",
                                "parent_id": 3000000,
                                "document_source": {
                                    "source_type": "ELASTIC",
                                    "generation_type": "FULL"
                                },
                                "rank": 0
                            }
                        ],
                        "image_attribution": "null",
                        "url": "https://seatgeek.com/godspell-tickets",
                        "score": 0.4,
                        "slug": "godspell",
                        "home_venue_id": null,
                        "short_name": "Godspell",
                        "num_upcoming_events": 62,
                        "colors": null,
                        "image_license": "null",
                        "popularity": 0,
                        "location": null
                    }
                ],
                "is_open": false,
                "links": [],
                "datetime_local": "2021-09-08T10:30:00",
                "time_tbd": false,
                "short_title": "Godspell - Columbia",
                "visible_until_utc": "2021-09-08T18:30:00",
                "stats": {
                    "listing_count": null,
                    "average_price": null,
                    "lowest_price_good_deals": null,
                    "lowest_price": null,
                    "highest_price": null,
                    "visible_listing_count": null,
                    "dq_bucket_counts": null,
                    "median_price": null,
                    "lowest_sg_base_price": null,
                    "lowest_sg_base_price_good_deals": null
                },
                "taxonomies": [
                    {
                        "id": 3000000,
                        "name": "theater",
                        "parent_id": null,
                        "rank": 0
                    },
                    {
                        "id": 3030000,
                        "name": "broadway_tickets_national",
                        "parent_id": 3000000,
                        "rank": 0
                    }
                ],
                "url": "https://seatgeek.com/godspell-columbia-tickets/toby-s-dinner-theatre-2021-09-08-10-30-am/broadway/5426908",
                "score": 0,
                "announce_date": "2021-06-18T00:00:00",
                "created_at": "2021-06-18T16:02:39",
                "date_tbd": false,
                "title": "Godspell - Columbia",
                "popularity": 0,
                "description": "",
                "status": "normal",
                "access_method": null,
                "event_promotion": null,
                "announcements": {},
                "conditional": false,
                "enddatetime_utc": null,
                "themes": [],
                "domain_information": []
            },
            {
                "type": "broadway_tickets_national",
                "id": 5345131,
                "datetime_utc": "2021-09-08T15:00:00",
                "venue": {
                    "state": "FL",
                    "name_v2": "Broward Center Amaturo",
                    "postal_code": "33312",
                    "name": "Broward Center Amaturo",
                    "links": [],
                    "timezone": "America/New_York",
                    "url": "https://seatgeek.com/venues/broward-center-amaturo-1/tickets",
                    "score": 0.67,
                    "location": {
                        "lat": 26.1199,
                        "lon": -80.1493
                    },
                    "address": "201 SW 5th Ave",
                    "country": "US",
                    "has_upcoming_events": true,
                    "num_upcoming_events": 64,
                    "city": "Fort Lauderdale",
                    "slug": "broward-center-amaturo-1",
                    "extended_address": "Fort Lauderdale, FL 33312",
                    "id": 586,
                    "popularity": 0,
                    "access_method": null,
                    "metro_code": 528,
                    "capacity": 590,
                    "display_location": "Fort Lauderdale, FL"
                },
                "datetime_tbd": false,
                "performers": [
                    {
                        "type": "theater_broadway_national_tours",
                        "name": "Kinky Boots",
                        "image": "https://seatgeek.com/images/performers-landscape/kinky-boots-c8ccb2/18509/huge.jpg",
                        "id": 18509,
                        "images": {
                            "huge": "https://seatgeek.com/images/performers-landscape/kinky-boots-c8ccb2/18509/huge.jpg"
                        },
                        "divisions": null,
                        "has_upcoming_events": true,
                        "primary": true,
                        "stats": {
                            "event_count": 81
                        },
                        "taxonomies": [
                            {
                                "id": 3000000,
                                "name": "theater",
                                "parent_id": null,
                                "document_source": {
                                    "source_type": "ELASTIC",
                                    "generation_type": "FULL"
                                },
                                "rank": 0
                            },
                            {
                                "id": 3030000,
                                "name": "broadway_tickets_national",
                                "parent_id": 3000000,
                                "document_source": {
                                    "source_type": "ELASTIC",
                                    "generation_type": "FULL"
                                },
                                "rank": 0
                            }
                        ],
                        "image_attribution": null,
                        "url": "https://seatgeek.com/kinky-boots-tickets",
                        "score": 0.49,
                        "slug": "kinky-boots",
                        "home_venue_id": null,
                        "short_name": "Kinky Boots",
                        "num_upcoming_events": 81,
                        "colors": null,
                        "image_license": null,
                        "popularity": 0,
                        "location": null
                    }
                ],
                "is_open": false,
                "links": [],
                "datetime_local": "2021-09-08T11:00:00",
                "time_tbd": false,
                "short_title": "Kinky Boots - Fort Lauderdale",
                "visible_until_utc": "2021-09-08T19:00:00",
                "stats": {
                    "listing_count": null,
                    "average_price": null,
                    "lowest_price_good_deals": null,
                    "lowest_price": null,
                    "highest_price": null,
                    "visible_listing_count": null,
                    "dq_bucket_counts": null,
                    "median_price": null,
                    "lowest_sg_base_price": null,
                    "lowest_sg_base_price_good_deals": null
                },
                "taxonomies": [
                    {
                        "id": 3000000,
                        "name": "theater",
                        "parent_id": null,
                        "rank": 0
                    },
                    {
                        "id": 3030000,
                        "name": "broadway_tickets_national",
                        "parent_id": 3000000,
                        "rank": 0
                    }
                ],
                "url": "https://seatgeek.com/kinky-boots-fort-lauderdale-tickets/broward-center-amaturo-1-2021-09-08-11-am/broadway/5345131",
                "score": 0.417,
                "announce_date": "2020-11-24T00:00:00",
                "created_at": "2020-11-24T13:55:01",
                "date_tbd": false,
                "title": "Kinky Boots - Fort Lauderdale",
                "popularity": 0.656,
                "description": "",
                "status": "normal",
                "access_method": null,
                "event_promotion": null,
                "announcements": {},
                "conditional": false,
                "enddatetime_utc": null,
                "themes": [],
                "domain_information": []
            },
            {
                "type": "theater",
                "id": 5476545,
                "datetime_utc": "2021-09-08T15:00:00",
                "venue": {
                    "state": "IL",
                    "name_v2": "Lighthouse ArtSpace Chicago",
                    "postal_code": "60647",
                    "name": "Lighthouse ArtSpace Chicago",
                    "links": [],
                    "timezone": "America/Chicago",
                    "url": "https://seatgeek.com/venues/lighthouse-artspace-chicago/tickets",
                    "score": 0.6,
                    "location": {
                        "lat": 41.9174,
                        "lon": -87.7127
                    },
                    "address": "3418 West Armitage Avenue",
                    "country": "US",
                    "has_upcoming_events": true,
                    "num_upcoming_events": 247,
                    "city": "Chicago",
                    "slug": "lighthouse-artspace-chicago",
                    "extended_address": "Chicago, IL 60647",
                    "id": 518641,
                    "popularity": 0,
                    "access_method": null,
                    "metro_code": 602,
                    "capacity": 0,
                    "display_location": "Chicago, IL"
                },
                "datetime_tbd": false,
                "performers": [
                    {
                        "type": "theater",
                        "name": "Immersive Van Gogh Exhibit",
                        "image": "https://seatgeek.com/images/performers-landscape/immersive-van-gogh-exhibit-4c1139/793490/huge.jpg",
                        "id": 793490,
                        "images": {
                            "huge": "https://seatgeek.com/images/performers-landscape/immersive-van-gogh-exhibit-4c1139/793490/huge.jpg"
                        },
                        "divisions": null,
                        "has_upcoming_events": true,
                        "primary": true,
                        "stats": {
                            "event_count": 247
                        },
                        "taxonomies": [
                            {
                                "id": 3000000,
                                "name": "theater",
                                "parent_id": null,
                                "document_source": {
                                    "source_type": "ELASTIC",
                                    "generation_type": "FULL"
                                },
                                "rank": 0
                            }
                        ],
                        "image_attribution": "null",
                        "url": "https://seatgeek.com/immersive-van-gogh-exhibit-tickets",
                        "score": 0.38,
                        "slug": "immersive-van-gogh-exhibit",
                        "home_venue_id": null,
                        "short_name": "Immersive Van Gogh Exhibit",
                        "num_upcoming_events": 247,
                        "colors": null,
                        "image_license": "null",
                        "popularity": 0,
                        "location": null
                    }
                ],
                "is_open": false,
                "links": [],
                "datetime_local": "2021-09-08T10:00:00",
                "time_tbd": false,
                "short_title": "Immersive Van Gogh Exhibit - Chicago",
                "visible_until_utc": "2021-09-08T19:00:00",
                "stats": {
                    "listing_count": null,
                    "average_price": null,
                    "lowest_price_good_deals": null,
                    "lowest_price": null,
                    "highest_price": null,
                    "visible_listing_count": null,
                    "dq_bucket_counts": null,
                    "median_price": null,
                    "lowest_sg_base_price": null,
                    "lowest_sg_base_price_good_deals": null
                },
                "taxonomies": [
                    {
                        "id": 3000000,
                        "name": "theater",
                        "parent_id": null,
                        "rank": 0
                    }
                ],
                "url": "https://seatgeek.com/immersive-van-gogh-exhibit-chicago-tickets/theater/2021-09-08-10-am/5476545",
                "score": 0.362,
                "announce_date": "2021-08-18T00:00:00",
                "created_at": "2021-08-18T16:03:58",
                "date_tbd": false,
                "title": "Immersive Van Gogh Exhibit - Chicago",
                "popularity": 0.597,
                "description": "",
                "status": "normal",
                "access_method": null,
                "event_promotion": null,
                "announcements": {},
                "conditional": false,
                "enddatetime_utc": null,
                "themes": [],
                "domain_information": []
            },
            {
                "type": "tennis",
                "id": 5349608,
                "datetime_utc": "2021-09-08T15:00:00",
                "venue": {
                    "state": "NY",
                    "name_v2": "Billie Jean King National Tennis Center",
                    "postal_code": "11368",
                    "name": "Billie Jean King National Tennis Center",
                    "links": [],
                    "timezone": "America/New_York",
                    "url": "https://seatgeek.com/venues/billie-jean-king-national-tennis-center/tickets",
                    "score": 0.76,
                    "location": {
                        "lat": 40.7504,
                        "lon": -73.8457
                    },
                    "address": "1 Flushing Meadows Corona Park Road",
                    "country": "US",
                    "has_upcoming_events": true,
                    "num_upcoming_events": 5,
                    "city": "Flushing",
                    "slug": "billie-jean-king-national-tennis-center",
                    "extended_address": "Flushing, NY 11368",
                    "id": 2975,
                    "popularity": 0,
                    "access_method": {
                        "method": "MOBILE_ONLY",
                        "created_at": "2018-08-28T20:59:45Z",
                        "employee_only": false
                    },
                    "metro_code": 501,
                    "capacity": 23200,
                    "display_location": "Flushing, NY"
                },
                "datetime_tbd": false,
                "performers": [
                    {
                        "type": "tennis",
                        "name": "US Open Tennis",
                        "image": "https://seatgeek.com/images/performers-landscape/us-open-tennis-d8ffc6/5702/3182/huge.jpg",
                        "id": 5702,
                        "images": {
                            "huge": "https://seatgeek.com/images/performers-landscape/us-open-tennis-d8ffc6/5702/3182/huge.jpg"
                        },
                        "divisions": null,
                        "has_upcoming_events": true,
                        "primary": true,
                        "stats": {
                            "event_count": 12
                        },
                        "taxonomies": [
                            {
                                "id": 1000000,
                                "name": "sports",
                                "parent_id": null,
                                "document_source": {
                                    "source_type": "ELASTIC",
                                    "generation_type": "FULL"
                                },
                                "rank": 0
                            },
                            {
                                "id": 1090000,
                                "name": "tennis",
                                "parent_id": 1000000,
                                "document_source": {
                                    "source_type": "ELASTIC",
                                    "generation_type": "FULL"
                                },
                                "rank": 0
                            }
                        ],
                        "image_attribution": null,
                        "url": "https://seatgeek.com/us-open-tennis-tickets",
                        "score": 0.75,
                        "slug": "us-open-tennis",
                        "home_venue_id": null,
                        "short_name": "US Open Tennis",
                        "num_upcoming_events": 12,
                        "colors": null,
                        "image_license": null,
                        "popularity": 0,
                        "location": null
                    }
                ],
                "is_open": false,
                "links": [],
                "datetime_local": "2021-09-08T11:00:00",
                "time_tbd": false,
                "short_title": "US Open Tennis Grounds Admission September 8",
                "visible_until_utc": "2021-09-08T19:00:00",
                "stats": {
                    "listing_count": null,
                    "average_price": null,
                    "lowest_price_good_deals": null,
                    "lowest_price": null,
                    "highest_price": null,
                    "visible_listing_count": null,
                    "dq_bucket_counts": null,
                    "median_price": null,
                    "lowest_sg_base_price": null,
                    "lowest_sg_base_price_good_deals": null
                },
                "taxonomies": [
                    {
                        "id": 1000000,
                        "name": "sports",
                        "parent_id": null,
                        "rank": 0
                    },
                    {
                        "id": 1090000,
                        "name": "tennis",
                        "parent_id": 1000000,
                        "rank": 0
                    }
                ],
                "url": "https://seatgeek.com/us-open-tennis-grounds-admission-september-8-tickets/tennis/2021-09-08-11-am/5349608",
                "score": 0.588,
                "announce_date": "2020-12-10T00:00:00",
                "created_at": "2020-12-10T16:00:55",
                "date_tbd": false,
                "title": "US Open Tennis Grounds Admission September 8",
                "popularity": 0.809,
                "description": "",
                "status": "normal",
                "access_method": {
                    "method": "MOBILE_ONLY",
                    "created_at": "2018-08-28T20:59:45Z",
                    "employee_only": false
                },
                "event_promotion": null,
                "announcements": {
                    "checkout_disclosures": {
                        "messages": [
                            {
                                "text": "All purchases are 100% guaranteed. Prices set by the seller may be above or below face value."
                            }
                        ]
                    }
                },
                "conditional": false,
                "enddatetime_utc": null,
                "themes": [],
                "domain_information": []
            },
            {
                "type": "tennis",
                "id": 5349657,
                "datetime_utc": "2021-09-08T16:00:00",
                "venue": {
                    "state": "NY",
                    "name_v2": "Arthur Ashe Stadium",
                    "postal_code": "11368",
                    "name": "Arthur Ashe Stadium",
                    "links": [],
                    "timezone": "America/New_York",
                    "url": "https://seatgeek.com/venues/arthur-ashe-stadium/tickets",
                    "score": 0.88,
                    "location": {
                        "lat": 40.7397,
                        "lon": -73.8408
                    },
                    "address": "Flushing Meadow Corona Park",
                    "country": "US",
                    "has_upcoming_events": true,
                    "num_upcoming_events": 7,
                    "city": "Flushing",
                    "slug": "arthur-ashe-stadium",
                    "extended_address": "Flushing, NY 11368",
                    "id": 2978,
                    "popularity": 0,
                    "access_method": {
                        "method": "QRCODE_TM",
                        "created_at": "2018-09-03T16:51:17Z",
                        "employee_only": false
                    },
                    "metro_code": 501,
                    "capacity": 22547,
                    "display_location": "Flushing, NY"
                },
                "datetime_tbd": false,
                "performers": [
                    {
                        "type": "tennis",
                        "name": "US Open Tennis",
                        "image": "https://seatgeek.com/images/performers-landscape/us-open-tennis-d8ffc6/5702/3182/huge.jpg",
                        "id": 5702,
                        "images": {
                            "huge": "https://seatgeek.com/images/performers-landscape/us-open-tennis-d8ffc6/5702/3182/huge.jpg"
                        },
                        "divisions": null,
                        "has_upcoming_events": true,
                        "primary": true,
                        "stats": {
                            "event_count": 10
                        },
                        "taxonomies": [
                            {
                                "id": 1000000,
                                "name": "sports",
                                "parent_id": null,
                                "document_source": {
                                    "source_type": "ELASTIC",
                                    "generation_type": "FULL"
                                },
                                "rank": 0
                            },
                            {
                                "id": 1090000,
                                "name": "tennis",
                                "parent_id": 1000000,
                                "document_source": {
                                    "source_type": "ELASTIC",
                                    "generation_type": "FULL"
                                },
                                "rank": 0
                            }
                        ],
                        "image_attribution": null,
                        "url": "https://seatgeek.com/us-open-tennis-tickets",
                        "score": 0.75,
                        "slug": "us-open-tennis",
                        "home_venue_id": null,
                        "short_name": "US Open Tennis",
                        "num_upcoming_events": 10,
                        "colors": null,
                        "image_license": null,
                        "popularity": 0,
                        "location": null
                    },
                    {
                        "type": "tennis",
                        "name": "Alexander Zverev",
                        "image": "https://seatgeek.com/images/performers-landscape/generic-tennis-3afc11/677173/32424/huge.jpg",
                        "id": 794602,
                        "images": {
                            "huge": "https://seatgeek.com/images/performers-landscape/generic-tennis-3afc11/677173/32424/huge.jpg"
                        },
                        "divisions": null,
                        "has_upcoming_events": false,
                        "stats": {
                            "event_count": 0
                        },
                        "taxonomies": [
                            {
                                "id": 1000000,
                                "name": "sports",
                                "parent_id": null,
                                "document_source": {
                                    "source_type": "ELASTIC",
                                    "generation_type": "FULL"
                                },
                                "rank": 0
                            },
                            {
                                "id": 1090000,
                                "name": "tennis",
                                "parent_id": 1000000,
                                "document_source": {
                                    "source_type": "ELASTIC",
                                    "generation_type": "FULL"
                                },
                                "rank": 0
                            }
                        ],
                        "image_attribution": null,
                        "url": "https://seatgeek.com/alexander-zverev-tickets",
                        "score": 0.76,
                        "slug": "alexander-zverev",
                        "home_venue_id": null,
                        "short_name": "Alexander Zverev",
                        "num_upcoming_events": 0,
                        "colors": null,
                        "image_license": null,
                        "popularity": 0,
                        "location": null
                    },
                    {
                        "type": "tennis",
                        "name": "Belinda Bencic",
                        "image": "https://seatgeek.com/images/performers-landscape/generic-tennis-3afc11/677173/32424/huge.jpg",
                        "id": 794702,
                        "images": {
                            "huge": "https://seatgeek.com/images/performers-landscape/generic-tennis-3afc11/677173/32424/huge.jpg"
                        },
                        "divisions": null,
                        "has_upcoming_events": false,
                        "stats": {
                            "event_count": 0
                        },
                        "taxonomies": [
                            {
                                "id": 1000000,
                                "name": "sports",
                                "parent_id": null,
                                "document_source": {
                                    "source_type": "ELASTIC",
                                    "generation_type": "FULL"
                                },
                                "rank": 0
                            },
                            {
                                "id": 1090000,
                                "name": "tennis",
                                "parent_id": 1000000,
                                "document_source": {
                                    "source_type": "ELASTIC",
                                    "generation_type": "FULL"
                                },
                                "rank": 0
                            }
                        ],
                        "image_attribution": null,
                        "url": "https://seatgeek.com/belinda-bencic-tickets",
                        "score": 0,
                        "slug": "belinda-bencic",
                        "home_venue_id": null,
                        "short_name": "Belinda Bencic",
                        "num_upcoming_events": 0,
                        "colors": null,
                        "image_license": null,
                        "popularity": 0,
                        "location": null
                    },
                    {
                        "type": "tennis",
                        "name": "Lloyd Harris",
                        "image": "https://seatgeek.com/images/performers-landscape/generic-tennis-3afc11/677173/32424/huge.jpg",
                        "id": 794703,
                        "images": {
                            "huge": "https://seatgeek.com/images/performers-landscape/generic-tennis-3afc11/677173/32424/huge.jpg"
                        },
                        "divisions": null,
                        "has_upcoming_events": false,
                        "stats": {
                            "event_count": 0
                        },
                        "taxonomies": [
                            {
                                "id": 1000000,
                                "name": "sports",
                                "parent_id": null,
                                "document_source": {
                                    "source_type": "ELASTIC",
                                    "generation_type": "FULL"
                                },
                                "rank": 0
                            },
                            {
                                "id": 1090000,
                                "name": "tennis",
                                "parent_id": 1000000,
                                "document_source": {
                                    "source_type": "ELASTIC",
                                    "generation_type": "FULL"
                                },
                                "rank": 0
                            }
                        ],
                        "image_attribution": null,
                        "url": "https://seatgeek.com/lloyd-harris-tickets",
                        "score": 0,
                        "slug": "lloyd-harris",
                        "home_venue_id": null,
                        "short_name": "Lloyd Harris",
                        "num_upcoming_events": 0,
                        "colors": null,
                        "image_license": null,
                        "popularity": 0,
                        "location": null
                    }
                ],
                "is_open": false,
                "links": [],
                "datetime_local": "2021-09-08T12:00:00",
                "time_tbd": false,
                "short_title": "US Open Tennis Session 19 - Men's and Women's Quarterfinals",
                "visible_until_utc": "2021-09-08T20:00:00",
                "stats": {
                    "listing_count": 50,
                    "average_price": 120,
                    "lowest_price_good_deals": 27,
                    "lowest_price": 27,
                    "highest_price": 645,
                    "visible_listing_count": 50,
                    "dq_bucket_counts": [
                        11,
                        10,
                        12,
                        5,
                        2,
                        5,
                        9,
                        0
                    ],
                    "median_price": 83,
                    "lowest_sg_base_price": 15,
                    "lowest_sg_base_price_good_deals": 15
                },
                "taxonomies": [
                    {
                        "id": 1000000,
                        "name": "sports",
                        "parent_id": null,
                        "rank": 0
                    },
                    {
                        "id": 1090000,
                        "name": "tennis",
                        "parent_id": 1000000,
                        "rank": 0
                    }
                ],
                "url": "https://seatgeek.com/us-open-tennis-session-19-mens-and-womens-quarterfinals-tickets/tennis/2021-09-08-12-pm/5349657",
                "score": 0.698,
                "announce_date": "2020-12-10T00:00:00",
                "created_at": "2020-12-10T16:00:56",
                "date_tbd": false,
                "title": "US Open Tennis Session 19 - Men's and Women's Quarterfinals",
                "popularity": 0.891,
                "description": "",
                "status": "normal",
                "access_method": {
                    "method": "QRCODE_TM",
                    "created_at": "2018-09-03T16:51:17Z",
                    "employee_only": false
                },
                "event_promotion": null,
                "announcements": {
                    "checkout_disclosures": {
                        "messages": [
                            {
                                "text": "All purchases are 100% guaranteed. Prices set by the seller may be above or below face value."
                            }
                        ]
                    }
                },
                "conditional": false,
                "enddatetime_utc": "2021-09-08T20:00:00",
                "themes": [],
                "domain_information": []
            },
            {
                "type": "minor_league_baseball",
                "id": 5391843,
                "datetime_utc": "2021-09-08T16:10:00",
                "venue": {
                    "state": "FL",
                    "name_v2": "Clover Park",
                    "postal_code": "34986",
                    "name": "Clover Park",
                    "links": [],
                    "timezone": "America/New_York",
                    "url": "https://seatgeek.com/venues/clover-park/tickets",
                    "score": 0.74,
                    "location": {
                        "lat": 27.3248,
                        "lon": -80.4048
                    },
                    "address": "525 NW Peacock Blvd.",
                    "country": "US",
                    "has_upcoming_events": true,
                    "num_upcoming_events": 11,
                    "city": "Port St. Lucie",
                    "slug": "clover-park",
                    "extended_address": "Port St. Lucie, FL 34986",
                    "id": 3926,
                    "popularity": 0,
                    "access_method": null,
                    "metro_code": 548,
                    "capacity": 7160,
                    "display_location": "Port St. Lucie, FL"
                },
                "datetime_tbd": false,
                "performers": [
                    {
                        "type": "minor_league_baseball",
                        "name": "St. Lucie Mets",
                        "image": "https://seatgeek.com/images/performers-landscape/st-lucie-mets-55ccb9/9432/huge.jpg",
                        "id": 9432,
                        "images": {
                            "huge": "https://seatgeek.com/images/performers-landscape/st-lucie-mets-55ccb9/9432/huge.jpg"
                        },
                        "divisions": null,
                        "has_upcoming_events": true,
                        "primary": true,
                        "stats": {
                            "event_count": 11
                        },
                        "taxonomies": [
                            {
                                "id": 1000000,
                                "name": "sports",
                                "parent_id": null,
                                "document_source": {
                                    "source_type": "ELASTIC",
                                    "generation_type": "FULL"
                                },
                                "rank": 0
                            },
                            {
                                "id": 1010000,
                                "name": "baseball",
                                "parent_id": 1000000,
                                "document_source": {
                                    "source_type": "ELASTIC",
                                    "generation_type": "FULL"
                                },
                                "rank": 0
                            },
                            {
                                "id": 1010300,
                                "name": "minor_league_baseball",
                                "parent_id": 1010000,
                                "document_source": {
                                    "source_type": "ELASTIC",
                                    "generation_type": "FULL"
                                },
                                "rank": 0
                            }
                        ],
                        "image_attribution": null,
                        "url": "https://seatgeek.com/st-lucie-mets-tickets",
                        "score": 0.35,
                        "slug": "st-lucie-mets",
                        "home_venue_id": 3926,
                        "short_name": "St Lucie Mets",
                        "num_upcoming_events": 11,
                        "colors": null,
                        "image_license": null,
                        "popularity": 0,
                        "home_team": true,
                        "location": {
                            "lat": 27.3248,
                            "lon": -80.4048
                        }
                    },
                    {
                        "type": "minor_league_baseball",
                        "name": "Lakeland Flying Tigers",
                        "image": "https://seatgeek.com/images/performers-landscape/lakeland-flying-tigers-e954f4/9431/huge.jpg",
                        "id": 9431,
                        "images": {
                            "huge": "https://seatgeek.com/images/performers-landscape/lakeland-flying-tigers-e954f4/9431/huge.jpg"
                        },
                        "divisions": null,
                        "has_upcoming_events": true,
                        "stats": {
                            "event_count": 5
                        },
                        "taxonomies": [
                            {
                                "id": 1000000,
                                "name": "sports",
                                "parent_id": null,
                                "document_source": {
                                    "source_type": "ELASTIC",
                                    "generation_type": "FULL"
                                },
                                "rank": 0
                            },
                            {
                                "id": 1010000,
                                "name": "baseball",
                                "parent_id": 1000000,
                                "document_source": {
                                    "source_type": "ELASTIC",
                                    "generation_type": "FULL"
                                },
                                "rank": 0
                            },
                            {
                                "id": 1010300,
                                "name": "minor_league_baseball",
                                "parent_id": 1010000,
                                "document_source": {
                                    "source_type": "ELASTIC",
                                    "generation_type": "FULL"
                                },
                                "rank": 0
                            }
                        ],
                        "image_attribution": "https://www.flickr.com/photos/hueytaxi/14022778699/in/photolist-nn9pyx-ezdZoM-nDmjxT-eze4EF-nDCsEL-nBAxo1-nFqAqX-ezdZWT-eze6fz-nBAGJq-nFqyrr-nDD9Ba-nDDedp-nn9Aea-nBAEk7-nn9Kj5-eze1qa-nn9rQA-nn9x5V-nDqxif-nn9PSk-eKUear-bC3XqA-eL6CSY-ngGDp2-oHZsFr-e6dpg3-d9amUG-ot4yxU-oYs1Z7-epzy5X-doDPi3-ngGGGL-oHYYs4-bUXKxL-p1rMW7-oHZmgA-fGaqum-e4S21A-fFSvLM-e4S1FE-epzAKB-oHZyNC-eL6zFq-epzyKF-oHZ4p8-oHZAC8-or46WJ-e4S1SL-p1tE1r",
                        "url": "https://seatgeek.com/lakeland-flying-tigers-tickets",
                        "score": 0.35,
                        "slug": "lakeland-flying-tigers",
                        "home_venue_id": 3929,
                        "short_name": "Lakeland Flying Tigers",
                        "num_upcoming_events": 5,
                        "colors": null,
                        "image_license": "https://creativecommons.org/licenses/by/2.0/",
                        "popularity": 0,
                        "away_team": true,
                        "location": {
                            "lat": 28.0739,
                            "lon": -81.9533
                        }
                    }
                ],
                "is_open": false,
                "links": [],
                "datetime_local": "2021-09-08T12:10:00",
                "time_tbd": false,
                "short_title": "Lakeland Flying Tigers at St. Lucie Mets",
                "visible_until_utc": "2021-09-08T20:10:00",
                "stats": {
                    "listing_count": null,
                    "average_price": null,
                    "lowest_price_good_deals": null,
                    "lowest_price": null,
                    "highest_price": null,
                    "visible_listing_count": null,
                    "dq_bucket_counts": null,
                    "median_price": null,
                    "lowest_sg_base_price": null,
                    "lowest_sg_base_price_good_deals": null
                },
                "taxonomies": [
                    {
                        "id": 1000000,
                        "name": "sports",
                        "parent_id": null,
                        "rank": 0
                    },
                    {
                        "id": 1010000,
                        "name": "baseball",
                        "parent_id": 1000000,
                        "rank": 0
                    },
                    {
                        "id": 1010300,
                        "name": "minor_league_baseball",
                        "parent_id": 1010000,
                        "rank": 0
                    }
                ],
                "url": "https://seatgeek.com/lakeland-flying-tigers-at-st-lucie-mets-tickets/minor-league-baseball/2021-09-08-12-10-pm/5391843",
                "score": 0.327,
                "announce_date": "2021-04-28T00:00:00",
                "created_at": "2021-04-28T16:00:45",
                "date_tbd": false,
                "title": "Lakeland Flying Tigers at St. Lucie Mets",
                "popularity": 0.607,
                "description": "",
                "status": "normal",
                "access_method": null,
                "event_promotion": null,
                "announcements": {},
                "conditional": false,
                "enddatetime_utc": null,
                "themes": [],
                "domain_information": []
            },
            {
                "type": "theater",
                "id": 5476652,
                "datetime_utc": "2021-09-08T17:00:00",
                "venue": {
                    "state": "IL",
                    "name_v2": "Lighthouse ArtSpace Chicago",
                    "postal_code": "60647",
                    "name": "Lighthouse ArtSpace Chicago",
                    "links": [],
                    "timezone": "America/Chicago",
                    "url": "https://seatgeek.com/venues/lighthouse-artspace-chicago/tickets",
                    "score": 0.6,
                    "location": {
                        "lat": 41.9174,
                        "lon": -87.7127
                    },
                    "address": "3418 West Armitage Avenue",
                    "country": "US",
                    "has_upcoming_events": true,
                    "num_upcoming_events": 247,
                    "city": "Chicago",
                    "slug": "lighthouse-artspace-chicago",
                    "extended_address": "Chicago, IL 60647",
                    "id": 518641,
                    "popularity": 0,
                    "access_method": null,
                    "metro_code": 602,
                    "capacity": 0,
                    "display_location": "Chicago, IL"
                },
                "datetime_tbd": false,
                "performers": [
                    {
                        "type": "theater",
                        "name": "Immersive Van Gogh Exhibit",
                        "image": "https://seatgeek.com/images/performers-landscape/immersive-van-gogh-exhibit-4c1139/793490/huge.jpg",
                        "id": 793490,
                        "images": {
                            "huge": "https://seatgeek.com/images/performers-landscape/immersive-van-gogh-exhibit-4c1139/793490/huge.jpg"
                        },
                        "divisions": null,
                        "has_upcoming_events": true,
                        "primary": true,
                        "stats": {
                            "event_count": 247
                        },
                        "taxonomies": [
                            {
                                "id": 3000000,
                                "name": "theater",
                                "parent_id": null,
                                "document_source": {
                                    "source_type": "ELASTIC",
                                    "generation_type": "FULL"
                                },
                                "rank": 0
                            }
                        ],
                        "image_attribution": "null",
                        "url": "https://seatgeek.com/immersive-van-gogh-exhibit-tickets",
                        "score": 0.38,
                        "slug": "immersive-van-gogh-exhibit",
                        "home_venue_id": null,
                        "short_name": "Immersive Van Gogh Exhibit",
                        "num_upcoming_events": 247,
                        "colors": null,
                        "image_license": "null",
                        "popularity": 0,
                        "location": null
                    }
                ],
                "is_open": false,
                "links": [],
                "datetime_local": "2021-09-08T12:00:00",
                "time_tbd": false,
                "short_title": "Immersive Van Gogh Exhibit - Chicago",
                "visible_until_utc": "2021-09-08T21:00:00",
                "stats": {
                    "listing_count": null,
                    "average_price": null,
                    "lowest_price_good_deals": null,
                    "lowest_price": null,
                    "highest_price": null,
                    "visible_listing_count": null,
                    "dq_bucket_counts": null,
                    "median_price": null,
                    "lowest_sg_base_price": null,
                    "lowest_sg_base_price_good_deals": null
                },
                "taxonomies": [
                    {
                        "id": 3000000,
                        "name": "theater",
                        "parent_id": null,
                        "rank": 0
                    }
                ],
                "url": "https://seatgeek.com/immersive-van-gogh-exhibit-chicago-tickets/theater/2021-09-08-12-pm/5476652",
                "score": 0.356,
                "announce_date": "2021-08-18T00:00:00",
                "created_at": "2021-08-18T16:04:00",
                "date_tbd": false,
                "title": "Immersive Van Gogh Exhibit - Chicago",
                "popularity": 0.593,
                "description": "",
                "status": "normal",
                "access_method": null,
                "event_promotion": null,
                "announcements": {},
                "conditional": false,
                "enddatetime_utc": null,
                "themes": [],
                "domain_information": []
            }
        ],
        "meta": {
            "total": 77791,
            "took": 8,
            "page": 1,
            "per_page": 10,
            "geolocation": null
        }
    }
    """
