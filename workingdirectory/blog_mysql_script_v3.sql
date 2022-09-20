-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema blog
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema blog
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `blog` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `blog` ;

-- -----------------------------------------------------
-- Table `blog`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `bio` VARCHAR(300) NULL DEFAULT NULL,
  `social_media` VARCHAR(45) NULL DEFAULT NULL,
  `created_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE,
  UNIQUE INDEX `user_name_UNIQUE` (`user_name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 1020
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blog`.`post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`post` (
  `post_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NULL DEFAULT NULL,
  `title` VARCHAR(45) NULL DEFAULT NULL,
  `post_content` TEXT NULL DEFAULT NULL,
  `created_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `user_id_post_fk`
    FOREIGN KEY (`user_id`)
    REFERENCES `blog`.`user` (`user_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3060
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blog`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`comments` (
  `comment_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NULL DEFAULT NULL,
  `post_id` INT NULL DEFAULT NULL,
  `comment` TEXT NULL DEFAULT NULL,
  `created_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  UNIQUE INDEX `comment_id_UNIQUE` (`comment_id` ASC) VISIBLE,
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  INDEX `post_id_idx` (`post_id` ASC) VISIBLE,
  CONSTRAINT `post_id_comments_fk`
    FOREIGN KEY (`post_id`)
    REFERENCES `blog`.`post` (`post_id`),
  CONSTRAINT `user_id_comments_fk`
    FOREIGN KEY (`user_id`)
    REFERENCES `blog`.`user` (`user_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5112
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blog`.`votes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`votes` (
  `post_id` INT NULL DEFAULT NULL,
  `user_id` INT NULL DEFAULT NULL,
  `type` TINYINT(1) NULL DEFAULT NULL,
  INDEX `post_id_idx` (`post_id` ASC) VISIBLE,
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `post_id_votes_fk`
    FOREIGN KEY (`post_id`)
    REFERENCES `blog`.`post` (`post_id`),
  CONSTRAINT `user_id_votes_fk`
    FOREIGN KEY (`user_id`)
    REFERENCES `blog`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- INSERT statements for all tables
-- -----------------------------------------------------


INSERT INTO `blog`.`user` (`user_id`, `user_name`, `email`, `first_name`, `last_name`, `bio`, `social_media`) VALUES ('1001','JC_1794','johncook1209@xyz.com','John','Cook','Coding is fun','https://www.facebook.com/');
INSERT INTO `blog`.`user` (`user_id`, `user_name`, `email`, `first_name`, `last_name`, `bio`, `social_media`) VALUES ('1002','OC_1568','ocruz1278@xyz.com','Oliver','Cruz','Love life','https://twitter.com/?lang=en');
INSERT INTO `blog`.`user` (`user_id`, `user_name`, `email`, `first_name`, `last_name`, `bio`, `social_media`) VALUES ('1003','NP_1841','Noah12park@xyz.com','Noah','Parker','Rapper/Influencer','https://www.instagram.com/');
INSERT INTO `blog`.`user` (`user_id`, `user_name`, `email`, `first_name`, `last_name`, `bio`, `social_media`) VALUES ('1004','PL_1087','plopo135@xyz.com','Patricia','Lopez','Actor/Singer','https://in.pinterest.com/');
INSERT INTO `blog`.`user` (`user_id`, `user_name`, `email`, `first_name`, `last_name`, `bio`, `social_media`) VALUES ('1005','RM_1498','rose189@xyz.com','Rose','Miller','Influencer','https://www.facebook.com/');
INSERT INTO `blog`.`user` (`user_id`, `user_name`, `email`, `first_name`, `last_name`, `bio`, `social_media`) VALUES ('1006','AD_1578','ameliad@xyz.com','Amelia','Davis','Lifestyle | Travel | Fun','https://www.instagram.com/');
INSERT INTO `blog`.`user` (`user_id`, `user_name`, `email`, `first_name`, `last_name`, `bio`, `social_media`) VALUES ('1007','BJ_1029','brynjacksonsss102@xyz.com','Bryn','Jackson','Pet Lover','https://twitter.com/?lang=en');
INSERT INTO `blog`.`user` (`user_id`, `user_name`, `email`, `first_name`, `last_name`, `bio`, `social_media`) VALUES ('1008','SB_1733','sophoBugs74@xyz.com','Sophia','Bugrara','Entrepreneur','https://in.pinterest.com/');
INSERT INTO `blog`.`user` (`user_id`, `user_name`, `email`, `first_name`, `last_name`, `bio`, `social_media`) VALUES ('1009','AH_1236','ALexusH1201@xyz.com','Alexus','Hale','Technology Enthusiast','https://www.instagram.com/');
INSERT INTO `blog`.`user` (`user_id`, `user_name`, `email`, `first_name`, `last_name`, `bio`, `social_media`) VALUES ('1010','FT_1152','farri210@xyz.com','Farris','Tuffin','Dancer | Yoga is Life','https://www.facebook.com/');
INSERT INTO `blog`.`user` (`user_id`, `user_name`, `email`, `first_name`, `last_name`, `bio`, `social_media`) VALUES ('1011','CB_1526','chestB1098@xyz.com','Chester','Brown','Your small action can bring a great change | Environmentalist','https://in.pinterest.com/');
INSERT INTO `blog`.`user` (`user_id`, `user_name`, `email`, `first_name`, `last_name`, `bio`, `social_media`) VALUES ('1012','LE_1202','LiamEE155@xyz.com','Liam','Evans','Influencer','https://www.instagram.com/');
INSERT INTO `blog`.`user` (`user_id`, `user_name`, `email`, `first_name`, `last_name`, `bio`, `social_media`) VALUES ('1013','AH_1070','AsherR189@xyz.com','Asher','Hall','Personal Trainer','https://twitter.com/?lang=en');
INSERT INTO `blog`.`user` (`user_id`, `user_name`, `email`, `first_name`, `last_name`, `bio`, `social_media`) VALUES ('1014','DN_1260','DavisNels129@xyz.com','David','Nelson','Animal Lover/ Donate percentage of sales to wildlife in masaimara','https://in.pinterest.com/');
INSERT INTO `blog`.`user` (`user_id`, `user_name`, `email`, `first_name`, `last_name`, `bio`, `social_media`) VALUES ('1015','JS_1856','JenniferScott1087@xyz.com','Jennifer','Scott','Check out my latest blog post/ www.tinyurl.com','https://twitter.com/?lang=en');
INSERT INTO `blog`.`user` (`user_id`, `user_name`, `email`, `first_name`, `last_name`, `bio`, `social_media`) VALUES ('1016','CG_1059','celila167@xyz.com','Celia','Green','Pilot | Mom |Youtuber | Influencer','https://www.facebook.com/');
INSERT INTO `blog`.`user` (`user_id`, `user_name`, `email`, `first_name`, `last_name`, `bio`, `social_media`) VALUES ('1017','VL_1868','Vince555@xyz.com','Vincent','Lee','Life Goals Student','https://www.instagram.com/');
INSERT INTO `blog`.`user` (`user_id`, `user_name`, `email`, `first_name`, `last_name`, `bio`, `social_media`) VALUES ('1018','PT_1365','philli335@xyz.com','Philip','Thompson','Environmentalist | You can make a difference Watch the documentry www.tinyurl.com','https://twitter.com/?lang=en');
INSERT INTO `blog`.`user` (`user_id`, `user_name`, `email`, `first_name`, `last_name`, `bio`, `social_media`) VALUES ('1019','WY_1034','willisyo221@xyz.com','William','Young','Saying yes to new adventures','https://www.facebook.com/');

commit;

INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3001','1001','Coding Is Fun ??','Coding Basics: What is coding ? Is it fun or Boring ? Coding is just like writing a set of instructions on your computer in the order in which you want them to be executed.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3002','1001','Coding Basics','In this post we will learn about the basics of coding. How it evolved. Coding languages came into existence in the late 1950s. Initial Coding languages were Cobol, Fortran and Lisp');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3003','1002','Life Is Beautiful','Have you watched the movie Life is Beautiful ? It is one of my favourite movies. It is an amazing movie that depicts no matter how hard circumstances are but there is always hope. I the story A gentle Jewish-Italian waiter, Guido Orefice meets Dora a pretty schoolteacher, and wins her over with his full of life and funny attitude. Eventually they marry and have a son. The fight extraordinary circumstances to keep their son alive.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3004','1002','In Which Jack Hazard Makes A Hero Of Himself.','Im afraid Ill have to strike that Brooklyn place, after all,” he said as he stepped out of a Water Street ship chandlery that had advertised for a bright boy and had taken a youth on trial an hour before. But, realizing that this wasnt business, he turned away and hurried up the street.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3005','1003','New Song Out Soon','My new song will be out soon. Its called The Right One. I am sure it will bring back your memories of childhood.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3006','1004','The Song','For the rest of the week, whenever he had the chance, he kept his eye on the indicator that ticked out its monotonous song in the reception-room during business hours, and every day D. & S. advanced, sometimes with provoking slowness and sometimes with little bounds, like a boy chasing himself up a flight of stairs.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3007','1005','A Day In Paris','Paris on a bright April morning. Can any city make a brighter, braver show under a clear blue sky and a brilliant sun, the chestnuts in the Champs Elysées and Tuileries gardens bursting into bloom, the flower-market of the Madeleine a mass of color, exhaling delicious perfume, the fair purchasers in the first freshness of their spring attire, the tide of business and of pleasure at the fullest flood. It is a sight to fill any heart tolerably free from pressing anxiety with an irresistible sense of youth.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3008','1006','Travelling Alone','I wish you would come as far as Genoa with me, cried Verner, I am just appointed to the Africa, on the Mediterranean station. I hate traveling alone. Poor Dennison, who commanded her, died of a few days fever off the coast of Calabria,—caught it shooting in some marshes, and——');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3009','1007','The Lady With The Dog','But in this case there was still the diffidence, the angularity of inexperienced youth, an awkward feeling; and there was a sense of consternation as though some one had suddenly knocked at the door. The attitude of Anna Sergeyevna—the lady with the dog—to what had happened was somehow peculiar, very grave, as though it were her fall—so it seemed, and it was strange and inappropriate. Her face dropped and faded, and on both sides of it her long hair hung down mournfully; she mused in a dejected attitude like the woman who was a sinner in an old-fashioned picture.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3010','1008','Golden Rules Of Making Money','In the United States, where we have more land than people, it is not at all difficult for persons in good health to make money. In this comparatively new field there are so many avenues of success open, so many vocations which are not crowded, that any person of either sex who is willing, at least for the time being, to engage in any respectable occupation that offers, may find lucrative employment.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3011','1009','How It Works','How does it work? This question has been put to me so often by persons young and old that I have at last decided to answer it in such a manner that a much larger public than that with which I have personal acquaintance may be able to satisfy themselves as to the principles underlying many of the mechanisms met with in everyday life.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3012','1010','Little Spanish Dancer','She was one of the best dancers in her group. And why not? Her mother had been a dancer; her grandmother, too, yes, and her great-grandmother and her great-great—oh, ever so many great-grandmothers! They had all been dancers.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3013','1011','Climatic Changes','The rôle of climate in the life of today suggests its importance in the past and in the future. No human being can escape from the fact that his food, clothing, shelter, recreation, occupation, health, and energy are all profoundly influenced by his climatic surroundings. A change of season brings in its train some alteration in practically every phase of human activity. Animals are influenced by climate even more than man, for they have not developed artificial means of protecting themselves. Even so hardy a creature as the dog becomes notably different with a change of climate. The thick-haired husky of the Eskimos has outwardly little in common with the small and almost hairless canines that grovel under foot in Mexico. Plants are even more sensitive than animals and men. Scarcely a single species can flourish permanently in regions which differ more than 20°C. in average yearly temperature, and for most the limit of successful growth is 10°.[1] So far as we yet know every living species of plant and animal, including man, thrives best under definite and limited conditions of temperature, humidity, and sunshine, and of the composition and movement of the atmosphere or water in which it lives. Any departure beyond the limits means lessened efficiency, and in the long run a lower rate of reproduction and a tendency toward changes in specific characteristics. Any great departure means suffering or death for the individual and destruction for the species.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3014','1012','Reflection','With regard to the term spiritual, it may be sufficient to remark here, that he regards it as having a specific import, and maintains that in the sense of the New Testament, spiritual and natural are contradistinguished, so that what is spiritual is different {xxxi}in kind from that which is natural, and is in fact super-natural. So, too, while morality is something more than prudence, religion, the spiritual life, is something more than morality.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3015','1013','The Study Of Physiology. ','We are now to take up a new study, and in a field quite different from any we have thus far entered. Of all our other studies,—mathematics, physics, history, language,—not one comes home to us with such peculiar interest as does physiology, because this is the study of ourselves.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3016','1014','Birds In The Bush','Why do birds sing? Has their music a meaning, or is it all a matter of blind impulse? Some bright morning in March, as you go out-of-doors, you are greeted by the notes of the first robin. Perched in a leafless tree, there he sits, facing the sun like a genuine fire-worshiper, and singing as though he would pour out his very soul. What is he thinking about? What spirit possesses him?');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3017','1015','Laugh','You can laugh too much. You can be too cheerful. You can look too much on the sunny side of life. You wont believe this and neither did Bobby McTabb. But McTabb proved it out. It took the girl to help him—Kitty Duchene was her name—tall and sweet to look upon, with those pure blue eyes, dark with the beauty of violets, that go so well with hair which is brown in the shadow and gold in the sun. They proved it out together, all of a sudden. It is their story. And it will never be believed. But its the truth.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3018','1016','The Red Fairy','Once upon a time there lived a King and Queen whose children had all died, first one and then another, until at last only one little daughter remained, and the Queen was at her wits end to know where to find a really good nurse who would take care of her, and bring her up. A herald was sent who blew a trumpet at every street corner, and commanded all the best nurses to appear before the Queen, that she might choose one for the little Princess. So on the appointed day the whole palace was crowded with nurses, who came from the four corners of the world to offer themselves, until the Queen declared that if she was ever to see the half of them, they must be brought out to her, one by one, as she sat in a shady wood near the palace.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3019','1017','Language Of Love','There is no language that Love does not speak: To-day commanding and to-morrow meek, One hour laconic and the next verbose, With hope triumphant and with doubt morose, His varying moods all forms of speech employ. To give expression to his painful joy,');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3020','1018','Importance Of Climate','Since climate has so profound an influence on life today, it has presumably been equally potent at other times. Therefore few scientific questions are more important than how and why the earths climate has varied in the past, and what changes it is likely to undergo in the future. This book sets forth what appear to be the chief reasons for climatic variations during historic and geologic times. It assumes that causes which can now be observed in operation, as explained in a companion volume entitled Earth and Sun, and in such books as Humphreys Physics of the Air, should be carefully studied before less obvious causes are appealed to. It also assumes that these same causes will continue to operate, and are the basis of all valid predictions as to the weather or climate of the future.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3021','1019','Young Adventure','In these days when the old civilisation is crumbling beneath our feet, the thought of poetry crosses the mind like the dear memory of things that have long since passed away. In our passionate desire for the new era, it is difficult to refrain oneself from the commonplace practice of speculating on the effects of warfare and of prophesying all manner of novel rebirths. But it may be well for us to remember that the era which has recently closed was itself marked by a mad idealisation of all novelties. In the literary movements of the last decade —when, indeed, any movement at all has been perceptible — we have witnessed a bewildering rise and fall of methods and ideals. We were captivated for a time by the quest of the golden phrase and the accompanying cultivation of exotic emotions; and then, wearying of the pretty and the temperamental, we plunged into the bloodshot brutalities of naturalism.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3022','1001','De President Krabde Zich Achter Het Oor','Dit ongeluk heeft alle medeleden afgeschrikt en wij zouden heel licht onze invloedrijkste leden kunnen verliezen!');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3023','1001','The Start For Palilo','The Isla de Negros,” a small inter-island steamer, lay moored alongside the dock in the turbulent waters of the Pasig River, the commercial artery of the city of Manila. As the last of its cargo was noisily carried on board by a swarm of half-naked stevedores, the slender lines which held the steamer to the stone quay were cast off, and with many shrill screeches from its high treble whistle the steamer swung its blunt bow out into the strength of the current.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3024','1001','A Polite Captor','The Americans were not kept long in suspense, although to the anxious boys, huddled helplessly in the shadow of the boat, the time seemed hours until the victorious and jubilant natives moved aft, bent on annihilating those whom they believed were hiding from their search.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3025','1001','A Leak Of Military Information','Brigadier-General Wilson sat at his desk in the headquarters building at Palilo. In the spacious corridors outside orderlies hurried to and fro, carrying messages from the several officers of the staff whose offices joined that of the general.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3026','1001','Landed In Captivity','Phil was too angry and humiliated to do more than glare at the girl who had so cleverly thwarted him in his daring plan to strand the steamer. His companions had started to spring toward the coveted rifles of their enemy, but now they sank back into their seats and hopelessly looked into the menacing muzzles of these same rifles in the hands of the four aroused sentries. The girl had risen to her feet, her face flushed with excitement; she raised her hand to the natives, motioning them to put up their weapons.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3027','1001','Captain Blynn Marches','Captain Blynns restless gaze contemplated his companion from time to time as the native signaled the right trail. They were now in a narrow defile between two hills that rose precipitously to a height of over a thousand feet. Captain Blynn, as he contemplated his surroundings with a soldiers eyes, drew his revolver from its holster and laid it gently across the pommel of his saddle.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3028','1001','The Mindinao','Captain Blynn rested his tired soldiers until the cool of the evening and then the march was begun back to Palilo, carrying with them the spoils of the fight.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3029','1001','The Gunboat Coöperates','Baker is in the field and a sergeant and twenty men are holding the post,” Major Marble continued, but if the natives are in great force such a handful cannot last long.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3030','1001','The Privileges Of Rank','They was messengers, telling the gugus of the coming of the gunboat, I reckon.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3031','1001','The Katipunan Society','Sydney was beside himself with indignation when he learned of the spiteful charges of the[140] lieutenant and was for seeking him out and bestowing personal vengeance, but Phil dissuaded him from any such rash act.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3032','1001','In The Shadow Of A Suspicion','A challenge was called and answered, and the next second the door was opened from within and a native entered. Phil beheld in admiration the air of grace and fearlessness while he advanced boldly toward the startled leader.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3033','1001','A Traitor Unmasked','Come!” Captain Blynn exclaimed, starting up from his chair. He led the lads down to his carriage at the door and motioned them to enter. Then giving an address to the driver they went whirling through the narrow streets.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3034','1001','The Midshipmen Reconnoitre','The midshipmen were so utterly astonished at the actions of their fanatical enemies that they could only gasp out their surprise in one heartfelt word of relief. Then a familiar voice at their elbow awoke them from their stupefied inactivity. It was in Visayan and they turned to gaze into the impassive face of Rodriguez.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3035','1002','Unwelcome Companions','The lads indeed found themselves in an awkward predicament. Just the faintest thread really bound them to life, for they saw in the cruel expression in the eyes of the Filipino officer that nothing would delight him so much as to have these white men shot. Phil very much feared that in spite of his cordial words this boyish native had before now guessed the truth. However there was nothing to do but remain silent and inactive. Phil had a great desire to speak to Sydney in English, but he feared this dapper little Filipino might have learned enough of that language to understand what he might say.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3036','1002','Cleverly Outwitted','As Salas hand slowly drew his revolver from its holster, Phils right hand with the speed of a mongoos seizing its prey clutched the slender wrist of the outlaw; the lads left hand had moved deftly to the slack of the natives strong khaki trousers, and the next second he had raised the surprised Filipino from off his seat and held him for an instant balanced in the air.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3037','1002','A Night Of Alarm','On the threshold she stopped in startled amazement. Her slippered feet had made no sound and the door as she pushed it open caused him to glance up in annoyed surprise. She saw her father on his knees in the corner before several heavy iron-bound chests, and their opened covers displayed to her anxious eyes a great wealth of gold and silver coins. More money than her young imagination had ever dreamed of.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3038','1002','A Filipino Martyr','Phil and Sydney were hard pushed to keep up with the native as he spurred his horse forward over the dark road.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3039','1017','A Daring Plan','The exchange proposed by Espinosa was out of the question, even if Colonel Martinez had surrendered, which he had not done up to the present time; and until his sins in Luzon were forgiven Phil knew that he preferred his liberty. But this threat against Tillotsons life worried Phil. Espinosa was sufficiently cruel to carry it out, he was sure.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3040','1017','A River Expedition','After Phil and his party had gone on their hazardous mission, Sydney went aboard the gunboat to make ready for the work which had been left in his hands. He felt it keenly that he could not share this dangerous expedition, but there was some consolation in the knowledge that ONeil was with Phil.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3041','1017','A Willing Captive','The natives who are guarding us are our own men, and one of em tried to stick his bayonet in me when I asked him for some water to wash in. I wish they were not so careful of appearances,” he added with a grim smile.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3042','1018','The Struggle For The Stronghold','Several hundred natives, their weapons in hand, had gathered about their cruel leader. Every eye was turned in rapt enjoyment toward the delighting spectacle of the torture of a despised American. None save Lopez and his faithful guards had observed the glint of steel far down in the valley below. None save he discerned two small white poles creeping along above the high trees on the river[326] bank. He glanced uneasily toward the torture. Phil was on his back securely bound, while Colonel Salas held above his head a long bamboo cane filled with water.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3043','1018','The Gunboat Takes A Hand','General Wilson was becoming impatient. He had held himself well in hand to steady the officers and men under him during the trial through which they had passed so successfully. Now his anxiety was more than he could keep to himself. He rushed up to the cringing native, taking him roughly by the shoulders and crying out to him in English, a language unintelligible to the terrified prisoner.');
INSERT INTO `blog`.`post` (`post_id`, `user_id`, `title`, `post_content`) VALUES ('3044','1019','The Escaped Outlaw','Lukban was the first to recover from the stunning news that Espinosa had, by a miracle, escaped out of the Americans hands when all outlets were supposed to have been covered.');

commit;

INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5001','1011','3001','If you allow us to pass it, Ill have no mercy,” he exclaimed.');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5002','1011','3002','The Mindinao” had now emerged from the dangerous cañon and the sound of firing above became less distinct.');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5003','1011','3003','Closer and closer loomed the cañon.');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5004','1011','3004','Open fire on the left flank of the hill,” Sydney ordered.');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5005','1011','3005','There was no answer; a glance aloft showed him the crew of the gun grouped anxiously about it.');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5006','1011','3006','To add to the danger there now came the song of enemys bullets while the water near the gunboat became disturbed as if from the fall of hail.');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5007','1011','3007','Look out for the prisoner,” Sydney cried out as he saw the native, his hands on the rail, about to leap overboard. ');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5008','1011','3008','The Mindinao” had now emerged from[342] the dangerous cañon and the sound of firing above became less distinct.');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5009','1011','3009','Within ten minutes, which seemed ages to the eager Americans, the Mindinao” was anchored in the river and the troops were landed.');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5010','1011','3010','The Filipino major calmly walked forward, his hands held above his head in sign of[345] peace, and raised his voice in his native language.');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5011','1011','3011','If you will cease torturing my man,” Phil said with difficulty through his wedged jaws, I will answer your questions.”');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5012','1011','3012','So you would dictate your own terms,” he cackled. Colonel Salas, just a few cupfuls. Captain Perry seems thirsty.”');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5013','1011','3013','I choose to ask my prisoner,” the native retorted with a meaning glance at those who held Phils head turned so that he must see out of the tail of his eyes the cruel suffering of ONeil.');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5014','1011','3014','Espinosa gave a guttural order and immediately Phil was seized and forced to gaze at the revolting torture of his companion.');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5015','1011','3015','You?” he cried in unfeigned surprise. How did you get there?”');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5016','1011','3016','Phil turned his face away. He saw as through a red mist the throngs of curious natives who had quickly gathered to see their enemy slowly murdered before their eyes.');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5017','1011','3017','Espinosa gave a guttural order and immediately Phil was seized and forced to gaze at the revolting torture of his companion.');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5018','1011','3018','We shall not kill him yet,” Espinosa said, while he smiled in keen delight at the discomfited midshipman. I have promised my men a field day. ');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5019','1011','3019','Where is General Wilson?” he asked anxiously, and is it true that your gunboat is in the river?”');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5020','1011','3020','Where are your scouts?” Phil exclaimed haughtily. Ask them, not your prisoner.”');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5021','1011','3021','I choose to ask my prisoner,” the native retorted with a meaning glance at those who held Phils head turned so that he must see out of the tail of his eyes the cruel suffering of ONeil.');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5022','1002','3029','Your prisoner does not choose to answer,” the lad declared stoutly.');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5023','1002','3030','He closed his eyes and stiffened his muscle in a supreme endeavor to withstand the pain and prevent himself showing his suffering to the delighted natives.');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5024','1002','3031','Now maybe you will consider your answer—Colonel Salas, a little water may loosen his tongue,” he heard the cruel voice of Espinosa say.');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5025','1002','3032','So you would dictate your own terms,” he cackled. Colonel Salas, just a few cupfuls. Captain Perry seems thirsty.”');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5026','1002','3033','Before it is too late,” he said, will you answer my questions?”');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5027','1002','3034','Phil opened his eyes and gazed at his tormentors. Then he closed them and steeled himself to what was to come.');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5028','1002','3035','He felt his nose held securely by muscular fingers and his head thrown back, making a reservoir of his mouth, which was kept full of water.');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5029','1002','3036','He could hold his breath no longer. His blood throbbed painfully in his temples. An awful nausea overcame him, and he gasped for air.');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5030','1003','3037','Then a sharp sound as of the discharge of a cannon sounded in his ears and he fought and struggled with the strength of a score of men for the precious air.');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5031','1003','3038','The natives did not understand the lads words, but his meaning was only too plain as he snatched a rifle from the ground and led the remnant of that plucky band.');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5032','1003','3039','Let us pray for success,” the captive cried weakly. I had determined to throw myself off the cliff rather than undergo another days torture.”');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5033','1003','3040','Phil seated himself by the side of the unnerved man and begged him to be calm and reserve his strength. After a few moments he told him of the plan and his hopes for success.');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5034','1004','3041','Phil stood silently by, his mind occupied over the details of a daring plan.');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5035','1005','3042','Phil shook his head in mystery.');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5036','1005','3043','We have no news, Maria,” Phil said kindly. No, it cannot be so. It was but prompted by this cruel man to taunt you.”');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5037','1005','3044','If he had known of this attack and was alive he would have prevented it,” she exclaimed suddenly, her hope turning to dejection.');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5038','1005','3015','While they were talking the fusillade slowly diminished and soon ceased altogether and in a short time Captain Blynns voice was heard in the hall below.');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5039','1005','3016','She must not be overexcited. She is outwardly calm but her heart acts queerly. It may snap at any moment,” he had told the lads.');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5040','1005','3017','A search at once,” Phil exclaimed rising hastily from his chair; they cant have gone far with those heavy chests.”');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5041','1005','3018','While they were still at table Major Marble arrived, and was told all the news of the river.');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5042','1006','3019','Major Marble nodded his head in agreement with the views of the young navy man.');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5043','1007','3020','If we could always do what our military training dictates,” he answered sadly, this war might not have begun.”');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5044','1008','3021','I shall go up the river in an hour,” Phil[272] announced, and if the general wishes I shall be honored to have him on board.”');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5045','1009','3022','I dont know how he got there, unless——” He turned and called ONeil from the boat. ONeil, do you know anything about a native securely bound with sailor neckerchiefs?”');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5046','1009','3023','Do you know,” the captain said knowingly,[275] that he is the only prisoner captured? There wasnt a single wounded man in sight this morning. It isnt the custom of the country, you see.”');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5047','1009','3024','Phil involuntarily shuddered. How callous one becomes,” he thought, in war time. Think of maybe a hundred wounded men cruelly butchered by brother natives.”');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5048','1009','3005','The boat came quickly back and Phil took a letter from a natives hand scanning it with beating heart. For the general,” he said.');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5049','1009','3006','All watched the general break the seal and fumble with his glasses. It seemed ages before[276] he finished the few short lines and handed the letter to Captain Blynn.');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5050','1014','3007','Phil gazed frantically at the swift current as it appeared intermittently through vistas in the trees while they sped along. Once across undiscovered they would be safe.');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5051','1015','3008','The midshipmen lifted Maria and her brother upon the backs of their horses, cutting loose the hempen lariats with which they had been tethered.');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5052','1016','3009','Theres no time to be lost,” Phil urged excitedly as he darted ahead to where their horses had been tied. A sickening fear took possession of him until he had climbed to the top of the slope.');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5053','1017','3010','He will as soon as he reaches shore,” Maria gasped breathlessly. The monkeys when they fall in the water always scream, so Salas knows better than to signal to all the crocodiles within hearing.”');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5054','1018','3001','Why hasnt he given the alarm?” Phil demanded nervously. What does it mean?”');
INSERT INTO `blog`.`comments` (`comment_id`, `user_id`, `post_id`, `comment`) VALUES ('5055','1019','3002','On the floor of the big room a cloth had been spread and a repast set out.');

commit;

INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3001','1003',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3001','1006',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3001','1009',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3001','1013',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3001','1016',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3001','1018',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3002','1002',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3002','1005',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3002','1007',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3002','1008',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3002','1010',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3002','1011',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3002','1014',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3002','1015',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3002','1017',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3002','1018',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3003','1002',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3003','1005',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3003','1006',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3003','1007',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3003','1008',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3003','1011',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3003','1014',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3003','1015',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3003','1017',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3003','1018',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3004','1008',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3004','1010',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3004','1011',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3004','1014',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3005','1003',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3005','1006',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3005','1009',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3005','1013',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3005','1016',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3005','1018',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3006','1002',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3006','1005',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3006','1006',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3006','1007',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3006','1008',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3006','1010',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3006','1011',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3006','1014',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3006','1015',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3006','1017',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3006','1018',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3007','1002',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3007','1005',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3007','1006',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3007','1007',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3007','1008',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3007','1010',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3007','1014',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3007','1017',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3007','1018',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3008','1008',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3008','1010',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3008','1014',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3009','1003',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3009','1006',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3009','1009',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3009','1013',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3009','1016',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3009','1018',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3010','1005',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3010','1006',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3010','1010',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3010','1011',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3010','1014',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3010','1015',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3010','1017',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3010','1018',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3011','1002',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3011','1005',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3011','1006',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3011','1007',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3011','1008',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3011','1010',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3011','1011',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3011','1014',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3011','1015',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3011','1017',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3011','1018',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3012','1008',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3012','1010',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3012','1011',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3012','1014',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3013','1003',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3013','1009',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3013','1013',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3013','1016',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3013','1018',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3014','1002',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3014','1005',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3014','1006',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3014','1008',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3014','1010',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3014','1011',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3014','1014',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3014','1015',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3014','1017',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3014','1018',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3015','1002',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3015','1005',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3015','1006',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3015','1007',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3015','1008',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3015','1010',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3015','1011',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3015','1014',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3015','1015',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3016','1008',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3016','1010',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3016','1011',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3016','1014',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3017','1003',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3017','1006',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3017','1009',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3017','1013',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3017','1016',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3017','1018',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3018','1002',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3018','1005',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3018','1006',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3018','1007',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3018','1008',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3018','1010',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3018','1011',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3018','1014',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3018','1015',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3018','1017',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3018','1018',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3019','1002',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3019','1005',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3019','1007',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3019','1008',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3019','1010',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3019','1011',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3019','1015',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3019','1017',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3019','1018',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3020','1008',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3020','1010',1);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3020','1011',0);
INSERT INTO `blog`.`votes`(`post_id`, `user_id`, `type`) VALUES ('3020','1014',1);

commit;