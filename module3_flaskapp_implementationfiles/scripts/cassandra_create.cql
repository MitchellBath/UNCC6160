DROP KEYSPACE IF EXISTS blog;



CREATE KEYSPACE "blog" WITH replication = {'class':'SimpleStrategy', 'replication_factor' : 1};



USE blog;




CREATE TABLE user_profile ( user_id UUID, user_name text, user_email text, user_bio text, user_social text, user_create_date timestamp, PRIMARY KEY ((user_id)) );

CREATE TABLE post_top_five ( post_id UUID, user_id UUID, post_title text, post_create_date timestamp, post_update_date timestamp, PRIMARY KEY ((user_id), post_id, post_create_date) ) WITH CLUSTERING ORDER BY (post_id ASC, post_create_date DESC);

CREATE TABLE post_search ( post_title text, post_id UUID, PRIMARY KEY ((post_title), post_id) );

CREATE TABLE post_details ( post_id UUID, user_id UUID, user_name text, post_title text, post_contents text, post_create_date timestamp, post_update_date timestamp, PRIMARY KEY ((post_id), post_create_date )) WITH CLUSTERING ORDER BY (post_create_date ASC);

CREATE TABLE comment_by_post ( comment_id UUID, post_id UUID, user_id UUID, comment_contents text, PRIMARY KEY ((post_id), comment_id) );

CREATE TABLE vote ( post_id UUID, user_id UUID, vote_type boolean , PRIMARY KEY ((post_id, user_id)) );







INSERT INTO user_profile ( user_id, user_name, user_email, user_bio, user_social, user_create_date) VALUES(c6014510-b517-11ec-b909-0242ac120002,'JC_1794','johncook1209@xyz.com','Coding is fun','https://www.facebook.com/', toTimeStamp(now()));
INSERT INTO user_profile ( user_id, user_name, user_email, user_bio, user_social, user_create_date) VALUES(c6014718-b517-11ec-b909-0242ac120002,'OC_1568','ocruz1278@xyz.com','Love life','https://twitter.com/?lang=en', toTimeStamp(now()));
INSERT INTO user_profile ( user_id, user_name, user_email, user_bio, user_social, user_create_date) VALUES(c6014858-b517-11ec-b909-0242ac120002,'NP_1841','Noah12park@xyz.com','Rapper/Influencer','https://www.instagram.com/', toTimeStamp(now()));
INSERT INTO user_profile ( user_id, user_name, user_email, user_bio, user_social, user_create_date) VALUES(c6014984-b517-11ec-b909-0242ac120002,'PL_1087','plopo135@xyz.com','Actor/Singer','https://in.pinterest.com/', toTimeStamp(now()));
INSERT INTO user_profile ( user_id, user_name, user_email, user_bio, user_social, user_create_date) VALUES(c6014bf0-b517-11ec-b909-0242ac120002,'RM_1498','rose189@xyz.com','Influencer','https://www.facebook.com/', toTimeStamp(now()));
INSERT INTO user_profile ( user_id, user_name, user_email, user_bio, user_social, user_create_date) VALUES(c6014db2-b517-11ec-b909-0242ac120002,'AD_1578','ameliad@xyz.com','Lifestyle | Travel | Fun','https://www.instagram.com/', toTimeStamp(now()));
INSERT INTO user_profile ( user_id, user_name, user_email, user_bio, user_social, user_create_date) VALUES(c6014ede-b517-11ec-b909-0242ac120002,'BJ_1029','brynjacksonsss102@xyz.com','Pet Lover','https://twitter.com/?lang=en', toTimeStamp(now()));
INSERT INTO user_profile ( user_id, user_name, user_email, user_bio, user_social, user_create_date) VALUES(c6015000-b517-11ec-b909-0242ac120002,'SB_1733','sophoBugs74@xyz.com','Entrepreneur','https://in.pinterest.com/', toTimeStamp(now()));
INSERT INTO user_profile ( user_id, user_name, user_email, user_bio, user_social, user_create_date) VALUES(c6015118-b517-11ec-b909-0242ac120002,'AH_1236','ALexusH1201@xyz.com','Technology Enthusiast','https://www.instagram.com/', toTimeStamp(now()));
INSERT INTO user_profile ( user_id, user_name, user_email, user_bio, user_social, user_create_date) VALUES(c6015226-b517-11ec-b909-0242ac120002,'FT_1152','farri210@xyz.com','Dancer | Yoga is Life','https://www.facebook.com/', toTimeStamp(now()));
INSERT INTO user_profile ( user_id, user_name, user_email, user_bio, user_social, user_create_date) VALUES(c6015348-b517-11ec-b909-0242ac120002,'CB_1526','chestB1098@xyz.com','Your small action can bring a great change | Environmentalist','https://in.pinterest.com/', toTimeStamp(now()));
INSERT INTO user_profile ( user_id, user_name, user_email, user_bio, user_social, user_create_date) VALUES(c6015456-b517-11ec-b909-0242ac120002,'LE_1202','LiamEE155@xyz.com','Influencer','https://www.instagram.com/', toTimeStamp(now()));
INSERT INTO user_profile ( user_id, user_name, user_email, user_bio, user_social, user_create_date) VALUES(c6015730-b517-11ec-b909-0242ac120002,'AH_1070','AsherR189@xyz.com','Personal Trainer','https://twitter.com/?lang=en', toTimeStamp(now()));
INSERT INTO user_profile ( user_id, user_name, user_email, user_bio, user_social, user_create_date) VALUES(c6015866-b517-11ec-b909-0242ac120002,'DN_1260','DavisNels129@xyz.com','Animal Lover/ Donate percentage of sales to wildlife in masaimara','https://in.pinterest.com/', toTimeStamp(now()));
INSERT INTO user_profile ( user_id, user_name, user_email, user_bio, user_social, user_create_date) VALUES(c601597e-b517-11ec-b909-0242ac120002,'JS_1856','JenniferScott1087@xyz.com','Check out my latest blog post/ www.tinyurl.com','https://twitter.com/?lang=en', toTimeStamp(now()));
INSERT INTO user_profile ( user_id, user_name, user_email, user_bio, user_social, user_create_date) VALUES(c6015aa0-b517-11ec-b909-0242ac120002,'CG_1059','celila167@xyz.com','Pilot | Mom |Youtuber | Influencer','https://www.facebook.com/', toTimeStamp(now()));
INSERT INTO user_profile ( user_id, user_name, user_email, user_bio, user_social, user_create_date) VALUES(c6015c08-b517-11ec-b909-0242ac120002,'VL_1868','Vince555@xyz.com','Life Goals Student','https://www.instagram.com/', toTimeStamp(now()));
INSERT INTO user_profile ( user_id, user_name, user_email, user_bio, user_social, user_create_date) VALUES(c6015d66-b517-11ec-b909-0242ac120002,'PT_1365','philli335@xyz.com','Environmentalist | You can make a difference Watch the documentry www.tinyurl.com','https://twitter.com/?lang=en', toTimeStamp(now()));
INSERT INTO user_profile ( user_id, user_name, user_email, user_bio, user_social, user_create_date) VALUES(c6015ec4-b517-11ec-b909-0242ac120002,'WY_1034','willisyo221@xyz.com','Saying yes to new adventures','https://www.facebook.com/', toTimeStamp(now()));








INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c6015ff0-b517-11ec-b909-0242ac120002,c6014510-b517-11ec-b909-0242ac120002,'Coding Is Fun ??', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c601625c-b517-11ec-b909-0242ac120002,c6014510-b517-11ec-b909-0242ac120002,'Coding Basics', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c6016388-b517-11ec-b909-0242ac120002,c6014718-b517-11ec-b909-0242ac120002,'Life Is Beautiful', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c60164aa-b517-11ec-b909-0242ac120002,c6014718-b517-11ec-b909-0242ac120002,'In Which Jack Hazard Makes A Hero Of Himself.', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c60165e0-b517-11ec-b909-0242ac120002,c6014858-b517-11ec-b909-0242ac120002,'New Song Out Soon', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c6016702-b517-11ec-b909-0242ac120002,c6014984-b517-11ec-b909-0242ac120002,'The Song', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c6016810-b517-11ec-b909-0242ac120002,c6014bf0-b517-11ec-b909-0242ac120002,'A Day In Paris', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c6016af4-b517-11ec-b909-0242ac120002,c6014db2-b517-11ec-b909-0242ac120002,'Travelling Alone', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c6016c16-b517-11ec-b909-0242ac120002,c6014ede-b517-11ec-b909-0242ac120002,'The Lady With The Dog', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c6016d24-b517-11ec-b909-0242ac120002,c6015000-b517-11ec-b909-0242ac120002,'Golden Rules Of Making Money', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c6016e3c-b517-11ec-b909-0242ac120002,c6015118-b517-11ec-b909-0242ac120002,'How It Works', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c6016f4a-b517-11ec-b909-0242ac120002,c6015226-b517-11ec-b909-0242ac120002,'Little Spanish Dancer', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c6017062-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,'Climatic Changes', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c60171fc-b517-11ec-b909-0242ac120002,c6015456-b517-11ec-b909-0242ac120002,'Reflection', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c6017364-b517-11ec-b909-0242ac120002,c6015730-b517-11ec-b909-0242ac120002,'The Study Of Physiology. ', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c601762a-b517-11ec-b909-0242ac120002,c6015866-b517-11ec-b909-0242ac120002,'Birds In The Bush', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c601774c-b517-11ec-b909-0242ac120002,c601597e-b517-11ec-b909-0242ac120002,'Laugh', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c6017864-b517-11ec-b909-0242ac120002,c6015aa0-b517-11ec-b909-0242ac120002,'The Red Fairy', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c6017972-b517-11ec-b909-0242ac120002,c6015c08-b517-11ec-b909-0242ac120002,'Language Of Love', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c6017a80-b517-11ec-b909-0242ac120002,c6015d66-b517-11ec-b909-0242ac120002,'Importance Of Climate', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c6017b8e-b517-11ec-b909-0242ac120002,c6015ec4-b517-11ec-b909-0242ac120002,'Young Adventure', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c6017c9c-b517-11ec-b909-0242ac120002,c6014510-b517-11ec-b909-0242ac120002,'De President Krabde Zich Achter Het Oor', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c6017dfa-b517-11ec-b909-0242ac120002,c6014510-b517-11ec-b909-0242ac120002,'The Start For Palilo', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c6018106-b517-11ec-b909-0242ac120002,c6014510-b517-11ec-b909-0242ac120002,'A Polite Captor', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c6018228-b517-11ec-b909-0242ac120002,c6014510-b517-11ec-b909-0242ac120002,'A Leak Of Military Information', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c6018340-b517-11ec-b909-0242ac120002,c6014510-b517-11ec-b909-0242ac120002,'Landed In Captivity', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c601844e-b517-11ec-b909-0242ac120002,c6014510-b517-11ec-b909-0242ac120002,'Captain Blynn Marches', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c601855c-b517-11ec-b909-0242ac120002,c6014510-b517-11ec-b909-0242ac120002,'The Mindinao', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c6018674-b517-11ec-b909-0242ac120002,c6014510-b517-11ec-b909-0242ac120002,'The Gunboat Coöperates', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c6018782-b517-11ec-b909-0242ac120002,c6014510-b517-11ec-b909-0242ac120002,'The Privileges Of Rank', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c60189d0-b517-11ec-b909-0242ac120002,c6014510-b517-11ec-b909-0242ac120002,'The Katipunan Society', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c6018ae8-b517-11ec-b909-0242ac120002,c6014510-b517-11ec-b909-0242ac120002,'In The Shadow Of A Suspicion', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c6018c00-b517-11ec-b909-0242ac120002,c6014510-b517-11ec-b909-0242ac120002,'A Traitor Unmasked', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c6018d68-b517-11ec-b909-0242ac120002,c6014510-b517-11ec-b909-0242ac120002,'The Midshipmen Reconnoitre', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c6018e8a-b517-11ec-b909-0242ac120002,c6014718-b517-11ec-b909-0242ac120002,'Unwelcome Companions', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c60190ce-b517-11ec-b909-0242ac120002,c6014718-b517-11ec-b909-0242ac120002,'Cleverly Outwitted', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c6019254-b517-11ec-b909-0242ac120002,c6014718-b517-11ec-b909-0242ac120002,'A Night Of Alarm', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c6019380-b517-11ec-b909-0242ac120002,c6014718-b517-11ec-b909-0242ac120002,'A Filipino Martyr', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c6019650-b517-11ec-b909-0242ac120002,c6015c08-b517-11ec-b909-0242ac120002,'A Daring Plan', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c60197cc-b517-11ec-b909-0242ac120002,c6015c08-b517-11ec-b909-0242ac120002,'A River Expedition', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c601992a-b517-11ec-b909-0242ac120002,c6015c08-b517-11ec-b909-0242ac120002,'A Willing Captive', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c6019a7e-b517-11ec-b909-0242ac120002,c6015d66-b517-11ec-b909-0242ac120002,'The Struggle For The Stronghold', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c6019b96-b517-11ec-b909-0242ac120002,c6015d66-b517-11ec-b909-0242ac120002,'The Gunboat Takes A Hand', toTimeStamp(now()) );
INSERT INTO post_top_five ( post_id, user_id, post_title, post_create_date ) VALUES(c6019c9a-b517-11ec-b909-0242ac120002,c6015ec4-b517-11ec-b909-0242ac120002,'The Escaped Outlaw', toTimeStamp(now()) );








INSERT INTO post_search ( post_title, post_id ) VALUES('Coding Is Fun ??', c6015ff0-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('Coding Basics', c601625c-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('Life Is Beautiful', c6016388-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('In Which Jack Hazard Makes A Hero Of Himself.', c60164aa-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('New Song Out Soon', c60165e0-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('The Song', c6016702-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('A Day In Paris', c6016810-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('Travelling Alone', c6016af4-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('The Lady With The Dog', c6016c16-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('Golden Rules Of Making Money', c6016d24-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('How It Works', c6016e3c-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('Little Spanish Dancer', c6016f4a-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('Climatic Changes', c6017062-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('Reflection', c60171fc-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('The Study Of Physiology. ', c6017364-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('Birds In The Bush', c601762a-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('Laugh', c601774c-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('The Red Fairy', c6017864-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('Language Of Love', c6017972-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('Importance Of Climate', c6017a80-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('Young Adventure', c6017b8e-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('De President Krabde Zich Achter Het Oor', c6017c9c-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('The Start For Palilo', c6017dfa-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('A Polite Captor', c6018106-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('A Leak Of Military Information', c6018228-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('Landed In Captivity', c6018340-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('Captain Blynn Marches', c601844e-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('The Mindinao', c601855c-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('The Gunboat Coöperates', c6018674-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('The Privileges Of Rank', c6018782-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('The Katipunan Society', c60189d0-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('In The Shadow Of A Suspicion', c6018ae8-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('A Traitor Unmasked', c6018c00-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('The Midshipmen Reconnoitre', c6018d68-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('Unwelcome Companions', c6018e8a-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('Cleverly Outwitted', c60190ce-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('A Night Of Alarm', c6019254-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('A Filipino Martyr', c6019380-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('A Daring Plan', c6019650-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('A River Expedition', c60197cc-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('A Willing Captive', c601992a-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('The Struggle For The Stronghold', c6019a7e-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('The Gunboat Takes A Hand', c6019b96-b517-11ec-b909-0242ac120002);
INSERT INTO post_search ( post_title, post_id ) VALUES('The Escaped Outlaw', c6019c9a-b517-11ec-b909-0242ac120002);








INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c6015ff0-b517-11ec-b909-0242ac120002,c6014510-b517-11ec-b909-0242ac120002,'JC_1794','Coding Is Fun ??','Coding Basics: What is coding ? Is it fun or Boring ? Coding is just like writing a set of instructions on your computer in the order in which you want them to be executed.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c601625c-b517-11ec-b909-0242ac120002,c6014510-b517-11ec-b909-0242ac120002,'JC_1794','Coding Basics','In this post we will learn about the basics of coding. How it evolved. Coding languages came into existence in the late 1950s. Initial Coding languages were Cobol, Fortran and Lisp', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c6016388-b517-11ec-b909-0242ac120002,c6014718-b517-11ec-b909-0242ac120002,'OC_1568','Life Is Beautiful','Have you watched the movie Life is Beautiful ? It is one of my favourite movies. It is an amazing movie that depicts no matter how hard circumstances are but there is always hope. I the story A gentle Jewish-Italian waiter, Guido Orefice meets Dora a pretty schoolteacher, and wins her over with his full of life and funny attitude. Eventually they marry and have a son. The fight extraordinary circumstances to keep their son alive.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c60164aa-b517-11ec-b909-0242ac120002,c6014718-b517-11ec-b909-0242ac120002,'OC_1568','In Which Jack Hazard Makes A Hero Of Himself.','Im afraid Ill have to strike that Brooklyn place, after all,” he said as he stepped out of a Water Street ship chandlery that had advertised for a bright boy and had taken a youth on trial an hour before. But, realizing that this wasnt business, he turned away and hurried up the street.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c60165e0-b517-11ec-b909-0242ac120002,c6014858-b517-11ec-b909-0242ac120002,'NP_1841','New Song Out Soon','My new song will be out soon. Its called The Right One. I am sure it will bring back your memories of childhood.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c6016702-b517-11ec-b909-0242ac120002,c6014984-b517-11ec-b909-0242ac120002,'PL_1087','The Song','For the rest of the week, whenever he had the chance, he kept his eye on the indicator that ticked out its monotonous song in the reception-room during business hours, and every day D. & S. advanced, sometimes with provoking slowness and sometimes with little bounds, like a boy chasing himself up a flight of stairs.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c6016810-b517-11ec-b909-0242ac120002,c6014bf0-b517-11ec-b909-0242ac120002,'RM_1498','A Day In Paris','Paris on a bright April morning. Can any city make a brighter, braver show under a clear blue sky and a brilliant sun, the chestnuts in the Champs Elysées and Tuileries gardens bursting into bloom, the flower-market of the Madeleine a mass of color, exhaling delicious perfume, the fair purchasers in the first freshness of their spring attire, the tide of business and of pleasure at the fullest flood. It is a sight to fill any heart tolerably free from pressing anxiety with an irresistible sense of youth.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c6016af4-b517-11ec-b909-0242ac120002,c6014db2-b517-11ec-b909-0242ac120002,'AD_1578','Travelling Alone','I wish you would come as far as Genoa with me, cried Verner, I am just appointed to the Africa, on the Mediterranean station. I hate traveling alone. Poor Dennison, who commanded her, died of a few days fever off the coast of Calabria,—caught it shooting in some marshes, and——', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c6016c16-b517-11ec-b909-0242ac120002,c6014ede-b517-11ec-b909-0242ac120002,'BJ_1029','The Lady With The Dog','But in this case there was still the diffidence, the angularity of inexperienced youth, an awkward feeling; and there was a sense of consternation as though some one had suddenly knocked at the door. The attitude of Anna Sergeyevna—the lady with the dog—to what had happened was somehow peculiar, very grave, as though it were her fall—so it seemed, and it was strange and inappropriate. Her face dropped and faded, and on both sides of it her long hair hung down mournfully; she mused in a dejected attitude like the woman who was a sinner in an old-fashioned picture.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c6016d24-b517-11ec-b909-0242ac120002,c6015000-b517-11ec-b909-0242ac120002,'SB_1733','Golden Rules Of Making Money','In the United States, where we have more land than people, it is not at all difficult for persons in good health to make money. In this comparatively new field there are so many avenues of success open, so many vocations which are not crowded, that any person of either sex who is willing, at least for the time being, to engage in any respectable occupation that offers, may find lucrative employment.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c6016e3c-b517-11ec-b909-0242ac120002,c6015118-b517-11ec-b909-0242ac120002,'AH_1236','How It Works','How does it work? This question has been put to me so often by persons young and old that I have at last decided to answer it in such a manner that a much larger public than that with which I have personal acquaintance may be able to satisfy themselves as to the principles underlying many of the mechanisms met with in everyday life.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c6016f4a-b517-11ec-b909-0242ac120002,c6015226-b517-11ec-b909-0242ac120002,'FT_1152','Little Spanish Dancer','She was one of the best dancers in her group. And why not? Her mother had been a dancer; her grandmother, too, yes, and her great-grandmother and her great-great—oh, ever so many great-grandmothers! They had all been dancers.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c6017062-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,'CB_1526','Climatic Changes','The rôle of climate in the life of today suggests its importance in the past and in the future. No human being can escape from the fact that his food, clothing, shelter, recreation, occupation, health, and energy are all profoundly influenced by his climatic surroundings. A change of season brings in its train some alteration in practically every phase of human activity. Animals are influenced by climate even more than man, for they have not developed artificial means of protecting themselves. Even so hardy a creature as the dog becomes notably different with a change of climate. The thick-haired husky of the Eskimos has outwardly little in common with the small and almost hairless canines that grovel under foot in Mexico. Plants are even more sensitive than animals and men. Scarcely a single species can flourish permanently in regions which differ more than 20°C. in average yearly temperature, and for most the limit of successful growth is 10°.[1] So far as we yet know every living species of plant and animal, including man, thrives best under definite and limited conditions of temperature, humidity, and sunshine, and of the composition and movement of the atmosphere or water in which it lives. Any departure beyond the limits means lessened efficiency, and in the long run a lower rate of reproduction and a tendency toward changes in specific characteristics. Any great departure means suffering or death for the individual and destruction for the species.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c60171fc-b517-11ec-b909-0242ac120002,c6015456-b517-11ec-b909-0242ac120002,'LE_1202','Reflection','With regard to the term spiritual, it may be sufficient to remark here, that he regards it as having a specific import, and maintains that in the sense of the New Testament, spiritual and natural are contradistinguished, so that what is spiritual is different {xxxi}in kind from that which is natural, and is in fact super-natural. So, too, while morality is something more than prudence, religion, the spiritual life, is something more than morality.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c6017364-b517-11ec-b909-0242ac120002,c6015730-b517-11ec-b909-0242ac120002,'AH_1070','The Study Of Physiology. ','We are now to take up a new study, and in a field quite different from any we have thus far entered. Of all our other studies,—mathematics, physics, history, language,—not one comes home to us with such peculiar interest as does physiology, because this is the study of ourselves.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c601762a-b517-11ec-b909-0242ac120002,c6015866-b517-11ec-b909-0242ac120002,'DN_1260','Birds In The Bush','Why do birds sing? Has their music a meaning, or is it all a matter of blind impulse? Some bright morning in March, as you go out-of-doors, you are greeted by the notes of the first robin. Perched in a leafless tree, there he sits, facing the sun like a genuine fire-worshiper, and singing as though he would pour out his very soul. What is he thinking about? What spirit possesses him?', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c601774c-b517-11ec-b909-0242ac120002,c601597e-b517-11ec-b909-0242ac120002,'JS_1856','Laugh','You can laugh too much. You can be too cheerful. You can look too much on the sunny side of life. You wont believe this and neither did Bobby McTabb. But McTabb proved it out. It took the girl to help him—Kitty Duchene was her name—tall and sweet to look upon, with those pure blue eyes, dark with the beauty of violets, that go so well with hair which is brown in the shadow and gold in the sun. They proved it out together, all of a sudden. It is their story. And it will never be believed. But its the truth.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c6017864-b517-11ec-b909-0242ac120002,c6015aa0-b517-11ec-b909-0242ac120002,'CG_1059','The Red Fairy','Once upon a time there lived a King and Queen whose children had all died, first one and then another, until at last only one little daughter remained, and the Queen was at her wits end to know where to find a really good nurse who would take care of her, and bring her up. A herald was sent who blew a trumpet at every street corner, and commanded all the best nurses to appear before the Queen, that she might choose one for the little Princess. So on the appointed day the whole palace was crowded with nurses, who came from the four corners of the world to offer themselves, until the Queen declared that if she was ever to see the half of them, they must be brought out to her, one by one, as she sat in a shady wood near the palace.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c6017972-b517-11ec-b909-0242ac120002,c6015c08-b517-11ec-b909-0242ac120002,'VL_1868','Language Of Love','There is no language that Love does not speak: To-day commanding and to-morrow meek, One hour laconic and the next verbose, With hope triumphant and with doubt morose, His varying moods all forms of speech employ. To give expression to his painful joy,', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c6017a80-b517-11ec-b909-0242ac120002,c6015d66-b517-11ec-b909-0242ac120002,'PT_1365','Importance Of Climate','Since climate has so profound an influence on life today, it has presumably been equally potent at other times. Therefore few scientific questions are more important than how and why the earths climate has varied in the past, and what changes it is likely to undergo in the future. This book sets forth what appear to be the chief reasons for climatic variations during historic and geologic times. It assumes that causes which can now be observed in operation, as explained in a companion volume entitled Earth and Sun, and in such books as Humphreys Physics of the Air, should be carefully studied before less obvious causes are appealed to. It also assumes that these same causes will continue to operate, and are the basis of all valid predictions as to the weather or climate of the future.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c6017b8e-b517-11ec-b909-0242ac120002,c6015ec4-b517-11ec-b909-0242ac120002,'WY_1034','Young Adventure','In these days when the old civilisation is crumbling beneath our feet, the thought of poetry crosses the mind like the dear memory of things that have long since passed away. In our passionate desire for the new era, it is difficult to refrain oneself from the commonplace practice of speculating on the effects of warfare and of prophesying all manner of novel rebirths. But it may be well for us to remember that the era which has recently closed was itself marked by a mad idealisation of all novelties. In the literary movements of the last decade —when, indeed, any movement at all has been perceptible — we have witnessed a bewildering rise and fall of methods and ideals. We were captivated for a time by the quest of the golden phrase and the accompanying cultivation of exotic emotions; and then, wearying of the pretty and the temperamental, we plunged into the bloodshot brutalities of naturalism.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c6017c9c-b517-11ec-b909-0242ac120002,c6014510-b517-11ec-b909-0242ac120002,'JC_1794','De President Krabde Zich Achter Het Oor','Dit ongeluk heeft alle medeleden afgeschrikt en wij zouden heel licht onze invloedrijkste leden kunnen verliezen!', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c6017dfa-b517-11ec-b909-0242ac120002,c6014510-b517-11ec-b909-0242ac120002,'JC_1794','The Start For Palilo','The Isla de Negros,” a small inter-island steamer, lay moored alongside the dock in the turbulent waters of the Pasig River, the commercial artery of the city of Manila. As the last of its cargo was noisily carried on board by a swarm of half-naked stevedores, the slender lines which held the steamer to the stone quay were cast off, and with many shrill screeches from its high treble whistle the steamer swung its blunt bow out into the strength of the current.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c6018106-b517-11ec-b909-0242ac120002,c6014510-b517-11ec-b909-0242ac120002,'JC_1794','A Polite Captor','The Americans were not kept long in suspense, although to the anxious boys, huddled helplessly in the shadow of the boat, the time seemed hours until the victorious and jubilant natives moved aft, bent on annihilating those whom they believed were hiding from their search.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c6018228-b517-11ec-b909-0242ac120002,c6014510-b517-11ec-b909-0242ac120002,'JC_1794','A Leak Of Military Information','Brigadier-General Wilson sat at his desk in the headquarters building at Palilo. In the spacious corridors outside orderlies hurried to and fro, carrying messages from the several officers of the staff whose offices joined that of the general.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c6018340-b517-11ec-b909-0242ac120002,c6014510-b517-11ec-b909-0242ac120002,'JC_1794','Landed In Captivity','Phil was too angry and humiliated to do more than glare at the girl who had so cleverly thwarted him in his daring plan to strand the steamer. His companions had started to spring toward the coveted rifles of their enemy, but now they sank back into their seats and hopelessly looked into the menacing muzzles of these same rifles in the hands of the four aroused sentries. The girl had risen to her feet, her face flushed with excitement; she raised her hand to the natives, motioning them to put up their weapons.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c601844e-b517-11ec-b909-0242ac120002,c6014510-b517-11ec-b909-0242ac120002,'JC_1794','Captain Blynn Marches','Captain Blynns restless gaze contemplated his companion from time to time as the native signaled the right trail. They were now in a narrow defile between two hills that rose precipitously to a height of over a thousand feet. Captain Blynn, as he contemplated his surroundings with a soldiers eyes, drew his revolver from its holster and laid it gently across the pommel of his saddle.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c601855c-b517-11ec-b909-0242ac120002,c6014510-b517-11ec-b909-0242ac120002,'JC_1794','The Mindinao','Captain Blynn rested his tired soldiers until the cool of the evening and then the march was begun back to Palilo, carrying with them the spoils of the fight.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c6018674-b517-11ec-b909-0242ac120002,c6014510-b517-11ec-b909-0242ac120002,'JC_1794','The Gunboat Coöperates','Baker is in the field and a sergeant and twenty men are holding the post,” Major Marble continued, but if the natives are in great force such a handful cannot last long.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c6018782-b517-11ec-b909-0242ac120002,c6014510-b517-11ec-b909-0242ac120002,'JC_1794','The Privileges Of Rank','They was messengers, telling the gugus of the coming of the gunboat, I reckon.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c60189d0-b517-11ec-b909-0242ac120002,c6014510-b517-11ec-b909-0242ac120002,'JC_1794','The Katipunan Society','Sydney was beside himself with indignation when he learned of the spiteful charges of the[140] lieutenant and was for seeking him out and bestowing personal vengeance, but Phil dissuaded him from any such rash act.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c6018ae8-b517-11ec-b909-0242ac120002,c6014510-b517-11ec-b909-0242ac120002,'JC_1794','In The Shadow Of A Suspicion','A challenge was called and answered, and the next second the door was opened from within and a native entered. Phil beheld in admiration the air of grace and fearlessness while he advanced boldly toward the startled leader.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c6018c00-b517-11ec-b909-0242ac120002,c6014510-b517-11ec-b909-0242ac120002,'JC_1794','A Traitor Unmasked','Come!” Captain Blynn exclaimed, starting up from his chair. He led the lads down to his carriage at the door and motioned them to enter. Then giving an address to the driver they went whirling through the narrow streets.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c6018d68-b517-11ec-b909-0242ac120002,c6014510-b517-11ec-b909-0242ac120002,'JC_1794','The Midshipmen Reconnoitre','The midshipmen were so utterly astonished at the actions of their fanatical enemies that they could only gasp out their surprise in one heartfelt word of relief. Then a familiar voice at their elbow awoke them from their stupefied inactivity. It was in Visayan and they turned to gaze into the impassive face of Rodriguez.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c6018e8a-b517-11ec-b909-0242ac120002,c6014718-b517-11ec-b909-0242ac120002,'OC_1568','Unwelcome Companions','The lads indeed found themselves in an awkward predicament. Just the faintest thread really bound them to life, for they saw in the cruel expression in the eyes of the Filipino officer that nothing would delight him so much as to have these white men shot. Phil very much feared that in spite of his cordial words this boyish native had before now guessed the truth. However there was nothing to do but remain silent and inactive. Phil had a great desire to speak to Sydney in English, but he feared this dapper little Filipino might have learned enough of that language to understand what he might say.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c60190ce-b517-11ec-b909-0242ac120002,c6014718-b517-11ec-b909-0242ac120002,'OC_1568','Cleverly Outwitted','As Salas hand slowly drew his revolver from its holster, Phils right hand with the speed of a mongoos seizing its prey clutched the slender wrist of the outlaw; the lads left hand had moved deftly to the slack of the natives strong khaki trousers, and the next second he had raised the surprised Filipino from off his seat and held him for an instant balanced in the air.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c6019254-b517-11ec-b909-0242ac120002,c6014718-b517-11ec-b909-0242ac120002,'OC_1568','A Night Of Alarm','On the threshold she stopped in startled amazement. Her slippered feet had made no sound and the door as she pushed it open caused him to glance up in annoyed surprise. She saw her father on his knees in the corner before several heavy iron-bound chests, and their opened covers displayed to her anxious eyes a great wealth of gold and silver coins. More money than her young imagination had ever dreamed of.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c6019380-b517-11ec-b909-0242ac120002,c6014718-b517-11ec-b909-0242ac120002,'OC_1568','A Filipino Martyr','Phil and Sydney were hard pushed to keep up with the native as he spurred his horse forward over the dark road.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c6019650-b517-11ec-b909-0242ac120002,c6015c08-b517-11ec-b909-0242ac120002,'VL_1868','A Daring Plan','The exchange proposed by Espinosa was out of the question, even if Colonel Martinez had surrendered, which he had not done up to the present time; and until his sins in Luzon were forgiven Phil knew that he preferred his liberty. But this threat against Tillotsons life worried Phil. Espinosa was sufficiently cruel to carry it out, he was sure.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c60197cc-b517-11ec-b909-0242ac120002,c6015c08-b517-11ec-b909-0242ac120002,'VL_1868','A River Expedition','After Phil and his party had gone on their hazardous mission, Sydney went aboard the gunboat to make ready for the work which had been left in his hands. He felt it keenly that he could not share this dangerous expedition, but there was some consolation in the knowledge that ONeil was with Phil.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c601992a-b517-11ec-b909-0242ac120002,c6015c08-b517-11ec-b909-0242ac120002,'VL_1868','A Willing Captive','The natives who are guarding us are our own men, and one of em tried to stick his bayonet in me when I asked him for some water to wash in. I wish they were not so careful of appearances,” he added with a grim smile.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c6019a7e-b517-11ec-b909-0242ac120002,c6015d66-b517-11ec-b909-0242ac120002,'PT_1365','The Struggle For The Stronghold','Several hundred natives, their weapons in hand, had gathered about their cruel leader. Every eye was turned in rapt enjoyment toward the delighting spectacle of the torture of a despised American. None save Lopez and his faithful guards had observed the glint of steel far down in the valley below. None save he discerned two small white poles creeping along above the high trees on the river[326] bank. He glanced uneasily toward the torture. Phil was on his back securely bound, while Colonel Salas held above his head a long bamboo cane filled with water.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c6019b96-b517-11ec-b909-0242ac120002,c6015d66-b517-11ec-b909-0242ac120002,'PT_1365','The Gunboat Takes A Hand','General Wilson was becoming impatient. He had held himself well in hand to steady the officers and men under him during the trial through which they had passed so successfully. Now his anxiety was more than he could keep to himself. He rushed up to the cringing native, taking him roughly by the shoulders and crying out to him in English, a language unintelligible to the terrified prisoner.', toTimeStamp(now()));
INSERT INTO post_details ( post_id, user_id, user_name, post_title, post_contents, post_create_date ) VALUES(c6019c9a-b517-11ec-b909-0242ac120002,c6015ec4-b517-11ec-b909-0242ac120002,'WY_1034','The Escaped Outlaw','Lukban was the first to recover from the stunning news that Espinosa had, by a miracle, escaped out of the Americans hands when all outlets were supposed to have been covered.', toTimeStamp(now()));











INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c6019da8-b517-11ec-b909-0242ac120002,c6015ff0-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,'If you allow us to pass it, Ill have no mercy,” he exclaimed.' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c6019ee8-b517-11ec-b909-0242ac120002,c601625c-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,'The Mindinao” had now emerged from the dangerous cañon and the sound of firing above became less distinct.' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601a2f8-b517-11ec-b909-0242ac120002,c6016388-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,'Closer and closer loomed the cañon.' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601a564-b517-11ec-b909-0242ac120002,c60164aa-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,'Open fire on the left flank of the hill,” Sydney ordered.' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601a6f4-b517-11ec-b909-0242ac120002,c60165e0-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,'There was no answer; a glance aloft showed him the crew of the gun grouped anxiously about it.' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601a848-b517-11ec-b909-0242ac120002,c6016702-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,'To add to the danger there now came the song of enemys bullets while the water near the gunboat became disturbed as if from the fall of hail.' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601ac9e-b517-11ec-b909-0242ac120002,c6016810-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,'Look out for the prisoner,” Sydney cried out as he saw the native, his hands on the rail, about to leap overboard. ' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601ae42-b517-11ec-b909-0242ac120002,c6016af4-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,'The Mindinao” had now emerged from[342] the dangerous cañon and the sound of firing above became less distinct.' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601b036-b517-11ec-b909-0242ac120002,c6016c16-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,'Within ten minutes, which seemed ages to the eager Americans, the Mindinao” was anchored in the river and the troops were landed.' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601b306-b517-11ec-b909-0242ac120002,c6016d24-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,'The Filipino major calmly walked forward, his hands held above his head in sign of[345] peace, and raised his voice in his native language.' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601b428-b517-11ec-b909-0242ac120002,c6016e3c-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,'If you will cease torturing my man,” Phil said with difficulty through his wedged jaws, I will answer your questions.”' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601b536-b517-11ec-b909-0242ac120002,c6016f4a-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,'So you would dictate your own terms,” he cackled. Colonel Salas, just a few cupfuls. Captain Perry seems thirsty.”' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601b63a-b517-11ec-b909-0242ac120002,c6017062-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,'I choose to ask my prisoner,” the native retorted with a meaning glance at those who held Phils head turned so that he must see out of the tail of his eyes the cruel suffering of ONeil.' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601b7c0-b517-11ec-b909-0242ac120002,c60171fc-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,'Espinosa gave a guttural order and immediately Phil was seized and forced to gaze at the revolting torture of his companion.' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601b964-b517-11ec-b909-0242ac120002,c6017364-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,'You?” he cried in unfeigned surprise. How did you get there?”' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601ba86-b517-11ec-b909-0242ac120002,c601762a-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,'Phil turned his face away. He saw as through a red mist the throngs of curious natives who had quickly gathered to see their enemy slowly murdered before their eyes.' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601bd9c-b517-11ec-b909-0242ac120002,c601774c-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,'Espinosa gave a guttural order and immediately Phil was seized and forced to gaze at the revolting torture of his companion.' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601bebe-b517-11ec-b909-0242ac120002,c6017864-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,'We shall not kill him yet,” Espinosa said, while he smiled in keen delight at the discomfited midshipman. I have promised my men a field day. ' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601bfc2-b517-11ec-b909-0242ac120002,c6017972-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,'Where is General Wilson?” he asked anxiously, and is it true that your gunboat is in the river?”' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601c0c6-b517-11ec-b909-0242ac120002,c6017a80-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,'Where are your scouts?” Phil exclaimed haughtily. Ask them, not your prisoner.”' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601c1ca-b517-11ec-b909-0242ac120002,c6017b8e-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,'I choose to ask my prisoner,” the native retorted with a meaning glance at those who held Phils head turned so that he must see out of the tail of his eyes the cruel suffering of ONeil.' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601c2e2-b517-11ec-b909-0242ac120002,c6018674-b517-11ec-b909-0242ac120002,c6014718-b517-11ec-b909-0242ac120002,'Your prisoner does not choose to answer,” the lad declared stoutly.' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601c4c2-b517-11ec-b909-0242ac120002,c6018782-b517-11ec-b909-0242ac120002,c6014718-b517-11ec-b909-0242ac120002,'He closed his eyes and stiffened his muscle in a supreme endeavor to withstand the pain and prevent himself showing his suffering to the delighted natives.' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601c74c-b517-11ec-b909-0242ac120002,c60189d0-b517-11ec-b909-0242ac120002,c6014718-b517-11ec-b909-0242ac120002,'Now maybe you will consider your answer—Colonel Salas, a little water may loosen his tongue,” he heard the cruel voice of Espinosa say.' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601c9d6-b517-11ec-b909-0242ac120002,c6018ae8-b517-11ec-b909-0242ac120002,c6014718-b517-11ec-b909-0242ac120002,'So you would dictate your own terms,” he cackled. Colonel Salas, just a few cupfuls. Captain Perry seems thirsty.”' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601caee-b517-11ec-b909-0242ac120002,c6018c00-b517-11ec-b909-0242ac120002,c6014718-b517-11ec-b909-0242ac120002,'Before it is too late,” he said, will you answer my questions?”' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601cc38-b517-11ec-b909-0242ac120002,c6018d68-b517-11ec-b909-0242ac120002,c6014718-b517-11ec-b909-0242ac120002,'Phil opened his eyes and gazed at his tormentors. Then he closed them and steeled himself to what was to come.' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601cd46-b517-11ec-b909-0242ac120002,c6018e8a-b517-11ec-b909-0242ac120002,c6014718-b517-11ec-b909-0242ac120002,'He felt his nose held securely by muscular fingers and his head thrown back, making a reservoir of his mouth, which was kept full of water.' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601ce4a-b517-11ec-b909-0242ac120002,c60190ce-b517-11ec-b909-0242ac120002,c6014718-b517-11ec-b909-0242ac120002,'He could hold his breath no longer. His blood throbbed painfully in his temples. An awful nausea overcame him, and he gasped for air.' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601cf4e-b517-11ec-b909-0242ac120002,c6019254-b517-11ec-b909-0242ac120002,c6014858-b517-11ec-b909-0242ac120002,'Then a sharp sound as of the discharge of a cannon sounded in his ears and he fought and struggled with the strength of a score of men for the precious air.' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601d066-b517-11ec-b909-0242ac120002,c6019380-b517-11ec-b909-0242ac120002,c6014858-b517-11ec-b909-0242ac120002,'The natives did not understand the lads words, but his meaning was only too plain as he snatched a rifle from the ground and led the remnant of that plucky band.' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601d1ce-b517-11ec-b909-0242ac120002,c6019650-b517-11ec-b909-0242ac120002,c6014858-b517-11ec-b909-0242ac120002,'Let us pray for success,” the captive cried weakly. I had determined to throw myself off the cliff rather than undergo another days torture.”' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601d4c6-b517-11ec-b909-0242ac120002,c60197cc-b517-11ec-b909-0242ac120002,c6014858-b517-11ec-b909-0242ac120002,'Phil seated himself by the side of the unnerved man and begged him to be calm and reserve his strength. After a few moments he told him of the plan and his hopes for success.' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601d6d8-b517-11ec-b909-0242ac120002,c601992a-b517-11ec-b909-0242ac120002,c6014984-b517-11ec-b909-0242ac120002,'Phil stood silently by, his mind occupied over the details of a daring plan.' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601d8fe-b517-11ec-b909-0242ac120002,c6019a7e-b517-11ec-b909-0242ac120002,c6014bf0-b517-11ec-b909-0242ac120002,'Phil shook his head in mystery.' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601da66-b517-11ec-b909-0242ac120002,c6019b96-b517-11ec-b909-0242ac120002,c6014bf0-b517-11ec-b909-0242ac120002,'We have no news, Maria,” Phil said kindly. No, it cannot be so. It was but prompted by this cruel man to taunt you.”' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601dbce-b517-11ec-b909-0242ac120002,c6019c9a-b517-11ec-b909-0242ac120002,c6014bf0-b517-11ec-b909-0242ac120002,'If he had known of this attack and was alive he would have prevented it,” she exclaimed suddenly, her hope turning to dejection.' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601dd18-b517-11ec-b909-0242ac120002,c6017364-b517-11ec-b909-0242ac120002,c6014bf0-b517-11ec-b909-0242ac120002,'While they were talking the fusillade slowly diminished and soon ceased altogether and in a short time Captain Blynns voice was heard in the hall below.' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601de30-b517-11ec-b909-0242ac120002,c601762a-b517-11ec-b909-0242ac120002,c6014bf0-b517-11ec-b909-0242ac120002,'She must not be overexcited. She is outwardly calm but her heart acts queerly. It may snap at any moment,” he had told the lads.' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601df3e-b517-11ec-b909-0242ac120002,c601774c-b517-11ec-b909-0242ac120002,c6014bf0-b517-11ec-b909-0242ac120002,'A search at once,” Phil exclaimed rising hastily from his chair; they cant have gone far with those heavy chests.”' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601e1fa-b517-11ec-b909-0242ac120002,c6017864-b517-11ec-b909-0242ac120002,c6014bf0-b517-11ec-b909-0242ac120002,'While they were still at table Major Marble arrived, and was told all the news of the river.' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601e312-b517-11ec-b909-0242ac120002,c6017972-b517-11ec-b909-0242ac120002,c6014db2-b517-11ec-b909-0242ac120002,'Major Marble nodded his head in agreement with the views of the young navy man.' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601e484-b517-11ec-b909-0242ac120002,c6017a80-b517-11ec-b909-0242ac120002,c6014ede-b517-11ec-b909-0242ac120002,'If we could always do what our military training dictates,” he answered sadly, this war might not have begun.”' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601e5ce-b517-11ec-b909-0242ac120002,c6017b8e-b517-11ec-b909-0242ac120002,c6015000-b517-11ec-b909-0242ac120002,'I shall go up the river in an hour,” Phil[272] announced, and if the general wishes I shall be honored to have him on board.”' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601e6dc-b517-11ec-b909-0242ac120002,c6017c9c-b517-11ec-b909-0242ac120002,c6015118-b517-11ec-b909-0242ac120002,'I dont know how he got there, unless——” He turned and called ONeil from the boat. ONeil, do you know anything about a native securely bound with sailor neckerchiefs?”' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601e826-b517-11ec-b909-0242ac120002,c6017dfa-b517-11ec-b909-0242ac120002,c6015118-b517-11ec-b909-0242ac120002,'Do you know,” the captain said knowingly,[275] that he is the only prisoner captured? There wasnt a single wounded man in sight this morning. It isnt the custom of the country, you see.”' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601e93e-b517-11ec-b909-0242ac120002,c6018106-b517-11ec-b909-0242ac120002,c6015118-b517-11ec-b909-0242ac120002,'Phil involuntarily shuddered. How callous one becomes,” he thought, in war time. Think of maybe a hundred wounded men cruelly butchered by brother natives.”' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601ea4c-b517-11ec-b909-0242ac120002,c60165e0-b517-11ec-b909-0242ac120002,c6015118-b517-11ec-b909-0242ac120002,'The boat came quickly back and Phil took a letter from a natives hand scanning it with beating heart. For the general,” he said.' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601eccc-b517-11ec-b909-0242ac120002,c6016702-b517-11ec-b909-0242ac120002,c6015118-b517-11ec-b909-0242ac120002,'All watched the general break the seal and fumble with his glasses. It seemed ages before[276] he finished the few short lines and handed the letter to Captain Blynn.' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601edda-b517-11ec-b909-0242ac120002,c6016810-b517-11ec-b909-0242ac120002,c6015866-b517-11ec-b909-0242ac120002,'Phil gazed frantically at the swift current as it appeared intermittently through vistas in the trees while they sped along. Once across undiscovered they would be safe.' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601eee8-b517-11ec-b909-0242ac120002,c6016af4-b517-11ec-b909-0242ac120002,c601597e-b517-11ec-b909-0242ac120002,'The midshipmen lifted Maria and her brother upon the backs of their horses, cutting loose the hempen lariats with which they had been tethered.' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601efec-b517-11ec-b909-0242ac120002,c6016c16-b517-11ec-b909-0242ac120002,c6015aa0-b517-11ec-b909-0242ac120002,'Theres no time to be lost,” Phil urged excitedly as he darted ahead to where their horses had been tied. A sickening fear took possession of him until he had climbed to the top of the slope.' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601f0f0-b517-11ec-b909-0242ac120002,c6016d24-b517-11ec-b909-0242ac120002,c6015c08-b517-11ec-b909-0242ac120002,'He will as soon as he reaches shore,” Maria gasped breathlessly. The monkeys when they fall in the water always scream, so Salas knows better than to signal to all the crocodiles within hearing.”' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601f1fe-b517-11ec-b909-0242ac120002,c6015ff0-b517-11ec-b909-0242ac120002,c6015d66-b517-11ec-b909-0242ac120002,'Why hasnt he given the alarm?” Phil demanded nervously. What does it mean?”' );
INSERT INTO comment_by_post ( comment_id, post_id, user_id, comment_contents ) VALUES(c601f302-b517-11ec-b909-0242ac120002,c601625c-b517-11ec-b909-0242ac120002,c6015ec4-b517-11ec-b909-0242ac120002,'On the floor of the big room a cloth had been spread and a repast set out.' );










INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6015ff0-b517-11ec-b909-0242ac120002,c6014858-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6015ff0-b517-11ec-b909-0242ac120002,c6014db2-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6015ff0-b517-11ec-b909-0242ac120002,c6015118-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6015ff0-b517-11ec-b909-0242ac120002,c6015730-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6015ff0-b517-11ec-b909-0242ac120002,c6015aa0-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6015ff0-b517-11ec-b909-0242ac120002,c6015d66-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c601625c-b517-11ec-b909-0242ac120002,c6014718-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c601625c-b517-11ec-b909-0242ac120002,c6014bf0-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c601625c-b517-11ec-b909-0242ac120002,c6014ede-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c601625c-b517-11ec-b909-0242ac120002,c6015000-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c601625c-b517-11ec-b909-0242ac120002,c6015226-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c601625c-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c601625c-b517-11ec-b909-0242ac120002,c6015866-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c601625c-b517-11ec-b909-0242ac120002,c601597e-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c601625c-b517-11ec-b909-0242ac120002,c6015c08-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c601625c-b517-11ec-b909-0242ac120002,c6015d66-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016388-b517-11ec-b909-0242ac120002,c6014718-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016388-b517-11ec-b909-0242ac120002,c6014bf0-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016388-b517-11ec-b909-0242ac120002,c6014db2-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016388-b517-11ec-b909-0242ac120002,c6014ede-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016388-b517-11ec-b909-0242ac120002,c6015000-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016388-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016388-b517-11ec-b909-0242ac120002,c6015866-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016388-b517-11ec-b909-0242ac120002,c601597e-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016388-b517-11ec-b909-0242ac120002,c6015c08-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016388-b517-11ec-b909-0242ac120002,c6015d66-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c60164aa-b517-11ec-b909-0242ac120002,c6015000-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c60164aa-b517-11ec-b909-0242ac120002,c6015226-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c60164aa-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c60164aa-b517-11ec-b909-0242ac120002,c6015866-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c60165e0-b517-11ec-b909-0242ac120002,c6014858-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c60165e0-b517-11ec-b909-0242ac120002,c6014db2-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c60165e0-b517-11ec-b909-0242ac120002,c6015118-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c60165e0-b517-11ec-b909-0242ac120002,c6015730-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c60165e0-b517-11ec-b909-0242ac120002,c6015aa0-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c60165e0-b517-11ec-b909-0242ac120002,c6015d66-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016702-b517-11ec-b909-0242ac120002,c6014718-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016702-b517-11ec-b909-0242ac120002,c6014bf0-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016702-b517-11ec-b909-0242ac120002,c6014db2-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016702-b517-11ec-b909-0242ac120002,c6014ede-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016702-b517-11ec-b909-0242ac120002,c6015000-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016702-b517-11ec-b909-0242ac120002,c6015226-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016702-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016702-b517-11ec-b909-0242ac120002,c6015866-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016702-b517-11ec-b909-0242ac120002,c601597e-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016702-b517-11ec-b909-0242ac120002,c6015c08-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016702-b517-11ec-b909-0242ac120002,c6015d66-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016810-b517-11ec-b909-0242ac120002,c6014718-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016810-b517-11ec-b909-0242ac120002,c6014bf0-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016810-b517-11ec-b909-0242ac120002,c6014db2-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016810-b517-11ec-b909-0242ac120002,c6014ede-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016810-b517-11ec-b909-0242ac120002,c6015000-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016810-b517-11ec-b909-0242ac120002,c6015226-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016810-b517-11ec-b909-0242ac120002,c6015866-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016810-b517-11ec-b909-0242ac120002,c6015c08-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016810-b517-11ec-b909-0242ac120002,c6015d66-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016af4-b517-11ec-b909-0242ac120002,c6015000-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016af4-b517-11ec-b909-0242ac120002,c6015226-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016af4-b517-11ec-b909-0242ac120002,c6015866-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016c16-b517-11ec-b909-0242ac120002,c6014858-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016c16-b517-11ec-b909-0242ac120002,c6014db2-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016c16-b517-11ec-b909-0242ac120002,c6015118-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016c16-b517-11ec-b909-0242ac120002,c6015730-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016c16-b517-11ec-b909-0242ac120002,c6015aa0-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016c16-b517-11ec-b909-0242ac120002,c6015d66-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016d24-b517-11ec-b909-0242ac120002,c6014bf0-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016d24-b517-11ec-b909-0242ac120002,c6014db2-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016d24-b517-11ec-b909-0242ac120002,c6015226-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016d24-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016d24-b517-11ec-b909-0242ac120002,c6015866-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016d24-b517-11ec-b909-0242ac120002,c601597e-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016d24-b517-11ec-b909-0242ac120002,c6015c08-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016d24-b517-11ec-b909-0242ac120002,c6015d66-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016e3c-b517-11ec-b909-0242ac120002,c6014718-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016e3c-b517-11ec-b909-0242ac120002,c6014bf0-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016e3c-b517-11ec-b909-0242ac120002,c6014db2-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016e3c-b517-11ec-b909-0242ac120002,c6014ede-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016e3c-b517-11ec-b909-0242ac120002,c6015000-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016e3c-b517-11ec-b909-0242ac120002,c6015226-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016e3c-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016e3c-b517-11ec-b909-0242ac120002,c6015866-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016e3c-b517-11ec-b909-0242ac120002,c601597e-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016e3c-b517-11ec-b909-0242ac120002,c6015c08-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016e3c-b517-11ec-b909-0242ac120002,c6015d66-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016f4a-b517-11ec-b909-0242ac120002,c6015000-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016f4a-b517-11ec-b909-0242ac120002,c6015226-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016f4a-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6016f4a-b517-11ec-b909-0242ac120002,c6015866-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017062-b517-11ec-b909-0242ac120002,c6014858-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017062-b517-11ec-b909-0242ac120002,c6015118-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017062-b517-11ec-b909-0242ac120002,c6015730-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017062-b517-11ec-b909-0242ac120002,c6015aa0-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017062-b517-11ec-b909-0242ac120002,c6015d66-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c60171fc-b517-11ec-b909-0242ac120002,c6014718-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c60171fc-b517-11ec-b909-0242ac120002,c6014bf0-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c60171fc-b517-11ec-b909-0242ac120002,c6014db2-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c60171fc-b517-11ec-b909-0242ac120002,c6015000-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c60171fc-b517-11ec-b909-0242ac120002,c6015226-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c60171fc-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c60171fc-b517-11ec-b909-0242ac120002,c6015866-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c60171fc-b517-11ec-b909-0242ac120002,c601597e-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c60171fc-b517-11ec-b909-0242ac120002,c6015c08-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c60171fc-b517-11ec-b909-0242ac120002,c6015d66-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017364-b517-11ec-b909-0242ac120002,c6014718-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017364-b517-11ec-b909-0242ac120002,c6014bf0-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017364-b517-11ec-b909-0242ac120002,c6014db2-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017364-b517-11ec-b909-0242ac120002,c6014ede-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017364-b517-11ec-b909-0242ac120002,c6015000-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017364-b517-11ec-b909-0242ac120002,c6015226-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017364-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017364-b517-11ec-b909-0242ac120002,c6015866-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017364-b517-11ec-b909-0242ac120002,c601597e-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c601762a-b517-11ec-b909-0242ac120002,c6015000-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c601762a-b517-11ec-b909-0242ac120002,c6015226-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c601762a-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c601762a-b517-11ec-b909-0242ac120002,c6015866-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c601774c-b517-11ec-b909-0242ac120002,c6014858-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c601774c-b517-11ec-b909-0242ac120002,c6014db2-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c601774c-b517-11ec-b909-0242ac120002,c6015118-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c601774c-b517-11ec-b909-0242ac120002,c6015730-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c601774c-b517-11ec-b909-0242ac120002,c6015aa0-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c601774c-b517-11ec-b909-0242ac120002,c6015d66-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017864-b517-11ec-b909-0242ac120002,c6014718-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017864-b517-11ec-b909-0242ac120002,c6014bf0-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017864-b517-11ec-b909-0242ac120002,c6014db2-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017864-b517-11ec-b909-0242ac120002,c6014ede-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017864-b517-11ec-b909-0242ac120002,c6015000-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017864-b517-11ec-b909-0242ac120002,c6015226-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017864-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017864-b517-11ec-b909-0242ac120002,c6015866-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017864-b517-11ec-b909-0242ac120002,c601597e-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017864-b517-11ec-b909-0242ac120002,c6015c08-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017864-b517-11ec-b909-0242ac120002,c6015d66-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017972-b517-11ec-b909-0242ac120002,c6014718-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017972-b517-11ec-b909-0242ac120002,c6014bf0-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017972-b517-11ec-b909-0242ac120002,c6014ede-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017972-b517-11ec-b909-0242ac120002,c6015000-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017972-b517-11ec-b909-0242ac120002,c6015226-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017972-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017972-b517-11ec-b909-0242ac120002,c601597e-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017972-b517-11ec-b909-0242ac120002,c6015c08-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017972-b517-11ec-b909-0242ac120002,c6015d66-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017a80-b517-11ec-b909-0242ac120002,c6015000-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017a80-b517-11ec-b909-0242ac120002,c6015226-b517-11ec-b909-0242ac120002,true);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017a80-b517-11ec-b909-0242ac120002,c6015348-b517-11ec-b909-0242ac120002,false);
INSERT INTO vote ( post_id, user_id, vote_type ) VALUES(c6017a80-b517-11ec-b909-0242ac120002,c6015866-b517-11ec-b909-0242ac120002,true);




