-- creates a stored procedure ComputeAverageWeightedScoreForUsers
-- that computes and stores the average weighted score for all students
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers;
DELIMITER //

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
  UPDATE users, 
    (SELECT users.id, SUM(score * weight) / SUM(weight) AS w_avg FROM users 
    JOIN corrections ON users.id = corrections.user_id 
    JOIN projects ON corrections.project_id = projects.id 
    GROUP BY users.id) AS users_avgs
  SET users.average_score = users_avgs.w_avg 
  WHERE users.id = users_avgs.id;
END;
//

DELIMITER ;
