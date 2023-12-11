# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

DROP TABLE IF EXISTS 23FA_users_cortezaa2.peopleroles;
DROP TABLE IF EXISTS 23FA_users_cortezaa2.peopleskills;
DROP TABLE IF EXISTS 23FA_users_cortezaa2.people;
DROP TABLE IF EXISTS 23FA_users_cortezaa2.roles;
DROP TABLE IF EXISTS 23FA_users_cortezaa2.skills;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE 23FA_users_cortezaa2.skills (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    description VARCHAR(4096),
    tag VARCHAR(255),
    url VARCHAR(255),
    time_commitment VARCHAR(255)
);




# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills ( skills_id, skills_name, skills_description, skills_tag ) values
 (1, 'fighting', 'I like to fight', 'Skill 1'),
 (2, 'skateboarding', 'I am a professional skater', 'Skill 2'),
 (3, 'sleeping', 'Not sure if this the same as being lazy', 'Skill 3'),
 (4, 'working out', 'It makes me feel better about myself and health', 'Skill 4'),
 (5, 'video games', 'My favorite game to play is magic the gathering', 'Skill 5'),
 (6, 'soccer', 'By far my pride and joy , soccer is life', 'Skill 6'),
 (7, 'coding', 'simple coding is fun , thinking kills', 'Skill 7'),
 (8, 'street racing ', 'This makes me feel edgy , i am the fast and furious', 'Skill 8'); 



# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE 23FA_users_cortezaa2.people (
    id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    linkedin_url VARCHAR(255),
    headshot_url VARCHAR(255),
    discord_handle VARCHAR(255),
    brief_bio VARCHAR(4096),
    date_joined DATE NOT NULL
);



# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO 23FA_users_cortezaa2.people (id, first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined) VALUES
(1, 'Kevin', 'Person 11', 'kevin@email.com', 'http://linkedin.com/in/kevin', 'http://headshot11.com/', 'kevinhandle', 'Bio of Kevin', '2023-01-11'),
(2, 'Linda', 'Person 12', 'linda@email.com', 'http://linkedin.com/in/linda', 'http://headshot12.com/', 'lindahandle', 'Bio of Linda', '2023-01-12'),
(3, 'Michael', 'Person 13', 'michael@email.com', 'http://linkedin.com/in/michael', 'http://headshot13.com/', 'michaelhandle', 'Bio of Michael', '2023-01-13'),
(4, 'Nora', 'Person 14', 'nora@email.com', 'http://linkedin.com/in/nora', 'http://headshot14.com/', 'norahandle', 'Bio of Nora', '2023-01-14'),
(5, 'Oliver', 'Person 15', 'oliver@email.com', 'http://linkedin.com/in/oliver', 'http://headshot15.com/', 'oliverhandle', 'Bio of Oliver', '2023-01-15'),
(6, 'Paula', 'Person 16', 'paula@email.com', 'http://linkedin.com/in/paula', 'http://headshot16.com/', 'paulahandle', 'Bio of Paula', '2023-01-16'),
(7, 'Quincy', 'Person 17', 'quincy@email.com', 'http://linkedin.com/in/quincy', 'http://headshot17.com/', 'quincyhandle', 'Bio of Quincy', '2023-01-17'),
(8, 'Rachel', 'Person 18', 'rachel@email.com', 'http://linkedin.com/in/rachel', 'http://headshot18.com/', 'rachelhandle', 'Bio of Rachel', '2023-01-18'),
(9, 'Steve', 'Person 19', 'steve@email.com', 'http://linkedin.com/in/steve', 'http://headshot19.com/', 'stevehandle', 'Bio of Steve', '2023-01-19'),
(10, 'Tina', 'Person 20', 'tina@email.com', 'http://linkedin.com/in/tina', 'http://headshot20.com/', 'tinahandle', 'Bio of Tina', '2023-01-20');

# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.
CREATE TABLE 23FA_users_cortezaa2.peopleskills (
    id INT AUTO_INCREMENT PRIMARY KEY,
    skills_id INT NOT NULL,
    people_id INT NOT NULL,
    date_acquired DATE NOT NULL,
    FOREIGN KEY (skills_id) REFERENCES skills(id),
    FOREIGN KEY (people_id) REFERENCES people(id)
);

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.
 INSERT INTO 23FA_users_cortezaa2.peopleskills (skills_id, people_id, date_acquired) VALUES
(1, 1, '2023-02-01'), -- Person 1 has skill 1
(3, 1, '2023-02-15'), -- Person 1 has skill 3
(6, 1, '2023-03-01'), -- Person 1 has skill 6
(3, 2, '2023-02-20'), -- Person 2 has skill 3
(4, 2, '2023-03-05'), -- Person 2 has skill 4
(5, 2, '2023-03-10'), -- Person 2 has skill 5
(1, 3, '2023-02-25'), -- Person 3 has skill 1
(5, 3, '2023-03-15'), -- Person 3 has skill 5
(3, 5, '2023-04-01'), -- Person 5 has skill 3
(6, 5, '2023-04-10'), -- Person 5 has skill 6
(2, 6, '2023-04-15'), -- Person 6 has skill 2
(3, 6, '2023-04-20'), -- Person 6 has skill 3
(4, 6, '2023-05-01'), -- Person 6 has skill 4
(3, 7, '2023-05-10'), -- Person 7 has skill 3
(5, 7, '2023-05-15'), -- Person 7 has skill 5
(6, 7, '2023-05-20'), -- Person 7 has skill 6
(1, 8, '2023-06-01'), -- Person 8 has skill 1
(3, 8, '2023-06-05'), -- Person 8 has skill 3
(5, 8, '2023-06-10'), -- Person 8 has skill 5
(6, 8, '2023-06-15'), -- Person 8 has skill 6
(2, 9, '2023-06-20'), -- Person 9 has skill 2
(5, 9, '2023-07-01'), -- Person 9 has skill 5
(6, 9, '2023-07-05'), -- Person 9 has skill 6
(1, 10, '2023-07-10'), -- Person 10 has skill 1
(4, 10, '2023-07-15'), -- Person 10 has skill 4
(5, 10, '2023-07-20'); -- Person 10 has skill 5

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles
CREATE TABLE 23FA_users_cortezaa2.roles (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    sort_priority INT
);


# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)
INSERT INTO 23FA_users_cortezaa2.roles (id, name, sort_priority) VALUES
(1, 'Designer', 10),
(2, 'Developer', 20),
(3, 'Recruit', 30),
(4, 'Team Lead', 40),
(5, 'Boss', 50),
(6, 'Mentor', 60);


# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment
CREATE TABLE 23FA_users_cortezaa2.peopleroles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    people_id INT NOT NULL,
    role_id INT NOT NULL,
    date_role_acquired DATE NOT NULL,
    FOREIGN KEY (people_id) REFERENCES people(id),
    FOREIGN KEY (role_id) REFERENCES roles(id)
);


# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer
INSERT INTO 23FA_users_cortezaa2.peopleroles (people_id, role_id, date_role_acquired) VALUES
(1, 2, '2023-01-01'), -- Person 1 is a Developer
(2, 5, '2023-01-05'), -- Person 2 is a Boss
(2, 6, '2023-01-10'), -- Person 2 is also a Mentor
(3, 2, '2023-01-15'), -- Person 3 is a Developer
(3, 4, '2023-01-20'), -- Person 3 is also a Team Lead
(4, 3, '2023-01-25'), -- Person 4 is a Recruit
(5, 3, '2023-02-01'), -- Person 5 is a Recruit
(6, 2, '2023-02-05'), -- Person 6 is a Developer
(6, 1, '2023-02-10'), -- Person 6 is also a Designer
(7, 1, '2023-02-15'), -- Person 7 is a Designer
(8, 1, '2023-02-20'), -- Person 8 is a Designer
(8, 4, '2023-02-25'), -- Person 8 is also a Team Lead
(9, 2, '2023-03-01'), -- Person 9 is a Developer
(10, 2, '2023-03-05'), -- Person 10 is a Developer
(10, 1, '2023-03-10'); -- Person 10 is also a Designer
