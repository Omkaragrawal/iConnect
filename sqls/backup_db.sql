toc.dat                                                                                             0000600 0004000 0002000 00000031354 13615653206 0014454 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       5    &                x            iconnect_local    12.1    12.1 '    C           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         D           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         E           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         F           1262    24658    iconnect_local    DATABASE     �   CREATE DATABASE iconnect_local WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_India.1252' LC_CTYPE = 'English_India.1252';
    DROP DATABASE iconnect_local;
                omkaragrawal    false                     3079    24663 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false         G           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
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
       public          postgres    false    203         H           0    0    interests_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.interests_id_seq OWNED BY public.interests.id;
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
       public          postgres    false    205         I           0    0    mentors_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.mentors_id_seq OWNED BY public.mentors.id;
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
       public          postgres    false    207         J           0    0    students_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;
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
       public          postgres    false    209         K           0    0    user_interest_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.user_interest_id_seq OWNED BY public.user_interest.id;
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
       public          postgres    false    210    209         �
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
       public          postgres    false    2741    209    207                                                                                                                                                                                                                                                                                            restore.sql                                                                                         0000600 0004000 0002000 00000023263 13615653206 0015401 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
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
-- Name: iconnect_local; Type: DATABASE; Schema: -; Owner: omkaragrawal
--

CREATE DATABASE iconnect_local WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_India.1252' LC_CTYPE = 'English_India.1252';


ALTER DATABASE iconnect_local OWNER TO omkaragrawal;

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
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: interests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.interests (
    id smallint NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.interests OWNER TO postgres;

--
-- Name: interests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.interests_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.interests_id_seq OWNER TO postgres;

--
-- Name: interests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.interests_id_seq OWNED BY public.interests.id;


--
-- Name: mentors; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.mentors OWNER TO postgres;

--
-- Name: mentors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mentors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mentors_id_seq OWNER TO postgres;

--
-- Name: mentors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mentors_id_seq OWNED BY public.mentors.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.students OWNER TO postgres;

--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_id_seq OWNER TO postgres;

--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- Name: user_interest; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.user_interest OWNER TO postgres;

--
-- Name: user_interest_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_interest_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_interest_id_seq OWNER TO postgres;

--
-- Name: user_interest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_interest_id_seq OWNED BY public.user_interest.id;


--
-- Name: interests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interests ALTER COLUMN id SET DEFAULT nextval('public.interests_id_seq'::regclass);


--
-- Name: mentors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mentors ALTER COLUMN id SET DEFAULT nextval('public.mentors_id_seq'::regclass);


--
-- Name: students id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- Name: user_interest id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_interest ALTER COLUMN id SET DEFAULT nextval('public.user_interest_id_seq'::regclass);


--
-- Name: interests interests_id_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interests
    ADD CONSTRAINT interests_id_name_key UNIQUE (id) INCLUDE (name);


--
-- Name: interests interests_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interests
    ADD CONSTRAINT interests_name_key UNIQUE (name);


--
-- Name: interests interests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interests
    ADD CONSTRAINT interests_pkey PRIMARY KEY (id);


--
-- Name: mentors mentors_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mentors
    ADD CONSTRAINT mentors_email_key UNIQUE (email);


--
-- Name: mentors mentors_id_email_mobile_institution_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mentors
    ADD CONSTRAINT mentors_id_email_mobile_institution_key UNIQUE (id) INCLUDE (email, mobile, institution);


--
-- Name: mentors mentors_mobile_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mentors
    ADD CONSTRAINT mentors_mobile_key UNIQUE (mobile);


--
-- Name: mentors mentors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mentors
    ADD CONSTRAINT mentors_pkey PRIMARY KEY (id);


--
-- Name: students students_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_email_key UNIQUE (email);


--
-- Name: students students_id_moodle_id_email_mobile_college_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_id_moodle_id_email_mobile_college_key UNIQUE (id) INCLUDE (moodle_id, email, mobile, college);


--
-- Name: students students_mobile_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_mobile_key UNIQUE (mobile);


--
-- Name: students students_moodle_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_moodle_id_key UNIQUE (moodle_id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: user_interest user_interest_id_interest_id_student_id_mentor_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_interest
    ADD CONSTRAINT user_interest_id_interest_id_student_id_mentor_id_key UNIQUE (id) INCLUDE (interest_id, student_id, mentor_id);


--
-- Name: user_interest user_interest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_interest
    ADD CONSTRAINT user_interest_pkey PRIMARY KEY (id);


--
-- Name: user_interest user_interest_interest_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_interest
    ADD CONSTRAINT user_interest_interest_id_fkey FOREIGN KEY (interest_id) REFERENCES public.interests(id);


--
-- Name: user_interest user_interest_mentor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_interest
    ADD CONSTRAINT user_interest_mentor_id_fkey FOREIGN KEY (mentor_id) REFERENCES public.mentors(id);


--
-- Name: user_interest user_interest_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_interest
    ADD CONSTRAINT user_interest_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             