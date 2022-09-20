// Mitchell Bath Topic 3 Design

// this statement serves query 1
CREATE TABLE multimedia.follows (
    followerID int,
    userID int,
    PRIMARY KEY (userID)
);

// this statement serves query 1
CREATE TABLE multimedia.user (
    userID int,
    username int,
    active boolean,
    firstname text,
    lastname text,
    bio text,
    PRIMARY KEY (username, userID)
);

// this statement serves query 4 & 5
CREATE TABLE multimedia.content (
    mediaID UUID,
    type text,
    URL text,
    alt_text text,
    PRIMARY KEY (mediaID, URL, type)
);

// this statement serves query 2
CREATE TABLE multimedia.post (
    postID int,
    text_contents text,
    created datetime,
    updated datetime,
    privacy text,
    PRIMARY KEY (postID)
);

// this statement serves query 3
CREATE TABLE multimedia.interactionByCommentTime (
    interactionID UUID,
    type text,
    comment_contents text,
    created datetime,
    PRIMARY KEY ((interactionID, created), type)
) WITH CLUSTERING ORDER BY (created);

// this statement serves query 2
CREATE TABLE multimedia.interaction (
    interactionID UUID,
    type text,
    comment_contents text,
    created datetime,
    PRIMARY KEY (interactionID)
);

// this statement serves query 5
CREATE TABLE multimedia.post (
    postID int,
    text_contents text,
    created datetime,
    updated datetime,
    privacy text,
    PRIMARY KEY (postID, created)
) WITH CLUSTERING ORDER BY (created);