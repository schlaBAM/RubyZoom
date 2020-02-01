# BeAGM

Be a GM (rubyzoom) is an NHL team stats organizer. You’re Jim Benning, General Manager of
 the Vancouver Canucks (whether you like it or not) and are able to check a couple things 
 related to the league and your team as of the end of January 2020.

##Installation

Clone / fork the repo, you will likely need to run `bundle install` for things to work properly.

##Usage

`cd` into the `rubyzoom` directory, and call `exe/rubyzoom command` to see the command in action. 

Calling `exe/rubyzoom` will prompt you with a greeting, and the current standings in the Western Conference.
 
If you'd like to see the available commands and their usage you can call `exe/rubyzoom help`.  

##Available commands:

####rubyzoom playoff_race
Prints playoff race for Western Conference. 
Usage: `rubyzoom playoff_race`

####rubyzoom player_stats
Prints player stats for team. Total points, highest scorer.
Usage: `rubyzoom player_stats`

####rubyzoom bad_players
Returns under-performing players (less than 10 points).
Usage: `rubyzoom bad_players`

####rubyzoom random_facts
Returns a collection of random facts. Surprise!
Usage: `rubyzoom random_facts`

####rubyzoom goalie_stats
Returns current stats for your goalie.
Usage: `rubyzoom goalie_stats`

####rubyzoom current_games
Makes a call to NHL's API to see if there are any hockey games currently being played.
Usage: `rubyzoom current_games`

-----