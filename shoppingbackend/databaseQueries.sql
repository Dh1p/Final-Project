CREATE TABLE category (
	id int(11) NOT NULL AUTO_INCREMENT,
	name VARCHAR(50),
	description VARCHAR(255),
	image_url VARCHAR(50),
	is_active BOOLEAN,
	CONSTRAINT pk_category_id PRIMARY KEY (id) 

);

CREATE TABLE user_detail (
	id int(11) NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	role VARCHAR(50),
	enabled BOOLEAN,
	password VARCHAR(60),
	email VARCHAR(100),
	contact_number VARCHAR(15),	
	CONSTRAINT pk_user_id PRIMARY KEY(id)
);


CREATE TABLE product (
	id int(11) NOT NULL AUTO_INCREMENT,
	code VARCHAR(20),
	name VARCHAR(50),
	brand VARCHAR(50),
	description VARCHAR(255),
	unit_price DECIMAL(10,2),
	quantity INT,
	is_active BOOLEAN,
	category_id INT,
	supplier_id INT,
	purchases INT DEFAULT 0,
	views INT DEFAULT 0,
	CONSTRAINT pk_product_id PRIMARY KEY (id),
 	CONSTRAINT fk_product_category_id FOREIGN KEY (category_id) REFERENCES category (id),
	CONSTRAINT fk_product_supplier_id FOREIGN KEY (supplier_id) REFERENCES user_detail(id)
);	

-- the address table to store the user billing and shipping addresses
CREATE TABLE address (
	id int(11) NOT NULL AUTO_INCREMENT,
	user_id int,
	address_line_one VARCHAR(100),
	address_line_two VARCHAR(100),
	city VARCHAR(20),
	state VARCHAR(20),
	country VARCHAR(20),
	postal_code VARCHAR(10),
	is_billing BOOLEAN,
	is_shipping BOOLEAN,
	CONSTRAINT fk_address_user_id FOREIGN KEY (user_id ) REFERENCES user_detail (id),
	CONSTRAINT pk_address_id PRIMARY KEY (id)
);

-- the cart table to store the user cart top-level details
CREATE TABLE cart (
	id int(11) NOT NULL AUTO_INCREMENT,
	user_id int,
	grand_total DECIMAL(10,2),
	cart_lines int,
	CONSTRAINT fk_cart_user_id FOREIGN KEY (user_id ) REFERENCES user_detail (id),
	CONSTRAINT pk_cart_id PRIMARY KEY (id)
);
-- the cart line table to store the cart details

CREATE TABLE cart_line (
	id int(11) NOT NULL AUTO_INCREMENT,
	cart_id int,
	total DECIMAL(10,2),
	product_id int,
	product_count int,
	buying_price DECIMAL(10,2),
	is_available boolean,
	CONSTRAINT fk_cartline_product_id FOREIGN KEY (product_id ) REFERENCES product (id),
	CONSTRAINT pk_cartline_id PRIMARY KEY (id)
);


-- the order detail table to store the order

CREATE TABLE order_detail (
	id int(11) NOT NULL AUTO_INCREMENT,
	user_id int,
	order_total DECIMAL(10,2),
	order_count int,
	shipping_id int,
	billing_id int,
	order_date date,
	CONSTRAINT fk_order_detail_user_id FOREIGN KEY (user_id) REFERENCES user_detail (id),
	CONSTRAINT fk_order_detail_shipping_id FOREIGN KEY (shipping_id) REFERENCES address (id),
	CONSTRAINT fk_order_detail_billing_id FOREIGN KEY (billing_id) REFERENCES address (id),
	CONSTRAINT pk_order_detail_id PRIMARY KEY (id)
);

-- the order item table to store order items

CREATE TABLE order_item (
	id int(11) NOT NULL AUTO_INCREMENT,
	order_id int,
	total DECIMAL(10,2),
	product_id int,
	product_count int,
	buying_price DECIMAL(10,2),
	CONSTRAINT fk_order_item_product_id FOREIGN KEY (product_id) REFERENCES product (id),
	CONSTRAINT fk_order_item_order_id FOREIGN KEY (order_id) REFERENCES order_detail (id),
	CONSTRAINT pk_order_item_id PRIMARY KEY (id)
);





INSERT INTO category (name, description,image_url,is_active) VALUES ('Men Products', 'This is description for men products category!', 'CAT_1.png', true);
INSERT INTO category (name, description,image_url,is_active) VALUES ('Women Products', 'This is description for women products category!', 'CAT_2.png', true);
INSERT INTO category (name, description,image_url,is_active) VALUES ('Baby Products', 'This is description for baby products category!', 'CAT_3.png', true);
INSERT INTO category (name, description,image_url,is_active) VALUES ('Smartphones', 'This is description for Smartphone category!', 'CAT_4.png', true);
INSERT INTO category (name, description,image_url,is_active) VALUES ('Computers', 'This is description for Computers category!', 'CAT_5.png', true);
INSERT INTO category (name, description,image_url,is_active) VALUES ('Electronics', 'This is description for Electronics category!', 'CAT_6.png', true);
INSERT INTO category (name, description,image_url,is_active) VALUES ('Sports', 'This is description for Sports category!', 'CAT_7.png', true);
INSERT INTO category (name, description,image_url,is_active) VALUES ('Health and Beauty', 'This is description for men products category!', 'CAT_8.png', true);
INSERT INTO category (name, description,image_url,is_active) VALUES ('Home and Living', 'This is description for Home and Living category!', 'CAT_9.png', true);
INSERT INTO category (name, description,image_url,is_active) VALUES ('Books', 'This is description for Books category!', 'CAT_10.png', true);



INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('Upal', 'Wazed', 'ADMIN', true, '$2a$06$ORtBskA2g5Wg0HDgRE5ZsOQNDHUZSdpJqJ2.PGXv0mKyEvLnKP7SW', 'uwazed@gmail.com', '01713937835');
INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('Rafiqul', 'Islam', 'SUPPLIER', true, '$2a$06$bzYMivkRjSxTK2LPD8W4te6jjJa795OwJR1Of5n95myFsu3hgUnm6', 'rm@gmail.com', '9999999999');
INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('Sayeed', 'Rahman', 'SUPPLIER', true, '$2a$06$i1dLNlXj2uY.UBIb9kUcAOxCigGHUZRKBtpRlmNtL5xtgD6bcVNOK', 'sr@gmail.com', '7777777777');
INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('Hasibul', 'Alam', 'USER', true, '$2a$06$4mvvyO0h7vnUiKV57IW3oudNEaKPpH1xVSdbie1k6Ni2jfjwwminq', 'hm@gmail.com', '7777777777');




INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC123DEFX', 'Leather Jacket', 'Ralph Lauren', 'Lanvins tan-brown suede bomber jacket is designed to be worn and appreciated over the course a lifetime. Its crafted in Italy to a boxy silhouette that feels slim at the shoulders with a neat point collar, alongside two internal and two external pockets and a black satin interior. Note the contrasting red, navy, and white striped ribbed-knit back hem panel a considered finishing touch. Runs true to size', 9000, 30, true, 1, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC125DEFX', 'Cashmere Blazer', 'Ralph Lauren', 'For timeless contemporary tailoring, look to Bottega Veneta. Its black notch-lapel blazer is the smart choice for multiple occasions. It’s crafted in Italy from mid-weight woven cashmere and is cut with a single vent and single-breasted button fastening for a smart silhouette. This piece fits small to size so take one size larger', 7500, 50, true, 1, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC523DEFX', 'Cotton Blazer', 'Boglioli', 'Boglioli’s sapphire-blue blazer is an example of the label’s relaxed approach to tailoring. It’s crafted in Italy from mid-weight cotton with notch lapels and long sleeves decorated with buttons on the cuffs. The single-breasted silhouette features a chest welt pocket and front patch pockets and is tailored for a slim-fitting shape. Fits true to size', 7000, 55, true, 1, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C523DEFX', 'Wool Blazer', 'Burberry', 'Burberrys black and beige wool herringbone-tweed blazer is an unapologetic homage to traditional British style. Its tailored in Italy for a double-breasted slim fit thats accented with peak lapels, a single chest and two flapped front pockets, and finished with raw and frayed edges for modern flair', 8500, 40, true, 1, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C149DEFX', 'Bomber Jacket', 'Valentino', 'This burgundy and navy checked satin bomber jacket demonstrates Valentinos commitment to impeccable craftsmanship. Made in Italy, it features contrasting white satin sleeves, black piped seams, and an instantly recognisable light-gold tone metal Rockstud at the back of the neck. Undo the centre-front press studs to reveal a glimpse of the camouflage-print cotton-jersey lining. This slim-fitting style runs true to size', 6000, 35, true, 1, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C150DEFX', 'Leather Jacket', 'Balmain', 'Balmain reworks the classic black biker jacket with a discerning eye for detail.Its impeccably crafted from smooth mid-weight lamb leather with a large ribbed-knit collar that matches the hem.Quilted panels on the shoulders,sleeves,and lower back add to the authentic vibe,as do the light-gold tone metal off-centre double zips at the front and the zip-fastening cuffs.The fit is slim and its lined with quilted black cotton.', 12000, 20, true, 1, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C151DEFX', 'Wool Coat', 'Off-White', 'Off-Whites under-the-radar sense of cool is delivered in full in this tonal-beige and black checkered shearling coat – a key part of AW17s Seeing Things collection. The relaxed silhouette is patterned in a palette of burnt orange, beige and black, and is finished with double-breasted buttons as well as mint-green canvas ties inside. The fit is slim and true to size', 9500, 20, true, 1, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C152DEFX', 'Polo Shirt', 'Lanvin', 'Lanvins navy and pine-green striped cotton-piqué shirt is a simple style accented with sophisticated details. Its crafted in Italy to a slim-fit with a charcoal-grey double-layer faille point collar and a half-button fastening. Runs true to size', 2500, 70, true, 1, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C153DEFX', 'Polo Shirt', 'Burberry', 'Burberrys edit of casual staples is highly reliable.The house offers pieces like this Talsworth polo shirt, cut from burgundy cotton-piqué to a long-sleeved shape with ribbed jersey point collar and cuffs. Its then branded with the signature Equestrian Knight in gold-tone metal set on back felt, applied as a badge for a heritage slant. It runs true to size for a slim fit', 2500, 70, true, 1, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C154DEFX', 'Polo Shirt', 'Ermenegildo Zegna', 'Ermenegildo Zegna’s burgundy-red cotton-piqué polo shirt offers a smart twist on a off-duty essential. Its crafted to the traditional short-sleeved silhouette and contrasted with sepia-brown piping at the point collar and buttoned placket. The hem is cut straight and slit at the sides to ease the slim silhouette. Runs true to size', 2500, 70, true, 1, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C155DEFX', 'Wool Shirt', 'A.P.C.', 'A.P.C.s pared-back aesthetic is reflected in this grey and white checked Fitz shirt. Its made from woven wool-blend felt to a regular tailored shape thats finished with a small button-down point collar and chest patch pocket. Fits true to size.', 1800, 75, true, 1, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C156DEFX', 'Cotton Shirt', 'Boglioli', 'Starting life as a humble tailors shop, Italian label Boglioli now crafts precision pieces such as this single-cuff cotton-batiste shirt. Tonal-blue checks lend it depth, while classic details, such as the button-down point collar and curved hem, hark back to the brands traditional roots. Fits true to size', 2200, 75, true, 1, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C157DEFX', 'Flannel Shirt', 'Burberry', 'Burberry’s signature House check pattern is reworked in graphic lava-red, grey, and black to update a classic shirt style. It’s crafted from lightweight cotton-flannel and shaped to a regular-fitting silhouette with a point collar, curved hem, and button-fastening single cuffs. Runs true to size', 1800, 80, true, 1, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C158DEFX', 'Wool Shirt', 'Stella McCartney', 'A true heritage style, this tonal-blue, grey, and yellow checked lightweight wool shirt will become a treasured piece in your wardrobe. It has a loose, easy shape thats detailed with flapped patch pockets at the chest and a white and black embroidered hemline patch for a cool, casual note. Fits true to size', 3500, 50, true, 1, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C159DEFX', 'Cotton Shirt', 'Prada','Pradas tonal-blue shirt is offset by a digital floral print for a typically whimsical feel. Its cut in Italy from cotton-poplin to a relaxed shape with short sleeves and small side-hem slits for further ease, then subtly finished with a chest-patch pocket to continue the pared-back vibe. Fits true to size', 2200, 80, true, 1, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C160DEFX', 'Cotton Shirt', 'Prada', 'Shown on Pradas AW17 runway, this cotton-twill shirt comes with a tonal-blue and brown checked pattern for a modern tint. Its cut in Italy for a tailored, slim shape thats sharpened further with a button-down point collar, single cuffs and a curved hem. Fits true to size', 3500, 50, true, 1, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C161DEFX', 'Cotton Shirt', 'Prada', 'Shown on Pradas AW17 runway, this cotton-twill shirt comes with a tonal-blue and brown checked pattern for a modern tint. Its cut in Italy for a tailored, slim shape thats sharpened further with a button-down point collar, single cuffs and a curved hem. Fits true to size', 3000, 50, true, 1, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C162DEFX', 'Cashmere Sweater', 'Ralph Lauren', 'In a dusty-blue hue, Polo Ralph Laurens pure cashmere sweater is ideal for softening all-black looks. Its spun from premium threads to a simple, crew-neck shape for optimum styling versatility. Runs true to size', 3000, 50, true, 1, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C163DEFX', 'Wool Cardigan', 'Ralph Lauren', 'Crafted with ultra-soft lambswool and merino yarn, Polo Ralph Laurens red and black checked cardigan is warm enough to be worn in lieu of a bulky coat. Its crafted with small shawl lapels, a button-down front, and bomber-style ribbed detailing at the cuffs and hem. The fit is regular and true to size', 3000, 45, true, 1, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C164DEFX', 'Slim-leg Jeans', 'Jacob Cohën', 'Every pair of Jacob Cohën’s jeans is handcrafted in the north of Italy for unique results. This mid-rise pair is crafted from a mid-blue stretch cotton-blend that’s undergone fading and whiskering processes for a one-of-a-kind finish. They’re tailored to a slim fit and branded with a blue, red, and white striped grosgrain front loop. Runs true to size', 3500, 100, true, 1, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C165DEFX', 'Slim-leg Jeans ', 'Neuw', 'Consider Neuw Denims khaki-green Lou jeans a welcome alternative to true-blue versions on off-duty days. Theyre woven with a little stretch to ease the slim legs, and are cut to a classic mid rise with five pockets and black and silver-tone metal hardware. The black logo-engraved key ring on the front loop is a considered touch. Fits true to size', 2500, 80, true, 1, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C166DEFX', 'Slim-leg Jeans', 'Acne Studios', 'Premium denim is in intrinsic to Acne Studioss DNA, as shown with these white North jeans – part of the labels Blå Konst collection. Theyre crafted in Italy to a sleek, slim-fitting shape ideal for smart-casual days, and are accented perfectly with a silver-tone metal button. Runs true to size', 2500, 50, true, 1, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C167DEFX', 'Low-top Trainers', 'ARKK Copenhagen', 'Sleek, minimalist design is integral to ARKK Copenhagens design DNA,and these sand-beige perforated suede Eaglezero S-E15 trainers offer a particularly cool interpretation. Theyre detailed with a coordinating mesh tongue that is tipped with a logo-jacquard elasticated edge,alongside an architectural lacing system that enhances the stripped-back aesthetic.A contrasting tan-brown perforated nubuck leather heel panel completes the look.Runs true to size', 4500, 25, true, 1, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C168DEFX', 'Low-top Trainers', 'Valentino', 'Valentino’s Fly Crew low-top suede trainers are a vibrant twist on a casual weekend classic. The uppers are crafted from vibrant orange suede and finished with white leather side panels, black camouflage embossed rubber soles, and a silver-tone Rockstud-embellished heel trim', 2500, 40, true, 1, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C169DEFX', 'Leather Shoes', 'Prada', 'Pradas commitment to exquisite Italian craftsmanship is demonstrated with these rich oxblood-burgundy shoes. Theyre designed from smooth high-shine leather to a squared round-toe shape thats detailed with classic oxford wingtip perforations and a double monk-strap fastening, complete with silver-tone metal buckles. Fits true to size', 8500, 25, true, 1, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C170DEFX', 'High-top Trainers', 'Fear Of God', 'These Military trainers, launched in 2016, are Fear of God’s first footwear style and embody the labels streetwear aesthetic. This peppercorn-grey pair are crafted in Italy from neoprene to a round-toe, high-top silhouette – evoking an army boot – and set on a white raised midsole with a saw-edge sole. The black grosgrain-trimmed edges define the style and they fasten with a lace-up front and Velcro fastening ankle strap. They run true to size', 9500, 15, true, 1, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C171DEFX', 'Low-top Trainers', 'Eytys', 'Eytyss Wave trainers are a play on 1990s skate shoes, and here they’re reimagined in tan-brown suede for AW17. The round-toe, low-top silhouette has a black wave-edged rubber sole that’s textured to resemble skateboard grip detailing, while a fuzzy black faux calf-hair heel counter adds a contemporary finish.Fits true to size', 3500, 50, true, 1, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C172DEFX', 'Bravur Watch', 'Bravur', 'Bravurs BW102 watch is crafted from gold-plated stainless steel, engraved with an individual serial number at the back, while the tan-brown vegetable-tanned Swedish leather strap is attached with a logo-engraved deployment buckle fastening. The white dial features matte-black numbers and hands with an ETA F04.111 Quartz movement, and is protected by an anti-reflective domed sapphire crystal glass, water-resistant up to 50 metres', 7500, 35, true, 1, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C173DEFX', 'Leather Watch', 'Larsson & Jennings', 'Larsson & Jennings collaborates with New York-based label Rochambeau to craft this charcoal-grey Saxon watch. A fusion of each of the labels precise and urban aesthetics, it features a black brass dial within an unconventional matte-black stainless-steel case and has a durable twill strap thats designed by the long-established American Woolen company', 8500, 35, true, 1, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C174DEFX', 'Stainless-steel watch', 'Larsson & Jennings', ' Larsson & Jennings’s black Saxon watch is a standout example of the brands contemporary minimalism. Its crafted from matte stainless steel and smooth vegetable-tanned leather, and features a Swiss movement that makes it a considered choice for everyday wear. Note the crystal sapphire glass case – it minimises reflection and ensures supreme clarity', 6500, 30, true, 1, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C175DEFX', 'Aviator Glasses', 'Saint Laurent', 'Aviator frames reign supreme this season, and this black rendition by Saint Laurent is a sleek pick. They are Italian crafted from metal to a classic silhouette thats inlaid with clear lenses – swap them for your prescription pair – and finished with acetate tips', 2500, 45, true, 1, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C176DEFX', 'Square-frame Sunglasses', 'Cutler and Gross', 'Light-blue tinted lenses lend a modern edge to Cutler and Grosss premium 1267 sunglasses. Theyre crafted from luxurious palladium-plated stainless steel in the labels Italian workshop, and shaped with chunky square frames that are joined by an aviator-style double bridge. The lightweight, slender arms and adjustable ceramic nosepads ensure optimum comfort', 2200, 35, true, 1, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C177DEFX', 'Round-frame Sunglasses', 'Gucci', 'Gucci black acetate sunglasses offer an easy way to elevate simple summer looks. Theyre crafted in Italy with round frames that are defined by a keyhole bridge, and finished with a contrasting top bar in dark-tortoiseshell acetate and gold-tone metal. Charcoal-black tinted lenses ensure a refined finish', 2500, 40, true, 1, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C178DEFX', 'Canvas Backpack', 'Junya Watanabe', 'Look to Junya Watanabe for a creative and urban twist on everyday pieces, like this lava-red and black canvas and PVC backpack. Part of a collaboration with outdoor specialists Seil Marschall, its host to a multitude of practical details, including two adjustable and padded shoulder straps, and zip closures on the top and bottom, ensuring easy access whatever the angle', 3500, 15, true, 1, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C179DEFX', 'Leather Backpack', 'Stella McCartney', 'Stella McCartneys second menswear collection sees staple pieces reworked in a luxe new guise; this black faux-leather backpack included. Its crafted to a spacious, utilitarian frame with a drawstring fastening beneath the front flap, and trimmed with a curb chain that nods to the iconic detailing of the labels womenswear line', 5500, 25, true, 1, 1, 0, 0 );






INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC200DEFX', 'Acino Coat', 'Weekend','In a bold lava-red hue, Weekend Max Maras double-breasted Acino coat is ideal for a statement that is both sartorial and of colour. Crafted from a mid-weight wool, its tailored to a slim fit with a traditional point collar, decorative front flap pockets, and a burnt-orange satin-twill half lining. Style over neutral separates for a standout finish', 8500, 35, true, 2, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC201DEFX', 'Wool Coat ', 'Étoile','New for Pre-AW17, Isabel Marant Étoiles khaki-green and black Gino checked coat is the sort of piece that makes you wish for cooler weather. Its crafted from a heavyweight wool-blend and shaped with a shawl collar and slanted pockets trimmed with leather. Its unlined, so layer it over a T-shirt now and chunky sweaters come autumn', 3500, 50, true, 2, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC202DEFX', 'Notch-lapel Coat', 'Fendi', 'Fendi puts a fresh spin on a classic with this black and beige checked jacquard coat. Its tailored with wide notch lapels and a belt which reveals a flash of lemon-yellow on the reverse side, and is embellished with faux-pearl studs bordering the black leather patch pockets. Belt yours over restrained separates', 6500, 30, true, 2, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC203DEFX', 'Pulled Coat ', 'Balenciaga','A number of asymmetric tailored coats sashayed down Balenciagas AW17 runway, but this black wool-felt Pulled Feminine style is one of the most wearable. Its supremely crafted in Italy with rounded notch lapels and cropped sleeves, and features swinging side panels that lend the weighty fabric an enhanced sense of movement. Skinny jeans will be the perfect anchor', 7500, 25, true, 2, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC204DEFX', 'Wool Blazer ', 'Sies Marjan', 'Sies Marjan’s Resort 2018 collection puts a contemporary spin on tailoring. This turquoise Terry blazer is crafted in the USA from a crinkled wool-blend with notch lapels and long sleeves. It’s tailored for a relaxed silhouette which can be cinched at the waist with the buckle-fastening belt. Pair it with the label’s matching trousers and stiletto heels for a whimsical approach to evening attire', 5000, 35, true, 2, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC205DEFX', 'Leather Jacket ', 'Raey', 'Theres nothing like a black leather biker jacket to bring instant edge to an everyday look, and Raeys new-season design is one of the best. The slightly oversized shape is ideal for layering, while the gently tumbled finish lends it a lived-in feel. Its a foolproof option with jeans and will also bring tough aplomb to a midi dress', 7500, 55, true, 2, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC206DEFX', 'Wesley Blazer' , 'Gabriela Hearst' , 'Gabriela Hearst imbues her collections with a country-via-city aesthetic. This light-pink Wesley blazer is tailored in Italy to a single-breasted silhouette with notch lapels, button-fastening shoulder epaulettes, and flapped patch pockets, and finished with raw fringed edges. The satin lining ensures a clean drape. Complete a sophisticated working-week ensemble with the coordinating midi-skirt, elevating on block-heels after hours', 4500, 50, true, 2, 2, 0, 0 );
 
INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC207DEFX', 'Giralda Jacket', 'Max Mara' , 'Max Mara offers a contemporary approach to tailored separates. This ivory Giralda jacket is crafted from wool-blend crepe with a collarless round neck and long sleeves with slits at the cuffs. The front is embellished with a ruffled waterfall panel and darts at the waistband accentuate the neat shape. Pair it with cropped trousers and muted accessories for a sophisticated ensemble', 2500, 70, true, 2, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC208DEFX', 'Floral-devoré Dress', 'Pilotto', 'Peter Pilotto’s experimental fabrics add a touch of femininity to sculptural silhouettes. This tonal-orange dress is crafted from velvet floral-devore and cut with an elegant high neck and short fluted sleeves. Asymmetric tiered panels swirl around the midi-length skirt, which ends in an asymmetric hem – watch how it sways with every step. Try yours with metallic accessories for your next event' , 4500, 80, true, 2, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC209DEFX', 'Fiona Shirtdress', 'Altuzarra' , 'Alturzarras cream and black pinstriped Fiona shirtdress offers a sophisticated take on an inherently casual style. It falls loosely over the body into a softly pleated hem with a coordinating buckled belt to define the waist, and is finished with softly fluted cuffs that are framed with matching straps. Style it for a lunch date with boots or lace-up sandals', 3500, 50, true, 2, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC210DEFX', 'T-shirt Dress', 'Marques Almeida','Work Marques Almeidas off-kilter aesthetic with this biscuit-beige cotton-blend T-shirt dress. The multicoloured floral-jacquard pattern could have been taken straight from a vintage wallpaper design, while fraying raw edges – a designer signature – heighten the grungy feel. Balance the boxy, thigh-skimming silhouette with chunky flats', 1500, 90, true, 2, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC211DEFX', 'Satin Top', 'Rochas', 'Rochass lava-red evening top is crafted in Italy from duchess-satin, cut to a boxy silhouette. A multicoloured crystal-embellished dragonfly appliqué counteracts the loose fit for a feminine flourish. Team it with cropped trousers and metallic slingbacks for a day-to-night city ensemble' , 750, 95, true, 2, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC212DEFX', 'Leather Backpack', 'Loewe','Loewe’s Midnight backpack ticks all the boxes for effortless, trend-proof cool. Crafted from the finest quality calf leather and detailed with handpainted edges, it’s accented with contrasting tan-brown leather and gold-tone metal hardware. The versatile straps means it can be worn a number of ways – try it over the shoulders for a particularly chic city look', 2500, 50, true, 2, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC213DEFX', 'Leather Backpack', 'Fendi','The sporty feel of Pre-AW17s essential backpack is twisted with whimsical detailing at Fendi. This white calf-leather style is decorated with colourful Flowerland motifs and toughened with an array of silver and gold-tone metal studs. The miniature shape makes it perfect for trips to the city – simply modify the two straps to your desired fit', 2500, 50, true, 2, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC214DEFX', 'Leather Backpack', 'Fendi', 'Fendis smooth black leather mini backback will bring a touch of colour to day and night looks. This Italian-crafted design is appliquéd with rainbow-hued fox-fur pompoms and refined with slick silver-tone metal accents, like the D-ring embellishment on the front flap. Let the sliding curb-chain and leather-trimmed shoulder straps swing from your shoulders', 2000, 50, true, 2, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC215DEFX', 'Leather Backpack', 'Anya Hindmarch' , 'Inject Anya Hindmarchs irreverent mood into everyday looks with this Italian-crafted taupe-grey shearling backpack. Its punctuated with black and white googly Eyes at the front pocket and refined with tonal leather panels and gold-tone metal zips with playful tassel trims. Watch how it instantly peps up a classic sweater and jeans combo', 2500, 25, true, 2, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC216DEFX', 'Embroidered Flats', 'Aquazzura','Aquazurras hyper-feminine aesthetic is twisted with artisanal nuances for Pre-AW17 with the assistance of interior company de Gournay. These pink Love flats are decorated with softly hued wallpaper-esque embroidery and swishing tassels that nod to the latter labels penchant for vintage designs. With a small gold-tone heel and wraparound ankle ties, theyre a comfortable way of bringing further impact to a colour-block dress', 2200, 50, true, 2, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC217DEFX', 'Satin Mules', 'Jimmy Choo','Jimmy Choos black satin Myla mules typify easy opulence. The clear Swarovski-crystal and faux-pearl embellishment lends a touch of glamour, while the wide enveloping front strap and mid-high block heel ensure they will work around the clock. Slip them on with contemporary cropped trousers and asymmetric dresses', 3500, 40, true, 2, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC218DEFX', 'Leather Slides', 'Stella McCartney','Stella McCartney transfers her signature Falabella design to this pair of tan-brown slides. They are crafted from premium eco-conscious faux-leather, and the wide front strap features a gold-tone metal curb chain embellishment thats handwoven with faux-leather laces. Slip them on to ground structured silhouettes', 2200, 50, true, 2, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC219DEFX', 'Embellished Earrings ', 'Valentino','Square-cut drops of veined turquoise lend Valentinos antiqued silver-tone earrings a note of exoticism. Made in Italy, the geometric-shaped drop is frosted with black crystals and coordinating silver-tone studs, and then finished with matching bar-drops which are tipped with the brands hallmarked Rockstuds. Let them swing over the shoulder of a whisper-weight blouse', 1500, 50, true, 2, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC220DEFX', 'Stone Earrings', 'Rosantica','Master SS17s bold earring trend with these Kilimangiaro earrings from Rosantica by Michela Panero. Scatterings of semi-precious stones and tonal-blue and green tassels are suspended from a gold-tone brass curved bar and cascade towards the collarbone. Let them graze the shoulder of a jewel-hued blouse as part of a day-to-night look', 900, 90, true, 2, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC221DEFX', 'Embellished Necklace', 'Dolce' , 'Dolce & Gabbana does not shy away from statement pieces and in a season when jewellery is all about statements, this Hydrangea necklace feels oh-so-right. Its crafted in Italy from galvanized gold-tone metal, with a large curb chain thats decorated with enamel-covered butterfly and flower-shaped pendants punctuated with ice-blue crystals and faux pearls. Wear it to lift a go-to cocktail dress', 2500, 50, true, 2, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC222DEFX', 'Embellished Necklace', 'Dolce','Channel classic Italian glamour by teaming Dolce & Gabbanas gold-tone Hydrangea necklace with a neutral silk blouse. Expertly crafted in Italy, it features a tonal-blue enamel-covered metal butterfly pendant thats set with dark and ice-blue crystals, and finished with faux-pearl drops. Add a slick of lipstick for an ultra-feminine finish', 1200, 60, true, 2, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC223DEFX', 'Sunglass', 'Garrett Leight','Elegant and timeless, Garrett Leight designs come with universal appeal. These Wilson 46 round-frame sunglasses feature tonal-brown tortoiseshell-effect acetate frames with yellow-gold tone metal hinges and nose bridge. The brown-tinted lenses are anti-reflective and provide 100% UV protection, while adjustable nose pads ensure comfort. Let them finish your favourite looks with a retro-imbued look that is utterly of-the-moment', 1200, 50, true, 2, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC224DEFX', 'Sunglass', 'Garrett Leight', 'Garrett Leights yellow gold-tone metal Valencia 54 round-frame sunglasses are inspired by Californian beaches. They are shaped to a pared-back silhouette with a high nose bridge and skinny arms with logo-embossed temple tips, and set with gradient green-tinted lenses. Wear them with a white ruffle-trimmed top to inject a vacation feel into city looks', 1200, 50, true, 2, 2, 0, 0 );







INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC800DEFX', 'Perfume', 'Lacoste', 'Lacoste is a French fashion house that sells clothing, footwear, watches, and perfume. The company was founded in 1933 by Rene Lacoste and Andre Gillier. They are most famous for their signature tennis wear—polo shirts featuring the companys green crocodile logo. Originally produced only in tennis white, the company began offering this garment in 1952. The Lacoste tennis shirt was a staple of the early 1980s preppy clothing trend and continues to be a best-seller today. The garment is endorsed by notable tennis champions such as Andy Roddick' , 2500, 55, true, 8, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC801DEFX', 'Argan Oil', 'Skin Cafe', 'The best facial oil for dry damaged skin. Rich in antioxidants and vitamins. Moisturizing. Relieves chemical inflicted hair damage' , 1380, 50, true, 8, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC802DEFX', 'Body Lotion', 'Nivea', 'As a beauty and cosmetic product supplier we are committed to supply the world’s best, original cosmetic to their valued consumers. Supplying original products is our brand mission and vision' , 500, 50, true, 8, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC803DEFX', 'Face Wash', 'Clariss' , 'As a beauty and cosmetic product supplier we are committed to supply the world’s best, original cosmetic to their valued consumers. Supplying original products is our brand mission and vision' ,  200, 50, true, 8, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC804DEFX', 'Lotion', 'Aveeno', 'As a beauty and cosmetic product supplier we are committed to supply the world’s best, original cosmetic to their valued consumers. Supplying original products is our brand mission and vision' , 1200, 50, true, 8, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC805DEFX', 'Clay Mask', 'Beauty Formula', 'As a beauty and cosmetic product supplier we are committed to supply the world’s best, original cosmetic to their valued consumers. Supplying original products is our brand mission and vision' , 350, 50, true, 8, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC806DEFX', 'Eyeshadow', 'TOO FACED', 'The Bestselling Chocolate Bar Eye Shadow Collection Got A Mini Matte Makeover. Chocolate Chip Matte Features 11 Of Our Iconic Chocolate Bar Shades Transformed In All Matte Finishes Infused With Our Signature Antioxidant-Rich Cocoa Powder And A Decadent Chocolate Scent. The Bite-Sized Palette Is The Perfect Travel Companion That Allows You To Indulge Your Beauty Craving Anywhere You Go' , 2500, 50, true, 8, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC807DEFX', 'Eyeshadow', 'Tarte', 'Take A Makeup Artist Home With This High-Performance Pro Palette For Instagram-Worthy Looks Powered By Healthy Ingredients. It Includes 16 Longwearing Matte Eyeshadows Infused With Amazonian Clay For Smooth Blending And Flake-Resistant Wear, Plus Four Brand-New Iridescent Luster Shades With A Microshimmer, Duochrome Formula. Deeply Concentrated Mineral Pigments And A New Smart-Blend Technology' , 4500, 50, true, 8, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC808DEFX', 'Cleansing Polish', 'Body Shop', 'As a beauty and cosmetic product supplier we are committed to supply the world’s best, original cosmetic to their valued consumers. Supplying original products is our brand mission and vision' , 1000, 50, true, 8, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC809DEFX', 'Perfume', 'Burberry', 'Burberry Perfume Founded in 1856, Burberry is a trusted luxury design house, world famous for its accessories, tartan patterns, and sturdy trench coats . Their famous motifs are often copied and imitated across the globe; however, none can match the quality of this staple of British fashion. Their fragrances match many qualities of their apparel: classic, long-lasting, and elegant' , 2500, 50, true, 8, 1, 0, 0 );




INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC850DEFX', 'Loveseat', 'Homelegance', 'With either the extended stretch your comfort is taken care of in the Marille Collection. Drop-down cup holders add additional function to the collection' , 25000, 15, true, 9, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC851DEFX', 'Chair', 'Homelegance' ,'The Shakespeare Mid-Century Leisure Chair is the perfect piece for most any living space, endowed with a sophisticated blend of classic and modern design aesthetics', 5500, 25, true, 9, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC852DEFX', 'Sheet Set', 'Pinzon' ,'100% Cotton. Imported. Made in Portugal, Full set includes flat sheet, fitted sheet, and 2 standard pillowcases.160-gram velvet flannel provides luxurious softness in a breathable weave Double-napped finish on both sides has an ultra velvety feel Designed with a 4-inch hem on flat sheet and pillowcases. machine washable and dryable ', 1800, 50, true, 9, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC853DEFX', 'Fur Pillow', 'Brentwood' ,'Brentwood manufactures the largest selection of decorative pillows available in the industry. Brentwood is committed to developing and delivering a quality product in a timely fashion. We deliver a product that provides not just a fashion statement within the home, but a product that provides the consumer with both the joy of adding to their lifestyle as well as the satisfaction of value', 450, 50, true, 9, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC854DEFX', 'Canvas Art', 'Fine Art' ,' Multi Panel Canvas Art Set; Panel Dimensions: 8" x 30", 25" x 30", 8" x 30. Multi Panel Canvas Art Set ', 3500, 50, true, 9, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC855DEFX', 'Wall Art', 'Fine Art' , 'Trademark Fine Art specializes in producing superior quality giclee prints on gallery wrapped canvas as well as in the matted, framed format',3500, 50, true, 9, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC856DEFX', 'Coffee Table', 'Poly and Bark' ,'East meets west with the Isamu Noguchi style coffee table, a triumph of minimalist design that combines natural and man made materials for a stunning effect', 8500, 50, true, 9, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC857DEFX', 'Coffee Table', 'Ashley' , 'Sleek and sharp, but definitely not stark. This square table has clean-lined style and warm hues that balance the look. Its the perfect conversation piece for your living room decor ', 12000, 50, true, 9, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC858DEFX', 'Table', 'Ashley' , 'Sleek and sharp, but definitely not stark. This square end table has clean-lined style and warm hues that balance the look. Its the perfect conversation piece for your bedroom, foyer entryway or living room decor', 5000, 50, true, 9, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC859DEFX', ' Loveseat', 'Homelegance' , 'High quality design with no sag seat and pocket coil construction. Equipped with removable back and seat cushions', 12500, 50, true, 9, 2, 0, 0 );






INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC901DEFX', 'Jack Ma', 'Kindle Edition' , 'Touted as the Steve Jobs of China, Jack Ma and his story has captivated his countrymen and the rest of the world. From his humble beginnings as a teacher, he has founded the Alibaba Group, one of the world’s largest ecommerce businesses, and has established himself as one of the world’s richest men', 850, 50, true, 10, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC902DEFX', 'Bipolar Faith', 'Kindle Edition' , 'Monica Coleman is a courageous and brilliant theologian whose wisdom and rigor helps sustain many of us. This unique and pioneering book opens a new spiritual zone for our serious attention', 1450, 50, true, 10, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC903DEFX', 'Still I Rise', 'Kindle Edition' , 'Marlene Wagman-Geller received her B.A. from York University and her teaching credentials from the University of Toronto and San Diego State University. Currently she teaches high school English in National City, California. Reviews from her first three books (Penguin/Perigree) have appeared in the New York Times and the Associated Press article was picked up in dozens of newspapers such as the Denver Post, the Huffington Post, and the San Diego Tribune', 1250, 50, true, 10, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC904DEFX', 'Origin', 'Hardcover' , 'Fans of The Da Vinci Code rejoice! Professor Robert Langdon is again solving the mysteries of the universe', 950, 50, true, 10, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC905DEFX', 'Milk and Honey', 'Paperback' , 'New York Times bestseller Milk and Honey is a collection of poetry and prose about survival. About the experience of violence, abuse, love, loss, and femininity', 450, 50, true, 10, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC906DEFX', 'Count to Ten', 'Paperback' , 'From the worlds #1 bestselling author comes the newest book in the blockbuster PRIVATE series', 1450, 50, true, 10, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC907DEFX', 'It', 'Kindle Edition' , 'Stephen King’s terrifying, classic #1 New York Times bestseller, “a landmark in American literature” (Chicago Sun-Times)—about seven adults who return to their hometown to confront a nightmare they had first stumbled on as teenagers…an evil without a name: It', 1450, 50, true, 10, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC908DEFX', 'Artemis', ' Hardcover' , 'First Edition, 2017, first printing, 10 9 8 7 6 5 4 3 2 1, SIGNED by the author on the second blank page at the front, an otherwise new, unread, unworn, unopened, unmarked hardcover', 950, 50, true, 10, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC909DEFX', 'Elmet', 'Paperback' , 'Shortlisted for the 2017 Man Booker Prize, Mozley’s preternaturally accomplished debut novel', 750, 50, true, 10, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC910DEFX', 'Dog Man', 'Hardcover' , 'He was the best of dogs... He was the worst of dogs... It was the age of invention... It was the season of surprise... It was the eve of supa sadness... It was the dawn of hope... Dog Man, the newest hero from the creator of Captain Underpants', 250, 90, true, 10, 1, 0, 0 );





INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC911DEFX', 'Exercise Bike', 'Evertop' , 'This machine gives you a good cardio workout. High-Low Resistance settings for easy to harder workouts. The tension can be adjusted for this resistance via the adjustable tension knob. The arms move for an extra upper body workout, like a cross trainer', 11500, 20, true, 7, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC912DEFX', 'Football', 'Sports One' , 'This football has the official size and weight. It can be used at training camps, school ground, etc. This product is made of premium synthetic leather and reinforced nylon wool', 1000, 50, true, 7, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC913DEFX', 'Exercise Bench', 'Sky Shops' , 'BD Asian Sky Shops is a leading e-retailer committed to becoming the most loved and trusted marketplace on the web by offering superior shopping experience, rapid delivery, and stellar customer service', 8000, 35, true, 7, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC914DEFX', 'Exercise Wheel', 'VIP Shop' , 'Exercise and strengthen your muscle - Men and women can burn unwanted belly fat with our uniquely designed ab roller wheel', 2000, 35, true, 7, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC915DEFX', 'Push Up Stand', 'Sky Shops' , 'Push-up bars stand behind the secret of strong and ideal body of professional athletes. Now you can maximize your hand and wrist strength without experiencing unnecessary discomfort', 650, 50, true, 7, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC916DEFX', 'Home Gym', 'Evertop' , 'Multi exercise home gym helps to tone up and increase your strength and muscle mass, increase your metabolic rate. Training your shoulders, breast, back, legs, abdomen and arms. Completely encased, greater protection and safety while exercising', 22000, 15, true, 7, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC917DEFX', 'Racket', 'FLEX' , 'Dynamic Optimum Frame is a high tech badminton racket frame technology that delivers exceptional offensive and defensive play characteristics and includes an enlarged sweet spot for high repulsion performance', 2500, 50, true, 7, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC918DEFX', 'Jersey', 'World Sports' , ' World Sports is an online based shop aiming to serve its client only with the best quality. Onushkar does not compromises with quality', 850, 50, true, 7, 2, 0, 0 );








INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C301DEFX', 'Hooded Rag', 'Yes Yes Yall', 'This Rag is created with a soft, stretchy french terry fabric', 2300, 50, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C302DEFX', 'Charlie Jacket', 'Charlie', 'This is a grey and black camouflage print boys winter jacket', 2700, 50, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C303DEFX', 'Solar Shirt', 'Solar', 'This super soft plaid boys shirt has a a modern nehru collar detail.', 2500, 50, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C304DEFX', 'Rain Coat', 'Hatley', 'This outerwear is just as functional as it is stylish.', 3300, 50, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C305DEFX', 'Alfie Shirt', 'Alfie', 'This is a little bit of punk,red tartan boys shirt.', 2700, 50, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C306DEFX', 'Chelsea Boot', 'Boys Matt', 'This easy wearing boys leather chelsea boot to style with anything.', 2500, 50, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C307DEFX', 'Mountain Jeans', 'Mountain', 'This is Loose fitting, denim jeans with embroidered mountain pocket.', 2500, 50, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C308DEFX', 'Puffer Coat', 'Camo', 'Boys will love this super cool camouflage print, thick padded jacket.',2500, 50, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C309DEFX', 'Chelsea Boot', 'Boys Matt', 'Comfy and easy to wear,these boys Chelsea boots make a great staple.', 5400, 50, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C310DEFX', 'Skater Boot', 'Boys Lace', 'Boys skater style boot in blue soft leather is comfortable to wear.', 3000, 50, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C311DEFX', 'Converse', 'Chuck Taylors', 'This easy wearing boys converse to style with anything.',2700, 50, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C312DEFX', 'Waterproof Boot', 'Camo', 'Camo-print ripstop nylon wraps the shaft of a rugged boot shaped from durable.', 3000, 50, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C313DEFX', 'Trainers', 'Boys Velcro', 'Easy for younger boys to put on with velcro straps.', 2700, 50, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C314DEFX', 'Mesh Sneaker', 'MB', 'This boys stylish sneaker to style with anything.', 2100, 50, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C315DEFX', 'Waterproof Boot', 'BOGS', 'This waterproof boot decorated in camouflage patterning..', 2500, 50, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C316DEFX', 'Jogger Pants', 'TREASURE & BOND', 'Strategic rips, tears and fading add a cool easy denim jogger pants.', 1500, 50, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C317DEFX', 'Terry Pants', 'HUDSON KIDS', 'French terry pants deliver the style of denim without any fuss.', 2300, 50, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C318DEFX', 'Slim Jeans', 'AG', 'A faded wash updates slim, straight-leg jeans with instant lived-in appeal.', 2200, 50, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C319DEFX', 'Nylon Jacket', 'VOLCOM', 'A lightweight, hooded windbreaker rain jacket is lined in breathable.', 2700, 50, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C320DEFX', 'Hooded Anorak', 'RVCA', 'Rain-shedding jacket that can be packed away when the clouds part.', 2800, 50, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C321DEFX', 'Tulle Dress', 'ZUNIE', 'A contrast lining highlights the burnout lace design of this charming velvet-and-tulle dress finished with a full, flouncy skirt.', 2900, 50, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C322DEFX', 'Jacquard Dress', 'TRIXXI', 'Metallic floral jacquard adds eye-catching glamour to a sleeveless dress with a crisply pleated, flared skirt.', 2000, 50, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C323DEFX', 'Stripe Dress', 'FRAIS', 'She will be ready for the holidays in this glamorous fit-and-flare dress fashioned with shimmering stripes.', 2200, 50, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C324DEFX', 'Flare Dress', 'FRAIS', 'She will shimmer and shine in this eye-catching brocade dress perfect for her next event.', 3100, 50, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C325DEFX', 'Skater Dress', 'ELISA B', 'Royal blue accents pop against the midnight blue lace of this charming skater dress designed with breezy shoulder cutouts framed by a plush velvet collar.', 2000, 50, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C326DEFX', 'Party Dress', 'NICKIE LEW', 'Sheer mesh chevrons at the high-cut neck add a special touch to a swingy skater dress cut from lustrous scuba-like material.', 2300, 50, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C327DEFX', 'Moto Jacket', 'JOU JOU', 'This classic faux-leather moto jacket instantly ups her schoolyard style cred, with or without the knit hood creating a cool layered look.', 2100, 50, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C328DEFX', 'Long Jacket', 'JOU JOU', 'An elongated silhouette adds a modern, street-chic twist to a classic bomber jacket finished with a ribbed collar and cuffs.', 3000, 50, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C329DEFX', 'Hooded Jacket', 'TREASURE & BOND', 'This classic cool jacket is comfortable to wear and fashionable and girls will love it.', 2000, 50, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C330DEFX', 'Bomber Jacket', 'TRULY ME', 'Lush velvet and bright flowers provide sweet, sophisticated updates for a classic bomber jacket.', 2500, 50, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C331DEFX', 'Metallic Boot', 'UGG®', 'This boot for girls is fashionable, stylish and comfortable.', 2500, 50, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C332DEFX', 'Tassel Boot', 'TUCKER TATE', 'A kicky tassle and star stud detail a mid-shaft boot made from durable faux leather and finished with a lug sole for extra traction.', 2300, 50, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C333DEFX', 'Waterproof Bootie', 'UGG®', ' A removable, genuine-shearling pompom floats playfully at the front of a waterproof suede bootie styled with a harness of glittery patent leather.', 3000, 50, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C334DEFX', 'Ballet Flat', 'AMERICAN GIRL', 'Your little princess-in-training is gonna love this gleaming golden ballet slipper capped with a frilly pink flower and edged with dainty scallops.', 2400, 50, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C335DEFX', 'Pom Bootie', 'UGG®', 'This boot for girls is fashionable, stylish,genuine-shearling Pom Bootie .', 2000, 50, true, 3, 2, 0, 0 );






INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C401DEFX', 'iPhone X', 'Apple', 'Battery Type: Non removable Li-ion 2716 mAh ( Fast battery charging 50% in 30 min) , Camera Resolution (Back): Dual 12 Megapixel , Camera Resolution (Front): 7 Megapixel , Display Size & Resolution: 5.8 inches, 1125×2434 pixles, (~458 ppi) , Processor: Hexa Core (2x Monsoon + 4x Mistral) , RAM: 3 GB , ROM: 32/128/256 GB.', 110000 , 50, true, 4, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C402DEFX', 'iPhone 7 Plus', 'Apple', 'Battery Type: Lithium-ion 2900 mAh(non-removable) , Camera Resolution (Back): Dual 12 Megapixel , Camera Resolution (Front): 7 Megapixel , Display Size & Resolution: 5.5 inches , Retina Full HD 1080 x 1920 pixels (401 ppi) , Processor: Quad-core 2.23 GHz , RAM: 3 GB , ROM: 32/128/256 GB.', 89950 , 50, true, 4, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C403DEFX', 'iPhone 8', 'Apple', 'Battery Type: Non removable Li-ion battery , Camera Resolution (Back): Dual 12 Megapixel , Camera Resolution (Front): 7 Megapixel , Display Size & Resolution: 4.7 inches , 750×1334 pixles , Processor: Hexa Core , RAM: 2 GB , ROM: 64/ 256 GB.', 79000 , 50, true, 4, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C404DEFX', 'iPhone 8 Plus', 'Apple', 'Battery Type: Non removable Li-ion battery , Camera Resolution (Back): Dual 12 Megapixel , Camera Resolution (Front): 7 Megapixel , Display Size & Resolution: 5.5 inches LED-backlit IPS LCD capacitive touchscreen , Processor: Hexa Core , RAM: 3 GB , ROM: 64/ 256 GB.', 86900 , 50, true, 4, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C405DEFX', 'iPhone 7', 'Apple', 'Battery Type: Lithium-ion 1960 mAh (non-removable) , Camera Resolution (Back): Dual 12 Megapixel , Camera Resolution (Front): 7 Megapixel , Display Size & Resolution: 4.7 inches, Retina HD 750 x 1334 pixels (326 ppi) , Processor: Quad Core 2.34 GHz , RAM: 2 GB , ROM: 32/128/256 GB.', 76000  , 50, true, 4, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C406DEFX', 'iPhone 6s', 'Apple', 'Battery Type: Lithium-polymer 1715 mAh (non-removable) , Camera Resolution (Back): Dual 12 Megapixel , Camera Resolution (Front): 5 Megapixel , Display Size & Resolution: 4.7 inches, Retina HD 750 x 1334 pixels (326 ppi) , Processor: Dual-core, 1.84 GHz , RAM: 2 GB , ROM: 16/64/128 GB.', 71499, 50, true, 4, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C407DEFX', 'iPhone 6s Plus', 'Apple', 'Battery Type: Lithium-polymer 2750 mAh (non-removable) , Camera Resolution (Back): Dual 12 Megapixel , Camera Resolution (Front): 5 Megapixel , Display Size & Resolution: 5.5 inches, FHD 1080 x 1920 pixels (401 ppi) , Processor: Dual-core, 1.84 GHz , RAM: 2 GB , ROM: 16/64/128 GB.', 81999 , 50, true, 4, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C408DEFX', 'iPhone 6', 'Apple', 'Battery Type: Lithium-polymer 1810 mAh (non-removable) , Camera Resolution (Back): Dual 8 Megapixel , Camera Resolution (Front): 1.2 Megapixel , Display Size & Resolution: 4.7 inches, 750 x 1334 pixels (326 ppi) , Processor: Dual-core 1.4 GHz Cyclone (ARM v8-based) , RAM: 1 GB , ROM: 16/64/128 GB.', 42500 , 50, true, 4, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C409DEFX', 'iPhone 6 Plus', 'Apple', 'Battery Type: Lithium-polymer 2915 mAh (non-removable) , Camera Resolution (Back): Dual 8 Megapixel , Camera Resolution (Front): 1.2 Megapixel , Display Size & Resolution: 5.5 inches , Retina Full HD 1080 x 1920 pixels (401 ppi) , Processor: Dual-core 1.4 GHz Cyclone (ARM v8-based) , RAM: 1 GB  ROM: 16/64/128 GB.', 75200 , 50, true, 4, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C410DEFX', 'iPhone SE', 'Apple', 'Battery Type: Lithium-polymer 1642 mAh (non-removable) , Camera Resolution (Back): Dual 12 Megapixel , Camera Resolution (Front): 1.2 Megapixel , Display Size & Resolution: 4.0 inches, Retina 640 x 1136 pixels (326 ppi) , Processor: Dual-core, 1.84 GHz Twister , RAM: 2 GB  ROM: 16/64 GB.', 46530 , 50, true, 4, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C411DEFX', 'Galaxy Note8', 'Samsung', 'Battery Type: Lithium-ion 3300 mAh (non-removable) , Camera Resolution (Back): Dual 12 Megapixel , Camera Resolution (Front): 8 Megapixel , Display Size & Resolution: 6.3 inches, qHD 1440 x 2960 pixels (521 ppi) , Processor: Octa-core (4 x 2.3 GHz & 4 x 1.7 GHz) , RAM: 6 GB  ROM: 64 GB.', 94900 , 50, true, 4, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C412DEFX', 'Galaxy S8', 'Samsung', 'Battery Type: Lithium-ion 3000 mAh (non-removable) , Camera Resolution (Back): Dual 12 Megapixel , Camera Resolution (Front): 8 Megapixel , Display Size & Resolution: 5.8 inches, qHD 1440 x 2960 pixels (570 ppi) , Processor: 	Octa-core (4 x 2.3 GHz & 4 x 1.7 GHz) , RAM: 4 GB  ROM: 64 GB.', 77900 , 50, true, 4, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C413DEFX', 'Galaxy S8 Active', 'Samsung', 'Battery Type: Non removable Li-ion 4000 mAh , Camera Resolution (Back): Dual 12 Megapixel , Camera Resolution (Front): 8 Megapixel , Display Size & Resolution: 5.8 inches , 1440×2560 pixels (~506 ppi) , Processor: Octa Core 4×2.35 GHz Kyro , RAM: 4 GB  ROM: 64 GB.', 69000 , 50, true, 4, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C414DEFX', 'Galaxy J7', 'Samsung', 'Battery Type: Non-removable Li-Ion 3600 mAh , Camera Resolution (Back): Dual 13 Megapixel , Camera Resolution (Front): 5 Megapixel , Display Size & Resolution:  	5.5 inches Super AMOLED capacitive touchscreen , Processor: Octa-core 1.6 GHz Cortex-A53 , RAM: 3 GB  ROM: 16 GB.', 27990 , 50, true, 4, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C415DEFX', 'Galaxy S8+', 'Samsung', 'Battery Type: Lithium-ion 3500 mAh (non-removable) , Camera Resolution (Back): Dual 12 Megapixel , Camera Resolution (Front): 8 Megapixel , Display Size & Resolution: 6.2 inches, qHD 1440 x 2960 pixels (529 ppi) , Processor: Octa-core (4 x 2.3 GHz & 4 x 1.7 GHz) , RAM: 4 GB  ROM: 64 GB.', 83900 , 50, true, 4, 1, 0, 0 );





INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C501DEFX', 'Macbook Pro (MD101LL/A)', 'Apple', 'Display-Size: 13.3 inch  , Display-Type: LED-backlit glossy widescreen display , 1280- By-800 resolution  , Operating-System: Mac OSX Lion & Windows Both supported  , HDD: 500 GB 5400-rpm Serial ATA hard disk  , Processor: 3nd Generation Intel core i5  , RAM: 4 GB , Processor-Clock-Rate: 2.5Ghz Upto 3.1 GHz , Graphics-Chipset: Intel HD Graphics 4000 .', 90350 , 50, true, 5, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C502DEFX', 'MacBook (MNYM2HN/A)', 'Apple', 'Display-Size: 12 inch  , Display-Type: Full+ HD LED Backlit IPS Display , 2304 x 1440 pixel  , Operating-System: Mac OS Sierra , HDD: 256 GB 5400-rpm Serial ATA hard disk  , Processor: Intel Core m3 7th Gen , RAM: 8 GB , Processor-Clock-Rate: 1.2 GHz with Turbo Boost Upto 3 GHz , Graphics-Chipset: Intel Integrated HD Graphics 615 .', 135100 , 50, true, 5, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C503DEFX', 'MacBook (MNYL2HN/A)', 'Apple', 'Display-Size:  12 inch   , Display-Type: Full+ HD LED Backlit IPS Display , 2304 x 1440 pixel  , Operating-System: Mac OS Sierra , HDD: 512 GB 5400-rpm Serial ATA hard disk  , Processor: Intel Core i5 7th Gen , RAM: 8 GB , Processor-Clock-Rate: 1.3 GHz with Turbo Boost Upto 3.2 GHz , Graphics-Chipset: Intel Integrated HD Graphics 615 .', 165850 , 50, true, 5, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C504DEFX', 'MacBook Air', 'Apple', 'Display-Size: 13.3 inch  , Display-Type: LED-backlit glossy widescreen display , 1280- By-800 resolution  , Operating-System: MacOS Sierra , HDD:  128 GB  GB 5400-rpm Serial ATA hard disk  , Processor: Intel Core i5 , RAM: 8 GB , Processor-Clock-Rate: 1.8 GHz , Graphics-Chipset: Intel HD Graphics 6000 .', 70250 , 50, true, 5, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C505DEFX', 'MacBook Air(MMGF2HN/A)', 'Apple', 'Display-Size: 13.3 inch  , Display-Type: Ultrabook display , 1400 x 900 pixel  , Operating-System: Mac OS Sierra , HDD: 128 GB 5400-rpm Serial ATA hard disk  , Processor: Intel Dual-Core I5 5th Gen , RAM: 8 GB , Processor-Clock-Rate: 1.6 GHz with Turbo Boost Upto 2.7 Ghz , Graphics-Chipset: Intel HD Graphics 6000 .', 73400 , 50, true, 5, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C506DEFX', 'MacBook Air(MMGG2HN/A)', 'Apple', 'Display-Size: 13.3 inch  , Display-Type: LED-backlit glossy widescreen display , 1440x900 pixel  , Operating-System: Mac OS , HDD: 256 GB 5400-rpm Serial ATA hard disk  , Processor: Intel Core i5 5th Gen , RAM: 8 GB , Processor-Clock-Rate: 2.5Ghz Upto 3.1 GHz , Graphics-Chipset: Intel HD Graphics 6000 .', 99000 , 50, true, 5, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C507DEFX', 'Mac(MPXQ2HN/A)', 'Apple', 'Display-Size: 12 inch  , Display-Type: LED-backlit glossy widescreen display , 2560x1600 pixel , Operating-System: Mac OS , HDD: 128 GB 5400-rpm Serial ATA hard disk  , Processor: Intel Core i5  , RAM: 8 GB , Processor-Clock-Rate: 2.3 GHz , Graphics-Chipset: Intel Iris Plus 640 .', 123200 , 50, true, 5, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C508DEFX', 'Macbook Pro(MJLQ2HN/A)', 'Apple', 'Display-Size: 15 inch  , Display-Type: LED-backlit glossy widescreen display , 2880 x 1800 pixel , Operating-System: Mac OS X Mavericks , HDD: 256 GB 5400-rpm Serial ATA hard disk  , Processor: Quad Core Intel Core i7  , RAM: 16 GB , Processor-Clock-Rate: 2.2 GHz , Graphics-Chipset: Intel Iris Pro Graphics .', 177500 , 50, true, 5, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C509DEFX', 'MacBook Air(MQD42HN/A)', 'Apple', 'Display-Size: 13.3 inch  , Display-Type: Thin and Light Laptop display , 1440 x 900 Pixel , Operating-System: Mac OS Sierra  , HDD: 256 GB 5400-rpm Serial ATA hard disk  , Processor: Intel Core i5 5th Gen , RAM: 8 GB , Processor-Clock-Rate: 1.8 GHz with Turbo Boost Upto 2.9 GHz , Graphics-Chipset: Intel Integrated HD Graphics 6000 .', 93900 , 50, true, 5, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C510DEFX', 'Macbook Pro(MF841HN/A)', 'Apple', 'Display-Size: 13.3 inch  , Display-Type: LED Backlit Retina Display with IPS Technology , 2560 x 1600 pixels  , Operating-System: Mac OS X Yosemite  , HDD: 512 GB 5400-rpm Serial ATA hard disk  , Processor: Intel core i5 5th Gen , RAM: 8 GB , Processor-Clock-Rate: 2.7 GHz with Turbo Boost Upto 3.1 GHz , Graphics-Chipset: Intel Iris Graphics 6100 .', 141400 , 50, true, 5, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C511DEFX', 'Macbook(MJVP2HN/A)', 'Apple', 'Display-Size: 11.6 inch  , Display-Type: LED Backlit Glossy Wide Screen Display with Support for Millions of Colors , 1366 x 768 pixels  , Operating-System: Apple OS X 10.10 Y , HDD: 256 GB 5400-rpm Serial ATA hard disk  , Processor: Intel Core i5 5th Gen , RAM: 4 GB , Processor-Clock-Rate: 2.7 GHz with Turbo Boost Upto 3.2 GHz , Graphics-Chipset: Intel HD Graphics 2500 .', 65500 , 50, true, 5, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C512DEFX', 'Macbook Pro(MJLT2HN/A)', 'Apple', 'Display-Size: 15 inch  , Display-Type: LED-backlit glossy widescreen display , 2560 x 1600 pixels , Operating-System: OS X Yosemite , HDD: 512 GB 5400-rpm Serial ATA hard disk  , Processor: Quad Core Intel Core i7 processor  , RAM: 16 GB , Processor-Clock-Rate: 2.5Ghz , Graphics-Chipset: Intel Iris Pro Graphics AMD Radeon R9 M370X with 2GB of GDDR5 memory and automatic graphics switching .', 224770 , 50, true, 5, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C513DEFX', 'Mac(MPXW2HN/A)', 'Apple', 'Display-Size: 12 inch  , Display-Type: LED-backlit glossy widescreen display , 2560x1600 pixels , Operating-System:  Mac OS , HDD: 512 GB 5400-rpm Serial ATA hard disk  , Processor: Intel Core i5  , RAM: 8 GB , Processor-Clock-Rate: 3.1 GHz , Graphics-Chipset: Intel Iris Plus 650 .', 190700 , 50, true, 5, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C514DEFX', 'Mac(MPXV2HN/A)', 'Apple', 'Display-Size: 15.2 inch  , Display-Type: LED-backlit glossy widescreen display , 2560x1600 pixels , Operating-System: Mac OS , HDD: 256 GB 5400-rpm Serial ATA hard disk  , Processor: Intel Core i5  , RAM: 8 GB , Processor-Clock-Rate: 3.1 GHz , Graphics-Chipset: Intel Iris Plus 650.', 171100 , 50, true, 5, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C515DEFX', 'Macbook Pro(MPTT2HN/A)', 'Apple', 'Display-Size: 15.4 inch  , Display-Type: LED-backlit glossy widescreen display , 2800 x 1800 pixel , Operating-System: Mac OS Sierra , HDD: 512 GB 5400-rpm Serial ATA hard disk  , Processor: Intel Core i7 7th Gen  , RAM: 16 GB , Processor-Clock-Rate: 2.9 GHz with Turbo Boost Upto 3.9 GHz , Graphics-Chipset: Intel Integrated HD Graphics 630 .', 267500 , 50, true, 5, 1, 0, 0 );







INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C601DEFX', 'QLED 4K TV', 'Samsung', 'Perfect color, Boundless design, Smarter than ever.Introducing QLED TV, our most spectacular TV yet. An unbelievably brilliant picture made possible by over a billion colors, producing images you have to see to believe. With 100% color volume thanks to Samsung.', 132600 , 50, true, 6, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C602DEFX', 'Frame 4K UHD TV', 'Samsung', 'Transforms into a beautiful piece of art when the 4K UHD TV is not being viewed, seamlessly blending into any room’s décor. Introducing The Frame from Samsung - a revolutionary way to think about your TV. When you watching the brilliant 4K UHD TV with HDR, it turns into a beautiful work of art  your wall', 107800 , 50, true, 6, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C603DEFX', 'Full HD LED TV', 'Samsung', ' Enjoy the best full HD viewing experience.Enjoy easier and faster access to your favorite media and entertainment.See every image as the director intended with enriched colors – even with older, non-HD content.Access your favorite program choices, live TV, video on demand, apps, and social media in one easy-to-browse navigation experience', 37300 , 50, true, 6, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C604DEFX', 'Bluetooth Speaker', 'Samsung', 'Fill the Entire Room With Exquisite Sound via Ring Radiator Technology . Stream and Control R5 Speakers Wirelessly With Your Mobile Device. Enjoy rich sound from anywhere in the room with patented Ring Radiator technology. Dual acoustic lenses transmit audio from the speaker in a 360° direction, filling the entire room with sound. ', 28950 , 50, true, 6, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C605DEFX', 'HW-K950 Soundbar', 'Samsung', ' Crystal clear sound that flows around above you. 15 built-in speakers including 4 upward-firing drivers. Get cinema style sound without leaving home. 15 built-in speakers including 4 upward-firing drivers and rear wireless speakers deliver crystal clear sound that feels like it comes from all around, including above, like in the theater.', 124500 , 50, true, 6, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C606DEFX', 'Home Theater System', 'Samsung', ' Discover incredible sound quality with a 5.1 Channel home theater system. Watch TV and movies with enriched audio that puts you right at the center. Sync and stream all your favorite TV shows, games, apps, and more with built-in wireless. Access and share your TV and multimedia content from your PC and mobile devices for a truly connected home media experience', 27400 , 50, true, 6, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C607DEFX', ' HD Blu-ray Player', 'Samsung', ' The definitive 4K UHD player. Enjoy 4K, HDR and expanded color range. Smart hub, stream to/from mobile and bluetooth connectivity. Samsung’s flagship UHD Blu-ray player offers the absolute best in picture quality and more ways to enjoy your content. With high dynamic range (HDR) content, scenes burst with vivid color, stunning contrast and deep detail. And with an expanded color spectrum, you’ll experience your favorites in a whole new way. With smart connectivity, content streaming to mobile devices, and Bluetooth wireless streaming, the UBD-M9500 is a true entertainment hub', 27500 , 50, true, 6, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C608DEFX', 'FlexWash Washer', 'Samsung', ' FlexWash™ - Wash separate loads at the same time. 6.0 cu. ft. Total Capacity - Fewer washes save you time. Two washers in one lets you wash separate loads at the same time, or independently. With two individually controlled washers in the same unit, you can run two kinds of washes with different settings and options, keeping your various types of clothes clean and in great condition.The largest 5.0 cu. ft. capacity lower washer in its class translates to fewer loads to save time, while the 1.0 cu. ft. upper washer lets you conveniently wash smaller loads.', 141500 , 50, true, 6, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C609DEFX', 'Front Load Washer', 'Samsung', 'AddWash™ - Easily add forgotten laundry. 5.0 cu. ft. Capacity - Largest 27” Front Load Washer in its class. The AddWash™ door eliminates the need to do an extra load of laundry just because you forgot an item. Now you can conveniently add in forgotten laundry after the cycle has begun, without starting all over again. Get up to a 50% faster wash cycle* – without sacrificing cleaning performance. With Super Speed, you can quickly wash a full load in as little as 30 minutes.', 96900 , 50, true, 6, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C610DEFX', '4-Door Flex Refrigerator', 'Samsung', 'Leave notes, sync calendars, and display your photos on the Family Hub™. Go from freezer to refrigerator with FlexZone™ temperature settings. Family Hub™ helps you manage your home and your life, with Food Management, Family Connection and Entertainment capabilities – all controlled from a 21.5” connected touchscreen. Create shopping lists and see inside from anywhere with 3 built-in cameras, also set expiration notifications to make sure everything is fresh.', 257100 , 50, true, 6, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C611DEFX', 'FlexDry Gas Dryer', 'Samsung', 'FlexDry™ - Dry delicates and everyday garments at the same time. Delicate Dryer - Flat dry delicates, sweaters, or accessories. Two dryers in one lets you dry delicates and everyday garments at the same time, or independently. By combining a conventional large capacity dryer with a delicate dryer, you can dry everyday clothes and delicates that need gentle care to keep your items in great condition. Flat dry delicates, sweaters, and accessorie to prevent items from shrinking and fabric damage.', 149100 , 50, true, 6, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C612DEFX', 'Countertop Microwave', 'Samsung', ' Heat food and drinks with plenty of space. Sensor cooking options deliver optimal results with convenience. Warm a hot drink or cook large dishes with plenty of room for any food you need to heat. Warm soup or cook frozen dinners with optimal results every time. Ceramic enamel interior is scratch-resistant and easy to clean.A variety of preset cooking options put convenient meals with fresh ingredients at your fingertips.', 18200 , 50, true, 6, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C613DEFX', 'Top Control Dishwasher', 'Samsung', ' Powerful wall of water cleans everything in the dishwasher. 3rd rack adds more room for cutlery and large utensils. A powerful, streaming wall of water that delivers remarkable cleaning results and maintains maximum pressure throughout the wash. Wash cutlery and large utensils with a third rack that saves plenty of space for other items, with a FlexTray™ that makes for easy unloading.Control the different areas of the dishwasher to clean your dirtiest or most delicate dishes', 89500 , 50, true, 6, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C614DEFX', 'BTU Power Burners', 'Samsung', 'Convert one oven into two with Flex Duo™. Two powerful convection fans cook food faster and more evenly. Removable divider that converts one oven into two to cook multiple dishes at once with a door that can adjust for use of the top or full oven. wo powerful convection fans that circulate heat, cook food evenly and save time. Monitor and control the range from anywhere. Open and close the oven door with barely any sound.', 140800 , 50, true, 6, 1, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDA8C615DEFX', 'Wall Oven with Flex Duo', 'Samsung', 'Bake, broil and roast with precise moisture. Convert one oven into two with Flex Duo™. Delivers moisture throughout the oven at precise times for a crisp, browned outside, and tender inside. A removable divider that converts one oven to two to cook multiple dishes at once. Two powerful convection fans that circulate heat cooks food evenly and saves time. Distinctive blue LED lights illuminate when the oven is in use', 348500 , 50, true, 6, 1, 0, 0 );





INSERT INTO address( user_id, address_line_one, address_line_two, city, state, country, postal_code, is_billing, is_shipping) 
VALUES (4, 'SEC', 'Tilagor', 'Sylhet', 'None', 'Bangladesh', '111111', true, false );

INSERT INTO cart (user_id, grand_total, cart_lines) VALUES (4, 0, 0);

