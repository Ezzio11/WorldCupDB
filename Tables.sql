CREATE TABLE `Referee_appearances` (
  `key_id ` <type>,
  `tournament_name` <type>,
  `match_id` <type>,
  `match_name` <type>,
  `stage_name` <type>,
  `group_name` <type>,
  `refree_id` <type>,
  `given_name` <type>,
  `family_name` <type>,
  `country_name` <type>,
  PRIMARY KEY (`key_id `)
);

CREATE TABLE `Matches` (
  `match_id` <type>,
  `match_name` <type>,
  `group_name` <type>,
  `group_stage` <type>,
  `match_date` <type>,
  `stadium_name` <type>,
  `home_team_name` <type>,
  `home_team_code` <type>,
  `away_team_name` <type>,
  `away_team_code` <type>,
  `key-id ` <type>,
  PRIMARY KEY (`match_id`),
  FOREIGN KEY (`key-id `) REFERENCES `Referee_appearances`(`key_id `)
);

CREATE TABLE `Goals` (
  `goal_id` <type>,
  `player_id` <type>,
  `team_id` <type>,
  `tournament_name` <type>,
  `match_id` <type>,
  PRIMARY KEY (`goal_id`),
  FOREIGN KEY (`match_id`) REFERENCES `Matches`(`match_id`)
);

CREATE TABLE `Subistitutions` (
  `SUB_ID` <type>,
  `match_id` <type>,
  `match_name` <type>,
  `stage_name` <type>,
  `group_name` <type>,
  `given_name` <type>,
  `family_name` <type>,
  PRIMARY KEY (`SUB_ID`),
  FOREIGN KEY (`match_id`) REFERENCES `Matches`(`match_id`)
);

CREATE TABLE `Group_standings` (
  `key_id` <type>,
  `stage_number` <type>,
  `stage_name` <type>,
  `group_name` <type>,
  `position` <type>,
  `played` <type>,
  `wins` <type>,
  `loses` <type>,
  `draws` <type>,
  `goals` <type>,
  `points` <type>,
  PRIMARY KEY (`key_id`)
);

CREATE TABLE `squads` (
  `squad_ID` <type>,
  `player_id` <type>,
  `team_name` <type>,
  `team_code` <type>,
  `family_name` <type>,
  `given_name` <type>,
  `tournament_name` <type>,
  `AW_ID` <type>,
  `key_id` <type>,
  PRIMARY KEY (`squad_ID`),
  FOREIGN KEY (`key_id`) REFERENCES `Group_standings`(`key_id`)
);

CREATE TABLE `players` (
  `p_id` <type>,
  `given_name` <type>,
  `family_name` <type>,
  `team_name` <type>,
  `team_code` <type>,
  `shirt_number` <type>,
  `position_name` <type>,
  `position_code` <type>,
  `starter` <type>,
  `subititute` <type>,
  `match_id` <type>,
  `squad_id` <type>,
  PRIMARY KEY (`p_id`),
  FOREIGN KEY (`squad_id`) REFERENCES `squads`(`squad_ID`)
);

CREATE TABLE `plays` (
  `p_id` <type>,
  `match_id` <type>,
  FOREIGN KEY (`p_id`) REFERENCES `players`(`p_id`),
  FOREIGN KEY (`match_id`) REFERENCES `Matches`(`match_id`)
);

CREATE TABLE `penalty_kicks` (
  `penalty_Kick_id` <type>,
  `tournament_name` <type>,
  `match_name` <type>,
  `team_name` <type>,
  `home_team` <type>,
  `away_team` <type>,
  `given_name` <type>,
  `family_name` <type>,
  `match_id` <type>,
  PRIMARY KEY (`penalty_Kick_id`),
  FOREIGN KEY (`match_id`) REFERENCES `Matches`(`match_id`)
);

CREATE TABLE `Bookings ` (
  `booking_id` <type>,
  `match_name` <type>,
  `match_date` <type>,
  `team_name` <type>,
  `home_team` <type>,
  `away_team` <type>,
  `given_name` <type>,
  `family_name` <type>,
  `yellow_card` <type>,
  `red_card` <type>,
  `second_yellow_card` <type>,
  `match_id` <type>,
  `p_id` <type>,
  PRIMARY KEY (`booking_id`),
  FOREIGN KEY (`match_id`) REFERENCES `Matches`(`match_id`),
  FOREIGN KEY (`p_id`) REFERENCES `players`(`p_id`)
);

CREATE TABLE `Manager_appearances` (
  `key_id` <type>,
  `team_name` <type>,
  `team_code` <type>,
  `match_name` <type>,
  `stage-name` <type>,
  `group_name` <type>,
  `family_name` <type>,
  `given_name` <type>,
  `country_name` <type>,
  `match_id` <type>,
  PRIMARY KEY (`key_id`)
);

CREATE TABLE `Award_winners` (
  `AW_ID` <type>,
  `tournament_name` <type>,
  `award_id` <type>,
  `award_name` <type>,
  `player_id` <type>,
  `family_name` <type>,
  `given_name` <type>,
  `team_name` <type>,
  `team_code` <type>,
  PRIMARY KEY (`AW_ID`),
  KEY `Key` (`tournament_name`, `award_id`, `award_name`, `player_id`, `family_name`, `given_name`, `team_name`, `team_code`)
);

CREATE TABLE `award` (
  `p_id` <type>,
  `AW_ID` <type>,
  FOREIGN KEY (`AW_ID`) REFERENCES `Award_winners`(`AW_ID`),
  FOREIGN KEY (`p_id`) REFERENCES `players`(`p_id`)
);

CREATE TABLE `wins ` (
  `AW_ID` <type>,
  `squad_ID` <type>,
  FOREIGN KEY (`squad_ID`) REFERENCES `squads`(`squad_ID`),
  FOREIGN KEY (`AW_ID`) REFERENCES `Award_winners`(`AW_ID`)
);

CREATE TABLE `manage` (
  `key_id` <type>,
  `match_id` <type>,
  FOREIGN KEY (`match_id`) REFERENCES `Matches`(`match_id`),
  FOREIGN KEY (`key_id`) REFERENCES `Manager_appearances`(`key_id`)
);

