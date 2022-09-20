from flask import Flask, render_template, request, url_for, redirect, session
from flask_mysqldb import MySQL

app = Flask(__name__)
app.debug = True
app.secret_key = 'BAD_SECRET_KEY'

#######################
## STUDENT: Fill in your AWS host, username, password, and database name in the quotes below.
#######################
app.config['MYSQL_HOST'] = 'mitchdb.cvaw3xverby5.us-east-1.rds.amazonaws.com'
app.config['MYSQL_USER'] = 'mbath'
app.config['MYSQL_PASSWORD'] = 'bathpass'
app.config['MYSQL_DB'] = 'bathpass'

mysql = MySQL(app)

@app.route('/', methods=['GET', 'POST'])
def selectUser():
    if request.method == 'POST':
        user_id = request.form.get('users')
        session['user_id'] = request.form.get('users')
        cur = mysql.connection.cursor()
        cur.execute("SELECT first_name, last_name FROM user WHERE user_id="+str(user_id))
        user = cur.fetchone()
        session['full_name'] = user[0] + ' ' + user[1]
        print(user_id)
        return redirect('/home')
    else:
        session.clear()
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM user")
        users = cur.fetchall()
        return render_template('selectUser.html', users=users)

@app.route('/posts', methods=['GET'])
def all_posts():
    #######################
    ## STUDENT: 
    ## Create a mysql cursor with the connection you opened on line 16
    ## Send all SQL queries needed to create this page to the database
    ## Save the results from your SQL query as a variable called posts
    ## Close your mysql cursor object.
    #######################

    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM posts")
    posts = cursor.fetchall()
    cursor.close()

    return render_template('posts.html', posts=posts)


@app.route('/home', methods=['POST','GET'])
def home():
    user_id = session['user_id']

    #######################
    ## STUDENT: 
    ## Create a mysql cursor with the connection you opened on line 16
    ## This page always displays the user's top 5 posts
    ## The user's ID is saved above as user_id
    ## Send a SQL query to the database that gets the top 5 posts for this user
    ## Save the results from your SQL query as a variable called user_top_posts
    ## Close your mysql cursor object.
    #######################

    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM posts WHERE user_id = "+str(user_id)+" ORDER BY posts DESC LIMIT 5")
    user_top_posts = cursor.fetchall()
    cursor.close()
        
    if request.method == 'POST':
        search_text = request.form['search_by_title']

        #######################
        ## STUDENT: 
        ## Create a mysql cursor with the connection you opened on line 16
        ## You only enter this block if the user has previously submitted a search
        ## The text of the search is saved above as search_text
        ## Send a SQL query to the database that gets all posts where the 
        ##    post title contains the search_text
        ## Save the results from your SQL query as a variable called search_posts
        ## Close your mysql cursor object.
        #######################

        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM posts WHERE title LIKE '%"+str(search_text)+"%'")
        search_posts = cursor.fetchall()
        cursor.close()

        return render_template('home.html', posts=user_top_posts, search_posts=search_posts)
    else:
        return render_template('home.html', posts=user_top_posts)

@app.route('/post/<postId>', methods=['POST', 'GET'])
def getPost(postId):
    user_id = session['user_id']

    #######################
    ## STUDENT: 
    ## Create a mysql cursor with the connection you opened on line 16
    ## The user ID and post ID are stored above as user_id and postId, respectively
    ## Send SQL queries to the database that: 
    ##    1. Get the information for the post with the current post ID; store the results as post
    ##    2. Get all comments for the post with the current post ID; store the results as comments
    ##    3. Get the current user's upvote/downvote for the current post ID; store the results as votes
    ## Close your mysql cursor object.
    #######################

    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM posts WHERE post_id = "+str(postId))
    posts = cursor.fetchall()
    cursor.close()

    cursor = mysql.connection.cursor()
    cursor.execute("SELECT comment_id FROM comments WHERE post_id = "+str(postId))
    comments = cursor.fetchall()
    cursor.close()

    cursor = mysql.connection.cursor()
    cursor.execute("SELECT COUNT(CASE WHEN type = 1 THEN 1 END) - COUNT(CASE WHEN type = 0 THEN 1 END) AS totalvote FROM votes WHERE post_id = "+str(postId))
    votes = cursor.fetchall()
    cursor.close()

    if request.method == 'POST':
        comment = request.form['comment']

        #######################
        ## STUDENT: 
        ## Create a mysql cursor with the connection you opened on line 16
        ## You only enter this block if the user has just submitted a new comment
        ## The text of the comment is saved above as comment
        ## The user ID and post ID are stored above as user_id and postId, respectively
        ## Send all SQL queries to the database needed to insert the new comment into the database
        ## Close your mysql cursor object.
        #######################

        cursor = mysql.connection.cursor()
        cursor.execute("INSERT INTO `blog`.`comments` (`user_id`, `post_id`, `comment`) VALUES ("+str(user_id)+","+str(postId)+","+str(comment)+");")
        cursor.close()

        return render_template('post.html', post=post, comments=comments, userVote = votes, current_userId = int(user_id)) 
    else:
        return render_template('post.html', post=post, comments=comments, userVote = votes, current_userId = int(user_id))

@app.route('/post/create', methods=['POST', 'GET'])
def createPost():
    if request.method == 'POST':
        title = request.form['title']
        content = request.form['content']
        user_id = session['user_id']

        #######################
        ## STUDENT: 
        ## Create a mysql cursor with the connection you opened on line 16
        ## You only enter this block if the user has just submitted a new post
        ## The title of the post is saved above as title
        ## The contents of the post are saved above as content
        ## The ID of the user who created the post is saved above as user_id
        ## Send all SQL queries to the database needed to insert the new post into the database
        ## Close your mysql cursor object.
        #######################

        cursor = mysql.connection.cursor()
        cursor.execute("INSERT INTO `blog`.`post` (`user_id`, `title`, `post_content`) VALUES ("+str(user_id)+","+str(title)+","+str(content)+");")
        cursor.close()

        return redirect('/posts')
    else:
        return render_template('createPost.html')

@app.route('/vote/<postId>', methods=['POST'])
def vote(postId):
    if request.method == 'POST':
        user_id = session['user_id']
        #type of vote_type is string
        vote_type = request.form['btn']

        #######################
        ## STUDENT: 
        ## Create a mysql cursor with the connection you opened on line 16
        ## You only enter this block if the user has just submitted a new vote
        ##    This new vote should overwrite the old vote, if it exists
        ## The vote is a 0 or 1 value, stored above in the variable vote_type
        ## The ID of the user who voted on the post is saved above as user_id
        ## The ID of the post the user voted on is saved above as postId
        ## Send all SQL queries to the database needed to remove the user's current vote for this post
        ## Send all SQL queries to the database needed to insert the user's new/updated vote into the database
        ## Close your mysql cursor object.
        #######################

        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM votes WHERE post_id = "+str(postId)+" AND user_id = "+str(user_id))
        votes = cursor.fetchall()
        cursor.close()
        if votes != None:
            cursor = mysql.connection.cursor()
            cursor.execute("INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ("+str(postId)+", "+str(user_id)+", "+str(vote_type)+");")
            cursor.close()
        else:
            cursor = mysql.connection.cursor()
            cursor.execute("DELETE FROM votes WHERE post_id = "+str(postId)+" AND user_id = "+str(user_id))
            cursor.execute("INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ("+str(postId)+", "+str(user_id)+", "+str(vote_type)+");")
            cursor.close()

        return redirect('/post/'+postId)

@app.route('/comment/delete/<commentId>/<postId>', methods=['POST'])
def deleteComment(commentId, postId):
    if request.method == 'POST':       
        #######################
        ## STUDENT: 
        ## Create a mysql cursor with the connection you opened on line 16
        ## You only enter this block if the user has just submitted request to delete a comment
        ## The ID of the comment to be deleted is saved above as commentId
        ## The ID of the post comment appears on is saved above as postId
        ## Send all SQL queries to the database needed to remove the comment from the database
        ## Close your mysql cursor object.
        ####################### 

        cursor = mysql.connection.cursor()
        cursor.execute("DELETE FROM comments WHERE post_id = "+str(postId)+" AND comment_id = "+str(commentId))
        cursor.close()

        return redirect('/post/'+postId)

@app.route('/post/delete/<postId>', methods=['POST'])
def deletePost(postId):
    if request.method == 'POST':  
        #######################
        ## STUDENT: 
        ## Create a mysql cursor with the connection you opened on line 16
        ## You only enter this block if the user has just submitted request to delete a post
        ## The ID of the post to be deleted is saved above as postId
        ## Send all SQL queries to the database needed to remove the post from the database
        ## HINT: There are foreign keys that depend on the POST entity - you need to take
        ##    these into account!
        ## Close your mysql cursor object.
        #######################       

        # note, votes and comments depend on posts.
        cursor = mysql.connection.cursor()
        cursor.execute("DELETE FROM comments WHERE post_id = "+str(postId))
        cursor.execute("DELETE FROM votes WHERE post_id = "+str(postId))
        cursor.execute("DELETE FROM posts WHERE post_id = "+str(postId))
        cursor.close()



        return redirect('/posts')

@app.route('/post/edit/<postId>', methods=['POST','GET'])
def editPost(postId):
    if request.method == 'POST':
        title = request.form['title']
        content = request.form['content']

        #######################
        ## STUDENT: 
        ## Create a mysql cursor with the connection you opened on line 16
        ## You only enter this block if the user has just submitted request to edit a post
        ## The ID of the post to be edited is saved above as postId
        ## The updated title of the post is saved above as title
        ## The updated contents of the post is saved above as content
        ## Send all SQL queries to the database needed to edit the post in the database
        ## Close your mysql cursor object.
        #######################       

        cursor = mysql.connection.cursor()
        cursor.execute("UPDATE posts SET title = "+str(title)+", content = "+str(content)+" WHERE post_id = "+str(postId))
        cursor.close()

        return redirect('/post/'+postId)
    else:
        #######################
        ## STUDENT: 
        ## Create a mysql cursor with the connection you opened on line 16
        ## This page is for viewing a post with the intention of editing it
        ## The post ID is stored above as postId
        ## Send a SQL query to the database to get all information for this post entry
        ## Store the results from your query as post
        ## Close your mysql cursor object.
        #######################

        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM posts WHERE post_id = "+str(postId))
        post = cursor.fetchall()
        cursor.close()

        return render_template('editPost.html', post=post)

if __name__ == '__main__':
    app.run()
