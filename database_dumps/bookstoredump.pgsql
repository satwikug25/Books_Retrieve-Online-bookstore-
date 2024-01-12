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
    p_id character varying(64)
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
33a5aeec-b9cb-4512-a67a-5fb74d63ac4c	699 S. Mill Ave	Tempe	t	5f84ba23-0351-465c-b6ae-262564e1b010	aedb2726-4896-49da-88a6-1eb9c67f587b
b9587e06-655d-4568-9d4c-74d7356f150d	4810 Sunset Boulevard	Los Angeles	t	5f84ba23-0351-465c-b6ae-262564e1b010	9355181d-7c15-4b8d-a403-5729661bc3ed
998ddf2c-c5fc-46de-a17d-6af712ed1c04	20 W 34th Street	New York City	t	5f84ba23-0351-465c-b6ae-262564e1b010	374dc94d-0e84-46f9-b3e5-9aba65ec2555
\.


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: blackstone
--

COPY public.authors (a_id, a_name) FROM stdin;
4253fa6d-e20f-4254-a246-029c4a299a5a	Cormac McCarthy
f5023be9-8f90-41a7-905b-33f283f6f946	John Steinbeck
2b2d11b3-f773-436a-b68d-6a1ab58d2bb7	George Orwell
\.


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: blackstone
--

COPY public.books (b_id, title, price, isbn, pages, p_id) FROM stdin;
268391a3-6b69-4462-9cc4-704e10fc6f36	The Road	17.00	9780307387899	287	9141feba-95bf-46ea-8249-c90dfb537556
c73dec71-00af-4167-93b7-8d58112ffb53	The Grapes of Wrath	18.00	143039431	464	dcae0f43-15b8-4c00-91c0-b0ff57b27527
9de0b9bf-bdef-47d8-98d6-c0ed7c8b843a	Nineteen Eighty-Four	23.11	9780241453513	368	dcae0f43-15b8-4c00-91c0-b0ff57b27527
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: blackstone
--

COPY public.country (cntry_id, country_name) FROM stdin;
5f84ba23-0351-465c-b6ae-262564e1b010	United States of America
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: blackstone
--

COPY public.customers (c_id, first_name, last_name, email, cellphone) FROM stdin;
aedb2726-4896-49da-88a6-1eb9c67f587b	John	Smith	johnsmith@gmail.com	6233126298
9355181d-7c15-4b8d-a403-5729661bc3ed	Hannah	Kate	hannahkate123@gmail.com	4343761369
374dc94d-0e84-46f9-b3e5-9aba65ec2555	Cal	Trask	caltrask@hotmail.com	202456123
\.


--
-- Data for Name: has; Type: TABLE DATA; Schema: public; Owner: blackstone
--

COPY public.has (h_suborder_id, h_b_id) FROM stdin;
5d37101c-fb1f-4dfe-b7cb-18113e62c293	c73dec71-00af-4167-93b7-8d58112ffb53
707c4c91-c537-4ea2-8969-d315942b59c7	268391a3-6b69-4462-9cc4-704e10fc6f36
4e54651d-a024-41e8-87dd-d3a855f01fd8	9de0b9bf-bdef-47d8-98d6-c0ed7c8b843a
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: blackstone
--

COPY public.orders (order_id, order_date, c_id) FROM stdin;
6b4f063c-b075-4989-a4a4-b0175e9ade6e	2019-05-10 05:59:51-07	374dc94d-0e84-46f9-b3e5-9aba65ec2555
8daa8bbb-6454-4137-a6f3-04632eb03f76	2023-10-20 12:13:04-07	9355181d-7c15-4b8d-a403-5729661bc3ed
\.


--
-- Data for Name: publishers; Type: TABLE DATA; Schema: public; Owner: blackstone
--

COPY public.publishers (p_id, p_name) FROM stdin;
9141feba-95bf-46ea-8249-c90dfb537556	Knopf Doubleday Publishing Group
dcae0f43-15b8-4c00-91c0-b0ff57b27527	Penguin Books
\.


--
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: blackstone
--

COPY public.status (order_id, status) FROM stdin;
6b4f063c-b075-4989-a4a4-b0175e9ade6e	shipped
8daa8bbb-6454-4137-a6f3-04632eb03f76	delivered
\.


--
-- Data for Name: suborders; Type: TABLE DATA; Schema: public; Owner: blackstone
--

COPY public.suborders (suborder_id, order_id) FROM stdin;
5d37101c-fb1f-4dfe-b7cb-18113e62c293	6b4f063c-b075-4989-a4a4-b0175e9ade6e
707c4c91-c537-4ea2-8969-d315942b59c7	8daa8bbb-6454-4137-a6f3-04632eb03f76
4e54651d-a024-41e8-87dd-d3a855f01fd8	8daa8bbb-6454-4137-a6f3-04632eb03f76
\.


--
-- Data for Name: written_by; Type: TABLE DATA; Schema: public; Owner: blackstone
--

COPY public.written_by (w_b_id, w_a_id) FROM stdin;
268391a3-6b69-4462-9cc4-704e10fc6f36	4253fa6d-e20f-4254-a246-029c4a299a5a
c73dec71-00af-4167-93b7-8d58112ffb53	f5023be9-8f90-41a7-905b-33f283f6f946
9de0b9bf-bdef-47d8-98d6-c0ed7c8b843a	2b2d11b3-f773-436a-b68d-6a1ab58d2bb7
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

