



void updateDatabase(){
  String sql = "UPDATE users SET highscore = '"+ ball.highscore + "', all_available_points = '"+ all_available_points + "' WHERE username =" + user_id +";";
  db.execute(sql);
}
