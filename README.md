# Project 2 - *Yelp*

**Yelp** is a Yelp search app using the [Yelp API](http://www.yelp.com/developers/documentation/v2/search_api).

Time spent: **20** hours spent in total

## User Stories

The following **required** functionality is completed:

- [X] Search results page
   - [X] Table rows should be dynamic height according to the content height.
   - [X] Custom cells should have the proper Auto Layout constraints.
   - [X] Search bar should be in the navigation bar (doesn't have to expand to show location like the real Yelp app does).
- [X] Filter page. Unfortunately, not all the filters are supported in the Yelp API.
   - [X] The filters you should actually have are: category, sort (best match, distance, highest rated), distance, deals (on/off).
   - [X] The filters table should be organized into sections as in the mock.
   - [X] You can use the default UISwitch for on/off states.
   - [X] Clicking on the "Search" button should dismiss the filters page and trigger the search w/ the new filter settings.
   - [X] Display some of the available Yelp categories (choose any 3-4 that you want).

The following **optional** features are implemented:

- [ ] Search results page
   - [ ] Infinite scroll for restaurant results.
   - [ ] Implement map view of restaurant results.
- [ ] Filter page
   - [ ] Implement a custom switch instead of the default UISwitch.
   - [ ] Distance filter should expand as in the real Yelp app
   - [ ] Categories should show a subset of the full list with a "See All" row to expand. Category list is [here](http://www.yelp.com/developers/documentation/category_list).
- [X] Implement the restaurant detail page.

The following **additional** features are implemented:

- [X] Modification in the original layout

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. how to put the spinner to give a user feed back
2. use of delegate or oder methods of pass data between different views

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='Walkthrough2.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />
GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

* i tried to implement "drop down"-ish field in the filter screen in order to display the options in the diferent filters but i run into several issue wiht the layout that i couldn't solve
* Pass data between the views using delegates is not completly clear yet
* i still find messy the way i display my code, then find a specific block of code is still consuming time.

## License

    Copyright [2016] [Victor Fernandez]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
