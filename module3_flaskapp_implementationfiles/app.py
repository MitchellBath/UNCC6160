import uuid
from flask import Flask, render_template, request, url_for, redirect, session
from cassandra.cluster import Cluster
import datetime

app = Flask(__name__)

app.debug = True

app.secret_key = 'BAD_SECRET_KEY'

clstr=Cluster(["127.0.0.1","127.0.0.2"])
cassandra_session=clstr.connect('blog')

@app.route('/', methods=['GET', 'POST'])
def selectUser():
    if request.method == 'POST':
        user_id = request.form.get('users')
        session['user_id'] = request.form.get('users')
        selected_user = cassandra_session.execute("SELECT user_name FROM user_profile WHERE user_id="+str(user_id))
        session['full_name'] = selected_user[0]
        return redirect('/home')
    else:
        session.clear()
        users = cassandra_session.execute("SELECT * FROM user_profile")
        return render_template('selectUser.html', users=users)

@app.route('/home', methods=['POST','GET'])
def home():
    user_id = session['user_id']

    #######################
    ## STUDENT: 
    ## This page always displays the user's top 5 posts
    ## The user's ID is saved above as user_id
    ## Send a CQL query to the database that gets the top 5 posts for this user
    ## Save the results from your CQL query as a variable called post_top_five
    #######################
    post_top_five = cassandra_session.execute("SELECT * FROM post_top_five WHERE user_id = "+str(user_id)+" ORDER BY post_id DESC LIMIT 5")

    if request.method == 'POST':
        search_text = request.form['search_by_title']
        
        #######################
        ## STUDENT: 
        ## You only enter this block if the user has previously submitted a search
        ## The text of the search is saved above as search_text
        ## Send a CQL query to the database that gets all posts where the 
        ##    post title contains the search_text
        ## Save the results from your CQL query as a variable called search_post
        #######################
        search_post = cassandra_session.execute("SELECT * FROM post_search WHERE search_text = "+str(search_text))


        return render_template('home.html', posts=post_top_five, search_posts=search_post)
    else:
        return render_template('home.html', posts=post_top_five)

@app.route('/posts', methods=['GET'])
def all_posts():
    #######################
    ## STUDENT: 
    ## Send all CQL queries needed to create this page to the database
    ## Save the results from your CQL query as a variable called posts
    #######################
    posts = cassandra_session.execute("SELECT * FROM post_search")

    return render_template('posts.html', posts=posts)

@app.route('/post/create', methods=['POST', 'GET'])
def createPost():
    if request.method == 'POST':
        title = request.form['title']
        content = request.form['content']
        user_id = uuid.UUID(session['user_id'])
        user_name = str(session['full_name'])
        post_id = uuid.uuid1()

        #######################
        ## STUDENT: 
        ## You only enter this block if the user has just submitted a new post
        ## The title of the post is saved above as title
        ## The contents of the post are saved above as content
        ## The ID of the user who created the post is saved above as user_id
        ## The name of the user who created the post is saved above as user_name
        ## A new ID for the new post has been created and saved above as post_id
        ## Send all CQL queries to the database needed to insert the new post into the database
        #######################
        cassandra_session.execute("INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES("+str(post_id)+","+str(user_id)+",'"+str(title)+"', toTimeStamp(now()) )")
        cassandra_session.execute("INSERT INTO post_search ( post_title, post_id ) VALUES('"+str(title)+"', "+str(post_id)+")")
        cassandra_session.execute("INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES("+str(post_id)+","+str(user_id)+",'"+str(title)+"', '"+str(content)+"',toTimeStamp(now()) )")


        return redirect('/posts')
    else:
        return render_template('createPost.html')

@app.route('/post/<postId>', methods=['GET'])
def getPost(postId):
    user_id = uuid.UUID(session['user_id'])

    if request.method == 'GET':
        #this gets object in post[0] hence in template used post[0]. values

        #######################
        ## STUDENT: 
        ## The user ID and post ID are stored above as user_id and postId, respectively
        ## Send CQL queries to the database that: 
        ##    1. Get the information for the post with the current post ID; store the results as post
        ##    2. Get all comments for the post with the current post ID; store the results as comments
        ##    3. Get the current user's upvote/downvote for the current post ID; store the results as votes
        #######################
        post = cassandra_session.execute("SELECT * FROM post_search WHERE post_id = "+str(postId))
        comments = cassandra_session.execute("SELECT * FROM comment_by_post WHERE post_id = "+str(postId))
        votes = cassandra_session.execute("SELECT * FROM vote WHERE post_id = "+str(postId))

        return render_template('post.html', post=post[0], comments=comments, userVote = votes, current_userId = user_id, postid = postId)

@app.route('/comment/create/<postId>', methods = ['POST'])
def create_comment(postId):
    if request.method =='POST':
        comment = request.form['comment']
        user_id = uuid.UUID(session['user_id'])

        #######################
        ## STUDENT: 
        ## The text of the comment is saved above as comment
        ## The user ID and post ID are stored above as user_id and postId, respectively
        ## Send all CQL queries to the database needed to insert the new comment into the database
        #######################
        cassandra_session.execute("INSERT INTO comment_by_post ( post_id, user_id, comment_contents ) VALUES("+str(postId)+","+str(user_id)+",'"+str(comment)+"' )")

        return redirect('/post/'+postId)

@app.route('/comment/delete/<commentId>/<postId>', methods = ['POST'])
def delete_comment(commentId, postId):
    if request.method =='POST':
        #######################
        ## STUDENT: 
        ## The ID of the comment to be deleted is saved above as commentId
        ## The ID of the post comment appears on is saved above as postId
        ## Send all CQL queries to the database needed to remove the comment from the database
        ####################### 
        cassandra_session.execute("DELETE * FROM comment_by_post WHERE post_id = "+str(postId)+" AND comment_id = "+str(commentId))
        
        return redirect('/post/'+postId)


@app.route('/vote/<postId>', methods=['POST'])
def vote(postId):
    if request.method == 'POST':
        user_id = session['user_id']
        # Be careful! vote_type is string '0' or '1' right now, 
        # but you need to insert into database as boolean
        vote_type = request.form['btn']

        #######################
        ## STUDENT: 
        ## You only enter this block if the user has just submitted a new vote
        ##    This new vote should overwrite the old vote, if it exists
        ## The vote is stored above in the variable vote_type
        ## The ID of the user who voted on the post is saved above as user_id
        ## The ID of the post the user voted on is saved above as postId
        ## Send all CQL queries to the database needed to remove the user's current vote for this post
        ## Send all CQL queries to the database needed to insert the user's new/updated vote into the database
        #######################
        oldvote = cassandra_session.execute("SELECT * FROM vote WHERE post_id = "+str(postId)+" AND user_id = "+str(user_id))
        if oldvote != None:
            cassandra_session.execute("INSERT INTO vote ( post_id, user_id, vote_type ) VALUES("+str(postId)+","+str(user_id)+", "+str(vote_type)+" )")
        else:
            cassandra_session.execute("DELETE * FROM vote WHERE post_id = "+str(postId)+" AND user_id = "+str(user_id))
            cassandra_session.execute("INSERT INTO vote ( post_id, user_id, vote_type ) VALUES("+str(postId)+","+str(user_id)+", "+str(vote_type)+" )")
        
        return redirect('/post/'+postId)

@app.route('/post/delete/<postId>', methods=['POST'])
def deletePost(postId):
    if request.method == 'POST':
        title = request.form['title']
        user_id = uuid.UUID(session['user_id'])
        post_id = uuid.UUID(postId)

        #######################
        ## STUDENT: 
        ## The ID of the post to be deleted is saved above as postId
        ## The title of the post to be deleted is saved above as title
        ## The ID of the user who created the post to be deleted is saved above as user_id
        ## Send all CQL queries to the database needed to remove the post from the database
        #######################    
        cassandra_session.execute("DELETE * FROM post_top_five WHERE post_id = "+str(postId)+" AND user_id = "+str(user_id))
        cassandra_session.execute("DELETE * FROM post_search WHERE post_title = "+str(title))
        cassandra_session.execute("DELETE * FROM post_details WHERE post_id = "+str(postId))

        return redirect('/posts')

#For post_search table as primary key is the key which is to be updated.add()
#First delete the row and then insert the row in the table
@app.route('/post/edit/<postId>', methods=['POST','GET'])
def editPost(postId):
    if request.method == 'POST':
        title = request.form['title']
        content = request.form['content']
        user_id = uuid.UUID(session['user_id'])

        #######################
        ## STUDENT: 
        ## You only enter this block if the user has just submitted request to edit a post
        ## The ID of the post to be edited is saved above as postId
        ## The updated title of the post is saved above as title
        ## The updated contents of the post is saved above as content
        ## The ID of the user who created the post to be edited is saved above as user_id
        ## Send all CQL queries to the database needed to edit the post in the database
        ##
        ## Warning: You cannot submit an UPDATE query for the primary key, so for any query 
        ## where you would be updating the PK, you should DELETE the old entry and re-INSERT
        ## it with the new information instead of using an UPDATE query.
        #######################  
        oldtitle = cassandra_session.execute("SELECT post_title FROM post_details WHERE post_id = "+str(postId))
        cassandra_session.execute("DELETE * FROM post_top_five WHERE post_id = "+str(postId)+" AND user_id = "+str(user_id))
        cassandra_session.execute("DELETE * FROM post_search WHERE post_title = "+oldtitle)
        cassandra_session.execute("DELETE * FROM post_details WHERE post_id = "+str(postId))

        cassandra_session.execute("INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES("+str(postId)+","+str(user_id)+",'"+str(title)+"', toTimeStamp(now()) )")
        cassandra_session.execute("INSERT INTO post_search ( post_title, post_id ) VALUES('"+str(title)+"', "+str(postId)+")")
        cassandra_session.execute("INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES("+str(postId)+","+str(user_id)+",'"+str(title)+"', '"+str(content)+"',toTimeStamp(now()) )")


        return redirect('/post/'+postId)
    else:
        #######################
        ## STUDENT: 
        ## This page is for viewing a post with the intention of editing it
        ## The post ID is stored above as postId
        ## Send a CQL query to the database to get all information for this post entry
        ## Store the results from your query as post
        #######################
        post = cassandra_session.execute("SELECT * FROM post_details WHERE post_id = "+str(postId))
        
        return render_template('editPost.html', post=post[0], postid = postId)


if __name__ == '__main__':
    app.run()
