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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    size_in_light_years integer,
    distance_from_earth integer,
    galaxy_type character varying(40)
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
    planet_id integer,
    name character varying(40),
    moon_mass_in_kg text,
    distance_from_planet_in_km integer NOT NULL,
    host_habitable_env boolean
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
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(40),
    distance_from_earth_light_years integer,
    type text
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebula_nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer,
    name character varying(40),
    distance_from_earth text,
    inside_habitable_zone boolean NOT NULL,
    planet_mass text
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
    galaxy_id integer,
    star_size_in_solar_mass numeric(3,2),
    star_type text
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
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_nebula_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 150000, 26670, 'Barred Spiral');
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 14000, 158186, 'Dwarf');
INSERT INTO public.galaxy VALUES (3, 'Small Magellanic Cloud', 7000, 198955, 'Dwarf');
INSERT INTO public.galaxy VALUES (4, 'Andromeda', 220000, 2530000, 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 60000, 2730000, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 54000, 24000000, 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Phobos', '1.07 x 10^16', 6000, false);
INSERT INTO public.moon VALUES (2, 3, 'Deimos', '1.48 x 10^15', 23460, false);
INSERT INTO public.moon VALUES (3, 4, 'Europa', '4.79 x 10^22', 670900, true);
INSERT INTO public.moon VALUES (4, 5, 'Enceladus', '1.08 x 10^20', 238000, true);
INSERT INTO public.moon VALUES (5, 5, 'Titan', '1.35 x 10^23', 1200000, true);
INSERT INTO public.moon VALUES (6, 4, 'Callisto', '1.08 x 10^23', 1880000, true);
INSERT INTO public.moon VALUES (7, 4, 'Ganymede', '1.48 x 10^23', 1070400, true);
INSERT INTO public.moon VALUES (8, 4, 'Io', '8.93 x 10^22', 421700, true);
INSERT INTO public.moon VALUES (9, 7, 'Triton', '2.14 x 10^22', 354800, true);
INSERT INTO public.moon VALUES (10, 5, 'Dione', '1.09 x 10^21', 377400, true);
INSERT INTO public.moon VALUES (11, 4, 'Metis', '3.6 x 10^16', 128000, false);
INSERT INTO public.moon VALUES (12, 4, 'Adrastea', '2 x 10^15', 129000, false);
INSERT INTO public.moon VALUES (13, 4, 'Amalthea', '2.08 x 10^18', 181000, false);
INSERT INTO public.moon VALUES (14, 4, 'Thebe', '4.3 x 10^17', 220000, false);
INSERT INTO public.moon VALUES (15, 5, 'Mimas', '4 x 10^19', 185539, false);
INSERT INTO public.moon VALUES (16, 5, 'Tethys', '6.2 x 10^20', 294619, false);
INSERT INTO public.moon VALUES (17, 5, 'Rhea', '2.3 x 10^21', 527108, false);
INSERT INTO public.moon VALUES (18, 5, 'Iapetus', '1.8 x 10^21', 3560820, false);
INSERT INTO public.moon VALUES (19, 7, 'Naiad', '13 x 10^16', 48224, false);
INSERT INTO public.moon VALUES (20, 7, 'Despina', '170 x 10^16', 27700, false);


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (1, 1, 'Horsehead Nebula', 1375, 'Dark Nebula');
INSERT INTO public.nebula VALUES (2, 1, 'Helix Nebula', 650, 'Planetary Nebula');
INSERT INTO public.nebula VALUES (3, 1, 'Eagle Nebula', 5700, 'Emission Nebula');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', '48 million miles', false, '3.3x 10^23 kg');
INSERT INTO public.planet VALUES (2, 1, 'Venus', '25 million miles', false, '4.867 x 10^24 kg');
INSERT INTO public.planet VALUES (3, 1, 'Mars', '33.2 million miles', false, '6.39 x 10^23 kg');
INSERT INTO public.planet VALUES (4, 1, 'Jupiter', '444 million miles', false, '1.898 x 10^27 kg');
INSERT INTO public.planet VALUES (5, 1, 'Saturn', '746 million miles', false, '5.683 x 10^26 kg');
INSERT INTO public.planet VALUES (7, 1, 'Neptune', '2.8 billion miles', false, '1.024 x 10^26 kg');
INSERT INTO public.planet VALUES (6, 1, 'Uranus', '1.7 billion miles', false, '8.681 x 10^25 kg');
INSERT INTO public.planet VALUES (8, 8, 'Methuselah', '12,400 light years', true, '2.5 Mj');
INSERT INTO public.planet VALUES (9, 10, 'Epsilon Eridani b', '10 light years', false, '0.63 Mj');
INSERT INTO public.planet VALUES (10, 9, 'Gliese 876b', '15 light years', true, '2.27 Mj');
INSERT INTO public.planet VALUES (11, 9, 'Gliese 876d', '15 light years', true, '6.83 MEarth');
INSERT INTO public.planet VALUES (12, 11, 'CoRoT-7b', '800 light years', false, '4.07 MEarth');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Alpheratz', 4, 3.80, 'Mercury-Maganese B8IVpMnHg');
INSERT INTO public.star VALUES (4, 'Centauri C', 1, 0.12, 'Red Dwarf');
INSERT INTO public.star VALUES (5, 'Vega', 1, 2.60, 'Alpha Lyrae');
INSERT INTO public.star VALUES (7, 'Beta Trianguli', 5, 3.50, 'A5III Giant Star');
INSERT INTO public.star VALUES (8, 'PSR B1620-26', 1, 0.34, 'White Dwarf and Binary');
INSERT INTO public.star VALUES (9, 'Gliese 876', 1, 0.35, 'Red Dwarf');
INSERT INTO public.star VALUES (10, 'Epsilon Eridani', 1, 0.82, 'Orange Dwarf');
INSERT INTO public.star VALUES (11, 'CoRoT-7', 1, 0.91, 'Yellow Dwarf and Binary');
INSERT INTO public.star VALUES (1, 'Sun', 1, 1.00, 'Yellow Dwarf');
INSERT INTO public.star VALUES (6, 'Sirius', 1, 2.02, 'A Dwarf Star and Binary');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_nebula_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


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
-- Name: nebula nebula_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_name_key UNIQUE (name);


--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: nebula nebula_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

