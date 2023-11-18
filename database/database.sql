
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
	email VARCHAR(255) NOT NULL check (email like '%@%'),
    password_hash VARCHAR(255) NOT NULL
);


CREATE TABLE blog_posts (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES users(user_id)
);


-- Data for the users table
INSERT INTO users (username, email, password_hash) VALUES
('JohnDoe', 'john.doe@email.com', 'hash1'),
('AliceSmith', 'alice.smith@email.com', 'hash2'),
('BobJohnson', 'bob.johnson@email.com', 'hash3'),
('EmilyBrown', 'emily.brown@email.com', 'hash4'),
('DanielClark', 'daniel.clark@email.com', 'hash5'),
('OliviaWhite', 'olivia.white@email.com', 'hash6'),
('MichaelLee', 'michael.lee@email.com', 'hash7'),
('SophiaTaylor', 'sophia.taylor@email.com', 'hash8'),
('WilliamHill', 'william.hill@email.com', 'hash9'),
('EmmaAnderson', 'emma.anderson@email.com', 'hash10'),
('MatthewWard', 'matthew.ward@email.com', 'hash11'),
('AvaTaylor', 'ava.taylor@email.com', 'hash12'),
('ChristopherMoore', 'christopher.moore@email.com', 'hash13'),
('GraceMiller', 'grace.miller@email.com', 'hash14'),
('AndrewDavis', 'andrew.davis@email.com', 'hash15'),
('EllaJackson', 'ella.jackson@email.com', 'hash16'),
('JamesSmith', 'james.smith@email.com', 'hash17'),
('SophieBaker', 'sophie.baker@email.com', 'hash18'),
('BenjaminJones', 'benjamin.jones@email.com', 'hash19'),
('LilyJohnson', 'lily.johnson@email.com', 'hash20');

-- Data for the blog_posts table
INSERT INTO blog_posts (title, content, author_id) VALUES
('Exploring the Wonders of Machine Learning', 'In this post, we delve into the fascinating world of machine learning and its applications.', 1),
('The Art of Culinary Delights', 'Join me on a culinary journey as we explore unique recipes and cooking techniques.', 2),
('Traveling the Globe: A Personal Perspective', 'Sharing my travel experiences from different parts of the world and the lessons learned along the way.', 3),
('Unraveling the Mysteries of Astrophysics', 'Let\'s explore the cosmos and discuss the latest discoveries in the field of astrophysics.', 4),
('Navigating the Startup Ecosystem', 'Insights and challenges faced while navigating the dynamic landscape of startup entrepreneurship.', 5),
('A Glimpse into Historical Architecture', 'Discovering the beauty and history behind iconic architectural landmarks from around the world.', 6),
('The Melodies of Jazz: A Musical Journey', 'Exploring the rich history and diverse styles of jazz music that have influenced generations.', 7),
('Balancing Work and Life: Tips for a Healthy Lifestyle', 'Practical tips and advice on achieving a healthy work-life balance in today\'s fast-paced world.', 8),
('Environmental Conservation: Small Actions, Big Impact', 'Discussing the importance of individual contributions to environmental conservation and sustainability.', 9),
('From Literature to Cinema: Adapting Classic Novels', 'Analyzing the art of adapting classic literature into captivating cinematic experiences.', 10),
('Understanding Quantum Computing', 'Delving into the principles of quantum computing and its potential to revolutionize the world of information processing.', 11),
('Fitness and Wellness: A Holistic Approach', 'Sharing insights into maintaining physical and mental well-being through a holistic approach to fitness.', 12),
('Art and Creativity: Expressing the Inexpressible', 'Exploring the world of art and its ability to convey emotions and perspectives beyond words.', 13),
('Innovation in Tech: Trends Shaping the Future', 'Examining the latest technological trends that are shaping the future of innovation and development.', 14),
('Mindfulness in a Digital Age', 'Discussing the importance of mindfulness practices in the midst of a rapidly advancing digital age.', 15),
('Exploring the Marvels of Marine Biology', 'Diving deep into the wonders of marine life and the crucial role of marine biology in conservation efforts.', 16),
('The Evolution of Fashion Through the Decades', 'A journey through the evolution of fashion, from the iconic styles of the past to contemporary trends.', 17),
('Culinary Adventures: Tasting the World\'s Cuisines', 'Embarking on a culinary adventure to savor the diverse and delicious cuisines from different cultures.', 18),
('Space Exploration: Dreams of the Final Frontier', 'Dreaming of the possibilities and challenges of future space exploration endeavors.', 19),
('Inspiring Women in STEM', 'Celebrating the achievements and contributions of women in science, technology, engineering, and mathematics.', 20);


/*
POST /api/blog - vytvoření nového blog postu. Blog post byste museli posílat ve formátu JSON (konkretní specifikace je na vás, musí ale být netriviální, t.j. jeden blog post musí obsahovat alespoň samotný kontent, datum vytváření a jméno autora). Po vytvoření blog postu a jeho přidání do db byste měli vrátit identifikátor nově vytvořeného objektu;
GET /api/blog - zobrazení všech blog postů přítomných v db;
GET /api/blog/blogId - zobrazení blog postu odpovídajícího uvedenému identifikátoru. Pokud takovýto blog post neexistuje, vygenerujte správnou chybu;
DELETE /api/blog/blogId - smazaní blog postu odpovídajícího uvedenému identifikátoru. Pokud takovýto blog post neexistuje, vygenerujte správnou chybu;
PATCH /api/blog/blogId - častečný update blog postu odpovídajícího uvedenému identifikátoru. Pokud takovýto blog post neexistuje, vygenerujte správnou chybu.
*/