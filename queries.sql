-- Q1

SELECT COUNT(experiences."endDate") AS "currentExperiences" 
FROM experiences;


-- Q2

SELECT educations."userId" AS id, COUNT(*) AS educations
FROM educations
GROUP BY educations."userId"
ORDER BY educations DESC;


-- Q3

SELECT users.name AS writer, COUNT(*) AS "testimonialCount"
FROM testimonials
JOIN users
ON users.id = testimonials."writerId"
WHERE users.id = 435
GROUP BY users.name
ORDER BY "testimonialCount" DESC;


-- Q4

SELECT MAX(jobs.salary) AS "maximumSalary", roles.name AS role
FROM jobs
JOIN roles
ON roles.id = jobs."roleId"
WHERE active
GROUP BY roles.name
ORDER BY "maximumSalary";


-- Bonus question

SELECT schools.name AS school, courses.name AS course,
COUNT(educations."userId") AS "studentCount", educations.status AS role
FROM educations
JOIN schools
ON schools.id = educations."schoolId"
JOIN courses
ON courses.id = educations."courseId"
WHERE educations.status = 'ongoing' OR educations.status = 'finished'
GROUP BY school, course, status
ORDER BY "studentCount" DESC
LIMIT 3;

