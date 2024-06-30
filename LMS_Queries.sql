show databases;
use lms;

-- find all candidate having java technology -- 
SELECT Hired_Candidate.*,tech_stack.Tech_Name FROM Hired_Candidate 
LEFT JOIN Tech_Stack 
ON Hired_Candidate.Creator_User = tech_stack.Creator_User
WHERE tech_stack.Tech_Name = "java";

-- find all mentors and ideations have java technology --
SELECT mentor.Name,mentor.Mentor_Type,tech_stack.Tech_Name FROM mentor
LEFT JOIN tech_stack
ON mentor.Creator_User = tech_stack.Creator_User
WHERE tech_stack.Tech_Name = "Java"; 

-- find name of candidate which did not assign technology --
SELECT hired_candidate.First_Name,hired_candidate.Last_Name,tech_stack.Tech_Name FROM hired_candidate
LEFT JOIN tech_stack
ON hired_candidate.Creator_User = tech_stack.Creator_User
WHERE tech_stack.Tech_Name = " ";

-- find name of candidate which is not submit documents -- 
SELECT hired_candidate.First_Name,hired_candidate.Last_Name,candidate_documents.Status FROM hired_candidate
LEFT JOIN candidate_documents
ON hired_candidate.Creator_User = candidate_documents.Creator_User
WHERE candidate_documents.Status = "Pending";

-- find name of candidate which is not submit bank details -- 
SELECT hired_candidate.First_Name,hired_candidate.Last_Name,candidate_bank_details.Candidate_Id FROM hired_candidate
LEFT JOIN candidate_bank_details
ON hired_candidate.Creator_User = candidate_bank_details.Creator_User
WHERE candidate_bank_details.Account_Number = " " And candidate_bank_details.Ifsc_Code = " ";

-- find name of candidates which is joined in dec month -- 
SELECT fellowship_candidate.First_Name,fellowship_candidate.Middle_Name,fellowship_candidate.Last_Name FROM fellowship_candidate
WHERE MONTH(fellowship_candidate.Hired_Date) = 12;

-- find name of candidates which is end of couse in feb -- 
SELECT fellowship_candidate.First_Name,fellowship_candidate.Middle_Name,fellowship_candidate.Last_Name FROM fellowship_candidate
WHERE MONTH(DATE_ADD(fellowship_candidate.Hired_Date,INTERVAL 3 MONTH))=2;

-- find name of candidates which is ending date accounding to joining date if joining date is 22-02-2019 -- 
SELECT fellowship_candidate.First_Name,fellowship_candidate.Middle_Name,fellowship_candidate.Last_Name,fellowship_candidate.Hired_Date FROM fellowship_candidate
WHERE MONTH(DATE_ADD(fellowship_candidate.Hired_Date,INTERVAL 3 MONTH)) = '2019-02-22';

-- find all candidates which is passed out in 2019 year -- 
SELECT fellowship_candidate.First_Name,fellowship_candidate.Middle_Name,fellowship_candidate.Last_Name,Candidate_Qualification.Passing_Year FROM fellowship_candidate
LEFT JOIN candidate_qualification
ON fellowship_candidate.Creator_User = candidate_qualification.Creator_User
WHERE candidate_qualification.Passing_Year = 2019;

-- which technology assign to which candidates which is having MCA background -- 
SELECT hired_candidate.First_Name,hired_candidate.Middle_Name,hired_candidate.Last_Name,hired_candidate.Degree,tech_stack.Tech_Name FROM hired_candidate
LEFT JOIN tech_stack
ON hired_candidate.Creator_User = tech_stack.Creator_User
WHERE hired_candidate.Degree = "MCA";

-- how many candiates which is having last month -- 
SELECT COUNT(fellowship_candidate.First_Name) AS Last_Month_Count
FROM fellowship_candidate
WHERE DATE_ADD(fellowship_candidate.Hired_Date, INTERVAL 3 MONTH) 
BETWEEN '2024-05-01' AND '2024-06-30';

-- how many week candidate completed in the bridgelabz since joining date candidate id is 2 -- 
SELECT fellowship_candidate.First_Name,fellowship_candidate.Last_Name,fellowship_candidate.Hired_Date,FLOOR(DATEDIFF(CURDATE(),fellowship_candidate.Hired_Date)/7) AS Completed_Weeks 
FROM fellowship_candidate WHERE fellowship_candidate.Id = 1002;

-- find joining date of candidate if candidate id is 4 -- 
SELECT fellowship_candidate.First_Name,fellowship_candidate.Last_Name,fellowship_candidate.Hired_Date FROM fellowship_candidate
WHERE fellowship_candidate.Id = 1004; 

-- how many week remaining of candidate in the bridglabz from today if candidate id is 5 -- 
SELECT fellowship_candidate.First_Name,fellowship_candidate.Last_Name,FLOOR(DATEDIFF(CURDATE(),DATE_ADD(fellowship_candidate.Hired_Date,INTERVAL 3 MONTH)/7)) AS Remaining_Weeks
FROM fellowship_candidate WHERE fellowship_candidate.Id = 1005;

-- how many days remaining of candidate in the bridgelabz from today if candidate is is 6 -- 
SELECT fellowship_candidate.First_Name,fellowship_candidate.Last_Name,DATEDIFF(DATE_ADD(fellowship_candidate.Hired_Date,INTERVAL 3 MONTH),CURDATE()) AS Remaining_Days
FROM fellowship_candidate WHERE fellowship_candidate.Id = 1006;

-- find candidates which is deployed -- 
SELECT fellowship_candidate.First_Name,fellowship_candidate.Last_Name FROM fellowship_candidate
JOIN company_requirement ON fellowship_candidate.Creator_User = company_requirement.Creator_User
JOIN candidate_stack_assignment ON fellowship_candidate.Creator_User = candidate_stack_assignment.Creator_User
WHERE candidate_stack_assignment.Complete_Date > company_requirement.Requested_Month;

-- find name and other details and name of company which is assign to condidate -- 
SELECT fellowship_candidate.First_Name,fellowship_candidate.Last_Name,company.* FROM fellowship_candidate
JOIN company ON fellowship_candidate.Creator_User = company.Creator_User;

-- find all condidate and mentors which is related to lab= banglore/mumbai/pune -- 
SELECT fellowship_candidate.First_Name,fellowship_candidate.Last_Name,mentor.Name,lab.Location FROM fellowship_candidate
JOIN mentor ON fellowship_candidate.Creator_User = mentor.Creator_User
JOIN lab ON fellowship_candidate.Creator_User = lab.Creator_User
WHERE lab.Location IN ("Mumbai","Pune","Bengalore");

-- find buddy mentors and ideation mentor and which technology assign to perticular candidate if candidate id is 6 --
SELECT fellowship_candidate.First_Name,mentor.Name,mentor.Mentor_Type,tech_stack.Tech_Name FROM fellowship_candidate
JOIN mentor ON fellowship_candidate.Creator_User = mentor.Creator_User
JOIN tech_stack ON fellowship_candidate.Creator_User = tech_stack.Creator_User
WHERE fellowship_candidate.Id = 1006; 
