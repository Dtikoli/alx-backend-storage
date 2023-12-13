-- script that lists all bands with Glam rock as their main style, ranked by their longevity
-- Alt to COALESCE() is IFNULL(). Takes only two args: an expression and the default value
SELECT band_name,
          (COALESCE(split, 2022) - formed) AS lifespan
	FROM metal_bands
	WHERE style like '%Glam rock%';
