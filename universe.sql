--
-- PostgreSQL database dump
--

-- Dumped from database version 16.9 (Ubuntu 16.9-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.9 (Ubuntu 16.9-0ubuntu0.24.04.1)

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

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'ru_RU.UTF-8';


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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    composition text NOT NULL,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    description text,
    diameter_km numeric
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    type text,
    distance_from_earth integer,
    has_life boolean,
    is_spherical boolean,
    mass_in_billions_of_solar_masses numeric
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


ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    description text,
    distance_from_earth integer,
    orbital_period numeric
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


ALTER SEQUENCE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer,
    planet_type text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    description text,
    gravity numeric
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


ALTER SEQUENCE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer,
    distance_from_earth integer,
    age_in_millions_of_years integer,
    is_spherical boolean,
    luminosity numeric
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


ALTER SEQUENCE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (7, 'Ceres', 4, 'Rock and ice', true, 4500, 414, 'Dwarf planet in asteroid belt', 945);
INSERT INTO public.asteroid VALUES (8, 'Vesta', 4, 'Rocky', false, 4500, 353, 'Second largest asteroid', 525);
INSERT INTO public.asteroid VALUES (9, 'Pallas', 4, 'Silicate', false, 4500, 414, 'Third largest asteroid', 512);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0, true, true, 1500.5);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2500000, false, true, 1800.2);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3000000, false, true, 500.7);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Elliptical', 29000000, false, true, 800.3);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 23000000, false, true, 900.1);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical', 53000000, false, true, 2400.0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Moon', 1, true, 4500, 'Earth’s only natural satellite', 0, 27.3);
INSERT INTO public.moon VALUES (22, 'Phobos', 2, false, 4500, 'Mars moon, very close', 78, 0.3);
INSERT INTO public.moon VALUES (23, 'Deimos', 2, false, 4500, 'Mars moon, farther out', 78, 1.3);
INSERT INTO public.moon VALUES (24, 'Io', 4, true, 4500, 'Volcanically active', 628, 1.8);
INSERT INTO public.moon VALUES (25, 'Europa', 4, true, 4500, 'Icy surface, possible ocean', 628, 3.5);
INSERT INTO public.moon VALUES (26, 'Ganymede', 4, true, 4500, 'Largest moon in solar system', 628, 7.2);
INSERT INTO public.moon VALUES (27, 'Callisto', 4, true, 4500, 'Heavily cratered', 628, 16.7);
INSERT INTO public.moon VALUES (28, 'Titan', 5, true, 4500, 'Thick atmosphere', 1275, 15.9);
INSERT INTO public.moon VALUES (29, 'Enceladus', 5, true, 4500, 'Ice geysers', 1275, 1.4);
INSERT INTO public.moon VALUES (30, 'Mimas', 5, true, 4500, 'Looks like Death Star', 1275, 0.9);
INSERT INTO public.moon VALUES (31, 'Triton', 6, true, 4500, 'Retrograde orbit', 4350, 5.9);
INSERT INTO public.moon VALUES (32, 'Nereid', 6, true, 4500, 'Highly eccentric orbit', 4350, 360.1);
INSERT INTO public.moon VALUES (33, 'Kepler Moon A', 7, true, 2000, 'Hypothetical moon', 600000, 30.0);
INSERT INTO public.moon VALUES (34, 'Kepler Moon B', 7, true, 2000, 'Hypothetical moon', 600000, 45.0);
INSERT INTO public.moon VALUES (35, 'Gliese Moon A', 8, true, 3000, 'Possible rocky moon', 200000, 20.0);
INSERT INTO public.moon VALUES (36, 'Gliese Moon B', 8, true, 3000, 'Possible icy moon', 200000, 25.0);
INSERT INTO public.moon VALUES (37, 'HD Moon A', 9, true, 5000, 'Gas moon', 150000, 10.0);
INSERT INTO public.moon VALUES (38, 'TRAPPIST Moon 1', 10, true, 800, 'Small rocky moon', 40000, 2.0);
INSERT INTO public.moon VALUES (39, 'TRAPPIST Moon 2', 11, true, 800, 'Frozen moon', 42000, 3.0);
INSERT INTO public.moon VALUES (40, 'TRAPPIST Moon 3', 12, true, 800, 'Large cold moon', 44000, 4.0);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Terrestrial', true, true, 4500, 0, 'Home planet', 9.8);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Terrestrial', false, true, 4500, 78, 'Red planet', 3.7);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 'Terrestrial', false, true, 4500, 41, 'Hot and toxic atmosphere', 8.9);
INSERT INTO public.planet VALUES (4, 'Jupiter', 1, 'Gas Giant', false, true, 4500, 628, 'Largest planet', 24.8);
INSERT INTO public.planet VALUES (5, 'Saturn', 1, 'Gas Giant', false, true, 4500, 1275, 'Famous for its rings', 10.4);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, 'Ice Giant', false, true, 4500, 4350, 'Farthest planet', 11.2);
INSERT INTO public.planet VALUES (7, 'Kepler-22b', 2, 'Super-Earth', false, true, 2000, 600000, 'Potentially habitable', 10.0);
INSERT INTO public.planet VALUES (8, 'Gliese 581g', 2, 'Super-Earth', false, true, 3000, 200000, 'Exoplanet in habitable zone', 11.5);
INSERT INTO public.planet VALUES (9, 'HD 209458b', 3, 'Hot Jupiter', false, true, 5000, 150000, 'Gas giant with atmosphere', 9.0);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1e', 4, 'Terrestrial', false, true, 800, 40000, 'One of seven TRAPPIST planets', 0.9);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1f', 4, 'Terrestrial', false, true, 800, 42000, 'Frozen surface', 0.6);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1g', 4, 'Terrestrial', false, true, 800, 44000, 'Large and cold', 0.8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 0, 4600, true, 1.0);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 4200, 4500, true, 0.0017);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 8700, 300, true, 25.4);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 2, 640000, 8000, true, 126000);
INSERT INTO public.star VALUES (5, 'Rigel', 2, 860000, 9000, true, 120000);
INSERT INTO public.star VALUES (6, 'Vega', 3, 25000, 455, true, 40.1);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 9, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 36, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid asteroid_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT ALL ON SCHEMA public TO freecodecamp;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO freecodecamp;


--
-- PostgreSQL database dump complete
--

