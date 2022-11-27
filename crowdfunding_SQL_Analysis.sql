-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for 
-- the "live" campaigns. 
SELECT * FROM campaign

SELECT cf_id,
    backers_count,
    outcome
	INTO backer_counts
FROM campaign
WHERE outcome = 'live'
ORDER BY backers_count DESC
;

SELECT * FROM backer_counts


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT c.cf_id as "campaign id",
    c.backers_count "campaign # of backers",
    COUNT(b.backer_id) as "# of backers "
FROM campaign as c
INNER JOIN backers as b 
on c.cf_id = b.cf_id
WHERE c.outcome = 'live'
GROUP BY c.cf_id
ORDER BY backers_count DESC;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
-- CREATE TABLE email_contacts_remaining_goal_amount
Select co.first_name "First Name", 
		co.last_name "Last Name", 
		co.email"Email", 
		ca.goal - ca.pledged "Remaining Goal Amount"
INTO email_contacts_remaining_goal_amount
from contacts as co
inner join campaign as ca on
co.contact_id = ca.contact_id
WHERE ca.outcome = 'live'
order by "Remaining Goal Amount" DESC
-- Check the table
Select * from email_contacts_remaining_goal_amount


-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 

Select b.email"Email",
		b.first_name "First Name", 
		b.last_name "Last Name", 
		b.cf_id,
		ca.company_name,
		ca.description,
		ca.end_date,
		ca.goal - ca.pledged "Left of Goal"
INTO email_backers_remaining_goal_amount
from backers as b
inner join campaign as ca on
b.cf_id = ca.cf_id
order by b.last_name, b.email	


-- Check the table
SELECT * FROM email_backers_remaining_goal_amount

