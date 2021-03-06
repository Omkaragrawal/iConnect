toc.dat                                                                                             0000600 0004000 0002000 00000034145 13615654276 0014465 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP           0                x            iconnect_local    12.1    12.1 /    K           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         L           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         M           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         N           1262    24658    iconnect_local    DATABASE     �   CREATE DATABASE iconnect_local WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_India.1252' LC_CTYPE = 'English_India.1252';
    DROP DATABASE iconnect_local;
                omkaragrawal    false                     3079    24663 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false         O           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    1         �            1259    24672 	   interests    TABLE     e   CREATE TABLE public.interests (
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
       public          postgres    false    203         P           0    0    interests_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.interests_id_seq OWNED BY public.interests.id;
          public          postgres    false    204         �            1259    24677    mentors    TABLE     b  CREATE TABLE public.mentors (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    gender "char" DEFAULT 'o'::"char" NOT NULL,
    dob date NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(1500) NOT NULL,
    mobile character varying(15) NOT NULL,
    "isVerified" boolean DEFAULT false NOT NULL,
    interests json NOT NULL,
    institution character varying(100) NOT NULL,
    "isActive" boolean DEFAULT false NOT NULL,
    "isAdmin" boolean DEFAULT false NOT NULL,
    bio character varying(1000) NOT NULL,
    "linkedIn" character varying(100) NOT NULL
);
    DROP TABLE public.mentors;
       public         heap    postgres    false         �            1259    24687    mentors_id_seq    SEQUENCE     w   CREATE SEQUENCE public.mentors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.mentors_id_seq;
       public          postgres    false    205         Q           0    0    mentors_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.mentors_id_seq OWNED BY public.mentors.id;
          public          postgres    false    206         �            1259    24689    students    TABLE     T  CREATE TABLE public.students (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    gender "char" DEFAULT 'o'::"char" NOT NULL,
    dob date NOT NULL,
    moodle_id character varying(15) NOT NULL,
    email character varying(30) NOT NULL,
    password character varying(500) NOT NULL,
    mobile character varying(15) NOT NULL,
    "isVerified" boolean DEFAULT false NOT NULL,
    interests json NOT NULL,
    college character varying(10) DEFAULT 'APSIT'::character varying NOT NULL,
    "isActive" boolean DEFAULT false NOT NULL,
    "isAdmin" boolean DEFAULT false NOT NULL
);
    DROP TABLE public.students;
       public         heap    postgres    false         �            1259    24699    students_id_seq    SEQUENCE     x   CREATE SEQUENCE public.students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.students_id_seq;
       public          postgres    false    207         R           0    0    students_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;
          public          postgres    false    208         �            1259    24701    user_interest    TABLE     .  CREATE TABLE public.user_interest (
    id bigint NOT NULL,
    usertable "char" NOT NULL,
    username character varying(50) NOT NULL,
    interest_id smallint NOT NULL,
    student_id bigint DEFAULT 1 NOT NULL,
    mentor_id bigint DEFAULT 1 NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL
);
 !   DROP TABLE public.user_interest;
       public         heap    postgres    false         �            1259    24705    user_interest_id_seq    SEQUENCE     }   CREATE SEQUENCE public.user_interest_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.user_interest_id_seq;
       public          postgres    false    209         S           0    0    user_interest_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.user_interest_id_seq OWNED BY public.user_interest.id;
          public          postgres    false    210         �
           2604    24707    interests id    DEFAULT     l   ALTER TABLE ONLY public.interests ALTER COLUMN id SET DEFAULT nextval('public.interests_id_seq'::regclass);
 ;   ALTER TABLE public.interests ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    203         �
           2604    24708 
   mentors id    DEFAULT     h   ALTER TABLE ONLY public.mentors ALTER COLUMN id SET DEFAULT nextval('public.mentors_id_seq'::regclass);
 9   ALTER TABLE public.mentors ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    205         �
           2604    24709    students id    DEFAULT     j   ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);
 :   ALTER TABLE public.students ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    207         �
           2604    24710    user_interest id    DEFAULT     t   ALTER TABLE ONLY public.user_interest ALTER COLUMN id SET DEFAULT nextval('public.user_interest_id_seq'::regclass);
 ?   ALTER TABLE public.user_interest ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209         A          0    24672 	   interests 
   TABLE DATA                 public          postgres    false    203       2881.dat C          0    24677    mentors 
   TABLE DATA                 public          postgres    false    205       2883.dat E          0    24689    students 
   TABLE DATA                 public          postgres    false    207       2885.dat G          0    24701    user_interest 
   TABLE DATA                 public          postgres    false    209       2887.dat T           0    0    interests_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.interests_id_seq', 19, true);
          public          postgres    false    204         U           0    0    mentors_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.mentors_id_seq', 1, true);
          public          postgres    false    206         V           0    0    students_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.students_id_seq', 1, true);
          public          postgres    false    208         W           0    0    user_interest_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.user_interest_id_seq', 1, false);
          public          postgres    false    210         �
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
       public            postgres    false    203         �
           2606    24718    mentors mentors_email_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.mentors
    ADD CONSTRAINT mentors_email_key UNIQUE (email);
 C   ALTER TABLE ONLY public.mentors DROP CONSTRAINT mentors_email_key;
       public            postgres    false    205         �
           2606    24720 /   mentors mentors_id_email_mobile_institution_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.mentors
    ADD CONSTRAINT mentors_id_email_mobile_institution_key UNIQUE (id) INCLUDE (email, mobile, institution);
 Y   ALTER TABLE ONLY public.mentors DROP CONSTRAINT mentors_id_email_mobile_institution_key;
       public            postgres    false    205    205    205    205         �
           2606    24722    mentors mentors_mobile_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.mentors
    ADD CONSTRAINT mentors_mobile_key UNIQUE (mobile);
 D   ALTER TABLE ONLY public.mentors DROP CONSTRAINT mentors_mobile_key;
       public            postgres    false    205         �
           2606    24724    mentors mentors_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.mentors
    ADD CONSTRAINT mentors_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.mentors DROP CONSTRAINT mentors_pkey;
       public            postgres    false    205         �
           2606    24726    students students_email_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_email_key UNIQUE (email);
 E   ALTER TABLE ONLY public.students DROP CONSTRAINT students_email_key;
       public            postgres    false    207         �
           2606    24728 7   students students_id_moodle_id_email_mobile_college_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_id_moodle_id_email_mobile_college_key UNIQUE (id) INCLUDE (moodle_id, email, mobile, college);
 a   ALTER TABLE ONLY public.students DROP CONSTRAINT students_id_moodle_id_email_mobile_college_key;
       public            postgres    false    207    207    207    207    207         �
           2606    24730    students students_mobile_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_mobile_key UNIQUE (mobile);
 F   ALTER TABLE ONLY public.students DROP CONSTRAINT students_mobile_key;
       public            postgres    false    207         �
           2606    24732    students students_moodle_id_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_moodle_id_key UNIQUE (moodle_id);
 I   ALTER TABLE ONLY public.students DROP CONSTRAINT students_moodle_id_key;
       public            postgres    false    207         �
           2606    24734    students students_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.students DROP CONSTRAINT students_pkey;
       public            postgres    false    207         �
           2606    24736 C   user_interest user_interest_id_interest_id_student_id_mentor_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_interest
    ADD CONSTRAINT user_interest_id_interest_id_student_id_mentor_id_key UNIQUE (id) INCLUDE (interest_id, student_id, mentor_id);
 m   ALTER TABLE ONLY public.user_interest DROP CONSTRAINT user_interest_id_interest_id_student_id_mentor_id_key;
       public            postgres    false    209    209    209    209         �
           2606    24738     user_interest user_interest_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.user_interest
    ADD CONSTRAINT user_interest_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.user_interest DROP CONSTRAINT user_interest_pkey;
       public            postgres    false    209         �
           2606    24739 ,   user_interest user_interest_interest_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_interest
    ADD CONSTRAINT user_interest_interest_id_fkey FOREIGN KEY (interest_id) REFERENCES public.interests(id);
 V   ALTER TABLE ONLY public.user_interest DROP CONSTRAINT user_interest_interest_id_fkey;
       public          postgres    false    209    2725    203         �
           2606    24744 *   user_interest user_interest_mentor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_interest
    ADD CONSTRAINT user_interest_mentor_id_fkey FOREIGN KEY (mentor_id) REFERENCES public.mentors(id);
 T   ALTER TABLE ONLY public.user_interest DROP CONSTRAINT user_interest_mentor_id_fkey;
       public          postgres    false    209    205    2733         �
           2606    24749 +   user_interest user_interest_student_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_interest
    ADD CONSTRAINT user_interest_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id);
 U   ALTER TABLE ONLY public.user_interest DROP CONSTRAINT user_interest_student_id_fkey;
       public          postgres    false    2741    209    207                                                                                                                                                                                                                                                                                                                                                                                                                                   2881.dat                                                                                            0000600 0004000 0002000 00000002513 13615654276 0014274 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO public.interests (id, name) VALUES (1, 'Backend Developement');
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


                                                                                                                                                                                     2883.dat                                                                                            0000600 0004000 0002000 00000002656 13615654276 0014306 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO public.mentors (id, name, gender, dob, email, password, mobile, "isVerified", interests, institution, "isActive", "isAdmin", bio, "linkedIn") VALUES (1, 'default', 'm', '2020-01-16', 'GVGVGVJGH@gmail.com', 'pbkdf2sync$$#1000$$#07bd9d6deffd9bd1b3dcfbba2ce3b8c07f1b5d65c8040fb997a638bb57256803$$#f622eede0fd74f0db3a1bfd0c660310a030814904e645d5ed5259b2afc63c9b51987e4d220c7b5f6c27e82b9be05d18340701475aefeea914e955d693caf9e96febcb9e968c570c47dc43201b9e11ceabef6cc986063391f697f98e90e4f19c50d2bc5c8f171ca5bbcf877036ecdf01bcedcbb548b48ee183c53da8c54eae6b2cd247fe3dfb2b303be579a317793712db8e7d1027f0b6522118809ac059b92a7879e6f32de1b1335c54f773c587245bf63b5acef8bf7cfbcba8f9a7659637a866da0bc6f71fc3c038bb16df97ffe19b42a4035b14864c51f633e9be5d7733b1c623ad11f00bfa9f3439d4abb3ee287b0471979116ff86f1e1087e899b3289571a23d60b937c724a0948a026cd2f50d118b8194d6840c7899dd943557aef98206bd974409cb2e0f1ba97e43cff24830da6a7a17a16b54cbde120845e891bbe9b347a958ca987a0e0f063411dc4a1fed0e64030fb06b09c230536ddb89037d41ffd51145e65f0ed5cc26fdf279e0aa9bbc18b2e9afabadab6bd9b7e30f3e3992a9f26775ff543a3a727d29dd6e03eee198610968bc0e8e796d116fc51d6c5de43c54e9479873a4fcedeeb228c917be0bfcbbdd1997cb08a039a04b6ff1e3b5d6ac65b2ab8c2da5b336b3cfa4fcf428b2ed801f1eb706a7a91a6b75100ca4f61234212eef8edeff0a0668ed6503f44e28f4f4798b396807b3c1d68151963538c58d', '9967040227', false, '["1","3"]', 'NONE', false, false, 'fvfssdfsdv sdvdc', 'https://www.linkedin.com/in/F-a-54a81/');


                                                                                  2885.dat                                                                                            0000600 0004000 0002000 00000000475 13615654276 0014305 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO public.students (id, name, gender, dob, moodle_id, email, password, mobile, "isVerified", interests, college, "isActive", "isAdmin") VALUES (1, 'default', 'o', '1998-10-16', '1234567890', 'default@default.default', 'password', '0123456789', false, '{"names":["abc","default"]}', 'APSIT', false, false);


                                                                                                                                                                                                   2887.dat                                                                                            0000600 0004000 0002000 00000000002 13615654276 0014271 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              restore.sql                                                                                         0000600 0004000 0002000 00000023673 13615654276 0015416 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
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

--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


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
-- Name: mentors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mentors (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    gender "char" DEFAULT 'o'::"char" NOT NULL,
    dob date NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(1500) NOT NULL,
    mobile character varying(15) NOT NULL,
    "isVerified" boolean DEFAULT false NOT NULL,
    interests json NOT NULL,
    institution character varying(100) NOT NULL,
    "isActive" boolean DEFAULT false NOT NULL,
    "isAdmin" boolean DEFAULT false NOT NULL,
    bio character varying(1000) NOT NULL,
    "linkedIn" character varying(100) NOT NULL
);


--
-- Name: mentors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mentors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mentors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mentors_id_seq OWNED BY public.mentors.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.students (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    gender "char" DEFAULT 'o'::"char" NOT NULL,
    dob date NOT NULL,
    moodle_id character varying(15) NOT NULL,
    email character varying(30) NOT NULL,
    password character varying(500) NOT NULL,
    mobile character varying(15) NOT NULL,
    "isVerified" boolean DEFAULT false NOT NULL,
    interests json NOT NULL,
    college character varying(10) DEFAULT 'APSIT'::character varying NOT NULL,
    "isActive" boolean DEFAULT false NOT NULL,
    "isAdmin" boolean DEFAULT false NOT NULL
);


--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- Name: user_interest; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_interest (
    id bigint NOT NULL,
    usertable "char" NOT NULL,
    username character varying(50) NOT NULL,
    interest_id smallint NOT NULL,
    student_id bigint DEFAULT 1 NOT NULL,
    mentor_id bigint DEFAULT 1 NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL
);


--
-- Name: user_interest_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_interest_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_interest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_interest_id_seq OWNED BY public.user_interest.id;


--
-- Name: interests id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.interests ALTER COLUMN id SET DEFAULT nextval('public.interests_id_seq'::regclass);


--
-- Name: mentors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mentors ALTER COLUMN id SET DEFAULT nextval('public.mentors_id_seq'::regclass);


--
-- Name: students id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- Name: user_interest id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_interest ALTER COLUMN id SET DEFAULT nextval('public.user_interest_id_seq'::regclass);


--
-- Data for Name: interests; Type: TABLE DATA; Schema: public; Owner: -
--

\i $$PATH$$/2881.dat

--
-- Data for Name: mentors; Type: TABLE DATA; Schema: public; Owner: -
--

\i $$PATH$$/2883.dat

--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: -
--

\i $$PATH$$/2885.dat

--
-- Data for Name: user_interest; Type: TABLE DATA; Schema: public; Owner: -
--

\i $$PATH$$/2887.dat

--
-- Name: interests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.interests_id_seq', 19, true);


--
-- Name: mentors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mentors_id_seq', 1, true);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.students_id_seq', 1, true);


--
-- Name: user_interest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_interest_id_seq', 1, false);


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
-- Name: mentors mentors_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mentors
    ADD CONSTRAINT mentors_email_key UNIQUE (email);


--
-- Name: mentors mentors_id_email_mobile_institution_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mentors
    ADD CONSTRAINT mentors_id_email_mobile_institution_key UNIQUE (id) INCLUDE (email, mobile, institution);


--
-- Name: mentors mentors_mobile_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mentors
    ADD CONSTRAINT mentors_mobile_key UNIQUE (mobile);


--
-- Name: mentors mentors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mentors
    ADD CONSTRAINT mentors_pkey PRIMARY KEY (id);


--
-- Name: students students_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_email_key UNIQUE (email);


--
-- Name: students students_id_moodle_id_email_mobile_college_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_id_moodle_id_email_mobile_college_key UNIQUE (id) INCLUDE (moodle_id, email, mobile, college);


--
-- Name: students students_mobile_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_mobile_key UNIQUE (mobile);


--
-- Name: students students_moodle_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_moodle_id_key UNIQUE (moodle_id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: user_interest user_interest_id_interest_id_student_id_mentor_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_interest
    ADD CONSTRAINT user_interest_id_interest_id_student_id_mentor_id_key UNIQUE (id) INCLUDE (interest_id, student_id, mentor_id);


--
-- Name: user_interest user_interest_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_interest
    ADD CONSTRAINT user_interest_pkey PRIMARY KEY (id);


--
-- Name: user_interest user_interest_interest_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_interest
    ADD CONSTRAINT user_interest_interest_id_fkey FOREIGN KEY (interest_id) REFERENCES public.interests(id);


--
-- Name: user_interest user_interest_mentor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_interest
    ADD CONSTRAINT user_interest_mentor_id_fkey FOREIGN KEY (mentor_id) REFERENCES public.mentors(id);


--
-- Name: user_interest user_interest_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_interest
    ADD CONSTRAINT user_interest_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     