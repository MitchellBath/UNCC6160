// Mitchell Bath Topic 3 Query

// Problem 1: For a specific policy holder, list all policy IDs and their respective effective and expiration dates.
SELECT policyholderID, policyeffectivedate, policyexpirationdate FROM POLICY_COVERAGES WHERE policyholderID = policyholderID;

// Problem 2: For a specific policy holder, list all policy IDs, arranged by expiration date from newest to oldest.
// Not possible due to where clause needed on non-primary key column (expiration date)

// Problem 3: For a specific policy holder, list the coverage type and amount for all expenses.
SELECT policyholderID, coverage type, expensive amount FROM POLICYHOLDER_PAYOUT WHERE policyholderID = policyholderID;

// Problem 4: For a specific policy holder, list the coverage type and amount for all expenses associated with claims that have a status of 'Open'.
SELECT policyholderID, claim status, coverage type, expense amount FROM POLICYHOLDER_PAYOUT WHERE policyholderID = policyholderID AND claim status = 'Open';

// Problem 5: For a specific policy holder, give the total (sum) of all expenses.
SELECT policyholderID, SUM(expense amount) FROM POLICYHOLDER_PAYOUT WHERE policyholderID = policyholderID;

// Problem 6: For a specific policy holder, give the total (sum) of all expenses that have a disbursement date (not null).
// Not possible to query on null because you can only query on primary key columns which cannot be null

// Problem 7: For a specific policy, give the total (sum) of all coverages with a type of 'Personal property'.
// Not possible due to where clause needed on non-primary key column (coverage type)

// Problem 8: For a specific policy, give the total (sum) of all expenses.
SELECT policyID, sum(expense amount) FROM POLICYHOLDER_PAYOUT WHERE policyID = policyID;

// Problem 9: Show the policy ID for all policies with an effective date after January 1, 2022.
// Not possible due to where clause needed on non-primary key column (policyeffectivedate)

// Problem 10: Show the ID for any policy that has a claim with a status of 'Open'.  Also include the policy holder information of first and last name, email address, and phone number.
SELECT policyID, claim status, policyholder_firstname, policyholder_lastname, policyholder_email, policyholder_phone FROM POLICYHOLDER_PAYOUT WHERE claim status = 'Open';