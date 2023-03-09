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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(50) NOT NULL,
    size_sq_degrees integer,
    messier_objs integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    alt_name character varying(50),
    first_observed date,
    stars_bil_ct integer NOT NULL,
    travel_time_yrs integer,
    distance_mil_ly_a numeric(9,2),
    constellation_id integer
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
    name character varying(50) NOT NULL,
    planet_id integer,
    discovered date,
    dist_earth_mil_mi numeric(9,2),
    visited boolean
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
    name character varying(50) NOT NULL,
    dwarf boolean,
    discovered date,
    dist_sun_aus numeric(9,2),
    quotes text,
    orb_pd_yr numeric(7,2)
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
    name character varying(50) NOT NULL,
    star_discovered date,
    star_dia_mil_mi numeric(9,2),
    star_dist numeric(9,2),
    star_alt_nm character varying(50),
    no_planets numeric(9,2),
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Coma Berenices', 386, 8);
INSERT INTO public.constellation VALUES (3, 'Sculptor', 475, 0);
INSERT INTO public.constellation VALUES (4, 'Ursa Major', 1280, 7);
INSERT INTO public.constellation VALUES (5, 'Andromeda', 722, 3);
INSERT INTO public.constellation VALUES (2, 'Sagittarius', 867, 15);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (6, 'Cigar', NULL, '2014-01-21', 30, NULL, 11.90, 4);
INSERT INTO public.galaxy VALUES (3, 'Milky Way', NULL, NULL, 100, NULL, 0.00, 2);
INSERT INTO public.galaxy VALUES (5, 'Cartwheel', NULL, '1941-01-01', 5, NULL, 500.00, 3);
INSERT INTO public.galaxy VALUES (7, 'Comet', NULL, '2007-03-02', 0, NULL, 3200.00, 3);
INSERT INTO public.galaxy VALUES (4, 'Bode''s', 'NGC 3031', '1774-01-01', 250, NULL, 11.74, 4);
INSERT INTO public.galaxy VALUES (2, 'Black Eye', 'NGC 4826', '1779-03-01', 100, NULL, 24.01, 1);
INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'NGC 224', '0964-01-01', 1000, NULL, 2.50, 5);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Phobos', 4, '1877-08-17', 48.34, NULL);
INSERT INTO public.moon VALUES (1, 'The Moon', 3, NULL, 0.24, true);
INSERT INTO public.moon VALUES (20, 'Amalthea', 5, '1892-09-09', NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Elara', 5, '1905-01-05', NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Thebe', 5, '1979-03-05', NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Europa', 5, '1610-01-08', NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Io', 5, '1610-01-08', NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Ganymede', 5, '1610-01-07', NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Callisto', 5, '1610-01-07', NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Hyperion', 6, '1848-01-01', NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Tethys', 6, '1684-03-11', NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Iapetus', 6, '1671-10-25', NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Enceladus', 6, '1789-08-28', NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Titan', 6, '1655-03-25', NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Mimas', 6, '1789-09-17', NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Rhea', 6, '1672-12-23', NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Dione', 6, '1684-03-30', NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, '1877-08-12', NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Aegir', 6, '2005-05-04', NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Albiorix', 6, '2000-12-19', NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (4, 'Mars', NULL, NULL, 1.52, '“Mars is there, waiting to be reached.” – Buzz Aldrin', 1.88);
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, '1781-03-13', 20.00, '“The moons of Uranus seem to have got a twist.” -Robert Stawell Ball', 84.02);
INSERT INTO public.planet VALUES (1, 'Mercury', NULL, NULL, 0.39, NULL, 0.24);
INSERT INTO public.planet VALUES (2, 'Venus', NULL, NULL, 0.72, NULL, 0.62);
INSERT INTO public.planet VALUES (3, 'Earth', NULL, NULL, 1.00, NULL, 1.00);
INSERT INTO public.planet VALUES (5, 'Jupiter', NULL, NULL, 5.20, NULL, 11.86);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, NULL, 9.50, NULL, 29.46);
INSERT INTO public.planet VALUES (8, 'Neptune', NULL, '1846-09-23', 30.00, NULL, 164.80);
INSERT INTO public.planet VALUES (9, 'Ceres', true, '1801-01-01', 2.77, NULL, 4.60);
INSERT INTO public.planet VALUES (11, 'Haumea', true, '2004-12-28', 43.12, NULL, 283.12);
INSERT INTO public.planet VALUES (12, 'Makemake', true, '2005-03-31', 45.43, NULL, 306.21);
INSERT INTO public.planet VALUES (10, 'Pluto', true, '1930-02-18', 39.48, NULL, 247.94);
INSERT INTO public.planet VALUES (13, 'Eris', true, '2005-01-05', 67.86, NULL, 559.07);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (4, 'Iota Andromedae', NULL, 3.19, 502.56, NULL, 0.00, 1);
INSERT INTO public.star VALUES (5, 'Beta Andromedae', NULL, 86.46, 199.00, NULL, NULL, 1);
INSERT INTO public.star VALUES (3, 'Sirius', '1862-01-31', 1.50, 8.60, NULL, 0.00, 3);
INSERT INTO public.star VALUES (2, 'Rigel', '1781-10-01', 68.22, 864.30, NULL, 14.00, 3);
INSERT INTO public.star VALUES (1, 'The Sun', NULL, 0.43, 0.00, NULL, 8.00, 3);
INSERT INTO public.star VALUES (6, 'Mu Andromedae', NULL, 1.48, 130.00, NULL, NULL, 1);
INSERT INTO public.star VALUES (7, 'Upsilon Andromedae', NULL, NULL, 44.26, NULL, NULL, 1);
INSERT INTO public.star VALUES (8, 'Delta Andromedae', NULL, NULL, 105.50, NULL, NULL, 1);
INSERT INTO public.star VALUES (9, 'Xi Andromedae', NULL, NULL, 223.00, NULL, NULL, 1);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: constellation constellation_constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_alt_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_alt_name_key UNIQUE (alt_name);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


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
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

