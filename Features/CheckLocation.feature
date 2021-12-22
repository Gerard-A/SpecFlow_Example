Feature: Returning location data based on country and zip code
	As a consumer of the Zippopotam.us API
	I want to receive location data matching the country code and zip code I supply
	So I can use this data to auto-complete forms on my web site

    @SmokeTest @NightTest
	Scenario: An existing country and zip code yields the correct place name
		Given the country code 'us' and zip code '90210'
		When I request the locations corresponding to these codes
		Then the response contains the place name 'Beverly Hills'

    @SmokeTest @NightTest
	Scenario: An existing country and zip code yields the correct state name
		Given the country code 'us' and zip code '90210'
		When I request the locations corresponding to these codes
		Then the response contains the state 'California'

    @SmokeTest @NightTest
	Scenario: An existing country and zip code yields the correct number of results
		Given the country code 'us' and zip code '90210'
		When I request the locations corresponding to these codes
		Then the response contains exactly '1' location

    @SmokeTest @NightTest
	Scenario: An existing country and zip code yields the correct HTTP status code
		Given the country code 'us' and zip code '90210'
		When I request the locations corresponding to these codes
		Then the response has status code '200'

    @NightTest
	Scenario: A not existing country and zip code yields the correct HTTP status code
		Given the country code 'xx' and zip code '90210'
		When I request the locations corresponding to these codes
		Then the response has status code '404'

    @NightTest
	Scenario: An existing country and not existing zip code yields the correct HTTP status code
		Given the country code 'nl' and zip code '0000'
		When I request the locations corresponding to these codes
		Then the response has status code '404'

    Scenario Outline: Existing country and zip codes yield the correct place names
		Given the country code '<country>' and zip code '<zip_code>'
		When I request the locations corresponding to these codes
		Then the response has status code '200'
		And the response contains exactly '<nr_of_locations>' locations
		And the response contains the place name '<place_name>'
		And the response contains the state '<state_name>'

    @SmokeTest
    Examples:
        | country | zip_code | place_name            | state_name    | nr_of_locations |
        | us      | 90210    | Beverly Hills         | California    | 1               |
        | ca      | B3M      | Halifax Bedford Basin | Nova Scotia   | 1               |
        | nl      | 5653     | Eindhoven             | Noord-Brabant | 1               |
        
    @NightTest
    Examples:
        | country | zip_code | place_name              | state_name    | nr_of_locations |
        | us      | 90210    | Beverly Hills           | California    | 1               |
        | ca      | B3M      | Halifax Bedford Basin   | Nova Scotia   | 1               |
        | nl      | 5653     | Eindhoven               | Noord-Brabant | 1               |
        | nl      | 6851     | Huissen                 | Gelderland    | 1               |
        | de      | 01067    | Dresden                 | Sachsen       | 3               |
        | de      | 01067    | Dresden Friedrichstadt  | Sachsen       | 3               |
        | de      | 01067    | Dresden Innere Altstadt | Sachsen       | 3               |
