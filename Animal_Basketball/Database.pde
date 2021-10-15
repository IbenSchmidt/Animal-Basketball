



void updateDatabase(){
sql = "UPDATE login SET highscore = '"+ ball.highscore + "', allavailablepoints = '"+ all_available_points + "' WHERE username =" + username;";
db.execute(sql);
}
