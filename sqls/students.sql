toc.dat                                                                                             0000600 0004000 0002000 00000002262 13616100104 0014431 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP           1                x            iconnect_local    12.1    12.1     "           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         #           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         $           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         %           1262    24658    iconnect_local    DATABASE     �   CREATE DATABASE iconnect_local WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_India.1252' LC_CTYPE = 'English_India.1252';
    DROP DATABASE iconnect_local;
                omkaragrawal    false                   0    24689    students 
   TABLE DATA                 public          postgres    false    207       2846.dat '           0    0    students_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.students_id_seq', 1, true);
          public          postgres    false    208                                                                                                                                                                                                                                                                                                                                                      2846.dat                                                                                            0000600 0004000 0002000 00000000475 13616100104 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO public.students (id, name, gender, dob, moodle_id, email, password, mobile, "isVerified", interests, college, "isActive", "isAdmin") VALUES (1, 'default', 'o', '1998-10-16', '1234567890', 'default@default.default', 'password', '0123456789', false, '{"names":["abc","default"]}', 'APSIT', false, false);


                                                                                                                                                                                                   restore.sql                                                                                         0000600 0004000 0002000 00000002727 13616100104 0015364 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
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
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: -
--

\i $$PATH$$/2846.dat

--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.students_id_seq', 1, true);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         