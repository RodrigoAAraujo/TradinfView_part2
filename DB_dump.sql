--
-- PostgreSQL database dump
--

-- Dumped from database version 11.18 (Ubuntu 11.18-1.pgdg20.04+1)
-- Dumped by pg_dump version 11.18 (Ubuntu 11.18-1.pgdg20.04+1)

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
-- Name: btree_gin; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS btree_gin WITH SCHEMA public;


--
-- Name: EXTENSION btree_gin; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION btree_gin IS 'support for indexing common datatypes in GIN';


--
-- Name: btree_gist; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS btree_gist WITH SCHEMA public;


--
-- Name: EXTENSION btree_gist; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION btree_gist IS 'support for indexing common datatypes in GiST';


--
-- Name: citext; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


--
-- Name: cube; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS cube WITH SCHEMA public;


--
-- Name: EXTENSION cube; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION cube IS 'data type for multidimensional cubes';


--
-- Name: dblink; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS dblink WITH SCHEMA public;


--
-- Name: EXTENSION dblink; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION dblink IS 'connect to other PostgreSQL databases from within a database';


--
-- Name: dict_int; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS dict_int WITH SCHEMA public;


--
-- Name: EXTENSION dict_int; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION dict_int IS 'text search dictionary template for integers';


--
-- Name: dict_xsyn; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS dict_xsyn WITH SCHEMA public;


--
-- Name: EXTENSION dict_xsyn; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION dict_xsyn IS 'text search dictionary template for extended synonym processing';


--
-- Name: earthdistance; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS earthdistance WITH SCHEMA public;


--
-- Name: EXTENSION earthdistance; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION earthdistance IS 'calculate great-circle distances on the surface of the Earth';


--
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


--
-- Name: intarray; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS intarray WITH SCHEMA public;


--
-- Name: EXTENSION intarray; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION intarray IS 'functions, operators, and index support for 1-D arrays of integers';


--
-- Name: ltree; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS ltree WITH SCHEMA public;


--
-- Name: EXTENSION ltree; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION ltree IS 'data type for hierarchical tree-like structures';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track execution statistics of all SQL statements executed';


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: pgrowlocks; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pgrowlocks WITH SCHEMA public;


--
-- Name: EXTENSION pgrowlocks; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgrowlocks IS 'show row-level locking information';


--
-- Name: pgstattuple; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pgstattuple WITH SCHEMA public;


--
-- Name: EXTENSION pgstattuple; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgstattuple IS 'show tuple-level statistics';


--
-- Name: tablefunc; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS tablefunc WITH SCHEMA public;


--
-- Name: EXTENSION tablefunc; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION tablefunc IS 'functions that manipulate whole tables, including crosstab';


--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: xml2; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS xml2 WITH SCHEMA public;


--
-- Name: EXTENSION xml2; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION xml2 IS 'XPath querying and XSLT';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: movimentation_types; Type: TABLE; Schema: public; Owner: nfxomfil
--

CREATE TABLE public.movimentation_types (
    id integer NOT NULL,
    type text NOT NULL
);


ALTER TABLE public.movimentation_types OWNER TO nfxomfil;

--
-- Name: movimentation_types_id_seq; Type: SEQUENCE; Schema: public; Owner: nfxomfil
--

CREATE SEQUENCE public.movimentation_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movimentation_types_id_seq OWNER TO nfxomfil;

--
-- Name: movimentation_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nfxomfil
--

ALTER SEQUENCE public.movimentation_types_id_seq OWNED BY public.movimentation_types.id;


--
-- Name: movimentations; Type: TABLE; Schema: public; Owner: nfxomfil
--

CREATE TABLE public.movimentations (
    id integer NOT NULL,
    wallet_id integer NOT NULL,
    amount_aported bigint NOT NULL,
    execution_time timestamp without time zone DEFAULT now(),
    expiration_time timestamp without time zone NOT NULL,
    type integer NOT NULL,
    amount_requested bigint NOT NULL
);


ALTER TABLE public.movimentations OWNER TO nfxomfil;

--
-- Name: movimentations_id_seq; Type: SEQUENCE; Schema: public; Owner: nfxomfil
--

CREATE SEQUENCE public.movimentations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movimentations_id_seq OWNER TO nfxomfil;

--
-- Name: movimentations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nfxomfil
--

ALTER SEQUENCE public.movimentations_id_seq OWNED BY public.movimentations.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: nfxomfil
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    token text NOT NULL,
    active boolean DEFAULT true NOT NULL
);


ALTER TABLE public.sessions OWNER TO nfxomfil;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: nfxomfil
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO nfxomfil;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nfxomfil
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: nfxomfil
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    image_url text DEFAULT 'data:image/jpeg;base64,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'::text
);


ALTER TABLE public.users OWNER TO nfxomfil;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: nfxomfil
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO nfxomfil;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nfxomfil
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: wallet; Type: TABLE; Schema: public; Owner: nfxomfil
--

CREATE TABLE public.wallet (
    id integer NOT NULL,
    balance bigint DEFAULT 0 NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.wallet OWNER TO nfxomfil;

--
-- Name: wallet_id_seq; Type: SEQUENCE; Schema: public; Owner: nfxomfil
--

CREATE SEQUENCE public.wallet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wallet_id_seq OWNER TO nfxomfil;

--
-- Name: wallet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nfxomfil
--

ALTER SEQUENCE public.wallet_id_seq OWNED BY public.wallet.id;


--
-- Name: movimentation_types id; Type: DEFAULT; Schema: public; Owner: nfxomfil
--

ALTER TABLE ONLY public.movimentation_types ALTER COLUMN id SET DEFAULT nextval('public.movimentation_types_id_seq'::regclass);


--
-- Name: movimentations id; Type: DEFAULT; Schema: public; Owner: nfxomfil
--

ALTER TABLE ONLY public.movimentations ALTER COLUMN id SET DEFAULT nextval('public.movimentations_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: nfxomfil
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: nfxomfil
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: wallet id; Type: DEFAULT; Schema: public; Owner: nfxomfil
--

ALTER TABLE ONLY public.wallet ALTER COLUMN id SET DEFAULT nextval('public.wallet_id_seq'::regclass);


--
-- Data for Name: movimentation_types; Type: TABLE DATA; Schema: public; Owner: nfxomfil
--

COPY public.movimentation_types (id, type) FROM stdin;
\.


--
-- Data for Name: movimentations; Type: TABLE DATA; Schema: public; Owner: nfxomfil
--

COPY public.movimentations (id, wallet_id, amount_aported, execution_time, expiration_time, type, amount_requested) FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: nfxomfil
--

COPY public.sessions (id, user_id, token, active) FROM stdin;
1	6	eyJhbGciOiJIUzI1NiJ9.cmVnQGdtYWlsLmNvbQ.FN42QqNvNouAXrPUrI9Rhq6_YEfYUD4XEACPaKgkslg	t
2	6	eyJhbGciOiJIUzI1NiJ9.cmVnQGdtYWlsLmNvbQ.FN42QqNvNouAXrPUrI9Rhq6_YEfYUD4XEACPaKgkslg	t
3	7	eyJhbGciOiJIUzI1NiJ9.cGFibG9jQGdtYWlsLmNvbQ._5xX7zFHLGdrnNVDQQ8KYXpVal04C1Lu3pWuSK4omCc	t
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: nfxomfil
--

COPY public.users (id, username, email, password, image_url) FROM stdin;
2	PabloPicis	regis	$2b$12$7fjjLBb7e/2WvAjyNYBe9uY33ExK9Df75raEChvDC7mBaYJL3L/2m	\N
5	PabloPicos	regis@gmail.com	$2b$12$oMjGU2idioEf8wED8ra8HutMxkLXisqXcN2J5xrE7rrK8BKjiNV.2	data:image/jpeg;base64,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
6	Pabl	reg@gmail.com	$2b$12$G50thSgYEMgSIqjJU0gaGO1X4wVxJVIhjr9xvwae0tff6nNoFqLdW	data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAJkA5gMBIgACEQEDEQH/xAAbAAACAwEBAQAAAAAAAAAAAAAEBQIDBgABB//EAEMQAAIBAwIDBQQIBAUCBgMAAAECAwAEERIhBTFBEyJRYXEUMoHwBiNCkaGxwdEzUnLhNFNic/E2whUkVHSDsjVEgv/EABgBAAMBAQAAAAAAAAAAAAAAAAABAgME/8QAIxEAAgICAwACAgMAAAAAAAAAAAECERIhAzFBBFETcSIyYf/aAAwDAQACEQMRAD8A+bX8ccOiVUeGQvhNyAR69DQVzdXqyA9poYj/ADdmHIijzxpUAbUzFjuCMjHoaRX5Vrlip7rHIB6VhBO6aGwia8hWZOzjAU4Zzgbnwoe9VO0aO3kEqgk6guMioNbDCnXksd/CpRxASKQ2+rc9BWvQisxEhWj3B2x51KAvC5G4OCDjmKbWzw28gBfLMNh0PwoG5lkWb6qJdyRkb6t+tSpNgFW1+08sayPGoPdPMbef400a0gV+8zKRLqCn7Azv6isvGzDUqnc8/AU3uppTw1JQGk+yWZScD1+eVDQBYkZpoppyojnkYFs/ZAxy8OZ+NDcbKn621LFhjtXU7EdM0ALotGltLtGhzkLvy/KvGaSOMqCChG2+x8qKdgQnmeXId+0LnUSdsGq4yAe0zhs7DHP41S6spwTvU4I5JnSOPGfM4FUATHOsMZYSEykYULto36/Cp2t2yQuSc9Dnc/CqL6yntVjknCASrqUIc7fCq4fdKt7rHmKGkwNT9EpmWditvqQrksrgFcb9emAabeyPdXUs72zyImfZ4k76lvPypPwC7a0zdO5VN1Krjug+XM+NPxcy2fCEksOIt2cwJZY4wMknG7HlnwrlneQJkzwgQ2kB4teojMVzDb4eQZ5ZyR+/415cW/CmiihtrOVzL3dbSZkyOeANs7UhvGkdYImkkfs276ryHnnkav4bLDGyGNZDNHnSWbAQkncEfr4U8WldhTDU4bw22tgLyZ7aV8hUlXUSdsAkcjQCokMrx3BYlWAXssHV8kij+JXCCNEZLG7KnQki7umRuSeZOaTTyRq+mJA7ac7HAxjw6U421sENLy7DW3YyShHbCyIFwMZ93/ius2E0ns8BMK47SWRgfLA2+dqSLIsc4Ze9IwJAzyNP+BRki4uiRG6EY1yYzvjb0zTx0DGMVjDG4kmUXMgOwX3D/V4bGi4ODR9t2V5FNiQltm1afAHFVW3EbdDGCC9wxGNPQ6c7554PlVMnEJ57pLRLiSdWGGDJuSPA+fnUNMEFvHFC5lkIVdJWJWIwudj6753OOtKbu4vLeQyJeBg6kxCJip2O/wA+VUX0mXkiOrWqjQqNqAyBkb8sZoYkIdTFG21HTkaT8DVUii6a9ZrxZrkJMMKezxk+O5+edF2fE/8AzEkkBjVcktGOvw5Uuu4xHaO2OzyxICjGvFXcDls1nnin1JGcGXDadQ/l38806Q9BvEfpEp0paxatJ7xXu/gNq6l3H5rJrllsbRASQ+AhjAB8vPY11NRVAIpuGorqLSXtw2rZl2A6Y86XzwNC5aRSGHIHlXiPK0Y0Fs6sBQTneiOIpLAkazLpIUZDHcHwrRWiADUNfdyRnbO1S1Mh32XPMjnXakPfJJbOeVQeRpM5Ax5Va2ARGhkbKkMR033q+OdzcmR0LAk7AYzttj4VVYIAQ3aAORgLmmtrcKkUiyg6QpDDG2kdPwqG6dAUpDBKshhCdp9lF2K+Pr0pbPc3EMb2rMQrHJGajIjKvtEICKThRnJHztXsML3coDsFYkDJ601/oFduS7EllUgZXPKrbi6kdljdgUj90KvX5FEHhUoeTsu/oAyFOdsc6tNihiKA65+6I1C4yDzoyQCzGvUSQpXqetWWqSs2bZcnBDHwq4RSQI0iq+Ae9lO6B85ql7yYySN2rfWjDY6rT7ALMF1dLKjFSIoe1bU+cAEDb4kbUE8Zg7Nt8SJqWirETQ2tzKNAidArluq6gcD4gVQUWTDyFtAGNt8HwoQFsF3pMajw73mf0rV2HHiFC3jGeHciOXGlQQN8YrJCAvC0picBGABHL0oiCRpJWMmW1Ie6QeQ2qJQT2C0PGuI5LjXawqkS+72ewI35/hTma84eot7CLhsFwqjSzkaWkOOYPkd/SsjDcSRppjCg50Z8OtNuIXEk+EgIiKbZhwo0kYwKzlGxvY74nY8Ns7RZ3ECzjLtG5LZTxGNs5rLSyWkUs7W7M0TDSgYY2quVBDiOVpDqOMN9gdSKrZCsKhlyQ+GLH9qcY0HZfaxdq/aEr2UZGrA3Y0zk4mIkEEVv2mv3dfTpj8KX2Jjs27R9OotkpjYdaKRXm1Xbsi6QGOgDOD0ApsRU7KgEsis02SwDe6p6bfPKr7HiDPJHb4OHc6Qp3XOx6b9BS+dQ7SFHKLn7ZyceVdbKYr2D2c5CsG3wST0pJAMrEkTSMoIkCtqA6fIFeTwtKqyTbaQPdO3xqvhxlW8l7Ve5Ij97VyPjVkwiwTcNldWCQ21DQy6ecsB2shfA2wM/8ChOzly8wwTgAFjyq+xi7QgQy6lPUD9f1qN/Bc2qaZQwjdsCQHb52pJoEylCY4jolbWWy+3M9TXUfw61tIrZXlZnkfmDyFdRZViO3jjXsbhcaj1U9f0NecQhkuZ5HMrFdORq3J+NH23CpE4bLeSyCNkwUUpqOPnrvjyqm5dPYnGXMcialkUY5ePxzTyTeiDOviN/c25c+dSLIABgk5ryZlcALk7dfGuWUKo0bHkfStwDbW79hV5I1HasNJyvMeVHT3p4jaiKGMRRggSPsWbyApGqsxEad7LY2q8QXFlKrTRFR4E75xUuKsAywVku3Z7drmMkKBnTkUzmtpGklBlijkUA6OeQOvl4UFYXHblGlRsxDcjb8aZWqykkLA8uokIWzuPhtWUn6wFcFtxCKeFhpPaNgk97A/4o62t4PaBJMSkhJGgDAx5UVeWd1CunspY5FUnDnAb/AIoR5Z+wjjZwCUwTq72c52x+dHYIvuLNbiOcQtiSVcnWwwdsAevKk9zw5bZ+znjYSaQFHJc9TR6XdwjxRzx6f5SeTDxGPIV1/ewnDGNTHq7pZtwf1H71StFFIkluoJlQlIkhBkXQMEDO/wB4FLVkjKkKCoPxFMrVYJBfGE6cxgqNWCpGd/xq76LfR+64sZHSFfZUXVJMykgbchjnTbSVsRcsKR8HtBJqnUSmSdV9Nt6e8P4JA5iuIIbY28oOQJSezAJJHI79P0qMslzFw2CzTh5upMc98AdDjHLGKT3PGuIwSHZUJJ+pSMKMDrWLbn0HZoZ4Po3w2X2iQNMekQOUXI21dW+fOqZp7C4aSe3eCE6CSwcggj3RjGPHl5c6ydwzSxmXDJv3juBk9DQAkZV7BxqVj5U48d+hVGla1t+JRvcTydkkmyFSAT8DSe8tRaXeUnjuF8EzkHrnFRgmd4vZ4d432HqM+PKgG1xnAyOmeQNaJBYyt7q2CsrRkSZLZbceGKslvzcRsrEZcYOMAADlSxIp5pUEYd9SjJ5gVbIgtDpeNWdTksBvTaEGCEaEYZkffCtVdrKRxONlUJ5jocVFOIogJVBrznOmuy0syzEANjC7c80v2CGNo4Gp2kGnBx60xsLX2hGYrpjbbYZz8Kzts5E4JbU2nljAx1psnEDKAIMIRzYjG36VM0/AY4s7aS0MjKY4427qkjJOB1Bod7oyXXZnS0SjDAnHx/tQLXLSNm6mJwcKDkkZ8uVSWY9rF7PHJKyk7sNsHH7VCQjp4LmbdXjC5yo7x7vSuo3tLoSjsJmhjKAgO2Ac+ANdRbKoBvTflBHZTK8zENGqkZwfe/4pTBOZiLdwutmIQscA8+fToa0kdrpYrbmCJZFGptWSPKrOH2tvZwy6VQzucBshgSDuMEbeGKzXKoqqEZC64Nee1PqRYwQSGLjSQBvg/POgVibWylFkwe8oPWtBxm//AI8UjwSam3j0FQD47bcjQ3DuHS3U80sMYCKgc68KAPGumM3jbBF1klkkkYaBRpXLg7t5b/GmN8OHXdqyPmKZz3dI2xnrvXo4PcW2m47IMMfzhh93Wuvp7lbcNc2MSLn6t9IDKOmceNZuVsZGx4X2iQGR+yWRhz2JTPPy2rTWvHra0gZbPhallkMaMc77c9R51hbjVIkZue1nzuo0HbmKeyTzx8Ph0W8rRxppw674pTSfYWi6/eecJcSvqiU4aNn93P47UpTseyGuDSA5K43JB+dqjez3MsD3EocRzthSoHz0oSK4ItwLoRu2rJxnOnw860jHQMI4hcb/APl3WRApUxkEEYGOfrn4UEtjNIqgqWTmAM08eO2uLyIxJ2TMDIS6Bc4AGMdRk17c64O5LpiDjMYHdElO6EKEighinMCdnIwwQxyVG+fzpnwjiV5fLacItbhYShIymAWGeWDscDP40jmnlkll050xbAc81Ta8Sl4feLeRBe2ClfDTkY2occkM+pRQRezyxRXd48itqeSJgm4+z3ic+lJJ+JpxbiRgmt1cw5VSi6Gwcc+hNZviPEJZPo9YyK8gZ5XLhWxnJJqu0M9xPHO5MZQAGUnZsdcViuFx2wWjQXPHjLA3Dk4fDHboctEI92/XNZT6QC0S4WO0jkicYDZPkK1M1/HbRCWLTdzypmWTJU5x0rH8QkF1K8z7vjc49a14h2dbkRFTqOsncL0qyOGKdyDJpZtvQcyaDtiqSpgFhnfzqcxwWVAAOnjWlEl47W1cdkxCsAoGcA+tQuNOCRIFfm2BtVsMxjSJ5SMasZIzjYb+tHXC2iYFvnL7szbhvPy5mlYCmLsmhYuzAnYAjbNNrdMyaI9DYU8+lRgtZX1dqiCNeobKjzA8attbZ5+Iuh+uGj3l2C+ZqJSEQtbPXcgzMurBBjGDipwxC0wsWpizY1NjNP4oo4bbScNpHvjcr8fjVMEoyg7aFVVckON/vrH8je6AVCWRYszQhWfuK5yNOPGrWnlXsmUxSdkxwGbG3r6ivJY4xcmWC4yiA4kZs6WPXfmaWcTu4pipVlMgGHwuA37mtErYDibjrq2JgrtzwxGlfTFdSEz2+hSBLnlg4rqeCHYzvJjAiZjlWJgdD6gMgdR40NJeRszsjkMG+qTVnvEc/vNVcYLzMojDCMkuFkbOM9fxpWO0hkLfa5ZxnpVQgqAJu1IYsWJIAU/P3Uw4fNNpIIlIIIZdyDjbl6UtklNzICMadRyPjufx/CmlvdxtOyKG7676TjfrirktAaLhNhNcQCd1MbMcIxbGf6V61QU7UNM/OIsGIOFyD5+dV3txClhCNZ1j3Bpx3jzx16UOIrjibKsLlEjxrJXYZ233rnrdsLHXCkIdbuEi4TT3Y05E+GfEULxTjEiD2aUHLHU7Dp/p261dIj8M4RFDBKukg5ITBx/zWb4lMoeOO2DyMB33I5eVTGNysRXcX3aJ2a/aY5TH57UucEvoLMQNyME/jUsOrBkVmG7b8tqMSKeRFaWVUQDOQM/H79q6FoZCOe5nRI45S+MgAnfHgKra5kaRdREgTZFc6seWKsuIZpbdNBQOh3QZU58qEn1Qz6ZEAdemaoAqIyPDdakKnRlWYY8sUvMelHJIOBTK3mZobhmGQIsDfzFDv2CqM4OsEnHSlY2Ezh5OB8PRSAdRx586lcX0kUAifJ7uABkCrpSj8JstlIDkgHlzPShtUck0aRBW0nbwobCRdI2IFRGwqjdm8ulBQRpJCqqzK4zqOM7U3lt4wuHUkYIyvLOOdVNEsNmrRgHbc46VGVC8FYtdw2ru9CeteRRCa5SIgpqOMnp60Wk7SuFOCM4GOle3QiUuoOSvM4NVYhgeHWcdtmcro6HV8PvpLPbCCZTDJqB5BT9nzozhTxe0CRomlIbKIMY1evhVlxdpbskggeOVidTF9h6Cp2mDBJpwsyxgaYv8xs7+PrTm2uxa2C9kGIbOGJ3b1pBNcs4Dlk7QHK+NR4Y8ktzo1HdWb0POnKGQBkvFrqSc57ikHIFABzI4kY5Yggtnc1dbxq7ZaTUxGfM7VFVR2ARQN9wKpJLSGePPKgY6gdh3W32xzodpXCqeu4yRRJtpfcCajj3scx5UXbcIkuolJkVd8gMNzy5U7SAAjvcAdokTEbDKiuo+54AVRWjmUZJzq2A8vWupXELJ32uGX64atRLKMcznnQswItlB0mSYnBHkcY+/I+FFX8kS3DF8uz4BYnGADtmgGDtH7QNSJkld+Z8vnrTiIujijKSKCMo+keYxUUk72plBZcA78sbZofTKk6Eggk7Z8etESoI5ASCSRkk8iMf802M8mlnklUHVp5LvT7hF7DYW4Wdhgvkpz3x91L+EwLPMNmZQBgDmKbCy4eLiSKVhnVzzt8KylvQBNw8t/cPGHVLcnYl9iMch99Ir65tI52aGHfOM8gPMD96MuGtoxJbWyZAc5Ybkn/ilE9uZuzkfbUNsLvy60oxSA8N0JCqhmRFPdO+/r4VXcXfRHfQBhQTtmrmsGRfr20qc6SKsTg8rjXcyi2twdmcd5vQVpBJ9CtFUfE3eOO3jR2cnBYklmHp+lG3HA7gSRmeRbcSbrHjXKfDKjl8TmmvCLQqHj4RGIFUZlu5sagPEn7I9N6sXiEdpP2fDiwjDBri9kB7S5wd1T+UefOtXFLsSbfQCvA5baCeAsImmQKEncCQbZzpUHGwzvis5d272k2mQqcnZlOQw8RWssJFluZTHH2MbyGQqGJ3Pnz8qXfSqzEKxThe6W0n1+RUNpl06AL06uC23QhuX31LhHDp75VKusCBjpZjjJHPln76oucNw60Q7Z863kXCIbHg1g6qO0kttRZuYyOVLS7G1fQug4BM9qXSVpomXeS2ftNII2JXY486WzcB4j2Wq0ZbmKMd4RE6wOpKHf7s0dFeezX8VxmUuilVZHKsoxgcqYQcUg4jJHDxIrBd4DRcThBCsd9nAxjlz504qMjOWSMnY6V4gGUHKZPLYVXNO+CUw0sjktkZxk7cq13E7cQXAHFrQM7Du3UGNRHj4OPxpSv0dklPa2s8U9sM5dB3kHPvA0S43HYlJeieFZILRpFhcyMzZzt0G9L5rxpRpKDT4as094nbSx2CQRxhgZMiRWJ/t0NJbi1VU1iRQ3VdqmLRZVo7Q5xkf6RyorhBU8RRdOcKwP3VdwgM1vKNIaPIUgjnk/pRnDrAnifa9kUj0nQud8Yp3QIVQCVJHIQnB542FMYrJ7Q5mmj1ahlcjbPLOat4PDcEyqZYlhVySrb0wvLVWWRpdYDkNpOBjrtsTWcp06Bi7h9vC7NKt66uCWVQwyfQGj3lguIX1QlimGdkBGG8Dn40omgFirzW9wZNW+lRsgPLNAGdz2rM3aBlAYt9oZoxy2BPiN+s7fURCIKxA0tzHpXUObdpO8q4U8tIJrq1SigNDd28KQSXUziUE91dOM+G3z1pVJcCSSGQYBjDFgOWR0/SnV/aIbZ3kY6wcggZHWs1MjsmyAZGdjzHz+dTF6FYTHKs7Ek4OjIydgc1KzlFyDbuMqASB4Y8KH4cp1My94qPdp19HbSPtWll9wBtXLfY4/P8ACiclFDCeGRexWTTCQrIRsoG5G9Q4lNawQFkjzKdi2c48fxoziCNDYyyDBQSbAbaSeg+elZziEzyyaWHd2Ow3PyTWcW5bAb2c8NzOtuEWNnUYPIFjt+VXSn2lDb20RXoXB2B9elAWXCJNSzXsvZxjfbmB5+FFy8Q+rK2YWGI51SY3b0/etlxXtkyl9ElMVgnZs3tNwDkKfdj9anbw9sH4hxOdltU+3y1H+VB+teJZRW9p7fxPVFbDdIvtz+vl50um4lcX9wLm4jQWoQiKAbAD0/WtdRRKVh8vE2uXiXszbcORswQIcdsw6t1PrQEMjSyOzHOygeCjfAFUxSGa6Mkp3x4e6PKr+DQm5mkQ5VAAzt/KozmsW7NEhxwqF/ZzOq53wFJxnxJ9K0MXA7ee2Au7eOZidWJDnFDWNuhnRQMKACVD8tthTs6F/mGenaf2oiapAZ+j3C2jVH4fBheQA5VVxW1eFRPGzlAuhkLZAAGAMdKaZVN9Ln/+s/pUHKzxOgQ5YY8f0p0Mw17F2ckbLukm4Ph5GlouGivI9IyrppZCdmGphj+9PbiFI7l4ZshWI7/8h6H56Gs7erJb30aMNLKB/wDZj+tKqM5IeWPFpLdZI5k9r4YTlopOcTeR5g+Yr2ZHtwvFOA3LtAP4n80Z/lcdR50jmkkt5i8J31EFcZBGBz8q9i4ndWF0Lu0UJEUxJGu4xk528KuMvDNxXhpbTiVlxMqk49kveWFJEcmfwpH9IbWaFmEtuIww5ouVYdCDV01pDxWFrrhSYkAzLZ9R/qj8vKvOH8dkij7C9QXVkdsP76U5ccZO+mRtEOG2sUdi2cyM5X6tCfHYU5tuGx20QubjsYz2Z0qCBzG+TQr2RSI330fkE6k6ije8NuQpZZXDF5JOIiRpI8aLfScE9dvnnXPyccky00x5b8OtYF1ImiRgCuTnn+ZpfPd3tszB2kVUJwVGdq9b6QJIouWxCqZAQbuWHKlzfSNp5Q0kChWXDFnzis4wldsdbI3bo9qyuVg1c3Ve6/rikedDDcHoRjajJ794zNboYpoW5FgT91AyE55866IqhjWxniCZNw0C8gg3+Oa6lAYjrXUONgbi5sLksBGdSKvIc8cufWs9xBJ7BzHPFpJySMcicYH3fnX0yWM2yjuNEqqqqWHMjfnj8PKsL9M5e1eLG/M6uWfHn8K4+D5DnyYUFUA8AtmuFmKgkZVSoGfH+1aVbP2CFmlJjL52HPGMfdSv6K9qllJ2bEK75b+kYG/gM4p3MwfLTNrIzgEbAb+POtZKXJNxRLkkcMSW0YdFAyWViAcn40sna0sMM4Ly40qBzP7VVe8WCkQWIDPyLfZWl0EUk9yETVcXMm3n/aurj4Yw0RbZbPNJekGfVpJ7kK05tbKPhaR3HEwJLpv4Fpn3fNqshto+BgbLccVkHdHNYfOovJGlvl/rr6YkvNNju7dPDbO1Pk5MP2OMRHeXEt68l7xFtaAkog642wPKl1tM91dyu+NTIcAchuNqk7PNHLJjTGvcUdAOdDWWomXGdXYty+FLb7NBhCxRZGIOwIyab8Ls3solcqup0zIM8yd1XHXA3+NDcHtjMTIQXhTvYPVui/PSm4jmmfcasE5IHXrUUVEZ8NEqrr0Pk7k6T+9NNdzgaFfHo370FaQzhFXE6+S8qJJlzgPMTzHiKpIuwkyTKCX7UE4x9Wx/WvGmc7nb/wCJ6GKXmQTJPkf6GriLnBB1Hrujg0wbFHHtXvbMMbgId/vFZu9tmmia5AXtINJP+pP0x+VariEE8kbFgykeOf1pHh4J1lChiNiCM5Hn5c80hMVzkL/U25PwpfdyPDcxsmNo916Eam2prxi1W3lUjV2JBZB1xjYeZFJL4FTAG94RAH1yaSM2NYpzDbrdWbGF0xIBndf7U1kgg46GMJS14uPeUnCXH7Gs5C3aLCpOAVRCeQxk86acOhhlAzciLcMuvPcz4EflTzx2yaBYJrvhl02ktb3EZxJE3L7utaO14pacZiNvOzWt2dwVOMnxHQ/Goyrb8Sb2DjLGO8Ta3v1UgMPPPMVnOI2Vzw65MF6gST7Ljk48Qa1Uk19oiUbGXEeGXlrhrhY5QAQssabttsCMbflWeSForlBcQ90t7rGtDwv6RS2oEN+TNByDdR+9MbjglnxILfcNmw+cjDZX7ulJ8ev4iU6/sY3iFsbedgPdY5XAPWqXik7PtOzbs/58bGtFxGJjMkc+FnVjmOUEK3QEDrnblQV9drHGLSNISqkkqB3d+grG30a2K4rZ5E1AjFdUom54l0DwxXU3kM+us1xd8IMkzqzck08tuW/hWGvrafiN3oZgyKcEtyXxwfurQBrmW0t4rgleyQDs1OBnHPalfE+L29mOziKyTfyjkpqOH4uDylozlP6JwGLhPD1iklxGuTkgd45zSS84lNfFhHqihPPxahJXmvJDJdMWY9PCj+FcMn4nKI4FKxLu8p5L/eupLxElNhYzXc4gs0JYjvE8l860LhOCW8ltwxPaL/QXmmOMRgc/T0ry7vrThMf/AIfwt40dv41wx2X1NKFllMc0Vg47KVMSSyLkyEjfHnv8KmcsdLsuMQyEGztQ80q3FxcYl1Abrnx35/2oS47SGZy8y4ilYcs/Ybei4PZ4OHzrcrrmjmjVSjHLDuk/maWcSnlntZJGi7DVcH6sb81OwPpXKtvZpQFEWHDpBjAZ8/hVXDVLXOlTu6lR94o6dEj4UN11FVOAd9xz++g+GB0uEnTTs2kZI54zWwh/aK1kTbwNkQnLOdsyHnj02Hwppw8lny++epzSkMNKqdW3+vrR9tOFXHT+qhFj03ja9KnS2NgHb58Puqa8SncYS3HLmXNJDMTuZMZ6hqnHLEmAzBmPNgTToY7S9u9JDwxnf/MO3OvWu7lDnsYyAP8ANPj6elJxcRf5nn7x8DXGaJ8AOw9aYDC5uSy96NRtz1fPlSG7do3IA06uuqj3lQDAcEeFAXp140tk0UIBkHtiezOftZRs5Or+42pBxLadBy0pgg9NzTxgVYEsceRxg0m4qrNeSPju5Ckjoef61NCZaEEcMB8Y0b79VNIowOGpMGHaiCIoQ3uZJH6UAkWeHiQKdkjG5/qq22mMtgI1iJVFiUycgO9/es57RA24hxK74jALC5K9pHjDY3z48vjXnC+JR3Np/wCG8fiMtrqKpMBgxsNu6aVX7vHeXMipIQrgh9Ww2HM/pVvDbhZYJLe8IdGYuB4MTnNEJYLQEONcFueEurFxNZOfq7heWPBvA0LZXtzYTdtay6R9peYannD+Ktw/VZ3qrcWMh0kNuPQ+FUca+j/YQ+38IZrixPvIN2iHn4iulNPcSWNrLinD+OxC3vI1WYfZfkT4qanf8IHYOsMcTxYyQV7wx0FYYnOHViGHUdK0PBvpPJbYhvy0kXSQe8PXxpvHk1LsyxcdxBo7U3AxLCIwNxgaRXVsGgsuIxLPDMUV99cD41eo8a6sZfG5W9Ffnj6ZPinH5Jy0NjkR8jL1b0pQiDOX3bxNVQ++vpV8n8NvStrsKrobcE4LPxV9bExWq+/Ieo8BTu9vCqHhP0eiPcX62RBkqB19aZ8N/wCmh/tis79E/wDGyf7w/MUTeMdFxWyfsvC7a2ANsLi4O+qbPd8Sf2qh4zcrayxjImuEww5Y3/aieKf4iX1qmb/pzhH+/wDoa5l0bEoxbE38kx7YG6i0HOdJyufXA60H9KZtckkSqqhrljhR1CAZqPDv8Lcf+5j/AEoXjn/5Bf8Acb8qdCZ5OrTwEKDrESxgYySME/vXk8KCZYkUvHB3FYbavE0ZwD/EL/V/2UBB/FHofzpoAyGQjnGD91HpONIAhzn0+fChYedHDktUhnolUH/DH4V72y/+mbHrXTc/nwqUfuffTEerIP8A0x+8edcZmPKPGPEipfaPr+9Tm90+n70IZR2h6oPwqiV10nun7xUqql5fPhTAXXGonZSB61RBA0kz62CRzDQ7HfSehoyaqD/CepYghbRgiw+9gIuBzzhsflQFkkL2snaSsHBjCRhsBiTy/A04v/8AGL/tRfk1ILX+HJ/tj/7Cs/sljm8QJFfxjIVXXJ1Fs7DY+Ne3kEU96BbyFUWAlCWG2GA+6u//AEOIf1x/kKCk/iN/7P8A7xWaEG2Lx3LPHPoXKFSAucnx+fCrrG+uOBTDRJ2ts2x9KUcO/iJ/Wfzo5+d1/U361cbjLQNDHifArbicHt/A9KykapLbOx8186yTAgsroVcHBU8xW1+g3+MHw/Okf0y/6mu/Wutki20v7uxLG2ndNXMV7QxrqnJr0MUf/9k=
7	Pablo	pabloc@gmail.com	$2b$12$d4FjV6e0gD9UW.ukFHNejuj/PEc3gE44oLhjOpMZcUHG4cxTOVLQS	\N
\.


--
-- Data for Name: wallet; Type: TABLE DATA; Schema: public; Owner: nfxomfil
--

COPY public.wallet (id, balance, user_id) FROM stdin;
2	0	6
3	366	6
\.


--
-- Name: movimentation_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nfxomfil
--

SELECT pg_catalog.setval('public.movimentation_types_id_seq', 1, false);


--
-- Name: movimentations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nfxomfil
--

SELECT pg_catalog.setval('public.movimentations_id_seq', 1, false);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nfxomfil
--

SELECT pg_catalog.setval('public.sessions_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nfxomfil
--

SELECT pg_catalog.setval('public.users_id_seq', 7, true);


--
-- Name: wallet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nfxomfil
--

SELECT pg_catalog.setval('public.wallet_id_seq', 4, true);


--
-- Name: movimentation_types movimentation_types_pkey; Type: CONSTRAINT; Schema: public; Owner: nfxomfil
--

ALTER TABLE ONLY public.movimentation_types
    ADD CONSTRAINT movimentation_types_pkey PRIMARY KEY (id);


--
-- Name: movimentations movimentations_pkey; Type: CONSTRAINT; Schema: public; Owner: nfxomfil
--

ALTER TABLE ONLY public.movimentations
    ADD CONSTRAINT movimentations_pkey PRIMARY KEY (id);


--
-- Name: wallet pk; Type: CONSTRAINT; Schema: public; Owner: nfxomfil
--

ALTER TABLE ONLY public.wallet
    ADD CONSTRAINT pk PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: nfxomfil
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: nfxomfil
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: nfxomfil
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: nfxomfil
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: movimentations movimentations_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nfxomfil
--

ALTER TABLE ONLY public.movimentations
    ADD CONSTRAINT movimentations_type_fkey FOREIGN KEY (type) REFERENCES public.movimentation_types(id);


--
-- Name: movimentations movimentations_wallet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nfxomfil
--

ALTER TABLE ONLY public.movimentations
    ADD CONSTRAINT movimentations_wallet_id_fkey FOREIGN KEY (wallet_id) REFERENCES public.wallet(id);


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nfxomfil
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: wallet wallet_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nfxomfil
--

ALTER TABLE ONLY public.wallet
    ADD CONSTRAINT wallet_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

