-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT cf_id, backers_count
FROM campaign
WHERE outcome = 'live'
ORDER BY backers_count desc;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT COUNT (backer_id), cf_id 
FROM backers 
WHERE cf_id = '65' or cf_id = '1911' or cf_id = '2488'  
GROUP BY cf_id;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT contacts.first_name,
		contacts.last_name,
		contacts.email,
		campaign.goal - campaign.pledged as Remaining_Goal_Amount
INTO email_contacts_remaining_goal_amount
FROM campaign
INNER JOIN contacts
ON contacts.contact_id = campaign.contact_id
WHERE outcome = 'live'
ORDER BY Remaining_Goal_Amount desc;

-- Check the table
SELECT * FROM email_contacts_remaining_goal_amount LIMIT 10

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT backers.email,
		backers.first_name,
		backers.last_name,
		campaign.cf_id,
		campaign.company_name,
		campaign.description,
		campaign.goal - campaign.pledged as "Left of Goal"
INTO email_backers_remaining_goal_amount
FROM campaign
INNER JOIN backers
ON campaign.cf_id = backers.cf_id
ORDER BY backers.last_name;


-- Check the table

SELECT * FROM email_backers_remaining_goal_amount LIMIT 10

