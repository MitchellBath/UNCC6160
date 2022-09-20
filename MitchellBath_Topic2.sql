/* Problem 1: List all comments by user with ID 678, in chronological order of comment creation with most recent on top. Your results should display the post title, the comment text, and the date the comment was created. */

SELECT POST.title, COMMENT.contents, COMMENT.create_date FROM COMMENT WHERE userID = 678 INNER JOIN POST ON POST.userID=COMMENT.userID ORDER BY COMMENT.create_date DESC;

/* Problem 2:  Compute the total number of upvotes and downvotes for each post. Your results should display the post title, the name of the user who wrote the post, and the number of upvotes and downvotes. */

SELECT POST.title, USER.name, COUNT(CASE WHEN VOTE.type=True THEN 1 ELSE 0 END), COUNT(CASE WHEN VOTE.type=False THEN 1 ELSE 0 END) FROM VOTE INNER JOIN POST ON Post.postID=VOTE.postID INNER JOIN USER ON USER.userID=POST.userID;

/* Problem 3: Show the title of all posts created in March 2022. */

SELECT POST.title FROM POST WHERE POST.create_date >= '2022-03-01' AND POST.create_date <= '2022-03-31';

/* Problem 4: Show the name of all users who created a post in March 2022. */

SELECT USER.name FROM POST WHERE POST.create_date >= '2022-03-01' AND POST.create_date <= '2022-03-31' INNER JOIN USER ON POST.userID=USER.userID;

/* Problem 5: Show the name of all users, along with the number of posts each user created in 2022. */

SELECT USER.name, COUNT(POST.postID) FROM USER, POST WHERE POST.create_date >= '2022-01-01' AND POST.create_date <= '2022-12-31' AND POST.userID=USER.userID;