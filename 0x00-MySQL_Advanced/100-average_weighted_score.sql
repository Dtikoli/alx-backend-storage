-- creates a stored procedure ComputeAverageScoreForUser
-- that computes and store the average score for a student
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;
DELIMITER //

CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN user_id INT)
BEGIN
    DECLARE weight_average_score FLOAT;
    SET weight_average_score = (
	SELECT SUM(score * weight) / SUM(weight) FROM users
	JOIN corrections ON users.id = corrections.user_id
	JOIN projects On corrections.project_id = projects.id
        WHERE users.id = user_id
    );
    UPDATE users
    SET average_score = weight_average_score
    WHERE id = user_id;
END;
//

DELIMITER ;
