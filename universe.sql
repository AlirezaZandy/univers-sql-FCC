--
-- PostgreSQL database dump
--

-- Dumped from database version 12.13 (Ubuntu 12.13-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.13 (Ubuntu 12.13-0ubuntu0.20.04.1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    galaxy_morphological_class character varying(30),
    distance_in_ly numeric NOT NULL,
    equatorial_coordinates character varying(30)[] NOT NULL
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
    name character varying(30),
    moon_class character varying(30),
    distance_in_km numeric NOT NULL,
    equatorial_coordinates character varying(30)[] NOT NULL,
    has_life boolean,
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
    name character varying(30),
    planet_class character varying(30),
    distance_in_au numeric NOT NULL,
    equatorial_coordinates character varying(30)[] NOT NULL,
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
-- Name: spacecarft; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spacecarft (
    spacecarft_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_of_crew integer,
    number_of_telescopes integer,
    notes text
);


ALTER TABLE public.spacecarft OWNER TO freecodecamp;

--
-- Name: spacecarft_spacecarft_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.spacecarft_spacecarft_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spacecarft_spacecarft_id_seq OWNER TO freecodecamp;

--
-- Name: spacecarft_spacecarft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.spacecarft_spacecarft_id_seq OWNED BY public.spacecarft.spacecarft_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    spectral_class character varying(30),
    distance_in_ly numeric NOT NULL,
    equatorial_coordinates character varying(30)[] NOT NULL,
    galaxy_id integer
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
-- Name: spacecarft spacecarft_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecarft ALTER COLUMN spacecarft_id SET DEFAULT nextval('public.spacecarft_spacecarft_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sb', 25881, '{"17h 45m 40.03599s","−29° 00′ 28.1699″"}');
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 'SB(s)m', 163000, '{NULL,NULL}');
INSERT INTO public.galaxy VALUES (3, 'Small Magellanic Cloud', 'SB(s)m pec', 203700, '{NULL,NULL}');
INSERT INTO public.galaxy VALUES (4, 'Andromeda Galaxy', 'SA(s)b', 2500000, '{NULL,NULL}');
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 'SA(s)cd', 3200000, '{NULL,NULL}');
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Ep', 12000000, '{NULL,NULL}');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, 405400, '{"5h 48m 46s","26 58 16"}', false, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', NULL, 9517.58, '{NULL,NULL}', false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', NULL, 23470.9, '{NULL,NULL}', false, 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', NULL, 1071600, '{NULL,NULL}', false, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', NULL, 1897000, '{NULL,NULL}', false, 5);
INSERT INTO public.moon VALUES (6, 'Europa', NULL, 676938, '{NULL,NULL}', false, 5);
INSERT INTO public.moon VALUES (7, 'Titan', NULL, 1257060, '{NULL,NULL}', false, 6);
INSERT INTO public.moon VALUES (8, 'Rhea', NULL, 527108, '{NULL,NULL}', false, 6);
INSERT INTO public.moon VALUES (9, 'Iapetus', NULL, 3560820, '{NULL,NULL}', false, 6);
INSERT INTO public.moon VALUES (10, 'Dione', NULL, 377396, '{NULL,NULL}', false, 6);
INSERT INTO public.moon VALUES (11, 'Tethys', NULL, 294619, '{NULL,NULL}', false, 6);
INSERT INTO public.moon VALUES (12, 'Enceladus', NULL, 237948, '{NULL,NULL}', false, 6);
INSERT INTO public.moon VALUES (13, 'Mimas', NULL, 185539, '{NULL,NULL}', false, 6);
INSERT INTO public.moon VALUES (14, 'Hyperion', NULL, 1481009, '{NULL,NULL}', false, 6);
INSERT INTO public.moon VALUES (15, 'Phoebe', NULL, 12960000, '{NULL,NULL}', false, 6);
INSERT INTO public.moon VALUES (16, 'Titania', NULL, 435910, '{NULL,NULL}', false, 7);
INSERT INTO public.moon VALUES (17, 'Oberon', NULL, 583520, '{NULL,NULL}', false, 7);
INSERT INTO public.moon VALUES (18, 'Umbriel', NULL, 266000, '{NULL,NULL}', false, 7);
INSERT INTO public.moon VALUES (19, 'Ariel', NULL, 191020, '{NULL,NULL}', false, 7);
INSERT INTO public.moon VALUES (20, 'Miranda', NULL, 129390, '{NULL,NULL}', false, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', NULL, 0.466697, '{"18h 44m 2s","61° 45′ 00″"}', false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', NULL, 0.728213, '{"18h 11m 2s","67° 16′ 00″"}', false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', NULL, 0, '{NULL,NULL}', true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', NULL, 1.66621, '{"21h 10m 44s","51° 88′ 65″"}', false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', NULL, 5.457, '{"17h 52m 14s","64° 49′ 50″"}', false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, 10.1238, '{"2h 33m 38s","83° 53′ 70″"}', false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, 20.09565, '{"17h 09m 15s","-15° 17′ 50″"}', false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', NULL, 30.33, '{"19h 57m 20s","42° 95′ 00″"}', false, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', NULL, 49.305, '{"20h 07m 30s","22° 37′ 48″"}', false, 1);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri d', NULL, 0.02885, '{NULL,NULL}', false, 2);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', NULL, 0.04856, '{NULL,NULL}', false, 2);
INSERT INTO public.planet VALUES (12, 'Lalande 21185 b', NULL, 0.0788, '{NULL,NULL}', false, 3);
INSERT INTO public.planet VALUES (13, 'Lalande 21185 d', NULL, 0.5141, '{NULL,NULL}', false, 3);


--
-- Data for Name: spacecarft; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spacecarft VALUES (1, 'Vostok', 1, 0, 'carried the first human into space');
INSERT INTO public.spacecarft VALUES (2, 'Mercury', 1, 0, 'was the United States first crewed spacecraft');
INSERT INTO public.spacecarft VALUES (3, 'Mir', 28, 2, 'The first modular space station in history');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G2V', 0.000000000017078116, '{"19h 4m 30s","60° 52′ 00″"}', 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'M5.5Ve', 4.2465, '{NULL,NULL}', 1);
INSERT INTO public.star VALUES (3, 'Lalande 21185', 'M2V', 8.3044, '{NULL,NULL}', 1);
INSERT INTO public.star VALUES (4, 'Epsilon Eridani', 'K2V', 10.475, '{NULL,NULL}', 1);
INSERT INTO public.star VALUES (5, 'Lacaille 9352', 'M0.5V', 10.7241, '{NULL,NULL}', 1);
INSERT INTO public.star VALUES (6, 'Ross 128', 'M4V', 11.007, '{NULL,NULL}', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: spacecarft_spacecarft_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spacecarft_spacecarft_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: spacecarft spacecarft_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecarft
    ADD CONSTRAINT spacecarft_name UNIQUE (name);


--
-- Name: spacecarft spacecarft_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecarft
    ADD CONSTRAINT spacecarft_pkey PRIMARY KEY (spacecarft_id);


--
-- Name: star star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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

