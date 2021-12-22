using System;
using TechTalk.SpecFlow;
using TechTalk.SpecFlow.Assist;
using NUnit.Framework;
using RestSharp;
using RestSharp.Serialization.Json;
using System.Collections.Generic;
using specflow_example.DataEntities;
using FluentAssertions;


	namespace specflow_example.StepDefinitions
	{
		[Binding]
		public class StepDefinitions
		{
			private readonly ScenarioContext _scenarioContext;
	        RestClient client;
			RestRequest request;
            IRestResponse response;
            IEnumerable<Place> places;

			public StepDefinitions(ScenarioContext scenarioContext)
			{
				_scenarioContext = scenarioContext;
			}
			
			[Given(@"the country code '(.*)' and zip code '(.*)'")]
			public void Giventhecountrycodeusandzipcode(string countryCode, string zipCode)
			{
				// _scenarioContext.Pending();
				client = new RestClient("http://api.zippopotam.us");
				request = new RestRequest($"{countryCode}/{zipCode}", Method.GET);
			}

			[When(@"I request the locations corresponding to these codes")]
			public void WhenIrequestthelocationscorrespondingtothesecodes()
			{
				response = client.Execute(request);
			}

			[Then(@"the response contains the place name '(.*)'")]
			public void Thentheresponsecontainstheplacename(string placeName)
			{
				LocationResponse locationResponse = new JsonDeserializer().Deserialize<LocationResponse>(response);
				List<string> listOfPlaceNames = new List<string>();
				foreach (Place place in locationResponse.Places)
				{
					listOfPlaceNames.Add(place.PlaceName);
				}
				listOfPlaceNames.Should().ContainEquivalentOf(placeName);
			}

			[Then(@"the response contains the state '(.*)'")]
			public void Thentheresponsecontainsthestate(string stateName)
			{
				LocationResponse locationResponse = new JsonDeserializer().Deserialize<LocationResponse>(response);
				List<string> listOfStateNames = new List<string>();
				foreach (Place place in locationResponse.Places)
				{
					listOfStateNames.Add(place.State);
				}
				listOfStateNames.Should().ContainEquivalentOf(stateName);
			}

			// [Then(@"the response contains the place name '(.*)' and state name '(.*)'")]
			// public void Thentheresponsecontainstheplacenameandstatename(string placeName, string stateName)
            // {
            //     this.Thentheresponsecontainstheplacename(placeName);
			// 	this.Thentheresponsecontainsthestatename(stateName);
			// }

			[Then(@"the response contains exactly '(.*)' location|s")]
			public void Thentheresponsecontainsexactlylocation(int numberOfLocations)
			{
				LocationResponse locationResponse = new JsonDeserializer().Deserialize<LocationResponse>(response);
				locationResponse.Places.Count.Should().Be(numberOfLocations);
			}

			[Then(@"the response has status code '(.*)'")]
			public void Thentheresponsehasstatuscode(int statusCode)
			{
				response.StatusCode.Should().Be(statusCode);
			}

		}
	}