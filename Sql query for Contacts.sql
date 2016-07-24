SELECT 
    contact.display_name AS 'Name',
    contact.organization_name AS 'Organization',
    count(*) AS 'N of Cases'
FROM
    civicrm_contact AS contact
        INNER JOIN
    civicrm_case_contact AS caseContact ON contact.id = caseContact.contact_id
		INNER JOIN
	civicrm_case AS civicrmCase ON caseContact.case_id = civicrmCase.id
WHERE
    contact.contact_type = 'Individual' and civicrmCase.status_id = 1 # Case status 1 is "Ongoing"
    Group by contact.display_name, contact.organization_name;


