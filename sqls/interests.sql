toc.dat                                                                                             0000600 0004000 0002000 00000006330 13616077214 0014450 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       8    )                x            iconnect_local    12.1    12.1                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                    0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                    0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                    1262    24658    iconnect_local    DATABASE     �   CREATE DATABASE iconnect_local WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_India.1252' LC_CTYPE = 'English_India.1252';
    DROP DATABASE iconnect_local;
                omkaragrawal    false         �            1259    24672 	   interests    TABLE     e   CREATE TABLE public.interests (
    id smallint NOT NULL,
    name character varying(30) NOT NULL
);
    DROP TABLE public.interests;
       public         heap    postgres    false         �            1259    24675    interests_id_seq    SEQUENCE     �   CREATE SEQUENCE public.interests_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.interests_id_seq;
       public          postgres    false    203                    0    0    interests_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.interests_id_seq OWNED BY public.interests.id;
          public          postgres    false    204         �
           2604    24707    interests id    DEFAULT     l   ALTER TABLE ONLY public.interests ALTER COLUMN id SET DEFAULT nextval('public.interests_id_seq'::regclass);
 ;   ALTER TABLE public.interests ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    203                   0    24672 	   interests 
   TABLE DATA                 public          postgres    false    203       2837.dat            0    0    interests_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.interests_id_seq', 19, true);
          public          postgres    false    204         �
           2606    24712    interests interests_id_name_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.interests
    ADD CONSTRAINT interests_id_name_key UNIQUE (id) INCLUDE (name);
 I   ALTER TABLE ONLY public.interests DROP CONSTRAINT interests_id_name_key;
       public            postgres    false    203    203         �
           2606    24714    interests interests_name_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.interests
    ADD CONSTRAINT interests_name_key UNIQUE (name);
 F   ALTER TABLE ONLY public.interests DROP CONSTRAINT interests_name_key;
       public            postgres    false    203         �
           2606    24716    interests interests_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.interests
    ADD CONSTRAINT interests_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.interests DROP CONSTRAINT interests_pkey;
       public            postgres    false    203                                                                                                                                                                                                                                                                                                                2837.dat                                                                                            0000600 0004000 0002000 00000002513 13616077214 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO public.interests (id, name) VALUES (1, 'Backend Developement');
INSERT INTO public.interests (id, name) VALUES (2, 'Frontend Developement');
INSERT INTO public.interests (id, name) VALUES (3, 'Machine Learning');
INSERT INTO public.interests (id, name) VALUES (4, 'Deep Learning');
INSERT INTO public.interests (id, name) VALUES (5, 'Computer Vision');
INSERT INTO public.interests (id, name) VALUES (6, 'Graphics Designing');
INSERT INTO public.interests (id, name) VALUES (7, 'Game Developement');
INSERT INTO public.interests (id, name) VALUES (8, 'IOT');
INSERT INTO public.interests (id, name) VALUES (9, 'Software Engineering');
INSERT INTO public.interests (id, name) VALUES (10, 'Devops');
INSERT INTO public.interests (id, name) VALUES (11, 'Theoritical Computing');
INSERT INTO public.interests (id, name) VALUES (12, 'Compiler Design');
INSERT INTO public.interests (id, name) VALUES (13, 'Computer Networking');
INSERT INTO public.interests (id, name) VALUES (14, 'Computer Security');
INSERT INTO public.interests (id, name) VALUES (15, 'Information Security');
INSERT INTO public.interests (id, name) VALUES (16, 'Hardware');
INSERT INTO public.interests (id, name) VALUES (17, 'Blockchain');
INSERT INTO public.interests (id, name) VALUES (18, 'NLP');
INSERT INTO public.interests (id, name) VALUES (19, 'Quantum Computing');


                                                                                                                                                                                     restore.sql                                                                                         0000600 0004000 0002000 00000005423 13616077214 0015377 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

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

DROP DATABASE iconnect_local;
--
-- Name: iconnect_local; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE iconnect_local WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_India.1252' LC_CTYPE = 'English_India.1252';


\connect iconnect_local

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: interests; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.interests (
    id smallint NOT NULL,
    name character varying(30) NOT NULL
);


--
-- Name: interests_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.interests_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: interests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.interests_id_seq OWNED BY public.interests.id;


--
-- Name: interests id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interests ALTER COLUMN id SET DEFAULT nextval('public.interests_id_seq'::regclass);


--
-- Data for Name: interests; Type: TABLE DATA; Schema: public; Owner: -
--

\i $$PATH$$/2837.dat

--
-- Name: interests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.interests_id_seq', 19, true);


--
-- Name: interests interests_id_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interests
    ADD CONSTRAINT interests_id_name_key UNIQUE (id) INCLUDE (name);


--
-- Name: interests interests_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interests
    ADD CONSTRAINT interests_name_key UNIQUE (name);


--
-- Name: interests interests_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interests
    ADD CONSTRAINT interests_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             