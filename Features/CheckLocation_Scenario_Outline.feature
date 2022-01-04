Feature: Returning location data based on country and zip code scenario outline
	As a consumer of the Zippopotam.us API
	I want to receive location data matching the country code and zip code I supply
	So I can use this data to auto-complete forms on my web site

    Scenario Outline: Existing country and zip codes yield the correct place names
		Given the country code '<country>' and zip code '<zip_code>'
		When I request the locations corresponding to these codes
		Then the response has status code '200'
		And the response contains exactly '<nr_of_locations>' locations
		And the response contains the place name '<place_name>'
		And the response contains the state '<state_name>'

    Examples:
        | country | zip_code | place_name            | state_name    | nr_of_locations |
        | us      | 90210    | Beverly Hills         | California    | 1               |
        | ca      | B3M      | Halifax Bedford Basin | Nova Scotia   | 1               |
        | nl      | 5653     | Eindhoven             | Noord-Brabant | 1               |
