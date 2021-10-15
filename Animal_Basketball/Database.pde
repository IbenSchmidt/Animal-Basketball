



void updateDatabase(){
  String sql = "UPDATE login SET highscore = '"+ ball.highscore + "', allavailablepoints = '"+ all_available_points + "' WHERE username =" + user_id +";";
  db.execute(sql);
}
