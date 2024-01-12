--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: status_type; Type: TYPE; Schema: public; Owner: blackstone
--

CREATE TYPE public.status_type AS ENUM (
    'being prepared',
    'in transit',
    'shipped',
    'delivered'
);


ALTER TYPE public.status_type OWNER TO blackstone;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: address; Type: TABLE; Schema: public; Owner: blackstone
--

CREATE TABLE public.address (
    addr_id character varying(64) NOT NULL,
    street character varying(64),
    city character varying(16),
    is_curr_addr boolean,
    cntry_id character varying(64),
    c_id character varying(64)
);


ALTER TABLE public.address OWNER TO blackstone;

--
-- Name: authors; Type: TABLE; Schema: public; Owner: blackstone
--

CREATE TABLE public.authors (
    a_id character varying(64) NOT NULL,
    a_name character varying(32)
);


ALTER TABLE public.authors OWNER TO blackstone;

--
-- Name: books; Type: TABLE; Schema: public; Owner: blackstone
--

CREATE TABLE public.books (
    b_id character varying(64) NOT NULL,
    title character varying(128),
    price numeric,
    isbn character varying(16),
    pages smallint,
    p_id character varying(64),
    url text
);


ALTER TABLE public.books OWNER TO blackstone;

--
-- Name: country; Type: TABLE; Schema: public; Owner: blackstone
--

CREATE TABLE public.country (
    cntry_id character varying(64) NOT NULL,
    country_name character varying(64)
);


ALTER TABLE public.country OWNER TO blackstone;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: blackstone
--

CREATE TABLE public.customers (
    c_id character varying(64) NOT NULL,
    first_name character varying(16),
    last_name character varying(16),
    email character varying(32),
    cellphone character varying(16)
);


ALTER TABLE public.customers OWNER TO blackstone;

--
-- Name: has; Type: TABLE; Schema: public; Owner: blackstone
--

CREATE TABLE public.has (
    h_suborder_id character varying(64) NOT NULL,
    h_b_id character varying(64) NOT NULL
);


ALTER TABLE public.has OWNER TO blackstone;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: blackstone
--

CREATE TABLE public.orders (
    order_id character varying(64) NOT NULL,
    order_date timestamp with time zone,
    c_id character varying(64)
);


ALTER TABLE public.orders OWNER TO blackstone;

--
-- Name: publishers; Type: TABLE; Schema: public; Owner: blackstone
--

CREATE TABLE public.publishers (
    p_id character varying(64) NOT NULL,
    p_name character varying(32)
);


ALTER TABLE public.publishers OWNER TO blackstone;

--
-- Name: status; Type: TABLE; Schema: public; Owner: blackstone
--

CREATE TABLE public.status (
    order_id character varying(64) NOT NULL,
    status public.status_type NOT NULL
);


ALTER TABLE public.status OWNER TO blackstone;

--
-- Name: suborders; Type: TABLE; Schema: public; Owner: blackstone
--

CREATE TABLE public.suborders (
    suborder_id character varying(64) NOT NULL,
    order_id character varying(64)
);


ALTER TABLE public.suborders OWNER TO blackstone;

--
-- Name: written_by; Type: TABLE; Schema: public; Owner: blackstone
--

CREATE TABLE public.written_by (
    w_b_id character varying(64) NOT NULL,
    w_a_id character varying(64) NOT NULL
);


ALTER TABLE public.written_by OWNER TO blackstone;

--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: blackstone
--

COPY public.address (addr_id, street, city, is_curr_addr, cntry_id, c_id) FROM stdin;
\.


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: blackstone
--

COPY public.authors (a_id, a_name) FROM stdin;
cd79d2c721345bbb5a410b2760d093b9850b8af6ff75a5706795bb0de5d9febc	Liz Cheney
c8eb4bc6bde19e9f98a2d53b290ebca4e532a99fe3ccc9a1dd33a87d14b72ced	Matthew Perry
dc7030804a8d910fe3136e593de48937b100f6c068e23b0afbdc09263a225af2	Mo Xiang
3c53ebdfbf35c3ee4928be2ad3843ea4c181951eba046d5d9b8743331dcf8168	James McBride
58b203e5ca18dcc3b6532a5834e8ca92b3b5f5662bdd3423620cd70892323808	Gege Akutami
2b21381dcca164b813534618ec773e8f6f96a6e2ba1cf090b0edb6dd4a61cb2e	Suzanne Collins
73f889fa728301c9e15a89a973622cb17b4ed95adcf8db0acd9633d0ddc4de08	Chanda Bell
3d458f12a8c8abf962b7da9556bd8b9b38667b234c38392c6bb64ba7ecad0f47	Sarah J. Maas
2f96fa94f100b38ebfbcfceca9f6bc795826c55c4931d25df80d44ea29e210e9	Paul Murray
af56dfe862a946347f833cb444322ad15c2a0877e1c95887b31f3b771be23eea	David Grann
827dcbb2040882aa6cf4fd3d029da8af1c751b0f1c0c501682a9eea4096bf990	Rebecca Yarros
1713b67081164bc48f6198fc2220d794f4ffbf0124c699278380f73cd6b11693	Anthony Doerr
2140a4752a6d324da565149001db45584c471956b1dcac21af354ea6100ad46c	Rick Riordan
453702eb1daf308abebbc1a2446658c6290557a1a20c15503ebaa18b3e217e36	Amanda Peters
7a09e7fbf513a3f70497b112658d99fec8d4d0a296dea9fe1206b7de0bcc5140	Christopher Paolini
0505406ef453e6d32eac41870e2005842a1d2038798c4f5d9c2475bb1911d144	Rebecca Ross
e93039e29a3572880d66199c7e6a283f7129dfe0bd7a3c2110356115a2ee476c	Carol V. Aebersold
3af27178ec206979a3f332c79698675a939a7a96348e6cd5971144cc3b8d7454	Lauren Roberts
a64a4895982f3ab42f0466a6a541c1f00b72e3c2525aa5c8d9fbf8db3a9a6fd3	Dav Pilkey
d14ab73f2e6af6ec370c7486f279537e0985b1f47944afcda01b5207674992b0	David Jeremiah
3ea7b3bcb4d79f743ae2c38ca583daecb33e551e86886d3571400dec0f32253a	Daniel Mason
792383cd1df9d1326d8ac1ce05859b08d7211e9438e28cb472e7a24bba6626a4	Leigh Bardugo
e143719d0b75379c77c75ec6cb49e9287621d495925b03b652ba7fd1fcccf75d	Stephen King
df78095cfd0dc4483adcdc2abd93ced5034b064cb7524526deac0a7af3ee620e	John Grisham
f6b6f43ec80e42390686028cbac7098826ad12296b349b527fd11cd40d375e05	Barbra Streisand
e822895a5f352e7d7367f78405d2bd9b50fd5d5738e9a90d784d4d2c5af9730c	Britney Spears
fe85da3620f1a94267082528ac25bc3f2f37627f296e56b69da63c11ba262d9d	A.L. White
7f96e3e3ca0c4d56954f2f674f49b6c01f9db4b8e8bcc8fec7cee5f781d83aab	Robert Kirkman
efa7d7d1069c6de99f06bf49f968fc83a12a88beae55113d3c34b1009bb936a9	Mo Willems
2d7cf40781e40f11807ce9fc69a89974700a75220262ed25be48601ca1b9e1b6	Ilyon Woo
a6a0758cda2fb1585f524a893413f0e7edd52828b741a40f81f0f3d2d7c7e9fe	Lynn Painter
5c15850edf095f6e863e92992a322bb48714505a44c7559d6bc9c899d92fd1b2	Rachel Maddow
66199f8dae8d0f016304c3e04e0eb55498d8cd15d5499406959017bcf64eecda	Katherine Quinn
b80bd450e9800c2c4e72b32e37049ef6491106ef782b1362105578ea0e8100f2	Bryan Lee O'Malley
f1bca420e6b950fec85bc603861685f44f376906d526e9946910bb5275c3d467	James Patterson
036a3168be58384f201d2ae8afdb4348cd7986f3fa3bc7cee3dab796b9f5c942	Jeff Kinney
35ac6f84d59c0a231f1e319ecef1b3f7048cdbcc83a0a371a4374645f7cca77b	Carissa Broadbent
179f57bc275c4507131605e5009bd2f5783dde36fa7ced5a501c58b4532bf83d	Jean Marzollo
686159d24c69e045635d3096af17b4a6905474a4653896c090839c718cf121b2	Mark Harmon
a14f5a7a2b07a3e8c2199e76a9cecedf4ce786fcd3bfd4e856caf263619d0698	Jennifer L. Armentrout
e7ab5d5225a41fef07189f99b77f735b198c868c48615b2e24956b18392b8bda	Charles T. Munger
35e82eff55cb395adca53d80c51cd1f7d23eee97c7d8bf7e891b336e3b331956	Alice Oseman
94bb6a860b65d7ca13f90873013b051921e63a254c347214adcc1ef17f75462a	Dev Petty
\.


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: blackstone
--

COPY public.books (b_id, title, price, isbn, pages, p_id, url) FROM stdin;
cea86a1615	Oath and Honor: A Memoir and a Warning	29.25	978876048517	130	6bdd3d08a5efb439a9400ced11541b85b40bd4537d91159c0ab2b754f3637212	https://prodimage.images-bn.com/pimages/9780316572064_p0_v2_s452x700.jpg
9dcc54dd1e	Friends, Lovers, and the Big Terrible Thing: A Memoir	23.99	979757748381	374	6bdd3d08a5efb439a9400ced11541b85b40bd4537d91159c0ab2b754f3637212	https://prodimage.images-bn.com/pimages/9781250866448_p0_v6_s460x700.jpg
e2cbca8b21	Heaven Official's Blessing: Tian Guan Ci Fu (Novel) Vol. 8 (Special Edition)	23.99	978112657215	451	6bdd3d08a5efb439a9400ced11541b85b40bd4537d91159c0ab2b754f3637212	https://prodimage.images-bn.com/pimages/9781685798468_p0_v3_s500x700.jpg
0ee42ed515	The Heaven & Earth Grocery Store (2023 B&N Book of the Year)	25.2	978717757194	219	f6850092ebcc4b9b560c10561e336d0753d0c84b72ee1578fde2465434238c11	https://prodimage.images-bn.com/pimages/9780593422946_p0_v9_s463x700.jpg
8647578b93	Jujutsu Kaisen Box Set Vols. 1-4 (B&N Exclusive Edition)	19.98	979218983200	882	c091a9ebb8e6a7a85673ee23e63749211963b1752e7dcd098f60a9ffab92e990	https://prodimage.images-bn.com/pimages/9781974737109_p0_v1_s444x700.jpg
adf565eb37	The Hunger Games Trilogy Boxset (Paperback Classic Collection)	27.27	979109156550	118	a4e816b10a0f5d77a745069ccb8e7410cc3ffb296b59854d13d0777e85584d6f	https://prodimage.images-bn.com/pimages/9780545670319_p0_v3_s462x700.jpg
0614ddc2d3	Scout Elf Carrier	10.95	979467810459	823	5bba95a3dc4b8765875e85ffa7e9336f12d8152de3acc41a2ce3822879a2e832	https://prodimage.images-bn.com/pimages/0814854014645_p0_v1_s385x700.jpg
0b640a2963	House of Flame and Shadow (Crescent City Series #3)	27.2	978228189329	403	d821a9b83acd0c1a2847162d1f7992533888311d030c1accf3babe536ab5f713	https://prodimage.images-bn.com/pimages/9781635574104_p0_v7_s455x700.jpg
a5ebe2e2d2	The Ballad of Songbirds and Snakes (Hunger Games Series Prequel)	21.99	978246763719	373	aad0d21981013dcc85f9fcf00ce77c971d2f694c75a948f99467e6285bb8551c	https://prodimage.images-bn.com/pimages/9781338635171_p0_v5_s461x700.jpg
5115bd6ff4	The Bee Sting	30.0	979397320323	954	6bdd3d08a5efb439a9400ced11541b85b40bd4537d91159c0ab2b754f3637212	https://prodimage.images-bn.com/pimages/9780374600303_p0_v1_s456x700.jpg
273c45e050	Killers of the Flower Moon: The Osage Murders and the Birth of the FBI	14.49	979319853294	610	6bdd3d08a5efb439a9400ced11541b85b40bd4537d91159c0ab2b754f3637212	https://prodimage.images-bn.com/pimages/9780307742483_p0_v10_s454x700.jpg
525d06a890	Iron Flame	29.99	978416453138	129	d821a9b83acd0c1a2847162d1f7992533888311d030c1accf3babe536ab5f713	https://prodimage.images-bn.com/pimages/9781649374172_p0_v18_s433x700.jpg
7d99373cb2	The Wager: A Tale of Shipwreck, Mutiny and Murder (2023 B&N Author of the Year)	27.0	978173269951	180	a4e816b10a0f5d77a745069ccb8e7410cc3ffb296b59854d13d0777e85584d6f	https://prodimage.images-bn.com/pimages/9780385534260_p0_v2_s460x700.jpg
1901aa0b45	All the Light We Cannot See (Pulitzer Prize Winner)	15.98	978227093724	759	f6850092ebcc4b9b560c10561e336d0753d0c84b72ee1578fde2465434238c11	https://prodimage.images-bn.com/pimages/9781501173219_p0_v10_s459x700.jpg
b59310a27a	Percy Jackson and the Olympians 5 Book Paperback Boxed Set (new covers) (B&N Exclusive Edition)	31.46	978536266406	705	aad0d21981013dcc85f9fcf00ce77c971d2f694c75a948f99467e6285bb8551c	https://prodimage.images-bn.com/pimages/9781368098014_p0_v2_s547x700.jpg
47d126f5aa	Fourth Wing	29.99	978987222378	819	a4e816b10a0f5d77a745069ccb8e7410cc3ffb296b59854d13d0777e85584d6f	https://prodimage.images-bn.com/pimages/9781649374042_p0_v9_s433x700.jpg
3edcc009d3	The Berry Pickers (B&N Discover Prize Winner)	27.0	979105684773	523	5bba95a3dc4b8765875e85ffa7e9336f12d8152de3acc41a2ce3822879a2e832	https://prodimage.images-bn.com/pimages/9781646221950_p0_v2_s466x700.jpg
7b8c9ceb46	Murtagh: The World of Eragon (Signed Book)	29.99	979566977650	458	d821a9b83acd0c1a2847162d1f7992533888311d030c1accf3babe536ab5f713	https://prodimage.images-bn.com/pimages/9780593805459_p0_v1_s448x700.jpg
d7679b474c	Ruthless Vows (B&N Exclusive Edition)	18.0	978469965230	424	6bdd3d08a5efb439a9400ced11541b85b40bd4537d91159c0ab2b754f3637212	https://prodimage.images-bn.com/pimages/9781250350923_p0_v1_s460x700.jpg
12e26749f7	Heaven Official's Blessing: Tian Guan Ci Fu (Novel) Vol. 8 (B&N Exclusive Edition)	15.99	979220601489	220	d821a9b83acd0c1a2847162d1f7992533888311d030c1accf3babe536ab5f713	https://prodimage.images-bn.com/pimages/9781685798451_p0_v4_s499x700.jpg
2e3608d915	The Elf on the Shelf: A Christmas Tradition (includes blue-eyed boy scout elf)	32.95	978786856506	424	caf4955608ab530a6e7e58f6c59833e9826504827194ca7ab2343848df7ebd3b	https://prodimage.images-bn.com/pimages/9780976990703_p0_v10_s571x700.jpg
5d61e92b07	House of Earth and Blood (B&N Exclusive Edition) (Crescent City Series #1)	19.0	979806784256	249	c091a9ebb8e6a7a85673ee23e63749211963b1752e7dcd098f60a9ffab92e990	https://prodimage.images-bn.com/pimages/9781639733286_p0_v1_s481x700.jpg
11d0f40211	Powerless	17.99	979192453846	698	aad0d21981013dcc85f9fcf00ce77c971d2f694c75a948f99467e6285bb8551c	https://prodimage.images-bn.com/pimages/9781665954884_p0_v7_s463x700.jpg
46a129cd9d	The Elf on the Shelf: A Christmas Tradition (includes blue-eyed girl scout elf)	32.95	979614690861	881	6bdd3d08a5efb439a9400ced11541b85b40bd4537d91159c0ab2b754f3637212	https://prodimage.images-bn.com/pimages/9780984365173_p0_v7_s530x700.jpg
ce47207e88	Influencers (B&N Exclusive Edition) (Cat Kid Comic Club #5)	9.09	979451098787	440	6bdd3d08a5efb439a9400ced11541b85b40bd4537d91159c0ab2b754f3637212	https://prodimage.images-bn.com/pimages/9781339034768_p0_v2_s472x700.jpg
edba95628c	The Great Disappearance: 31 Ways to be Rapture Ready	29.99	978378654010	897	a4e816b10a0f5d77a745069ccb8e7410cc3ffb296b59854d13d0777e85584d6f	https://prodimage.images-bn.com/pimages/9780785252245_p0_v3_s398x598.jpg
821a1ba0fb	House of Sky and Breath (B&N Exclusive Edition) (Crescent City Series #2)	19.0	978569679569	322	a4e816b10a0f5d77a745069ccb8e7410cc3ffb296b59854d13d0777e85584d6f	https://prodimage.images-bn.com/pimages/9781639732876_p0_v1_s481x700.jpg
2a660130ab	North Woods	28.0	979188706929	990	c091a9ebb8e6a7a85673ee23e63749211963b1752e7dcd098f60a9ffab92e990	https://prodimage.images-bn.com/pimages/9780593597033_p0_v2_s466x700.jpg
116746ac86	Six of Crows Boxed Set: Six of Crows, Crooked Kingdom	16.78	979324835052	223	aad0d21981013dcc85f9fcf00ce77c971d2f694c75a948f99467e6285bb8551c	https://prodimage.images-bn.com/pimages/9781250211101_p0_v3_s700x700.jpg
5b8593c296	The Hunger Games 4-Book Paperback Box Set (The Hunger Games, Catching Fire, Mockingjay, the Ballad of Songbirds and Snakes)	55.76	979218108423	581	d821a9b83acd0c1a2847162d1f7992533888311d030c1accf3babe536ab5f713	https://prodimage.images-bn.com/pimages/9781339042657_p0_v2_s581x700.jpg
53128aaaaa	The Body	12.5	978993654897	490	c091a9ebb8e6a7a85673ee23e63749211963b1752e7dcd098f60a9ffab92e990	https://prodimage.images-bn.com/pimages/9781982103538_p0_v10_s459x700.jpg
7e312a8ade	The Exchange: After The Firm	20.96	978961056949	435	d821a9b83acd0c1a2847162d1f7992533888311d030c1accf3babe536ab5f713	https://prodimage.images-bn.com/pimages/9780385548953_p0_v2_s417x667.jpg
3d781233f9	My Name Is Barbra	42.3	978274528038	187	aad0d21981013dcc85f9fcf00ce77c971d2f694c75a948f99467e6285bb8551c	https://prodimage.images-bn.com/pimages/9780525429524_p0_v5_s460x700.jpg
ed135ef5ad	The Woman in Me	26.39	979150251060	242	d821a9b83acd0c1a2847162d1f7992533888311d030c1accf3babe536ab5f713	https://prodimage.images-bn.com/pimages/9781668009048_p0_v5_s461x700.jpg
f2499f229b	Tabitha & the Happiness	10.99	978306252358	282	caf4955608ab530a6e7e58f6c59833e9826504827194ca7ab2343848df7ebd3b	https://prodimage.images-bn.com/pimages/9781839349324_p0_v1_s700x700.jpg
f7a084914e	The Shadow and Bone Trilogy Boxed Set: Shadow and Bone, Siege and Storm, Ruin and Rising	23.07	978114136856	995	f6850092ebcc4b9b560c10561e336d0753d0c84b72ee1578fde2465434238c11	https://prodimage.images-bn.com/pimages/9781250196231_p0_v4_s432x700.jpg
603047eca7	The Chalice of the Gods (B&N Exclusive Edition) (Percy Jackson and the Olympians)	15.99	979997103406	856	c091a9ebb8e6a7a85673ee23e63749211963b1752e7dcd098f60a9ffab92e990	https://prodimage.images-bn.com/pimages/9781368099370_p0_v2_s464x700.jpg
551e33ba8c	Invincible Compendium, Volume 1	57.99	979776852557	730	a4e816b10a0f5d77a745069ccb8e7410cc3ffb296b59854d13d0777e85584d6f	https://prodimage.images-bn.com/pimages/9781607064114_p0_v2_s456x700.jpg
3020dcb9ca	Don't Let the Pigeon Drive the Sleigh! (B&N Exclusive Edition)	16.14	978915964525	152	f6850092ebcc4b9b560c10561e336d0753d0c84b72ee1578fde2465434238c11	https://prodimage.images-bn.com/pimages/9781454954200_p0_v4_s700x700.jpg
0eb691002f	A Court of Thorns and Roses Paperback Box Set (5 books)	65.1	979506208400	798	6bdd3d08a5efb439a9400ced11541b85b40bd4537d91159c0ab2b754f3637212	https://prodimage.images-bn.com/pimages/9781639730193_p0_v1_s700x614.jpg
e51b58ddc2	Master Slave Husband Wife: An Epic Journey from Slavery to Freedom	26.99	978707667823	882	caf4955608ab530a6e7e58f6c59833e9826504827194ca7ab2343848df7ebd3b	https://prodimage.images-bn.com/pimages/9781501191053_p0_v3_s464x700.jpg
81d382c127	The Do-Over (B&N Exclusive Edition)	11.69	979645874917	743	c091a9ebb8e6a7a85673ee23e63749211963b1752e7dcd098f60a9ffab92e990	https://prodimage.images-bn.com/pimages/9781665951388_p0_v1_s402x700.jpg
d581328170	Prequel: An American Fight Against Fascism	28.8	979388240532	815	5bba95a3dc4b8765875e85ffa7e9336f12d8152de3acc41a2ce3822879a2e832	https://prodimage.images-bn.com/pimages/9780593444511_p0_v1_s461x700.jpg
e4506cf2ed	Throne of Glass Box Set	171.5	979494990121	293	c091a9ebb8e6a7a85673ee23e63749211963b1752e7dcd098f60a9ffab92e990	https://prodimage.images-bn.com/pimages/9781639731763_p0_v3_s653x700.jpg
241c0609f6	To Kill a Shadow	19.99	978808711121	328	6bdd3d08a5efb439a9400ced11541b85b40bd4537d91159c0ab2b754f3637212	https://prodimage.images-bn.com/pimages/9781649374318_p0_v3_s432x700.jpg
6af3583297	Scott Pilgrim Vol. 2: Scott Pilgrim vs. the World	14.99	979281106843	386	a4e816b10a0f5d77a745069ccb8e7410cc3ffb296b59854d13d0777e85584d6f	https://prodimage.images-bn.com/pimages/9781932664126_p0_v3_s470x700.jpg
411c38ee70	Scott Pilgrim Vol. 1: Scott Pilgrim's Precious Little Life	14.99	978798648885	344	d821a9b83acd0c1a2847162d1f7992533888311d030c1accf3babe536ab5f713	https://prodimage.images-bn.com/pimages/9781932664089_p0_v3_s470x700.jpg
d9afac49f7	Alex Cross Must Die: A Thriller	21.0	979275451537	152	aad0d21981013dcc85f9fcf00ce77c971d2f694c75a948f99467e6285bb8551c	https://prodimage.images-bn.com/pimages/9780316402484_p0_v3_s451x700.jpg
5de61602a2	No Brainer (Diary of a Wimpy Kid Series #18)	10.49	978855428117	304	6bdd3d08a5efb439a9400ced11541b85b40bd4537d91159c0ab2b754f3637212	https://prodimage.images-bn.com/pimages/9781419766947_p0_v3_s431x700.jpg
229767dfc1	The Ashes and the Star-Cursed King (Signed Book)	29.99	979659287791	862	f6850092ebcc4b9b560c10561e336d0753d0c84b72ee1578fde2465434238c11	https://prodimage.images-bn.com/pimages/9781250354907_p0_v1_s452x700.jpg
f128a05d86	I Spy Christmas	13.49	979822872083	128	6bdd3d08a5efb439a9400ced11541b85b40bd4537d91159c0ab2b754f3637212	https://prodimage.images-bn.com/pimages/9781338332582_p0_v3_s513x700.jpg
aa4e9e7989	Invincible Compendium, Volume 2	59.99	979783216890	981	caf4955608ab530a6e7e58f6c59833e9826504827194ca7ab2343848df7ebd3b	https://prodimage.images-bn.com/pimages/9781607067726_p0_v3_s455x700.jpg
8e78288c4b	Scott Pilgrim Vol. 3: Scott Pilgrim and the Infinite Sadness	13.99	978322443209	152	c091a9ebb8e6a7a85673ee23e63749211963b1752e7dcd098f60a9ffab92e990	https://prodimage.images-bn.com/pimages/9781932664225_p0_v3_s470x700.jpg
0385874e13	Ghosts of Honolulu: A Japanese Spy, a Japanese American Spy Hunter, and the Untold Story of Pearl Harbor	26.99	979247540702	239	5bba95a3dc4b8765875e85ffa7e9336f12d8152de3acc41a2ce3822879a2e832	https://prodimage.images-bn.com/pimages/9781400337019_p0_v3_s466x700.jpg
a6f4dc40d4	Visions of Flesh and Blood: A Blood and Ash/Flesh and Fire Compendium (B&N Exclusive Edition)	28.79	978555150238	155	d821a9b83acd0c1a2847162d1f7992533888311d030c1accf3babe536ab5f713	https://prodimage.images-bn.com/pimages/9781957568843_p0_v4_s466x700.jpg
aa9480afee	Heaven Official's Blessing: Tian Guan Ci Fu (Novel) Vol. 7	15.99	978752701313	443	c091a9ebb8e6a7a85673ee23e63749211963b1752e7dcd098f60a9ffab92e990	https://prodimage.images-bn.com/pimages/9781638585527_p0_v2_s504x700.jpg
ccbb050f18	Divine Rivals: A Novel	18.99	979727160096	958	d821a9b83acd0c1a2847162d1f7992533888311d030c1accf3babe536ab5f713	https://prodimage.images-bn.com/pimages/9781250857439_p0_v5_s460x700.jpg
f95f0c025e	Poor Charlie's Almanack: The Essential Wit and Wisdom of Charles T. Munger	30.0	978631538679	839	d821a9b83acd0c1a2847162d1f7992533888311d030c1accf3babe536ab5f713	https://prodimage.images-bn.com/pimages/9781953953230_p0_v3_s491x700.jpg
cede3fa517	Heartstopper, Volume 5	14.39	979922534910	192	c091a9ebb8e6a7a85673ee23e63749211963b1752e7dcd098f60a9ffab92e990	https://prodimage.images-bn.com/pimages/9781338807486_p0_v3_s466x700.jpg
59cdd3bb45	Elmore the Christmas Moose (B&N Exclusive Edition)	18.99	979588620204	208	6bdd3d08a5efb439a9400ced11541b85b40bd4537d91159c0ab2b754f3637212	https://prodimage.images-bn.com/pimages/9780593707456_p0_v9_s348x348.jpg
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: blackstone
--

COPY public.country (cntry_id, country_name) FROM stdin;
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: blackstone
--

COPY public.customers (c_id, first_name, last_name, email, cellphone) FROM stdin;
\.


--
-- Data for Name: has; Type: TABLE DATA; Schema: public; Owner: blackstone
--

COPY public.has (h_suborder_id, h_b_id) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: blackstone
--

COPY public.orders (order_id, order_date, c_id) FROM stdin;
\.


--
-- Data for Name: publishers; Type: TABLE DATA; Schema: public; Owner: blackstone
--

COPY public.publishers (p_id, p_name) FROM stdin;
6bdd3d08a5efb439a9400ced11541b85b40bd4537d91159c0ab2b754f3637212	Penguin Random House
f6850092ebcc4b9b560c10561e336d0753d0c84b72ee1578fde2465434238c11	Hachette Book Group
c091a9ebb8e6a7a85673ee23e63749211963b1752e7dcd098f60a9ffab92e990	Pearson Education
a4e816b10a0f5d77a745069ccb8e7410cc3ffb296b59854d13d0777e85584d6f	John Wiley & Sons
5bba95a3dc4b8765875e85ffa7e9336f12d8152de3acc41a2ce3822879a2e832	McGraw-Hill Education
d821a9b83acd0c1a2847162d1f7992533888311d030c1accf3babe536ab5f713	HarperCollins
aad0d21981013dcc85f9fcf00ce77c971d2f694c75a948f99467e6285bb8551c	Scholastic
caf4955608ab530a6e7e58f6c59833e9826504827194ca7ab2343848df7ebd3b	Springer Nature
\.


--
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: blackstone
--

COPY public.status (order_id, status) FROM stdin;
\.


--
-- Data for Name: suborders; Type: TABLE DATA; Schema: public; Owner: blackstone
--

COPY public.suborders (suborder_id, order_id) FROM stdin;
\.


--
-- Data for Name: written_by; Type: TABLE DATA; Schema: public; Owner: blackstone
--

COPY public.written_by (w_b_id, w_a_id) FROM stdin;
cea86a1615	cd79d2c721345bbb5a410b2760d093b9850b8af6ff75a5706795bb0de5d9febc
9dcc54dd1e	c8eb4bc6bde19e9f98a2d53b290ebca4e532a99fe3ccc9a1dd33a87d14b72ced
e2cbca8b21	dc7030804a8d910fe3136e593de48937b100f6c068e23b0afbdc09263a225af2
0ee42ed515	3c53ebdfbf35c3ee4928be2ad3843ea4c181951eba046d5d9b8743331dcf8168
8647578b93	58b203e5ca18dcc3b6532a5834e8ca92b3b5f5662bdd3423620cd70892323808
adf565eb37	2b21381dcca164b813534618ec773e8f6f96a6e2ba1cf090b0edb6dd4a61cb2e
0614ddc2d3	73f889fa728301c9e15a89a973622cb17b4ed95adcf8db0acd9633d0ddc4de08
0b640a2963	3d458f12a8c8abf962b7da9556bd8b9b38667b234c38392c6bb64ba7ecad0f47
a5ebe2e2d2	2b21381dcca164b813534618ec773e8f6f96a6e2ba1cf090b0edb6dd4a61cb2e
5115bd6ff4	2f96fa94f100b38ebfbcfceca9f6bc795826c55c4931d25df80d44ea29e210e9
273c45e050	af56dfe862a946347f833cb444322ad15c2a0877e1c95887b31f3b771be23eea
525d06a890	827dcbb2040882aa6cf4fd3d029da8af1c751b0f1c0c501682a9eea4096bf990
7d99373cb2	af56dfe862a946347f833cb444322ad15c2a0877e1c95887b31f3b771be23eea
1901aa0b45	1713b67081164bc48f6198fc2220d794f4ffbf0124c699278380f73cd6b11693
b59310a27a	2140a4752a6d324da565149001db45584c471956b1dcac21af354ea6100ad46c
47d126f5aa	827dcbb2040882aa6cf4fd3d029da8af1c751b0f1c0c501682a9eea4096bf990
3edcc009d3	453702eb1daf308abebbc1a2446658c6290557a1a20c15503ebaa18b3e217e36
7b8c9ceb46	7a09e7fbf513a3f70497b112658d99fec8d4d0a296dea9fe1206b7de0bcc5140
d7679b474c	0505406ef453e6d32eac41870e2005842a1d2038798c4f5d9c2475bb1911d144
12e26749f7	dc7030804a8d910fe3136e593de48937b100f6c068e23b0afbdc09263a225af2
2e3608d915	e93039e29a3572880d66199c7e6a283f7129dfe0bd7a3c2110356115a2ee476c
5d61e92b07	3d458f12a8c8abf962b7da9556bd8b9b38667b234c38392c6bb64ba7ecad0f47
11d0f40211	3af27178ec206979a3f332c79698675a939a7a96348e6cd5971144cc3b8d7454
46a129cd9d	e93039e29a3572880d66199c7e6a283f7129dfe0bd7a3c2110356115a2ee476c
ce47207e88	a64a4895982f3ab42f0466a6a541c1f00b72e3c2525aa5c8d9fbf8db3a9a6fd3
edba95628c	d14ab73f2e6af6ec370c7486f279537e0985b1f47944afcda01b5207674992b0
821a1ba0fb	3d458f12a8c8abf962b7da9556bd8b9b38667b234c38392c6bb64ba7ecad0f47
2a660130ab	3ea7b3bcb4d79f743ae2c38ca583daecb33e551e86886d3571400dec0f32253a
116746ac86	792383cd1df9d1326d8ac1ce05859b08d7211e9438e28cb472e7a24bba6626a4
5b8593c296	2b21381dcca164b813534618ec773e8f6f96a6e2ba1cf090b0edb6dd4a61cb2e
53128aaaaa	e143719d0b75379c77c75ec6cb49e9287621d495925b03b652ba7fd1fcccf75d
7e312a8ade	df78095cfd0dc4483adcdc2abd93ced5034b064cb7524526deac0a7af3ee620e
3d781233f9	f6b6f43ec80e42390686028cbac7098826ad12296b349b527fd11cd40d375e05
ed135ef5ad	e822895a5f352e7d7367f78405d2bd9b50fd5d5738e9a90d784d4d2c5af9730c
f2499f229b	fe85da3620f1a94267082528ac25bc3f2f37627f296e56b69da63c11ba262d9d
f7a084914e	792383cd1df9d1326d8ac1ce05859b08d7211e9438e28cb472e7a24bba6626a4
603047eca7	2140a4752a6d324da565149001db45584c471956b1dcac21af354ea6100ad46c
551e33ba8c	7f96e3e3ca0c4d56954f2f674f49b6c01f9db4b8e8bcc8fec7cee5f781d83aab
3020dcb9ca	efa7d7d1069c6de99f06bf49f968fc83a12a88beae55113d3c34b1009bb936a9
0eb691002f	3d458f12a8c8abf962b7da9556bd8b9b38667b234c38392c6bb64ba7ecad0f47
e51b58ddc2	2d7cf40781e40f11807ce9fc69a89974700a75220262ed25be48601ca1b9e1b6
81d382c127	a6a0758cda2fb1585f524a893413f0e7edd52828b741a40f81f0f3d2d7c7e9fe
d581328170	5c15850edf095f6e863e92992a322bb48714505a44c7559d6bc9c899d92fd1b2
e4506cf2ed	3d458f12a8c8abf962b7da9556bd8b9b38667b234c38392c6bb64ba7ecad0f47
241c0609f6	66199f8dae8d0f016304c3e04e0eb55498d8cd15d5499406959017bcf64eecda
6af3583297	b80bd450e9800c2c4e72b32e37049ef6491106ef782b1362105578ea0e8100f2
411c38ee70	b80bd450e9800c2c4e72b32e37049ef6491106ef782b1362105578ea0e8100f2
d9afac49f7	f1bca420e6b950fec85bc603861685f44f376906d526e9946910bb5275c3d467
5de61602a2	036a3168be58384f201d2ae8afdb4348cd7986f3fa3bc7cee3dab796b9f5c942
229767dfc1	35ac6f84d59c0a231f1e319ecef1b3f7048cdbcc83a0a371a4374645f7cca77b
f128a05d86	179f57bc275c4507131605e5009bd2f5783dde36fa7ced5a501c58b4532bf83d
aa4e9e7989	7f96e3e3ca0c4d56954f2f674f49b6c01f9db4b8e8bcc8fec7cee5f781d83aab
8e78288c4b	b80bd450e9800c2c4e72b32e37049ef6491106ef782b1362105578ea0e8100f2
0385874e13	686159d24c69e045635d3096af17b4a6905474a4653896c090839c718cf121b2
a6f4dc40d4	a14f5a7a2b07a3e8c2199e76a9cecedf4ce786fcd3bfd4e856caf263619d0698
aa9480afee	dc7030804a8d910fe3136e593de48937b100f6c068e23b0afbdc09263a225af2
ccbb050f18	0505406ef453e6d32eac41870e2005842a1d2038798c4f5d9c2475bb1911d144
f95f0c025e	e7ab5d5225a41fef07189f99b77f735b198c868c48615b2e24956b18392b8bda
cede3fa517	35e82eff55cb395adca53d80c51cd1f7d23eee97c7d8bf7e891b336e3b331956
59cdd3bb45	94bb6a860b65d7ca13f90873013b051921e63a254c347214adcc1ef17f75462a
\.


--
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: blackstone
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (addr_id);


--
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: blackstone
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (a_id);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: blackstone
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (b_id);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: blackstone
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (cntry_id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: blackstone
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (c_id);


--
-- Name: has has_pkey; Type: CONSTRAINT; Schema: public; Owner: blackstone
--

ALTER TABLE ONLY public.has
    ADD CONSTRAINT has_pkey PRIMARY KEY (h_suborder_id, h_b_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: blackstone
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- Name: publishers publishers_pkey; Type: CONSTRAINT; Schema: public; Owner: blackstone
--

ALTER TABLE ONLY public.publishers
    ADD CONSTRAINT publishers_pkey PRIMARY KEY (p_id);


--
-- Name: status status_pkey; Type: CONSTRAINT; Schema: public; Owner: blackstone
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (order_id, status);


--
-- Name: suborders suborders_pkey; Type: CONSTRAINT; Schema: public; Owner: blackstone
--

ALTER TABLE ONLY public.suborders
    ADD CONSTRAINT suborders_pkey PRIMARY KEY (suborder_id);


--
-- Name: written_by written_by_pkey; Type: CONSTRAINT; Schema: public; Owner: blackstone
--

ALTER TABLE ONLY public.written_by
    ADD CONSTRAINT written_by_pkey PRIMARY KEY (w_b_id, w_a_id);


--
-- Name: address address_c_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blackstone
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_c_id_fkey FOREIGN KEY (c_id) REFERENCES public.customers(c_id);


--
-- Name: address address_cntry_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blackstone
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_cntry_id_fkey FOREIGN KEY (cntry_id) REFERENCES public.country(cntry_id);


--
-- Name: books books_p_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blackstone
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_p_id_fkey FOREIGN KEY (p_id) REFERENCES public.publishers(p_id);


--
-- Name: has has_b_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blackstone
--

ALTER TABLE ONLY public.has
    ADD CONSTRAINT has_b_id_fkey FOREIGN KEY (h_b_id) REFERENCES public.books(b_id);


--
-- Name: has has_suborder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blackstone
--

ALTER TABLE ONLY public.has
    ADD CONSTRAINT has_suborder_id_fkey FOREIGN KEY (h_suborder_id) REFERENCES public.suborders(suborder_id);


--
-- Name: orders orders_c_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blackstone
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_c_id_fkey FOREIGN KEY (c_id) REFERENCES public.customers(c_id);


--
-- Name: status status_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blackstone
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);


--
-- Name: suborders suborders_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blackstone
--

ALTER TABLE ONLY public.suborders
    ADD CONSTRAINT suborders_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);


--
-- Name: written_by written_by_a_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blackstone
--

ALTER TABLE ONLY public.written_by
    ADD CONSTRAINT written_by_a_id_fkey FOREIGN KEY (w_a_id) REFERENCES public.authors(a_id);


--
-- Name: written_by written_by_b_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: blackstone
--

ALTER TABLE ONLY public.written_by
    ADD CONSTRAINT written_by_b_id_fkey FOREIGN KEY (w_b_id) REFERENCES public.books(b_id);


--
-- PostgreSQL database dump complete
--

