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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: earth_continents; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.earth_continents (
    earth_continents_id integer NOT NULL,
    name character varying(40) NOT NULL,
    population_in_millions integer,
    has_life boolean,
    planet_id integer
);


ALTER TABLE public.earth_continents OWNER TO freecodecamp;

--
-- Name: earth_continents_continent_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.earth_continents_continent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.earth_continents_continent_id_seq OWNER TO freecodecamp;

--
-- Name: earth_continents_continent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.earth_continents_continent_id_seq OWNED BY public.earth_continents.earth_continents_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    age_in_millions_of_years numeric(5,1),
    diameter_in_light_years integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    radius_in_meters integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age_in_millions_of_years integer,
    description text,
    has_life boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    distance_in_light_years integer,
    description text,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: earth_continents earth_continents_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earth_continents ALTER COLUMN earth_continents_id SET DEFAULT nextval('public.earth_continents_continent_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: earth_continents; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.earth_continents VALUES (1, 'North America', NULL, NULL, NULL);
INSERT INTO public.earth_continents VALUES (2, 'South America', NULL, NULL, NULL);
INSERT INTO public.earth_continents VALUES (3, 'Africa', NULL, NULL, NULL);
INSERT INTO public.earth_continents VALUES (4, 'Europe', NULL, NULL, NULL);
INSERT INTO public.earth_continents VALUES (5, 'Asia', NULL, NULL, NULL);
INSERT INTO public.earth_continents VALUES (6, 'Australia', NULL, NULL, NULL);
INSERT INTO public.earth_continents VALUES (7, 'Antactica', NULL, NULL, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Type SBbc. Barred spiral Galaxy. Home of Earth', NULL, 180000);
INSERT INTO public.galaxy VALUES (2, 'Segue 1', 'dSph or Glob Clus. Satellite of Milky Way.', NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Sagittarius Dwarf Sphr', 'dSph/E7', NULL, 10000);
INSERT INTO public.galaxy VALUES (4, 'Andromeda Galaxy(M31)', 'SA(s)b. Largest galaxy in the Local Group, with at least 19 satellite galaxies. Barred spiral galaxy.', NULL, 220000);
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy (M33)', 'SA(s)cd. Most distant (difficult) naked eye object. Closest unbarred spiral galaxy to us.', NULL, 60000);
INSERT INTO public.galaxy VALUES (6, 'Sextans A(92205, DDO 75)', 'IBm. Contains cluster of young hot blue stars', NULL, 5000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, NULL, 1);
INSERT INTO public.moon VALUES (2, 'Deimos', NULL, NULL, 4);
INSERT INTO public.moon VALUES (3, 'Phobos', NULL, NULL, 4);
INSERT INTO public.moon VALUES (4, 'Amalthea', NULL, NULL, 3);
INSERT INTO public.moon VALUES (5, 'Callisto', NULL, NULL, 3);
INSERT INTO public.moon VALUES (6, 'Europa', NULL, NULL, 3);
INSERT INTO public.moon VALUES (7, 'Ganymede', NULL, NULL, 3);
INSERT INTO public.moon VALUES (8, 'Io', NULL, NULL, 3);
INSERT INTO public.moon VALUES (9, 'Ariel', NULL, NULL, 7);
INSERT INTO public.moon VALUES (10, 'Miranda', NULL, NULL, 7);
INSERT INTO public.moon VALUES (11, 'Oberon', NULL, NULL, 7);
INSERT INTO public.moon VALUES (12, 'Titania', NULL, NULL, 7);
INSERT INTO public.moon VALUES (13, 'Umbriel', NULL, NULL, 7);
INSERT INTO public.moon VALUES (14, 'Dione', NULL, NULL, 13);
INSERT INTO public.moon VALUES (15, 'Enceladus', NULL, NULL, 13);
INSERT INTO public.moon VALUES (16, 'Hyperion', NULL, NULL, 13);
INSERT INTO public.moon VALUES (17, 'Iapetus', NULL, NULL, 13);
INSERT INTO public.moon VALUES (18, 'Mimas', NULL, NULL, 13);
INSERT INTO public.moon VALUES (19, 'Phoebe', NULL, NULL, 13);
INSERT INTO public.moon VALUES (20, 'Rhea', NULL, NULL, 13);
INSERT INTO public.moon VALUES (21, 'Tethys', NULL, NULL, 13);
INSERT INTO public.moon VALUES (22, 'Titan', NULL, NULL, 13);
INSERT INTO public.moon VALUES (23, 'Nereid', NULL, NULL, 6);
INSERT INTO public.moon VALUES (24, 'Triton', NULL, NULL, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', NULL, 'our planet', true, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', NULL, 'smallest planet', false, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', NULL, 'largest planet', false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', NULL, 'red planet; fourth largest', false, 1);
INSERT INTO public.planet VALUES (5, 'Venus', NULL, 'second planet from Sun; brightest natural object in Earth sky after the moon', false, 1);
INSERT INTO public.planet VALUES (6, 'Neptune', NULL, 'eighth and farthest-known Solar planet from Sun; 17 times mass of Earth', false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, 'seventh planet from Sun', false, 1);
INSERT INTO public.planet VALUES (8, 'Planet b', NULL, 'orbits at roughly 0.05AU w period of approximately 11.2 Earth days', false, 2);
INSERT INTO public.planet VALUES (9, 'Planet c', NULL, 'super-Earth or gas dwarf about 8 Earth masses; orbits roughly 1900 Earth days', false, 2);
INSERT INTO public.planet VALUES (10, 'Planet d', NULL, 'estimated .29 Earth masses if it is a planetary companion to Planet b', false, 2);
INSERT INTO public.planet VALUES (11, 'b', NULL, 'existence questioned in 2021; orbits every 233 days', NULL, 3);
INSERT INTO public.planet VALUES (12, 'Sirius A', NULL, 'stellar models suggest the star formed during the collapsing of a molecular cloud', NULL, 6);
INSERT INTO public.planet VALUES (13, 'Saturn', NULL, 'sixth planet from Sun, gas giant with radius of nine and a half Earths', false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun (Sol)', NULL, 'eight known planets', 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4, 'flare star, three confirmed planets.', 1);
INSERT INTO public.star VALUES (3, 'Barnards Star', 6, 'flare star, largest known proper motion, one disputed planet', 1);
INSERT INTO public.star VALUES (4, 'Ross 154', 9, 'flare star', 1);
INSERT INTO public.star VALUES (5, 'Ross 128', 11, 'flare star, one planet', 1);
INSERT INTO public.star VALUES (6, 'Sirius', 8, 'brightest star in the night sky', 1);


--
-- Name: earth_continents_continent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.earth_continents_continent_id_seq', 7, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: earth_continents earth_continents_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earth_continents
    ADD CONSTRAINT earth_continents_name_key UNIQUE (name);


--
-- Name: earth_continents earth_continents_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earth_continents
    ADD CONSTRAINT earth_continents_pkey PRIMARY KEY (earth_continents_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: earth_continents earth_continents_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earth_continents
    ADD CONSTRAINT earth_continents_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

