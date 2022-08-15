--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE random_numbers;
--
-- Name: random_numbers; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE random_numbers WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE random_numbers OWNER TO freecodecamp;

\connect random_numbers

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    guesses integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(30) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (7217, 251, 601);
INSERT INTO public.games VALUES (7218, 251, 928);
INSERT INTO public.games VALUES (7219, 252, 39);
INSERT INTO public.games VALUES (7220, 252, 530);
INSERT INTO public.games VALUES (7221, 251, 71);
INSERT INTO public.games VALUES (7222, 251, 381);
INSERT INTO public.games VALUES (7223, 251, 288);
INSERT INTO public.games VALUES (7224, 253, 563);
INSERT INTO public.games VALUES (7225, 253, 584);
INSERT INTO public.games VALUES (7226, 254, 361);
INSERT INTO public.games VALUES (7227, 254, 728);
INSERT INTO public.games VALUES (7228, 253, 520);
INSERT INTO public.games VALUES (7229, 253, 572);
INSERT INTO public.games VALUES (7230, 253, 188);
INSERT INTO public.games VALUES (7231, 255, 863);
INSERT INTO public.games VALUES (7232, 255, 465);
INSERT INTO public.games VALUES (7233, 256, 482);
INSERT INTO public.games VALUES (7234, 256, 971);
INSERT INTO public.games VALUES (7235, 255, 815);
INSERT INTO public.games VALUES (7236, 255, 868);
INSERT INTO public.games VALUES (7237, 255, 813);
INSERT INTO public.games VALUES (7238, 257, 689);
INSERT INTO public.games VALUES (7239, 257, 454);
INSERT INTO public.games VALUES (7240, 258, 374);
INSERT INTO public.games VALUES (7241, 258, 350);
INSERT INTO public.games VALUES (7242, 257, 269);
INSERT INTO public.games VALUES (7243, 257, 689);
INSERT INTO public.games VALUES (7244, 257, 708);
INSERT INTO public.games VALUES (7245, 259, 876);
INSERT INTO public.games VALUES (7246, 259, 104);
INSERT INTO public.games VALUES (7247, 260, 15);
INSERT INTO public.games VALUES (7248, 260, 359);
INSERT INTO public.games VALUES (7249, 259, 978);
INSERT INTO public.games VALUES (7250, 259, 220);
INSERT INTO public.games VALUES (7251, 259, 376);
INSERT INTO public.games VALUES (7252, 261, 6);
INSERT INTO public.games VALUES (7253, 261, 9);
INSERT INTO public.games VALUES (7254, 262, 1);
INSERT INTO public.games VALUES (7255, 263, 1);
INSERT INTO public.games VALUES (7256, 264, 455);
INSERT INTO public.games VALUES (7257, 264, 181);
INSERT INTO public.games VALUES (7258, 265, 473);
INSERT INTO public.games VALUES (7259, 265, 566);
INSERT INTO public.games VALUES (7260, 264, 570);
INSERT INTO public.games VALUES (7261, 264, 439);
INSERT INTO public.games VALUES (7262, 264, 889);
INSERT INTO public.games VALUES (7263, 266, 515);
INSERT INTO public.games VALUES (7264, 266, 799);
INSERT INTO public.games VALUES (7265, 267, 65);
INSERT INTO public.games VALUES (7266, 267, 273);
INSERT INTO public.games VALUES (7267, 266, 238);
INSERT INTO public.games VALUES (7268, 266, 792);
INSERT INTO public.games VALUES (7269, 266, 589);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (251, 'user_1660575345663');
INSERT INTO public.users VALUES (252, 'user_1660575345662');
INSERT INTO public.users VALUES (253, 'user_1660575348666');
INSERT INTO public.users VALUES (254, 'user_1660575348665');
INSERT INTO public.users VALUES (255, 'user_1660575352302');
INSERT INTO public.users VALUES (256, 'user_1660575352301');
INSERT INTO public.users VALUES (257, 'user_1660575356604');
INSERT INTO public.users VALUES (258, 'user_1660575356603');
INSERT INTO public.users VALUES (259, 'user_1660575420294');
INSERT INTO public.users VALUES (260, 'user_1660575420293');
INSERT INTO public.users VALUES (261, 'Eam');
INSERT INTO public.users VALUES (262, 'Eamonn');
INSERT INTO public.users VALUES (263, 'Eamonnn');
INSERT INTO public.users VALUES (264, 'user_1660575786209');
INSERT INTO public.users VALUES (265, 'user_1660575786208');
INSERT INTO public.users VALUES (266, 'user_1660575867627');
INSERT INTO public.users VALUES (267, 'user_1660575867626');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 7269, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 267, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

