toc.dat                                                                                             0000600 0004000 0002000 00000002257 13616100255 0014444 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP           3                x            iconnect_local    12.1    12.1                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                     0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         !           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         "           1262    24658    iconnect_local    DATABASE     �   CREATE DATABASE iconnect_local WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_India.1252' LC_CTYPE = 'English_India.1252';
    DROP DATABASE iconnect_local;
                omkaragrawal    false                   0    24677    mentors 
   TABLE DATA                 public          postgres    false    205       2843.dat $           0    0    mentors_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.mentors_id_seq', 2, true);
          public          postgres    false    206                                                                                                                                                                                                                                                                                                                                                         2843.dat                                                                                            0000600 0004000 0002000 00000005631 13616100255 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO public.mentors (id, name, gender, dob, email, password, mobile, "isVerified", interests, institution, "isActive", "isAdmin", bio, "linkedIn") VALUES (1, 'default', 'm', '2020-01-16', 'GVGVGVJGH@gmail.com', 'pbkdf2sync$$#1000$$#07bd9d6deffd9bd1b3dcfbba2ce3b8c07f1b5d65c8040fb997a638bb57256803$$#f622eede0fd74f0db3a1bfd0c660310a030814904e645d5ed5259b2afc63c9b51987e4d220c7b5f6c27e82b9be05d18340701475aefeea914e955d693caf9e96febcb9e968c570c47dc43201b9e11ceabef6cc986063391f697f98e90e4f19c50d2bc5c8f171ca5bbcf877036ecdf01bcedcbb548b48ee183c53da8c54eae6b2cd247fe3dfb2b303be579a317793712db8e7d1027f0b6522118809ac059b92a7879e6f32de1b1335c54f773c587245bf63b5acef8bf7cfbcba8f9a7659637a866da0bc6f71fc3c038bb16df97ffe19b42a4035b14864c51f633e9be5d7733b1c623ad11f00bfa9f3439d4abb3ee287b0471979116ff86f1e1087e899b3289571a23d60b937c724a0948a026cd2f50d118b8194d6840c7899dd943557aef98206bd974409cb2e0f1ba97e43cff24830da6a7a17a16b54cbde120845e891bbe9b347a958ca987a0e0f063411dc4a1fed0e64030fb06b09c230536ddb89037d41ffd51145e65f0ed5cc26fdf279e0aa9bbc18b2e9afabadab6bd9b7e30f3e3992a9f26775ff543a3a727d29dd6e03eee198610968bc0e8e796d116fc51d6c5de43c54e9479873a4fcedeeb228c917be0bfcbbdd1997cb08a039a04b6ff1e3b5d6ac65b2ab8c2da5b336b3cfa4fcf428b2ed801f1eb706a7a91a6b75100ca4f61234212eef8edeff0a0668ed6503f44e28f4f4798b396807b3c1d68151963538c58d', '9967040227', false, '["1","3"]', 'NONE', false, false, 'fvfssdfsdv sdvdc', 'https://www.linkedin.com/in/F-a-54a81/');
INSERT INTO public.mentors (id, name, gender, dob, email, password, mobile, "isVerified", interests, institution, "isActive", "isAdmin", bio, "linkedIn") VALUES (2, 'gvtud 6rdru ', 'm', '1998-10-16', 'GVGVG@gmail.com', 'pbkdf2sync$$#1000$$#b1a457028a43fffc2a1a5e5a01799b803a5dce9585e60ab0d5909a8a975ca2f5$$#f77243d595606fd8109497e9b949dab5d819ae8080047c3ec98711d40f0514f0935ae3e9db630afe6aed939888c2fb09018943da61b567d70876bcf83b771858e465e67495cec1b7cac85afe3aecb1d81a012de49ca6aec2ca0e477c2c00d90f61af9b099e09fcd45f5b16ffa1a3385c1c0bcb51c0300d8bf2c076b278e57d9a81c009e4b3c916453fc6328eecb4f7e22df1a9f4d310e3227e544285f05b6fa31383342c554b0270e951df216f239eec310d6eaa6d5b4c50a2586992f3912026a98367a3297e5327c74861d96f22af3637b1867426bb5f414f2d7b9590badcaa078432c679da43098ed0edd3110a33c8633cd902a7d2e7431536865ca09f372fc5b7d28390c61e97f91ead1171b689b63a4cc35d621eff25f228488bf0837dbd75a270ab06e9d0ebed10f40e348debcf2f27995ac843627ae488126d87eb313fc4c3a862fe8baccf47654ab7f1e926bb749d21362ba506e2aa152e626138b3f1adcaedccac2ebf952ed311952b4c28ec41c2d554ff4ff6c53af0ea1e6291dc53ba274b9e74398a5b0028f959e111da0ed31769dd75ce483f165b044f9cdde0f6ee2f998c347f21850ee044975630851d8e06f361928d634c40dcf30e95be15f03306c361e3d4f57d49231eae48f9c060f77e7d8049d9c7b2c91329527f7356741354f734a5d82c91c32f07eb1ced1a955908caf6b710867e12ed6d75286b26b5', '7977937694', false, '["1","2"]', 'Reliance Jio', false, false, 'kjhvgjtgcgsestuoi pijougtfdsdfghjkliuytresazxcvbhjkiuytrdcvbnkiuytrfdv', 'https://www.linkedin.com/in/F-a-54a81/');


                                                                                                       restore.sql                                                                                         0000600 0004000 0002000 00000002724 13616100255 0015370 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
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
-- Data for Name: mentors; Type: TABLE DATA; Schema: public; Owner: -
--

\i $$PATH$$/2843.dat

--
-- Name: mentors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.mentors_id_seq', 2, true);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            