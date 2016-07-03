--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admins; Type: TABLE; Schema: public; Owner: elmirill; Tablespace: 
--

CREATE TABLE admins (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone
);


ALTER TABLE public.admins OWNER TO elmirill;

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: elmirill
--

CREATE SEQUENCE admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admins_id_seq OWNER TO elmirill;

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elmirill
--

ALTER SEQUENCE admins_id_seq OWNED BY admins.id;


--
-- Name: applications; Type: TABLE; Schema: public; Owner: elmirill; Tablespace: 
--

CREATE TABLE applications (
    id integer NOT NULL,
    name character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    meta_title character varying,
    meta_description character varying
);


ALTER TABLE public.applications OWNER TO elmirill;

--
-- Name: applications_id_seq; Type: SEQUENCE; Schema: public; Owner: elmirill
--

CREATE SEQUENCE applications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.applications_id_seq OWNER TO elmirill;

--
-- Name: applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elmirill
--

ALTER SEQUENCE applications_id_seq OWNED BY applications.id;


--
-- Name: applications_products; Type: TABLE; Schema: public; Owner: elmirill; Tablespace: 
--

CREATE TABLE applications_products (
    product_id integer NOT NULL,
    application_id integer NOT NULL
);


ALTER TABLE public.applications_products OWNER TO elmirill;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: elmirill; Tablespace: 
--

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "position" integer,
    thumbnail_file_name character varying,
    thumbnail_content_type character varying,
    thumbnail_file_size integer,
    thumbnail_updated_at timestamp without time zone
);


ALTER TABLE public.categories OWNER TO elmirill;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: elmirill
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO elmirill;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elmirill
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: comparison_items; Type: TABLE; Schema: public; Owner: elmirill; Tablespace: 
--

CREATE TABLE comparison_items (
    id integer NOT NULL,
    product_id integer,
    comparison_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.comparison_items OWNER TO elmirill;

--
-- Name: comparison_items_id_seq; Type: SEQUENCE; Schema: public; Owner: elmirill
--

CREATE SEQUENCE comparison_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comparison_items_id_seq OWNER TO elmirill;

--
-- Name: comparison_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elmirill
--

ALTER SEQUENCE comparison_items_id_seq OWNED BY comparison_items.id;


--
-- Name: comparisons; Type: TABLE; Schema: public; Owner: elmirill; Tablespace: 
--

CREATE TABLE comparisons (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.comparisons OWNER TO elmirill;

--
-- Name: comparisons_id_seq; Type: SEQUENCE; Schema: public; Owner: elmirill
--

CREATE SEQUENCE comparisons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comparisons_id_seq OWNER TO elmirill;

--
-- Name: comparisons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elmirill
--

ALTER SEQUENCE comparisons_id_seq OWNED BY comparisons.id;


--
-- Name: contacts; Type: TABLE; Schema: public; Owner: elmirill; Tablespace: 
--

CREATE TABLE contacts (
    id integer NOT NULL,
    address_full text,
    address_short text,
    email character varying,
    phone_main character varying,
    phone_other character varying,
    map character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    description character varying
);


ALTER TABLE public.contacts OWNER TO elmirill;

--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: elmirill
--

CREATE SEQUENCE contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_id_seq OWNER TO elmirill;

--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elmirill
--

ALTER SEQUENCE contacts_id_seq OWNED BY contacts.id;


--
-- Name: core_settings; Type: TABLE; Schema: public; Owner: elmirill; Tablespace: 
--

CREATE TABLE core_settings (
    id integer NOT NULL,
    main_phone character varying,
    add_phone_1 character varying,
    add_phone_2 character varying,
    main_phone_multi boolean,
    add_phone_1_multi boolean,
    add_phone_2_multi boolean,
    main_email character varying,
    add_email character varying,
    address text,
    address_comment text,
    site_description character varying,
    map_lat numeric,
    map_lng numeric,
    map_name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    default_meta_title character varying,
    default_meta_description character varying
);


ALTER TABLE public.core_settings OWNER TO elmirill;

--
-- Name: core_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: elmirill
--

CREATE SEQUENCE core_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_settings_id_seq OWNER TO elmirill;

--
-- Name: core_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elmirill
--

ALTER SEQUENCE core_settings_id_seq OWNED BY core_settings.id;


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: elmirill; Tablespace: 
--

CREATE TABLE order_items (
    id integer NOT NULL,
    product_id integer,
    order_id integer,
    color_quantity integer,
    high_quantity integer,
    spec_quantity integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    item_total integer,
    item_vol numeric(20,2)
);


ALTER TABLE public.order_items OWNER TO elmirill;

--
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: elmirill
--

CREATE SEQUENCE order_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_items_id_seq OWNER TO elmirill;

--
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elmirill
--

ALTER SEQUENCE order_items_id_seq OWNED BY order_items.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: elmirill; Tablespace: 
--

CREATE TABLE orders (
    id integer NOT NULL,
    total double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    total_vol numeric(20,2),
    customer_name character varying,
    customer_contact character varying,
    customer_message text
);


ALTER TABLE public.orders OWNER TO elmirill;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: elmirill
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO elmirill;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elmirill
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: elmirill; Tablespace: 
--

CREATE TABLE pages (
    id integer NOT NULL,
    name character varying,
    content text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    meta_title character varying,
    meta_description character varying
);


ALTER TABLE public.pages OWNER TO elmirill;

--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: elmirill
--

CREATE SEQUENCE pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_id_seq OWNER TO elmirill;

--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elmirill
--

ALTER SEQUENCE pages_id_seq OWNED BY pages.id;


--
-- Name: price_lists; Type: TABLE; Schema: public; Owner: elmirill; Tablespace: 
--

CREATE TABLE price_lists (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    price_file_name character varying,
    price_content_type character varying,
    price_file_size integer,
    price_updated_at timestamp without time zone
);


ALTER TABLE public.price_lists OWNER TO elmirill;

--
-- Name: price_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: elmirill
--

CREATE SEQUENCE price_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.price_lists_id_seq OWNER TO elmirill;

--
-- Name: price_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elmirill
--

ALTER SEQUENCE price_lists_id_seq OWNED BY price_lists.id;


--
-- Name: product_photos; Type: TABLE; Schema: public; Owner: elmirill; Tablespace: 
--

CREATE TABLE product_photos (
    id integer NOT NULL,
    caption character varying,
    product_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    photo_file_name character varying,
    photo_content_type character varying,
    photo_file_size integer,
    photo_updated_at timestamp without time zone
);


ALTER TABLE public.product_photos OWNER TO elmirill;

--
-- Name: product_photos_id_seq; Type: SEQUENCE; Schema: public; Owner: elmirill
--

CREATE SEQUENCE product_photos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_photos_id_seq OWNER TO elmirill;

--
-- Name: product_photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elmirill
--

ALTER SEQUENCE product_photos_id_seq OWNED BY product_photos.id;


--
-- Name: product_types; Type: TABLE; Schema: public; Owner: elmirill; Tablespace: 
--

CREATE TABLE product_types (
    id integer NOT NULL,
    product_id integer,
    type_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.product_types OWNER TO elmirill;

--
-- Name: product_types_id_seq; Type: SEQUENCE; Schema: public; Owner: elmirill
--

CREATE SEQUENCE product_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_types_id_seq OWNER TO elmirill;

--
-- Name: product_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elmirill
--

ALTER SEQUENCE product_types_id_seq OWNED BY product_types.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: elmirill; Tablespace: 
--

CREATE TABLE products (
    id integer NOT NULL,
    name character varying,
    description text,
    gallery character varying,
    capacity character varying,
    volume integer,
    net_volume integer,
    color character varying,
    var_color_price_1 integer,
    var_color_price_2 integer,
    var_color_price_3 integer,
    var_high_price_1 integer,
    var_high_price_2 integer,
    var_high_price_3 integer,
    var_spec_price_1 integer,
    var_spec_price_2 integer,
    var_spec_price_3 integer,
    featured boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    keywords text,
    articul character varying,
    length integer,
    width integer,
    height integer,
    "position" integer,
    campaign integer,
    weight double precision,
    side character varying,
    bottom character varying,
    static_load integer,
    dynamic_load integer,
    rack_load integer,
    inner_length integer,
    inner_width integer,
    inner_height integer,
    cover boolean,
    category_id integer,
    diameter integer,
    inner_diameter integer,
    thumbnail_file_name character varying,
    thumbnail_content_type character varying,
    thumbnail_file_size integer,
    thumbnail_updated_at timestamp without time zone,
    meta text,
    min_price integer,
    active boolean DEFAULT true,
    meta_title character varying,
    meta_description character varying
);


ALTER TABLE public.products OWNER TO elmirill;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: elmirill
--

CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO elmirill;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elmirill
--

ALTER SEQUENCE products_id_seq OWNED BY products.id;


--
-- Name: promo_units; Type: TABLE; Schema: public; Owner: elmirill; Tablespace: 
--

CREATE TABLE promo_units (
    id integer NOT NULL,
    title character varying,
    subtitle character varying,
    link character varying,
    description text,
    promo_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image_file_name character varying,
    image_content_type character varying,
    image_file_size integer,
    image_updated_at timestamp without time zone,
    active boolean
);


ALTER TABLE public.promo_units OWNER TO elmirill;

--
-- Name: promo_units_id_seq; Type: SEQUENCE; Schema: public; Owner: elmirill
--

CREATE SEQUENCE promo_units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.promo_units_id_seq OWNER TO elmirill;

--
-- Name: promo_units_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elmirill
--

ALTER SEQUENCE promo_units_id_seq OWNED BY promo_units.id;


--
-- Name: promos; Type: TABLE; Schema: public; Owner: elmirill; Tablespace: 
--

CREATE TABLE promos (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.promos OWNER TO elmirill;

--
-- Name: promos_id_seq; Type: SEQUENCE; Schema: public; Owner: elmirill
--

CREATE SEQUENCE promos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.promos_id_seq OWNER TO elmirill;

--
-- Name: promos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elmirill
--

ALTER SEQUENCE promos_id_seq OWNED BY promos.id;


--
-- Name: related_products; Type: TABLE; Schema: public; Owner: elmirill; Tablespace: 
--

CREATE TABLE related_products (
    id integer NOT NULL,
    product_id integer,
    related_product_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.related_products OWNER TO elmirill;

--
-- Name: related_products_id_seq; Type: SEQUENCE; Schema: public; Owner: elmirill
--

CREATE SEQUENCE related_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.related_products_id_seq OWNER TO elmirill;

--
-- Name: related_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elmirill
--

ALTER SEQUENCE related_products_id_seq OWNED BY related_products.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: elmirill; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO elmirill;

--
-- Name: types; Type: TABLE; Schema: public; Owner: elmirill; Tablespace: 
--

CREATE TABLE types (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.types OWNER TO elmirill;

--
-- Name: types_id_seq; Type: SEQUENCE; Schema: public; Owner: elmirill
--

CREATE SEQUENCE types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.types_id_seq OWNER TO elmirill;

--
-- Name: types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: elmirill
--

ALTER SEQUENCE types_id_seq OWNED BY types.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: elmirill
--

ALTER TABLE ONLY admins ALTER COLUMN id SET DEFAULT nextval('admins_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: elmirill
--

ALTER TABLE ONLY applications ALTER COLUMN id SET DEFAULT nextval('applications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: elmirill
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: elmirill
--

ALTER TABLE ONLY comparison_items ALTER COLUMN id SET DEFAULT nextval('comparison_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: elmirill
--

ALTER TABLE ONLY comparisons ALTER COLUMN id SET DEFAULT nextval('comparisons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: elmirill
--

ALTER TABLE ONLY contacts ALTER COLUMN id SET DEFAULT nextval('contacts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: elmirill
--

ALTER TABLE ONLY core_settings ALTER COLUMN id SET DEFAULT nextval('core_settings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: elmirill
--

ALTER TABLE ONLY order_items ALTER COLUMN id SET DEFAULT nextval('order_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: elmirill
--

ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: elmirill
--

ALTER TABLE ONLY pages ALTER COLUMN id SET DEFAULT nextval('pages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: elmirill
--

ALTER TABLE ONLY price_lists ALTER COLUMN id SET DEFAULT nextval('price_lists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: elmirill
--

ALTER TABLE ONLY product_photos ALTER COLUMN id SET DEFAULT nextval('product_photos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: elmirill
--

ALTER TABLE ONLY product_types ALTER COLUMN id SET DEFAULT nextval('product_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: elmirill
--

ALTER TABLE ONLY products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: elmirill
--

ALTER TABLE ONLY promo_units ALTER COLUMN id SET DEFAULT nextval('promo_units_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: elmirill
--

ALTER TABLE ONLY promos ALTER COLUMN id SET DEFAULT nextval('promos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: elmirill
--

ALTER TABLE ONLY related_products ALTER COLUMN id SET DEFAULT nextval('related_products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: elmirill
--

ALTER TABLE ONLY types ALTER COLUMN id SET DEFAULT nextval('types_id_seq'::regclass);


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: elmirill
--

COPY admins (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, confirmation_token, confirmed_at, confirmation_sent_at) FROM stdin;
3	tss_astro@list.ru	$2a$10$Ww8MomThsw7LWkZ4mbZlmukNhql/ktFXyWbO5Br.XHBPf6TVdE41a	\N	\N	\N	1	2015-10-13 00:08:06.36647	2015-10-13 00:08:06.36647	66.102.9.112	66.102.9.112	2015-10-13 00:04:22.562424	2015-10-13 00:08:06.369299	\N	2015-11-01 08:20:41.720721	\N
2	goa@plast-tara.ru	$2a$10$wQanGVVz7UWcaU4BQTxjIep3Ywj1U3N5dagdi51OUfb/qMRtVr0lW	\N	\N	\N	1	2015-10-13 00:08:36.773095	2015-10-13 00:08:36.773095	66.102.9.122	66.102.9.122	2015-10-13 00:02:26.251349	2015-10-13 00:08:36.775758	\N	2015-11-01 08:20:41.720721	\N
4	tvs@plast-tara.ru	$2a$10$PmZf2eFrDyVgQHBFbaeKv.ilR7XTRwCQiv..oSW7M6x05gW4QRMMe	\N	\N	\N	2	2015-10-19 06:59:23.232158	2015-10-13 04:02:55.163109	91.217.202.137	91.217.202.137	2015-10-13 00:07:44.937369	2015-10-19 06:59:34.209032	\N	2015-11-01 08:20:41.720721	\N
1	ant.khay@gmail.com	$2a$10$o6134t7N.49f3ylB4SM4OeJan6G/Y8Q60zXGPOx/wB8oahTo.oExu	10fc31306c8ff67544240ea753ca0df9507c2df40fedadf73036cf6bbd74c120	2015-11-01 08:01:29.732818	\N	34	2016-01-06 17:50:50.029698	2015-12-03 06:18:03.107606	127.0.0.1	127.0.0.1	2015-08-05 22:25:41.158385	2016-01-06 17:50:50.0324	\N	2015-11-01 08:20:41.720721	\N
\.


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elmirill
--

SELECT pg_catalog.setval('admins_id_seq', 8, true);


--
-- Data for Name: applications; Type: TABLE DATA; Schema: public; Owner: elmirill
--

COPY applications (id, name, description, created_at, updated_at, meta_title, meta_description) FROM stdin;
1	Молочное производство	Описание молочного производства	2015-10-31 08:23:03.731192	2015-10-31 11:08:03.712923		
2	Многоцелевая тара	<p>Описание многоцелевой тары</p>\r\n	2015-10-31 09:27:32.973541	2015-11-01 10:07:28.057026		
3	Тестовая сфера 1		2016-01-05 21:29:03.252559	2016-01-05 21:29:03.252559		
4	Тестовая сфера 2		2016-01-05 21:29:18.07756	2016-01-05 21:29:18.07756		
5	Тестовая сфера 3		2016-01-05 21:29:28.285189	2016-01-05 21:29:28.285189		
6	Тестовая сфера 4 ололоололол ололололололо		2016-01-05 21:29:39.069014	2016-01-05 22:16:48.252953		
\.


--
-- Name: applications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elmirill
--

SELECT pg_catalog.setval('applications_id_seq', 6, true);


--
-- Data for Name: applications_products; Type: TABLE DATA; Schema: public; Owner: elmirill
--

COPY applications_products (product_id, application_id) FROM stdin;
441	1
441	2
447	2
458	2
438	1
439	1
440	1
442	1
443	1
444	1
421	1
425	1
426	1
401	1
441	3
456	4
421	5
418	6
405	3
393	3
424	3
446	3
476	2
422	2
450	2
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: elmirill
--

COPY categories (id, name, created_at, updated_at, "position", thumbnail_file_name, thumbnail_content_type, thumbnail_file_size, thumbnail_updated_at) FROM stdin;
41	Ящики	2015-05-07 16:48:12.46309	2016-01-06 17:24:03.340144	1	box_menu.png	image/png	63095	2016-01-06 17:24:03.317419
42	Складские системы	2015-05-07 16:48:12.468079	2016-01-06 17:25:55.059932	2	storage_menu.png	image/png	34745	2016-01-06 17:25:55.050889
43	Паллеты	2015-05-07 16:48:12.47078	2016-01-06 17:27:28.598219	3	pallet_menu.png	image/png	30473	2016-01-06 17:27:28.589499
44	Мусорные контейнеры	2015-05-07 16:48:12.4764	2016-01-06 17:29:04.281708	5	dumpster_menu.png	image/png	25468	2016-01-06 17:29:04.272524
45	Сопутствующие товары	2015-05-07 16:48:12.479146	2016-01-06 17:29:32.949005	7	cart_menu.png	image/png	44726	2016-01-06 17:29:32.939717
46	Лом пластмассы	2016-01-06 17:06:22.735177	2016-01-06 17:36:16.218856	6	scrap.png	image/png	59231	2016-01-06 17:35:59.70493
47	Кубоконтейнеры	2016-01-06 17:10:08.692081	2016-01-06 17:37:14.884022	4	cube_container.png	image/png	39597	2016-01-06 17:37:14.873899
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elmirill
--

SELECT pg_catalog.setval('categories_id_seq', 47, true);


--
-- Data for Name: comparison_items; Type: TABLE DATA; Schema: public; Owner: elmirill
--

COPY comparison_items (id, product_id, comparison_id, created_at, updated_at) FROM stdin;
46	393	5	2015-09-23 13:34:06.640938	2015-09-23 13:34:06.640938
47	420	5	2015-09-23 13:34:07.524494	2015-09-23 13:34:07.524494
69	443	8	2015-10-06 06:11:25.700729	2015-10-06 06:11:25.700729
70	416	8	2015-10-06 06:11:52.931808	2015-10-06 06:11:52.931808
72	441	9	2015-10-06 12:45:06.228471	2015-10-06 12:45:06.228471
73	439	9	2015-10-06 12:50:21.613678	2015-10-06 12:50:21.613678
74	438	9	2015-10-06 12:50:23.654957	2015-10-06 12:50:23.654957
75	416	10	2015-10-08 05:34:57.632278	2015-10-08 05:34:57.632278
77	439	11	2015-10-08 13:31:53.023706	2015-10-08 13:31:53.023706
78	406	12	2015-10-09 09:19:54.661987	2015-10-09 09:19:54.661987
79	391	13	2015-10-14 22:37:03.007389	2015-10-14 22:37:03.007389
80	392	13	2015-10-14 22:37:03.918273	2015-10-14 22:37:03.918273
81	419	13	2015-10-14 22:37:09.840868	2015-10-14 22:37:09.840868
82	444	14	2015-10-15 03:37:03.081503	2015-10-15 03:37:03.081503
84	406	15	2015-10-19 07:45:26.672485	2015-10-19 07:45:26.672485
85	417	16	2015-10-22 00:06:19.512535	2015-10-22 00:06:19.512535
86	405	16	2015-10-22 00:06:20.440685	2015-10-22 00:06:20.440685
87	424	17	2015-10-22 05:06:17.785946	2015-10-22 05:06:17.785946
88	457	17	2015-10-22 05:06:19.840114	2015-10-22 05:06:19.840114
89	480	18	2015-10-23 22:59:01.685766	2015-10-23 22:59:01.685766
90	442	19	2015-10-30 15:41:39.626889	2015-10-30 15:41:39.626889
91	428	20	2015-11-01 07:50:03.697163	2015-11-01 07:50:03.697163
383	418	23	2016-01-06 17:52:48.38048	2016-01-06 17:52:48.38048
\.


--
-- Name: comparison_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elmirill
--

SELECT pg_catalog.setval('comparison_items_id_seq', 383, true);


--
-- Data for Name: comparisons; Type: TABLE DATA; Schema: public; Owner: elmirill
--

COPY comparisons (id, created_at, updated_at) FROM stdin;
5	2015-09-23 13:34:06.621487	2015-09-23 13:34:06.621487
6	2015-09-25 04:26:45.637699	2015-09-25 04:26:45.637699
7	2015-10-04 11:20:48.666018	2015-10-04 11:20:48.666018
8	2015-10-06 06:11:25.622709	2015-10-06 06:11:25.622709
9	2015-10-06 12:45:03.900847	2015-10-06 12:45:03.900847
10	2015-10-08 05:34:57.62833	2015-10-08 05:34:57.62833
11	2015-10-08 13:31:47.008854	2015-10-08 13:31:47.008854
12	2015-10-09 09:19:54.657781	2015-10-09 09:19:54.657781
13	2015-10-14 22:37:03.00169	2015-10-14 22:37:03.00169
14	2015-10-15 03:37:03.076732	2015-10-15 03:37:03.076732
15	2015-10-19 07:45:15.612162	2015-10-19 07:45:15.612162
16	2015-10-22 00:06:19.507721	2015-10-22 00:06:19.507721
17	2015-10-22 05:06:17.777977	2015-10-22 05:06:17.777977
18	2015-10-23 22:59:01.676686	2015-10-23 22:59:01.676686
19	2015-10-30 15:41:39.562344	2015-10-30 15:41:39.562344
20	2015-11-01 07:50:03.685947	2015-11-01 07:50:03.685947
21	2015-11-01 09:51:46.274846	2015-11-01 09:51:46.274846
22	2015-12-03 05:38:42.774227	2015-12-03 05:38:42.774227
23	2016-01-06 17:52:48.361541	2016-01-06 17:52:48.361541
\.


--
-- Name: comparisons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elmirill
--

SELECT pg_catalog.setval('comparisons_id_seq', 23, true);


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: elmirill
--

COPY contacts (id, address_full, address_short, email, phone_main, phone_other, map, created_at, updated_at, description) FROM stdin;
1	630108, г. Новосибирск, ул. Станционная 30/А, корпус 10	г. Новосибирск, ул. Станционная 30/А, корпус 10	info@plast-tara.ru	(383) 349-94-84		\N	2015-02-21 14:10:15.419864	2015-02-21 14:10:15.419864	\N
\.


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elmirill
--

SELECT pg_catalog.setval('contacts_id_seq', 1, true);


--
-- Data for Name: core_settings; Type: TABLE DATA; Schema: public; Owner: elmirill
--

COPY core_settings (id, main_phone, add_phone_1, add_phone_2, main_phone_multi, add_phone_1_multi, add_phone_2_multi, main_email, add_email, address, address_comment, site_description, map_lat, map_lng, map_name, created_at, updated_at, default_meta_title, default_meta_description) FROM stdin;
1	+7 (383) 349-94-84			t	f	f	elmirill@yandex.ru		г. Новосибирск, ул. Станционная 30/А, корпус 10	Въезд на территорию для отгрузки продукции и оформ..Въезд на территорию для отгрузки продукции и оформления документов через ул. Большая 145/2, КПП №10 (проходная завода «НЛК»).	Производство пластиковой тары	55.009907	82.842856	Пласт-Тара	2015-10-14 17:36:45	2016-01-04 19:05:23.537997	Пласт-Тара	Производство пластиковой тары в Новосибирске
\.


--
-- Name: core_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elmirill
--

SELECT pg_catalog.setval('core_settings_id_seq', 1, false);


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: elmirill
--

COPY order_items (id, product_id, order_id, color_quantity, high_quantity, spec_quantity, created_at, updated_at, item_total, item_vol) FROM stdin;
184	393	8	0	0	0	2015-09-23 13:36:59.181002	2015-09-23 13:36:59.181002	0	0.00
196	446	10	0	9	0	2015-10-03 06:34:45.052453	2015-10-03 06:35:00.549174	3168	0.28
199	405	11	0	0	0	2015-10-03 13:14:00.365652	2015-10-03 13:14:00.365652	0	0.00
224	438	12	0	0	0	2015-10-04 08:00:54.940688	2015-10-04 08:00:54.940688	0	0.00
225	439	12	0	0	0	2015-10-04 08:00:58.173265	2015-10-04 08:00:58.173265	0	0.00
226	440	12	0	0	0	2015-10-04 08:00:59.612117	2015-10-04 08:00:59.612117	0	0.00
234	441	13	0	0	0	2015-10-04 09:01:39.748779	2015-10-04 09:01:39.748779	0	0.00
235	440	13	0	0	0	2015-10-04 09:01:43.205495	2015-10-04 09:01:43.205495	0	0.00
236	444	13	0	0	0	2015-10-04 09:01:46.769099	2015-10-04 09:01:46.769099	0	0.00
237	444	12	0	0	0	2015-10-04 09:01:51.202047	2015-10-04 09:01:51.202047	0	0.00
243	438	15	0	0	0	2015-10-06 06:12:57.949827	2015-10-06 06:12:57.949827	0	0.00
244	440	15	0	0	0	2015-10-06 06:13:01.670781	2015-10-06 06:13:01.670781	0	0.00
248	405	16	0	0	0	2015-10-06 12:45:30.759283	2015-10-06 12:45:30.759283	0	0.00
247	446	16	56	0	0	2015-10-06 12:45:29.561873	2015-10-06 12:45:43.379957	14896	1.75
250	391	17	0	0	0	2015-10-07 07:19:07.931581	2015-10-07 07:19:07.931581	0	0.00
254	438	19	0	0	0	2015-10-07 19:35:21.071502	2015-10-07 19:35:21.071502	0	0.00
255	443	19	0	0	0	2015-10-07 19:35:24.388971	2015-10-07 19:35:24.388971	0	0.00
256	416	19	0	0	0	2015-10-07 19:35:25.763213	2015-10-07 19:35:25.763213	0	0.00
257	393	20	0	0	0	2015-10-08 05:25:54.923394	2015-10-08 05:25:54.923394	0	0.00
260	438	21	0	0	0	2015-10-08 13:53:55.70684	2015-10-08 13:53:55.70684	0	0.00
261	439	21	0	0	0	2015-10-08 13:53:57.906912	2015-10-08 13:53:57.906912	0	0.00
262	438	18	0	0	0	2015-10-08 14:56:17.66497	2015-10-08 14:56:17.66497	0	0.00
263	442	22	0	0	0	2015-10-09 08:14:10.938811	2015-10-09 08:14:10.938811	0	0.00
266	406	23	0	0	0	2015-10-09 09:20:02.437984	2015-10-09 09:20:02.437984	0	0.00
267	441	24	6	0	0	2015-10-09 13:13:18.556287	2015-10-09 13:13:43.824703	1896	0.43
268	446	25	0	30	0	2015-10-10 00:55:32.248457	2015-10-10 01:06:11.498912	11040	0.94
279	439	28	0	0	0	2015-10-15 05:15:59.055954	2015-10-15 05:15:59.055954	0	0.00
280	438	28	0	0	0	2015-10-15 05:16:02.322129	2015-10-15 05:16:02.322129	0	0.00
283	407	31	0	0	0	2015-10-20 07:06:52.218914	2015-10-20 07:06:52.218914	0	0.00
284	406	32	0	0	0	2015-10-20 16:39:02.924026	2015-10-20 16:39:02.924026	0	0.00
285	450	32	0	0	0	2015-10-20 16:42:47.560573	2015-10-20 16:42:47.560573	0	0.00
287	421	33	0	0	0	2015-10-21 05:00:45.301814	2015-10-21 05:00:45.301814	0	0.00
288	417	34	0	0	0	2015-10-22 00:06:17.256373	2015-10-22 00:06:17.256373	0	0.00
289	440	35	0	0	0	2015-10-22 03:21:56.524434	2015-10-22 03:21:56.524434	0	0.00
290	406	36	0	0	0	2015-10-22 12:29:36.465603	2015-10-22 12:29:36.465603	0	0.00
245	442	16	1	0	0	2015-10-06 12:45:19.015017	2015-10-30 15:51:14.898096	320	0.07
249	461	16	12	34	0	2015-10-06 12:52:34.171557	2015-10-30 15:52:10.724969	11614	4.58
292	428	38	0	0	0	2015-11-01 07:50:02.865219	2015-11-01 07:50:02.865219	0	0.00
293	417	39	0	0	0	2015-11-01 09:51:45.090889	2015-11-01 09:51:45.090889	0	0.00
466	441	41	20	0	0	2016-01-09 10:52:10.530909	2016-01-19 15:33:15.247546	6360	1.44
\.


--
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elmirill
--

SELECT pg_catalog.setval('order_items_id_seq', 466, true);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: elmirill
--

COPY orders (id, total, created_at, updated_at, total_vol, customer_name, customer_contact, customer_message) FROM stdin;
8	0	2015-09-23 13:36:59.157265	2015-09-23 13:36:59.157265	0.00	\N	\N	\N
10	0	2015-10-03 06:34:42.243219	2015-10-03 06:34:42.243219	0.00	\N	\N	\N
11	0	2015-10-03 13:14:00.317704	2015-10-03 13:14:00.317704	0.00	\N	\N	\N
9	197405	2015-09-25 04:26:56.274501	2015-10-03 15:24:05.90383	33.78	\N	\N	\N
12	0	2015-10-04 08:00:54.929026	2015-10-04 08:00:54.929026	0.00	\N	\N	\N
13	0	2015-10-04 09:01:39.74418	2015-10-04 09:01:39.74418	0.00	\N	\N	\N
14	0	2015-10-04 11:20:28.878213	2015-10-04 11:20:28.878213	0.00	\N	\N	\N
15	0	2015-10-06 06:12:15.592248	2015-10-06 06:12:15.592248	0.00	\N	\N	\N
16	14896	2015-10-06 12:45:19.01033	2015-10-06 12:52:34.16522	1.75	\N	\N	\N
17	0	2015-10-07 07:19:07.921995	2015-10-07 07:19:07.921995	0.00	\N	\N	\N
19	0	2015-10-07 19:35:21.055138	2015-10-07 19:35:21.055138	0.00	\N	\N	\N
20	0	2015-10-08 05:25:54.916984	2015-10-08 05:25:54.916984	0.00	\N	\N	\N
18	0	2015-10-07 19:33:42.55685	2015-10-08 13:33:18.04468	0.00	Антон Х	ant.khay@gmail.com	fadsfdsfdsggd
21	0	2015-10-08 13:53:55.702876	2015-10-08 13:53:55.702876	0.00	\N	\N	\N
22	0	2015-10-09 08:14:10.917638	2015-10-09 08:14:10.917638	0.00	\N	\N	\N
23	0	2015-10-09 09:19:10.525556	2015-10-09 09:19:10.525556	0.00	\N	\N	\N
24	0	2015-10-09 13:13:18.552751	2015-10-09 13:13:18.552751	0.00	\N	\N	\N
25	0	2015-10-10 00:55:32.244489	2015-10-10 00:55:32.244489	0.00	\N	\N	\N
26	0	2015-10-13 00:57:33.85574	2015-10-13 00:57:33.85574	0.00	\N	\N	\N
27	0	2015-10-14 05:41:18.126952	2015-10-14 05:41:18.126952	0.00	\N	\N	\N
28	0	2015-10-15 05:15:59.049508	2015-10-15 05:15:59.049508	0.00	\N	\N	\N
29	1735	2015-10-19 06:59:41.131873	2015-10-19 07:00:19.963931	0.22	Влад	8-923-235-17-34	дайте два\r\n
30	0	2015-10-19 07:45:59.441931	2015-10-19 07:45:59.441931	0.00	\N	\N	\N
31	0	2015-10-20 07:06:52.214154	2015-10-20 07:08:04.062602	0.00	Ася	8-905-946-5533	
32	0	2015-10-20 16:39:02.920237	2015-10-20 16:44:21.719513	0.00	Илья	5684033@bk.ru	
33	0	2015-10-21 04:59:08.296743	2015-10-21 04:59:08.296743	0.00	\N	\N	\N
34	0	2015-10-22 00:06:17.25148	2015-10-22 00:06:17.25148	0.00	\N	\N	\N
35	0	2015-10-22 03:21:56.519222	2015-10-22 03:21:56.519222	0.00	\N	\N	\N
36	0	2015-10-22 12:29:36.460448	2015-10-22 12:32:40.769878	0.00	Анна	89270993862	
37	0	2015-10-23 22:58:40.589461	2015-10-23 22:58:40.589461	0.00	\N	\N	\N
38	0	2015-11-01 07:50:02.815212	2015-11-01 07:50:02.815212	0.00	\N	\N	\N
39	0	2015-11-01 09:51:45.086026	2015-11-01 09:51:45.086026	0.00	\N	\N	\N
40	0	2016-01-01 10:45:02.445348	2016-01-01 10:45:02.445348	0.00	\N	\N	\N
41	0	2016-01-06 17:52:47.382375	2016-01-08 19:56:14.490094	0.00	\N	\N	\N
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elmirill
--

SELECT pg_catalog.setval('orders_id_seq', 41, true);


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: elmirill
--

COPY pages (id, name, content, created_at, updated_at, meta_title, meta_description) FROM stdin;
1	Пластиковая тара, емкости, контейнеры	<h2>Уважаемые господа!</h2>\r\n\r\n<p>Мы рады приветствовать вас, наших друзей, коллег и потенциальных партнеров, на сайте компании «Пласт-Тара».<br>\r\nНаше предприятие работает на рынке крупногабаритной <b><i>пластиковой тары</b></i> уже более пятнадцати лет и является <b><i>производителем</i></b> предложенной продукции. Ассортимент предприятия состоит из более 20 наименований пластиковой тары и регулярно пополняется.<br><br>\r\n\r\nНаше кредо — постоянное расширение номеклатуры, стабильное качество и построение партнерских отношений.<br><br>\r\n\r\nНаша цель — обеспечение потребителей необходимой продукцией стабильного качества, изготовленной точно в срок.<br><br>\r\n\r\nНаши изделия имеют все необходимые сертификаты и активно используются многими ведущими предприятиями пищевой промышленности.<br>\r\nМы всегда готовы к диалогу. Приглашаем вас к сотрудничеству!</p>	2015-03-16 07:55:27.825469	2015-08-05 20:15:30.803971	\N	\N
4	Сертификаты	<p><img alt="Cert1" class="col-lg-6" src="https://s3.eu-central-1.amazonaws.com/purple-waves/plast-tara/files/cert1-bccdcce13f52dde9b9bfcccdab4e0977.jpg" /></p>\r\n\r\n<p><img alt="Cert1" class="col-lg-6" src="https://s3.eu-central-1.amazonaws.com/purple-waves/plast-tara/files/cert1-bccdcce13f52dde9b9bfcccdab4e0977.jpg" /></p>\r\n	2015-03-16 13:50:53.888118	2015-08-16 00:37:58.65382	\N	\N
2	О компании	<h2>Уважаемые господа!</h2>\r\n\r\n<p>Мы рады приветствовать вас, наших друзей, коллег и потенциальных партнеров, на сайте компании &laquo;Пласт-Тара&raquo;.<br />\r\nНаше предприятие работает на рынке крупногабаритной <b><i>пластиковой тары</i></b> уже более пятнадцати лет и является <b><i>производителем</i></b> предложенной продукции. Ассортимент предприятия состоит из более 20 наименований пластиковой тары и регулярно пополняется.<br />\r\n<br />\r\nНаше кредо &mdash; постоянное расширение номеклатуры, стабильное качество и построение партнерских отношений.<br />\r\n<br />\r\nНаша цель &mdash; обеспечение потребителей необходимой продукцией стабильного качества, изготовленной точно в срок.<br />\r\n<br />\r\nНаши изделия имеют все необходимые сертификаты и активно используются многими ведущими предприятиями пищевой промышленности.<br />\r\nМы всегда готовы к диалогу. Приглашаем вас к сотрудничеству!</p>\r\n	2015-03-16 07:29:16.866757	2015-08-05 21:40:21.690139	\N	\N
3	Доставка и оплата	<h3>Уважаемые покупатели, обращаем ваше внимание, что отгрузка товара осуществляется после 100% оплаты.</h3>\r\n\r\n<ol>\r\n\t<li>Наше предприятие работает:\r\n\t<ul>\r\n\t\t<li>С юридическими лицами &mdash; оплата по безналичному расчету;</li>\r\n\t\t<li>С физическими лицами &mdash; оплата за наличный расчет.</li>\r\n\t</ul>\r\n\t</li>\r\n\t<li>Счет для оплаты товара вы можете выписать, сделав заявку\r\n\t<ul>\r\n\t\t<li>по тел: +7 (383) 349-94-98;</li>\r\n\t\t<li>по е-mail: info@plast-tara.ru.</li>\r\n\t</ul>\r\n\t</li>\r\n\t<li>Отгрузка продукции осуществляется:\r\n\t<ul>\r\n\t\t<li>Самовывоз &mdash; при наличии оригинала доверенности у представителя юридического лица;</li>\r\n\t\t<li>Через любую транспортную компанию, удобную вам.</li>\r\n\t</ul>\r\n\t</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3>Рассчитать стоимость и сроки доставки вы можете на сайте транспортных компаний:</h3>\r\n\r\n<p><a href="http://www.rateksib.ru/tarify/" target="_blank">Ратэк</a><br />\r\n<a href="http://pecom.ru/services-are/the-calculation-of-the-cost/" target="_blank">ПЭК</a><br />\r\n<a href="http://novosibirsk.dellin.ru/requests/" target="_blank">Деловые Линии</a><br />\r\n<a href="http://ae5000.ru" target="_blank">Автотрейдинг</a><br />\r\n<a href="http://xn--e1agdbbk0adboq.xn--p1ai/pages/%D0%BF%D1%80%D0%B0%D0%B9%D1%81%D1%8B/%D0%BE%D0%B1%D1%89%D0%B8%D0%B9.html" target="_blank">Меркурий</a><br />\r\n<a href="http://www.jde.ru/online/calculator.html" target="_blank">ЖелДорЭкспедиция</a><br />\r\n<a href="http://nrg-tk.ru/client/calculator.html" target="_blank">Энергия</a></p>\r\n	2015-03-16 08:00:45.097212	2015-12-04 02:52:09.430707		
\.


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elmirill
--

SELECT pg_catalog.setval('pages_id_seq', 4, true);


--
-- Data for Name: price_lists; Type: TABLE DATA; Schema: public; Owner: elmirill
--

COPY price_lists (id, created_at, updated_at, price_file_name, price_content_type, price_file_size, price_updated_at) FROM stdin;
1	2015-10-04 10:00:05.83058	2016-02-08 10:23:15.259204	Price_21.09.15_(2).xls	application/vnd.ms-excel	89600	2016-02-08 10:23:15.251549
\.


--
-- Name: price_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elmirill
--

SELECT pg_catalog.setval('price_lists_id_seq', 1, true);


--
-- Data for Name: product_photos; Type: TABLE DATA; Schema: public; Owner: elmirill
--

COPY product_photos (id, caption, product_id, created_at, updated_at, photo_file_name, photo_content_type, photo_file_size, photo_updated_at) FROM stdin;
48		438	2015-09-08 22:25:01.667764	2015-10-23 21:29:11.137128	1.jpg	image/jpeg	128483	2015-10-23 21:29:10.385623
49		438	2015-09-08 22:25:03.515158	2015-10-23 21:29:11.164113	1-(2).jpg	image/jpeg	151340	2015-10-23 21:29:10.592611
50		439	2015-09-08 22:26:37.346655	2015-10-23 21:33:10.918312	2П.jpg	image/jpeg	151441	2015-10-23 21:33:10.641534
51		440	2015-09-08 22:27:01.31713	2015-10-23 21:34:33.3979	2Г.jpg	image/jpeg	110304	2015-10-23 21:34:33.174836
52		441	2015-09-08 22:28:07.369157	2015-10-23 21:35:55.426138	3П.jpg	image/jpeg	153725	2015-10-23 21:35:54.923939
53		441	2015-09-08 22:28:08.847383	2015-10-23 21:35:55.436682	3П-(2).jpg	image/jpeg	185099	2015-10-23 21:35:55.17176
54		443	2015-09-08 22:29:20.139752	2015-10-23 21:37:05.932508	4.jpg	image/jpeg	193634	2015-10-23 21:37:05.618101
20		416	2015-08-07 16:38:30.115383	2015-10-23 21:38:12.417393	29.jpg	image/jpeg	101732	2015-10-23 21:38:11.995732
21		416	2015-08-07 16:38:31.642721	2015-10-23 21:38:12.432851	30.jpg	image/jpeg	83166	2015-10-23 21:38:12.197949
34		417	2015-09-06 23:02:04.418208	2015-10-23 21:39:53.489753	32.jpg	image/jpeg	100796	2015-10-23 21:39:53.275871
35		405	2015-09-06 23:03:17.325917	2015-10-23 21:41:00.335	7.jpg	image/jpeg	60728	2015-10-23 21:41:00.119892
55		446	2015-09-08 22:30:05.700593	2015-10-23 21:42:24.842443	10(2).jpg	image/jpeg	118438	2015-10-23 21:42:24.405703
56		446	2015-09-08 22:30:07.051182	2015-10-23 21:42:24.869898	10-(2).jpg	image/jpeg	132135	2015-10-23 21:42:24.6091
36		406	2015-09-06 23:05:47.995311	2015-10-23 21:43:38.200396	39.jpg	image/jpeg	97328	2015-10-23 21:43:37.751807
23		406	2015-08-07 16:40:46.748357	2015-10-23 21:43:38.220041	11(2).jpg	image/jpeg	129322	2015-10-23 21:43:37.941209
24		407	2015-08-07 16:42:03.715708	2015-10-23 21:44:59.429209	42.jpg	image/jpeg	82758	2015-10-23 21:44:58.92547
25		407	2015-08-07 16:42:04.90942	2015-10-23 21:44:59.445246	12(2).jpg	image/jpeg	150491	2015-10-23 21:44:59.134556
37		395	2015-09-06 23:08:25.45881	2015-10-23 21:58:24.425709	15-(2).jpg	image/jpeg	99059	2015-10-23 21:58:24.009399
26		395	2015-08-07 16:42:57.422845	2015-10-23 21:58:24.44038	15-(3).jpg	image/jpeg	120341	2015-10-23 21:58:24.1893
57		447	2015-09-08 22:31:42.438389	2015-10-23 21:59:07.418424	16.jpg	image/jpeg	247098	2015-10-23 21:59:07.132773
27		396	2015-08-07 16:43:22.350032	2015-10-23 22:00:18.627882	51.jpg	image/jpeg	117133	2015-10-23 22:00:18.137148
28		396	2015-08-07 16:43:23.964648	2015-10-23 22:00:18.645123	50.jpg	image/jpeg	141033	2015-10-23 22:00:18.372648
30		412	2015-08-07 16:44:23.418402	2015-10-23 22:04:03.504567	55.jpg	image/jpeg	115662	2015-10-23 22:04:02.989015
29		412	2015-08-07 16:44:21.896719	2015-10-23 22:04:03.524558	18-(2).jpg	image/jpeg	120586	2015-10-23 22:04:03.244611
31		413	2015-08-07 16:45:02.598872	2015-10-23 22:05:29.669171	58.jpg	image/jpeg	183492	2015-10-23 22:05:29.170665
38		413	2015-09-06 23:09:57.82069	2015-10-23 22:05:29.683968	57.jpg	image/jpeg	171044	2015-10-23 22:05:29.41209
39		414	2015-09-06 23:10:36.826773	2015-10-23 22:06:20.493672	22(2).jpg	image/jpeg	168736	2015-10-23 22:06:20.250048
32		415	2015-08-07 16:46:00.965177	2015-10-23 22:08:27.385494	61.jpg	image/jpeg	220722	2015-10-23 22:08:26.82019
40		415	2015-09-06 23:11:05.029782	2015-10-23 22:08:27.403821	23(2).jpg	image/jpeg	149621	2015-10-23 22:08:27.05281
33		418	2015-08-07 16:46:18.598151	2015-10-23 22:09:15.195856	24(2).jpg	image/jpeg	167725	2015-10-23 22:09:14.952517
17		409	2015-08-07 16:36:32.524884	2015-10-23 22:21:58.447538	131.jpg	image/jpeg	50186	2015-10-23 22:21:58.289768
18		411	2015-08-07 16:37:13.207853	2015-10-23 22:26:19.87064	134.jpg	image/jpeg	47340	2015-10-23 22:26:19.717091
19		423	2015-08-07 16:37:42.477151	2015-10-23 22:28:17.030927	137.jpg	image/jpeg	48164	2015-10-23 22:28:16.861254
44		419	2015-09-06 23:14:43.301967	2015-10-23 22:35:16.648797	мот-10(2).jpg	image/jpeg	65312	2015-10-23 22:35:16.137043
45		419	2015-09-06 23:14:44.052288	2015-10-23 22:35:16.680625	68.jpg	image/jpeg	104757	2015-10-23 22:35:16.34695
46		420	2015-09-06 23:15:49.627847	2015-10-23 22:35:58.168907	Мот-15-(2).jpg	image/jpeg	91621	2015-10-23 22:35:57.713363
47		420	2015-09-06 23:15:50.476065	2015-10-23 22:35:58.182022	70.jpg	image/jpeg	72430	2015-10-23 22:35:57.946827
16		403	2015-08-07 16:33:40.59241	2015-10-23 23:00:40.108724	142.jpg	image/jpeg	22745	2015-10-23 23:00:39.891603
13		400	2015-08-07 16:29:12.22538	2015-10-23 23:03:21.504065	71.jpg	image/jpeg	43190	2015-10-23 23:03:21.035709
43		400	2015-09-06 23:13:47.914199	2015-10-23 23:03:21.604975	72.jpg	image/jpeg	41868	2015-10-23 23:03:21.266283
14		401	2015-08-07 16:32:30.988457	2015-10-23 23:05:24.362995	65.jpg	image/jpeg	172342	2015-10-23 23:05:23.834091
15		401	2015-08-07 16:32:32.482681	2015-10-23 23:05:24.393657	_DSC0063.jpg	image/jpeg	244926	2015-10-23 23:05:24.080825
\.


--
-- Name: product_photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elmirill
--

SELECT pg_catalog.setval('product_photos_id_seq', 57, true);


--
-- Data for Name: product_types; Type: TABLE DATA; Schema: public; Owner: elmirill
--

COPY product_types (id, product_id, type_id, created_at, updated_at) FROM stdin;
1	3	44	2015-03-15 10:57:42.206777	2015-03-15 10:57:42.206777
2	3	45	2015-03-15 10:57:42.209635	2015-03-15 10:57:42.209635
3	3	47	2015-03-15 10:57:42.211395	2015-03-15 10:57:42.211395
4	4	51	2015-03-15 11:00:36.320731	2015-03-15 11:00:36.320731
5	4	52	2015-03-15 11:00:36.322662	2015-03-15 11:00:36.322662
6	4	54	2015-03-15 11:00:36.324231	2015-03-15 11:00:36.324231
7	5	58	2015-03-15 11:35:41.191368	2015-03-15 11:35:41.191368
8	5	59	2015-03-15 11:35:41.193456	2015-03-15 11:35:41.193456
9	5	61	2015-03-15 11:35:41.195032	2015-03-15 11:35:41.195032
10	6	65	2015-03-15 11:54:40.743339	2015-03-15 11:54:40.743339
11	6	66	2015-03-15 11:54:40.745833	2015-03-15 11:54:40.745833
12	6	68	2015-03-15 11:54:40.748029	2015-03-15 11:54:40.748029
13	7	64	2015-03-15 11:54:40.765503	2015-03-15 11:54:40.765503
14	7	66	2015-03-15 11:54:40.767201	2015-03-15 11:54:40.767201
15	8	72	2015-03-15 12:08:56.247343	2015-03-15 12:08:56.247343
16	8	73	2015-03-15 12:08:56.249786	2015-03-15 12:08:56.249786
17	8	75	2015-03-15 12:08:56.2515	2015-03-15 12:08:56.2515
18	9	71	2015-03-15 12:08:56.269694	2015-03-15 12:08:56.269694
19	9	73	2015-03-15 12:08:56.2714	2015-03-15 12:08:56.2714
20	10	72	2015-03-15 12:08:56.291637	2015-03-15 12:08:56.291637
21	10	73	2015-03-15 12:08:56.29371	2015-03-15 12:08:56.29371
22	10	75	2015-03-15 12:08:56.295345	2015-03-15 12:08:56.295345
23	11	72	2015-03-15 12:08:56.322093	2015-03-15 12:08:56.322093
24	11	73	2015-03-15 12:08:56.324356	2015-03-15 12:08:56.324356
25	11	75	2015-03-15 12:08:56.325962	2015-03-15 12:08:56.325962
26	12	72	2015-03-15 12:08:56.352005	2015-03-15 12:08:56.352005
27	12	73	2015-03-15 12:08:56.354098	2015-03-15 12:08:56.354098
28	12	75	2015-03-15 12:08:56.355863	2015-03-15 12:08:56.355863
29	13	79	2015-03-15 14:02:53.035568	2015-03-15 14:02:53.035568
30	13	80	2015-03-15 14:02:53.037786	2015-03-15 14:02:53.037786
31	13	82	2015-03-15 14:02:53.039463	2015-03-15 14:02:53.039463
32	14	78	2015-03-15 14:02:53.056558	2015-03-15 14:02:53.056558
33	14	80	2015-03-15 14:02:53.058313	2015-03-15 14:02:53.058313
34	15	79	2015-03-15 14:02:53.077177	2015-03-15 14:02:53.077177
35	15	80	2015-03-15 14:02:53.079016	2015-03-15 14:02:53.079016
36	15	82	2015-03-15 14:02:53.081376	2015-03-15 14:02:53.081376
37	16	79	2015-03-15 14:02:53.109541	2015-03-15 14:02:53.109541
38	16	80	2015-03-15 14:02:53.111296	2015-03-15 14:02:53.111296
39	16	82	2015-03-15 14:02:53.11296	2015-03-15 14:02:53.11296
40	17	79	2015-03-15 14:02:53.13901	2015-03-15 14:02:53.13901
41	17	80	2015-03-15 14:02:53.14075	2015-03-15 14:02:53.14075
42	17	82	2015-03-15 14:02:53.142474	2015-03-15 14:02:53.142474
43	18	79	2015-03-15 14:02:53.165277	2015-03-15 14:02:53.165277
44	18	81	2015-03-15 14:02:53.167067	2015-03-15 14:02:53.167067
45	19	78	2015-03-15 14:02:53.183575	2015-03-15 14:02:53.183575
46	19	79	2015-03-15 14:02:53.186069	2015-03-15 14:02:53.186069
47	20	78	2015-03-15 14:02:53.201729	2015-03-15 14:02:53.201729
48	20	80	2015-03-15 14:02:53.203631	2015-03-15 14:02:53.203631
49	21	78	2015-03-15 14:02:53.219666	2015-03-15 14:02:53.219666
50	21	79	2015-03-15 14:02:53.221868	2015-03-15 14:02:53.221868
51	22	78	2015-03-15 14:02:53.23885	2015-03-15 14:02:53.23885
52	22	79	2015-03-15 14:02:53.240665	2015-03-15 14:02:53.240665
53	23	78	2015-03-15 14:02:53.259246	2015-03-15 14:02:53.259246
54	23	80	2015-03-15 14:02:53.261046	2015-03-15 14:02:53.261046
55	24	86	2015-03-15 14:03:49.978269	2015-03-15 14:03:49.978269
56	24	87	2015-03-15 14:03:49.98029	2015-03-15 14:03:49.98029
57	24	89	2015-03-15 14:03:49.98218	2015-03-15 14:03:49.98218
58	25	85	2015-03-15 14:03:50.001885	2015-03-15 14:03:50.001885
59	25	87	2015-03-15 14:03:50.003687	2015-03-15 14:03:50.003687
60	26	86	2015-03-15 14:03:50.022236	2015-03-15 14:03:50.022236
61	26	87	2015-03-15 14:03:50.023986	2015-03-15 14:03:50.023986
62	26	89	2015-03-15 14:03:50.025688	2015-03-15 14:03:50.025688
63	27	86	2015-03-15 14:03:50.053056	2015-03-15 14:03:50.053056
64	27	87	2015-03-15 14:03:50.054855	2015-03-15 14:03:50.054855
65	27	89	2015-03-15 14:03:50.056994	2015-03-15 14:03:50.056994
66	28	86	2015-03-15 14:03:50.081805	2015-03-15 14:03:50.081805
67	28	87	2015-03-15 14:03:50.083741	2015-03-15 14:03:50.083741
68	28	89	2015-03-15 14:03:50.085489	2015-03-15 14:03:50.085489
69	29	86	2015-03-15 14:03:50.111803	2015-03-15 14:03:50.111803
70	29	88	2015-03-15 14:03:50.113589	2015-03-15 14:03:50.113589
71	30	85	2015-03-15 14:03:50.130752	2015-03-15 14:03:50.130752
72	30	86	2015-03-15 14:03:50.13276	2015-03-15 14:03:50.13276
73	31	85	2015-03-15 14:03:50.149095	2015-03-15 14:03:50.149095
74	31	87	2015-03-15 14:03:50.151239	2015-03-15 14:03:50.151239
75	32	85	2015-03-15 14:03:50.166899	2015-03-15 14:03:50.166899
76	32	86	2015-03-15 14:03:50.168782	2015-03-15 14:03:50.168782
77	33	85	2015-03-15 14:03:50.186397	2015-03-15 14:03:50.186397
78	33	86	2015-03-15 14:03:50.188178	2015-03-15 14:03:50.188178
79	34	85	2015-03-15 14:03:50.209335	2015-03-15 14:03:50.209335
80	34	87	2015-03-15 14:03:50.21105	2015-03-15 14:03:50.21105
81	35	128	2015-03-15 15:45:23.399164	2015-03-15 15:45:23.399164
82	35	129	2015-03-15 15:45:23.401365	2015-03-15 15:45:23.401365
83	35	131	2015-03-15 15:45:23.402957	2015-03-15 15:45:23.402957
84	36	127	2015-03-15 15:45:23.420602	2015-03-15 15:45:23.420602
85	36	129	2015-03-15 15:45:23.422328	2015-03-15 15:45:23.422328
86	37	128	2015-03-15 15:45:23.440298	2015-03-15 15:45:23.440298
87	37	129	2015-03-15 15:45:23.441976	2015-03-15 15:45:23.441976
88	37	131	2015-03-15 15:45:23.443644	2015-03-15 15:45:23.443644
89	38	128	2015-03-15 15:45:23.467282	2015-03-15 15:45:23.467282
90	38	129	2015-03-15 15:45:23.469027	2015-03-15 15:45:23.469027
91	38	131	2015-03-15 15:45:23.470602	2015-03-15 15:45:23.470602
92	39	128	2015-03-15 15:45:23.49586	2015-03-15 15:45:23.49586
93	39	129	2015-03-15 15:45:23.497521	2015-03-15 15:45:23.497521
94	39	131	2015-03-15 15:45:23.499132	2015-03-15 15:45:23.499132
95	40	128	2015-03-15 15:45:23.519723	2015-03-15 15:45:23.519723
96	40	130	2015-03-15 15:45:23.52144	2015-03-15 15:45:23.52144
97	41	127	2015-03-15 15:45:23.537012	2015-03-15 15:45:23.537012
98	41	128	2015-03-15 15:45:23.53895	2015-03-15 15:45:23.53895
99	42	127	2015-03-15 15:45:23.555171	2015-03-15 15:45:23.555171
100	42	129	2015-03-15 15:45:23.55689	2015-03-15 15:45:23.55689
101	43	127	2015-03-15 15:45:23.573169	2015-03-15 15:45:23.573169
102	43	128	2015-03-15 15:45:23.574872	2015-03-15 15:45:23.574872
103	44	127	2015-03-15 15:45:23.59064	2015-03-15 15:45:23.59064
104	44	128	2015-03-15 15:45:23.59243	2015-03-15 15:45:23.59243
105	45	127	2015-03-15 15:45:23.60858	2015-03-15 15:45:23.60858
106	45	129	2015-03-15 15:45:23.610269	2015-03-15 15:45:23.610269
107	46	135	2015-03-15 16:26:24.801307	2015-03-15 16:26:24.801307
108	46	136	2015-03-15 16:26:24.803522	2015-03-15 16:26:24.803522
109	46	138	2015-03-15 16:26:24.805355	2015-03-15 16:26:24.805355
110	47	134	2015-03-15 16:26:24.822869	2015-03-15 16:26:24.822869
111	47	136	2015-03-15 16:26:24.824906	2015-03-15 16:26:24.824906
112	48	135	2015-03-15 16:26:24.843625	2015-03-15 16:26:24.843625
113	48	136	2015-03-15 16:26:24.845461	2015-03-15 16:26:24.845461
114	48	138	2015-03-15 16:26:24.847153	2015-03-15 16:26:24.847153
115	49	135	2015-03-15 16:26:24.874351	2015-03-15 16:26:24.874351
116	49	136	2015-03-15 16:26:24.876029	2015-03-15 16:26:24.876029
117	49	138	2015-03-15 16:26:24.87791	2015-03-15 16:26:24.87791
118	50	135	2015-03-15 16:26:24.909052	2015-03-15 16:26:24.909052
119	50	136	2015-03-15 16:26:24.911445	2015-03-15 16:26:24.911445
120	50	138	2015-03-15 16:26:24.913913	2015-03-15 16:26:24.913913
121	51	135	2015-03-15 16:26:24.938908	2015-03-15 16:26:24.938908
122	51	137	2015-03-15 16:26:24.940706	2015-03-15 16:26:24.940706
123	52	134	2015-03-15 16:26:24.956768	2015-03-15 16:26:24.956768
124	52	135	2015-03-15 16:26:24.958565	2015-03-15 16:26:24.958565
125	53	134	2015-03-15 16:26:24.973902	2015-03-15 16:26:24.973902
126	53	136	2015-03-15 16:26:24.975604	2015-03-15 16:26:24.975604
127	54	134	2015-03-15 16:26:24.992455	2015-03-15 16:26:24.992455
128	54	135	2015-03-15 16:26:24.994215	2015-03-15 16:26:24.994215
129	55	134	2015-03-15 16:26:25.010236	2015-03-15 16:26:25.010236
130	55	135	2015-03-15 16:26:25.011966	2015-03-15 16:26:25.011966
131	56	134	2015-03-15 16:26:25.031561	2015-03-15 16:26:25.031561
132	56	136	2015-03-15 16:26:25.033244	2015-03-15 16:26:25.033244
133	57	142	2015-03-15 16:36:20.200873	2015-03-15 16:36:20.200873
134	57	143	2015-03-15 16:36:20.20373	2015-03-15 16:36:20.20373
135	57	145	2015-03-15 16:36:20.205358	2015-03-15 16:36:20.205358
136	58	141	2015-03-15 16:36:20.22228	2015-03-15 16:36:20.22228
137	58	143	2015-03-15 16:36:20.223951	2015-03-15 16:36:20.223951
138	59	142	2015-03-15 16:36:20.242249	2015-03-15 16:36:20.242249
139	59	143	2015-03-15 16:36:20.24418	2015-03-15 16:36:20.24418
140	59	145	2015-03-15 16:36:20.245935	2015-03-15 16:36:20.245935
141	60	142	2015-03-15 16:36:20.270402	2015-03-15 16:36:20.270402
142	60	143	2015-03-15 16:36:20.272074	2015-03-15 16:36:20.272074
143	60	145	2015-03-15 16:36:20.273704	2015-03-15 16:36:20.273704
144	61	142	2015-03-15 16:36:20.298117	2015-03-15 16:36:20.298117
145	61	143	2015-03-15 16:36:20.300076	2015-03-15 16:36:20.300076
146	61	145	2015-03-15 16:36:20.301833	2015-03-15 16:36:20.301833
147	62	142	2015-03-15 16:36:20.323861	2015-03-15 16:36:20.323861
148	62	144	2015-03-15 16:36:20.32553	2015-03-15 16:36:20.32553
149	63	141	2015-03-15 16:36:20.342718	2015-03-15 16:36:20.342718
150	63	142	2015-03-15 16:36:20.344568	2015-03-15 16:36:20.344568
151	64	141	2015-03-15 16:36:20.360417	2015-03-15 16:36:20.360417
152	64	143	2015-03-15 16:36:20.362036	2015-03-15 16:36:20.362036
153	65	141	2015-03-15 16:36:20.377692	2015-03-15 16:36:20.377692
154	65	142	2015-03-15 16:36:20.379315	2015-03-15 16:36:20.379315
155	66	141	2015-03-15 16:36:20.394528	2015-03-15 16:36:20.394528
156	66	142	2015-03-15 16:36:20.396304	2015-03-15 16:36:20.396304
157	67	141	2015-03-15 16:36:20.412364	2015-03-15 16:36:20.412364
158	67	143	2015-03-15 16:36:20.414025	2015-03-15 16:36:20.414025
159	68	156	2015-03-15 16:38:48.022937	2015-03-15 16:38:48.022937
160	68	157	2015-03-15 16:38:48.025798	2015-03-15 16:38:48.025798
161	68	159	2015-03-15 16:38:48.028007	2015-03-15 16:38:48.028007
162	69	155	2015-03-15 16:38:48.046177	2015-03-15 16:38:48.046177
163	69	157	2015-03-15 16:38:48.047988	2015-03-15 16:38:48.047988
164	70	156	2015-03-15 16:38:48.068994	2015-03-15 16:38:48.068994
165	70	157	2015-03-15 16:38:48.07085	2015-03-15 16:38:48.07085
166	70	159	2015-03-15 16:38:48.072833	2015-03-15 16:38:48.072833
167	71	156	2015-03-15 16:38:48.101079	2015-03-15 16:38:48.101079
168	71	157	2015-03-15 16:38:48.10293	2015-03-15 16:38:48.10293
169	71	159	2015-03-15 16:38:48.104625	2015-03-15 16:38:48.104625
170	72	156	2015-03-15 16:38:48.131756	2015-03-15 16:38:48.131756
171	72	157	2015-03-15 16:38:48.133639	2015-03-15 16:38:48.133639
172	72	159	2015-03-15 16:38:48.135365	2015-03-15 16:38:48.135365
173	73	156	2015-03-15 16:38:48.15998	2015-03-15 16:38:48.15998
174	73	158	2015-03-15 16:38:48.161874	2015-03-15 16:38:48.161874
175	74	155	2015-03-15 16:38:48.180157	2015-03-15 16:38:48.180157
176	74	156	2015-03-15 16:38:48.181917	2015-03-15 16:38:48.181917
177	75	155	2015-03-15 16:38:48.202624	2015-03-15 16:38:48.202624
178	75	157	2015-03-15 16:38:48.204457	2015-03-15 16:38:48.204457
179	76	155	2015-03-15 16:38:48.222201	2015-03-15 16:38:48.222201
180	76	156	2015-03-15 16:38:48.224036	2015-03-15 16:38:48.224036
181	77	155	2015-03-15 16:38:48.247422	2015-03-15 16:38:48.247422
182	77	156	2015-03-15 16:38:48.249289	2015-03-15 16:38:48.249289
183	78	155	2015-03-15 16:38:48.269139	2015-03-15 16:38:48.269139
184	78	157	2015-03-15 16:38:48.271066	2015-03-15 16:38:48.271066
185	79	170	2015-03-15 16:59:56.325504	2015-03-15 16:59:56.325504
186	79	171	2015-03-15 16:59:56.327991	2015-03-15 16:59:56.327991
187	79	173	2015-03-15 16:59:56.329717	2015-03-15 16:59:56.329717
188	80	169	2015-03-15 16:59:56.349295	2015-03-15 16:59:56.349295
189	80	171	2015-03-15 16:59:56.351197	2015-03-15 16:59:56.351197
190	81	170	2015-03-15 16:59:56.37035	2015-03-15 16:59:56.37035
191	81	171	2015-03-15 16:59:56.372163	2015-03-15 16:59:56.372163
192	81	173	2015-03-15 16:59:56.374015	2015-03-15 16:59:56.374015
193	82	170	2015-03-15 16:59:56.398868	2015-03-15 16:59:56.398868
194	82	171	2015-03-15 16:59:56.401234	2015-03-15 16:59:56.401234
195	82	173	2015-03-15 16:59:56.402967	2015-03-15 16:59:56.402967
196	83	170	2015-03-15 16:59:56.427998	2015-03-15 16:59:56.427998
197	83	171	2015-03-15 16:59:56.429706	2015-03-15 16:59:56.429706
198	83	173	2015-03-15 16:59:56.431509	2015-03-15 16:59:56.431509
199	84	170	2015-03-15 16:59:56.455177	2015-03-15 16:59:56.455177
200	84	172	2015-03-15 16:59:56.456872	2015-03-15 16:59:56.456872
201	85	169	2015-03-15 16:59:56.472963	2015-03-15 16:59:56.472963
202	85	170	2015-03-15 16:59:56.474671	2015-03-15 16:59:56.474671
203	86	169	2015-03-15 16:59:56.492069	2015-03-15 16:59:56.492069
204	86	171	2015-03-15 16:59:56.493715	2015-03-15 16:59:56.493715
205	87	169	2015-03-15 16:59:56.510551	2015-03-15 16:59:56.510551
206	87	170	2015-03-15 16:59:56.512163	2015-03-15 16:59:56.512163
207	88	169	2015-03-15 16:59:56.527405	2015-03-15 16:59:56.527405
208	88	170	2015-03-15 16:59:56.529165	2015-03-15 16:59:56.529165
209	89	169	2015-03-15 16:59:56.545487	2015-03-15 16:59:56.545487
210	89	171	2015-03-15 16:59:56.547177	2015-03-15 16:59:56.547177
211	90	184	2015-03-15 17:01:19.003245	2015-03-15 17:01:19.003245
212	90	185	2015-03-15 17:01:19.005425	2015-03-15 17:01:19.005425
213	90	187	2015-03-15 17:01:19.00703	2015-03-15 17:01:19.00703
214	91	183	2015-03-15 17:01:19.023476	2015-03-15 17:01:19.023476
215	91	185	2015-03-15 17:01:19.02518	2015-03-15 17:01:19.02518
216	92	184	2015-03-15 17:01:19.044177	2015-03-15 17:01:19.044177
217	92	185	2015-03-15 17:01:19.045878	2015-03-15 17:01:19.045878
218	92	187	2015-03-15 17:01:19.047759	2015-03-15 17:01:19.047759
219	93	184	2015-03-15 17:01:19.072516	2015-03-15 17:01:19.072516
220	93	185	2015-03-15 17:01:19.074283	2015-03-15 17:01:19.074283
221	93	187	2015-03-15 17:01:19.077788	2015-03-15 17:01:19.077788
222	94	184	2015-03-15 17:01:19.102345	2015-03-15 17:01:19.102345
223	94	185	2015-03-15 17:01:19.103995	2015-03-15 17:01:19.103995
224	94	187	2015-03-15 17:01:19.105598	2015-03-15 17:01:19.105598
225	95	184	2015-03-15 17:01:19.126864	2015-03-15 17:01:19.126864
226	95	186	2015-03-15 17:01:19.128584	2015-03-15 17:01:19.128584
227	96	183	2015-03-15 17:01:19.144609	2015-03-15 17:01:19.144609
228	96	184	2015-03-15 17:01:19.146522	2015-03-15 17:01:19.146522
229	97	183	2015-03-15 17:01:19.162377	2015-03-15 17:01:19.162377
230	97	185	2015-03-15 17:01:19.164065	2015-03-15 17:01:19.164065
231	98	183	2015-03-15 17:01:19.179483	2015-03-15 17:01:19.179483
232	98	184	2015-03-15 17:01:19.181121	2015-03-15 17:01:19.181121
233	99	183	2015-03-15 17:01:19.196502	2015-03-15 17:01:19.196502
234	99	184	2015-03-15 17:01:19.198244	2015-03-15 17:01:19.198244
235	100	183	2015-03-15 17:01:19.216043	2015-03-15 17:01:19.216043
236	100	185	2015-03-15 17:01:19.21797	2015-03-15 17:01:19.21797
237	101	191	2015-03-15 17:03:10.323057	2015-03-15 17:03:10.323057
238	101	192	2015-03-15 17:03:10.325214	2015-03-15 17:03:10.325214
239	101	194	2015-03-15 17:03:10.326814	2015-03-15 17:03:10.326814
240	102	190	2015-03-15 17:03:10.343515	2015-03-15 17:03:10.343515
241	102	192	2015-03-15 17:03:10.345135	2015-03-15 17:03:10.345135
242	103	191	2015-03-15 17:03:10.366737	2015-03-15 17:03:10.366737
243	103	192	2015-03-15 17:03:10.368393	2015-03-15 17:03:10.368393
244	103	194	2015-03-15 17:03:10.370011	2015-03-15 17:03:10.370011
245	104	191	2015-03-15 17:03:10.394236	2015-03-15 17:03:10.394236
246	104	192	2015-03-15 17:03:10.395895	2015-03-15 17:03:10.395895
247	104	194	2015-03-15 17:03:10.397496	2015-03-15 17:03:10.397496
248	105	191	2015-03-15 17:03:10.421851	2015-03-15 17:03:10.421851
249	105	192	2015-03-15 17:03:10.423743	2015-03-15 17:03:10.423743
250	105	194	2015-03-15 17:03:10.425743	2015-03-15 17:03:10.425743
251	106	191	2015-03-15 17:03:10.448079	2015-03-15 17:03:10.448079
252	106	193	2015-03-15 17:03:10.449777	2015-03-15 17:03:10.449777
253	107	190	2015-03-15 17:03:10.465914	2015-03-15 17:03:10.465914
254	107	191	2015-03-15 17:03:10.467668	2015-03-15 17:03:10.467668
255	108	190	2015-03-15 17:03:10.48418	2015-03-15 17:03:10.48418
256	108	192	2015-03-15 17:03:10.485806	2015-03-15 17:03:10.485806
257	109	190	2015-03-15 17:03:10.502865	2015-03-15 17:03:10.502865
258	109	191	2015-03-15 17:03:10.504891	2015-03-15 17:03:10.504891
259	110	190	2015-03-15 17:03:10.520964	2015-03-15 17:03:10.520964
260	110	191	2015-03-15 17:03:10.522649	2015-03-15 17:03:10.522649
261	111	190	2015-03-15 17:03:10.540709	2015-03-15 17:03:10.540709
262	111	192	2015-03-15 17:03:10.542316	2015-03-15 17:03:10.542316
263	112	198	2015-03-15 17:06:18.789053	2015-03-15 17:06:18.789053
264	112	199	2015-03-15 17:06:18.793312	2015-03-15 17:06:18.793312
265	112	201	2015-03-15 17:06:18.795432	2015-03-15 17:06:18.795432
266	113	212	2015-03-15 17:15:25.5341	2015-03-15 17:15:25.5341
267	113	213	2015-03-15 17:15:25.53624	2015-03-15 17:15:25.53624
268	113	215	2015-03-15 17:15:25.537807	2015-03-15 17:15:25.537807
269	114	211	2015-03-15 17:15:25.556122	2015-03-15 17:15:25.556122
270	114	213	2015-03-15 17:15:25.557845	2015-03-15 17:15:25.557845
271	115	212	2015-03-15 17:15:25.579813	2015-03-15 17:15:25.579813
272	115	213	2015-03-15 17:15:25.581527	2015-03-15 17:15:25.581527
273	115	215	2015-03-15 17:15:25.583108	2015-03-15 17:15:25.583108
274	116	212	2015-03-15 17:15:25.610422	2015-03-15 17:15:25.610422
275	116	213	2015-03-15 17:15:25.612167	2015-03-15 17:15:25.612167
276	116	215	2015-03-15 17:15:25.614459	2015-03-15 17:15:25.614459
277	117	212	2015-03-15 17:15:25.643776	2015-03-15 17:15:25.643776
278	117	213	2015-03-15 17:15:25.645454	2015-03-15 17:15:25.645454
279	117	215	2015-03-15 17:15:25.647003	2015-03-15 17:15:25.647003
280	118	212	2015-03-15 17:15:25.667596	2015-03-15 17:15:25.667596
281	118	214	2015-03-15 17:15:25.669234	2015-03-15 17:15:25.669234
282	119	211	2015-03-15 17:15:25.685405	2015-03-15 17:15:25.685405
283	119	212	2015-03-15 17:15:25.687109	2015-03-15 17:15:25.687109
284	120	211	2015-03-15 17:15:25.701868	2015-03-15 17:15:25.701868
285	120	213	2015-03-15 17:15:25.703608	2015-03-15 17:15:25.703608
286	121	211	2015-03-15 17:15:25.720373	2015-03-15 17:15:25.720373
287	121	212	2015-03-15 17:15:25.722075	2015-03-15 17:15:25.722075
288	122	211	2015-03-15 17:15:25.737243	2015-03-15 17:15:25.737243
289	122	212	2015-03-15 17:15:25.738872	2015-03-15 17:15:25.738872
290	123	211	2015-03-15 17:15:25.75576	2015-03-15 17:15:25.75576
291	123	213	2015-03-15 17:15:25.757403	2015-03-15 17:15:25.757403
292	124	226	2015-03-15 17:21:33.038803	2015-03-15 17:21:33.038803
293	124	227	2015-03-15 17:21:33.04081	2015-03-15 17:21:33.04081
294	124	229	2015-03-15 17:21:33.042427	2015-03-15 17:21:33.042427
295	125	225	2015-03-15 17:21:33.059473	2015-03-15 17:21:33.059473
296	125	227	2015-03-15 17:21:33.061171	2015-03-15 17:21:33.061171
297	126	226	2015-03-15 17:21:33.079679	2015-03-15 17:21:33.079679
298	126	227	2015-03-15 17:21:33.082004	2015-03-15 17:21:33.082004
299	126	229	2015-03-15 17:21:33.084826	2015-03-15 17:21:33.084826
300	127	226	2015-03-15 17:21:33.113162	2015-03-15 17:21:33.113162
301	127	227	2015-03-15 17:21:33.11486	2015-03-15 17:21:33.11486
302	127	229	2015-03-15 17:21:33.116482	2015-03-15 17:21:33.116482
303	128	226	2015-03-15 17:21:33.141032	2015-03-15 17:21:33.141032
304	128	227	2015-03-15 17:21:33.143042	2015-03-15 17:21:33.143042
305	128	229	2015-03-15 17:21:33.144836	2015-03-15 17:21:33.144836
306	129	226	2015-03-15 17:21:33.172775	2015-03-15 17:21:33.172775
307	129	228	2015-03-15 17:21:33.174649	2015-03-15 17:21:33.174649
308	130	225	2015-03-15 17:21:33.191053	2015-03-15 17:21:33.191053
309	130	226	2015-03-15 17:21:33.192884	2015-03-15 17:21:33.192884
310	131	225	2015-03-15 17:21:33.208026	2015-03-15 17:21:33.208026
311	131	227	2015-03-15 17:21:33.209701	2015-03-15 17:21:33.209701
312	132	225	2015-03-15 17:21:33.22648	2015-03-15 17:21:33.22648
313	132	226	2015-03-15 17:21:33.228125	2015-03-15 17:21:33.228125
314	133	225	2015-03-15 17:21:33.246075	2015-03-15 17:21:33.246075
315	133	226	2015-03-15 17:21:33.247913	2015-03-15 17:21:33.247913
316	134	225	2015-03-15 17:21:33.266801	2015-03-15 17:21:33.266801
317	134	227	2015-03-15 17:21:33.26861	2015-03-15 17:21:33.26861
318	135	233	2015-03-16 15:03:01.9154	2015-03-16 15:03:01.9154
319	135	234	2015-03-16 15:03:01.917735	2015-03-16 15:03:01.917735
320	135	236	2015-03-16 15:03:01.919414	2015-03-16 15:03:01.919414
321	136	232	2015-03-16 15:03:01.953216	2015-03-16 15:03:01.953216
322	136	234	2015-03-16 15:03:01.95514	2015-03-16 15:03:01.95514
323	137	233	2015-03-16 15:03:01.974575	2015-03-16 15:03:01.974575
324	137	234	2015-03-16 15:03:01.97634	2015-03-16 15:03:01.97634
325	137	236	2015-03-16 15:03:01.97797	2015-03-16 15:03:01.97797
326	138	233	2015-03-16 15:03:02.003938	2015-03-16 15:03:02.003938
327	138	234	2015-03-16 15:03:02.005678	2015-03-16 15:03:02.005678
328	138	236	2015-03-16 15:03:02.007334	2015-03-16 15:03:02.007334
329	139	233	2015-03-16 15:03:02.035908	2015-03-16 15:03:02.035908
330	139	234	2015-03-16 15:03:02.037618	2015-03-16 15:03:02.037618
331	139	236	2015-03-16 15:03:02.039302	2015-03-16 15:03:02.039302
332	140	233	2015-03-16 15:03:02.060591	2015-03-16 15:03:02.060591
333	140	235	2015-03-16 15:03:02.062366	2015-03-16 15:03:02.062366
334	141	232	2015-03-16 15:03:02.078937	2015-03-16 15:03:02.078937
335	141	233	2015-03-16 15:03:02.08073	2015-03-16 15:03:02.08073
336	142	232	2015-03-16 15:03:02.097014	2015-03-16 15:03:02.097014
337	142	234	2015-03-16 15:03:02.099057	2015-03-16 15:03:02.099057
338	143	232	2015-03-16 15:03:02.115523	2015-03-16 15:03:02.115523
339	143	233	2015-03-16 15:03:02.117193	2015-03-16 15:03:02.117193
340	144	232	2015-03-16 15:03:02.133711	2015-03-16 15:03:02.133711
341	144	233	2015-03-16 15:03:02.156966	2015-03-16 15:03:02.156966
342	145	232	2015-03-16 15:03:02.175593	2015-03-16 15:03:02.175593
343	145	234	2015-03-16 15:03:02.177418	2015-03-16 15:03:02.177418
344	146	240	2015-03-16 15:04:43.255708	2015-03-16 15:04:43.255708
345	146	241	2015-03-16 15:04:43.257763	2015-03-16 15:04:43.257763
346	146	243	2015-03-16 15:04:43.25937	2015-03-16 15:04:43.25937
347	147	239	2015-03-16 15:04:43.277103	2015-03-16 15:04:43.277103
348	147	241	2015-03-16 15:04:43.278856	2015-03-16 15:04:43.278856
349	148	240	2015-03-16 15:04:43.297703	2015-03-16 15:04:43.297703
350	148	241	2015-03-16 15:04:43.299603	2015-03-16 15:04:43.299603
351	148	243	2015-03-16 15:04:43.301243	2015-03-16 15:04:43.301243
352	149	240	2015-03-16 15:04:43.326435	2015-03-16 15:04:43.326435
353	149	241	2015-03-16 15:04:43.328192	2015-03-16 15:04:43.328192
354	149	243	2015-03-16 15:04:43.330061	2015-03-16 15:04:43.330061
355	150	240	2015-03-16 15:04:43.354786	2015-03-16 15:04:43.354786
356	150	241	2015-03-16 15:04:43.356459	2015-03-16 15:04:43.356459
357	150	243	2015-03-16 15:04:43.358124	2015-03-16 15:04:43.358124
358	151	240	2015-03-16 15:04:43.379319	2015-03-16 15:04:43.379319
359	151	242	2015-03-16 15:04:43.381084	2015-03-16 15:04:43.381084
360	152	239	2015-03-16 15:04:43.399234	2015-03-16 15:04:43.399234
361	152	240	2015-03-16 15:04:43.401121	2015-03-16 15:04:43.401121
362	153	239	2015-03-16 15:04:43.416939	2015-03-16 15:04:43.416939
363	153	241	2015-03-16 15:04:43.418737	2015-03-16 15:04:43.418737
364	154	239	2015-03-16 15:04:43.436491	2015-03-16 15:04:43.436491
365	154	240	2015-03-16 15:04:43.438458	2015-03-16 15:04:43.438458
366	155	239	2015-03-16 15:04:43.456441	2015-03-16 15:04:43.456441
367	155	240	2015-03-16 15:04:43.458554	2015-03-16 15:04:43.458554
368	156	239	2015-03-16 15:04:43.476933	2015-03-16 15:04:43.476933
369	156	241	2015-03-16 15:04:43.479582	2015-03-16 15:04:43.479582
370	157	247	2015-03-16 15:06:23.172701	2015-03-16 15:06:23.172701
371	157	248	2015-03-16 15:06:23.175155	2015-03-16 15:06:23.175155
372	157	250	2015-03-16 15:06:23.176835	2015-03-16 15:06:23.176835
373	158	246	2015-03-16 15:06:23.211077	2015-03-16 15:06:23.211077
374	158	248	2015-03-16 15:06:23.213155	2015-03-16 15:06:23.213155
375	159	247	2015-03-16 15:06:23.233364	2015-03-16 15:06:23.233364
376	159	248	2015-03-16 15:06:23.23521	2015-03-16 15:06:23.23521
377	159	250	2015-03-16 15:06:23.236833	2015-03-16 15:06:23.236833
378	160	247	2015-03-16 15:06:23.273481	2015-03-16 15:06:23.273481
379	160	248	2015-03-16 15:06:23.27555	2015-03-16 15:06:23.27555
380	160	250	2015-03-16 15:06:23.277253	2015-03-16 15:06:23.277253
381	161	247	2015-03-16 15:06:23.302008	2015-03-16 15:06:23.302008
382	161	248	2015-03-16 15:06:23.303704	2015-03-16 15:06:23.303704
383	161	250	2015-03-16 15:06:23.30529	2015-03-16 15:06:23.30529
384	162	247	2015-03-16 15:06:23.33703	2015-03-16 15:06:23.33703
385	162	249	2015-03-16 15:06:23.338988	2015-03-16 15:06:23.338988
386	163	246	2015-03-16 15:06:23.35665	2015-03-16 15:06:23.35665
387	163	247	2015-03-16 15:06:23.358439	2015-03-16 15:06:23.358439
388	164	246	2015-03-16 15:06:23.377555	2015-03-16 15:06:23.377555
389	164	248	2015-03-16 15:06:23.379251	2015-03-16 15:06:23.379251
390	165	246	2015-03-16 15:06:23.396171	2015-03-16 15:06:23.396171
391	165	247	2015-03-16 15:06:23.397845	2015-03-16 15:06:23.397845
392	166	246	2015-03-16 15:06:23.413959	2015-03-16 15:06:23.413959
393	166	247	2015-03-16 15:06:23.415758	2015-03-16 15:06:23.415758
394	167	246	2015-03-16 15:06:23.434317	2015-03-16 15:06:23.434317
395	167	248	2015-03-16 15:06:23.436292	2015-03-16 15:06:23.436292
396	168	261	2015-03-16 15:09:38.568253	2015-03-16 15:09:38.568253
397	168	262	2015-03-16 15:09:38.57033	2015-03-16 15:09:38.57033
398	168	264	2015-03-16 15:09:38.572	2015-03-16 15:09:38.572
399	169	260	2015-03-16 15:09:38.591413	2015-03-16 15:09:38.591413
400	169	262	2015-03-16 15:09:38.594111	2015-03-16 15:09:38.594111
401	170	261	2015-03-16 15:09:38.615008	2015-03-16 15:09:38.615008
402	170	262	2015-03-16 15:09:38.616737	2015-03-16 15:09:38.616737
403	170	264	2015-03-16 15:09:38.61842	2015-03-16 15:09:38.61842
404	171	261	2015-03-16 15:09:38.64561	2015-03-16 15:09:38.64561
405	171	262	2015-03-16 15:09:38.647437	2015-03-16 15:09:38.647437
406	171	264	2015-03-16 15:09:38.649087	2015-03-16 15:09:38.649087
407	172	261	2015-03-16 15:09:38.67545	2015-03-16 15:09:38.67545
408	172	262	2015-03-16 15:09:38.677175	2015-03-16 15:09:38.677175
409	172	264	2015-03-16 15:09:38.679355	2015-03-16 15:09:38.679355
410	173	261	2015-03-16 15:09:38.701919	2015-03-16 15:09:38.701919
411	173	263	2015-03-16 15:09:38.703748	2015-03-16 15:09:38.703748
412	174	260	2015-03-16 15:09:38.721626	2015-03-16 15:09:38.721626
413	174	261	2015-03-16 15:09:38.723557	2015-03-16 15:09:38.723557
414	175	260	2015-03-16 15:09:38.741403	2015-03-16 15:09:38.741403
415	175	262	2015-03-16 15:09:38.743145	2015-03-16 15:09:38.743145
416	176	260	2015-03-16 15:09:38.760114	2015-03-16 15:09:38.760114
417	176	261	2015-03-16 15:09:38.761848	2015-03-16 15:09:38.761848
418	177	260	2015-03-16 15:09:38.795539	2015-03-16 15:09:38.795539
419	177	261	2015-03-16 15:09:38.79751	2015-03-16 15:09:38.79751
420	178	260	2015-03-16 15:09:38.816551	2015-03-16 15:09:38.816551
421	178	262	2015-03-16 15:09:38.81841	2015-03-16 15:09:38.81841
422	179	268	2015-03-16 15:13:41.954448	2015-03-16 15:13:41.954448
423	179	269	2015-03-16 15:13:41.956629	2015-03-16 15:13:41.956629
424	179	271	2015-03-16 15:13:41.958216	2015-03-16 15:13:41.958216
425	180	267	2015-03-16 15:13:41.976193	2015-03-16 15:13:41.976193
426	180	269	2015-03-16 15:13:41.977936	2015-03-16 15:13:41.977936
427	181	268	2015-03-16 15:13:41.999082	2015-03-16 15:13:41.999082
428	181	269	2015-03-16 15:13:42.001023	2015-03-16 15:13:42.001023
429	181	271	2015-03-16 15:13:42.002705	2015-03-16 15:13:42.002705
430	182	268	2015-03-16 15:13:42.034164	2015-03-16 15:13:42.034164
431	182	269	2015-03-16 15:13:42.035953	2015-03-16 15:13:42.035953
432	182	271	2015-03-16 15:13:42.038362	2015-03-16 15:13:42.038362
433	183	268	2015-03-16 15:13:42.065119	2015-03-16 15:13:42.065119
434	183	269	2015-03-16 15:13:42.066888	2015-03-16 15:13:42.066888
435	183	271	2015-03-16 15:13:42.06852	2015-03-16 15:13:42.06852
436	184	268	2015-03-16 15:13:42.091712	2015-03-16 15:13:42.091712
437	184	270	2015-03-16 15:13:42.093488	2015-03-16 15:13:42.093488
438	185	267	2015-03-16 15:13:42.112243	2015-03-16 15:13:42.112243
439	185	268	2015-03-16 15:13:42.114208	2015-03-16 15:13:42.114208
440	186	267	2015-03-16 15:13:42.138882	2015-03-16 15:13:42.138882
441	186	269	2015-03-16 15:13:42.140678	2015-03-16 15:13:42.140678
442	187	267	2015-03-16 15:13:42.157404	2015-03-16 15:13:42.157404
443	187	268	2015-03-16 15:13:42.15915	2015-03-16 15:13:42.15915
444	188	267	2015-03-16 15:13:42.177098	2015-03-16 15:13:42.177098
445	188	268	2015-03-16 15:13:42.178985	2015-03-16 15:13:42.178985
446	189	267	2015-03-16 15:13:42.199279	2015-03-16 15:13:42.199279
447	189	269	2015-03-16 15:13:42.200972	2015-03-16 15:13:42.200972
448	190	275	2015-03-16 15:16:45.327895	2015-03-16 15:16:45.327895
449	190	276	2015-03-16 15:16:45.330056	2015-03-16 15:16:45.330056
450	190	278	2015-03-16 15:16:45.331767	2015-03-16 15:16:45.331767
451	191	274	2015-03-16 15:16:45.351835	2015-03-16 15:16:45.351835
452	191	276	2015-03-16 15:16:45.353589	2015-03-16 15:16:45.353589
453	192	275	2015-03-16 15:16:45.37397	2015-03-16 15:16:45.37397
454	192	276	2015-03-16 15:16:45.375751	2015-03-16 15:16:45.375751
455	192	278	2015-03-16 15:16:45.377411	2015-03-16 15:16:45.377411
456	193	275	2015-03-16 15:16:45.404482	2015-03-16 15:16:45.404482
457	193	276	2015-03-16 15:16:45.406401	2015-03-16 15:16:45.406401
458	193	278	2015-03-16 15:16:45.408338	2015-03-16 15:16:45.408338
459	194	275	2015-03-16 15:16:45.437145	2015-03-16 15:16:45.437145
460	194	276	2015-03-16 15:16:45.439058	2015-03-16 15:16:45.439058
461	194	278	2015-03-16 15:16:45.440987	2015-03-16 15:16:45.440987
462	195	275	2015-03-16 15:16:45.464849	2015-03-16 15:16:45.464849
463	195	277	2015-03-16 15:16:45.466566	2015-03-16 15:16:45.466566
464	196	274	2015-03-16 15:16:45.485042	2015-03-16 15:16:45.485042
465	196	275	2015-03-16 15:16:45.487023	2015-03-16 15:16:45.487023
466	197	274	2015-03-16 15:16:45.504306	2015-03-16 15:16:45.504306
467	197	276	2015-03-16 15:16:45.50615	2015-03-16 15:16:45.50615
468	198	274	2015-03-16 15:16:45.524116	2015-03-16 15:16:45.524116
469	198	275	2015-03-16 15:16:45.526001	2015-03-16 15:16:45.526001
470	199	274	2015-03-16 15:16:45.555404	2015-03-16 15:16:45.555404
471	199	275	2015-03-16 15:16:45.557324	2015-03-16 15:16:45.557324
472	200	274	2015-03-16 15:16:45.58486	2015-03-16 15:16:45.58486
473	200	276	2015-03-16 15:16:45.586889	2015-03-16 15:16:45.586889
474	201	299	2015-04-29 15:16:32.092593	2015-04-29 15:16:32.092593
475	201	300	2015-04-29 15:16:32.161049	2015-04-29 15:16:32.161049
476	202	299	2015-04-29 15:16:32.179347	2015-04-29 15:16:32.179347
477	202	300	2015-04-29 15:16:32.181158	2015-04-29 15:16:32.181158
478	203	299	2015-04-29 15:16:32.200355	2015-04-29 15:16:32.200355
479	203	300	2015-04-29 15:16:32.2022	2015-04-29 15:16:32.2022
480	205	299	2015-04-29 15:16:32.240714	2015-04-29 15:16:32.240714
481	205	301	2015-04-29 15:16:32.24246	2015-04-29 15:16:32.24246
482	206	299	2015-04-29 15:16:32.384323	2015-04-29 15:16:32.384323
483	206	300	2015-04-29 15:16:32.386798	2015-04-29 15:16:32.386798
484	206	303	2015-04-29 15:16:32.389896	2015-04-29 15:16:32.389896
485	207	299	2015-04-29 15:16:32.438088	2015-04-29 15:16:32.438088
486	207	300	2015-04-29 15:16:32.440118	2015-04-29 15:16:32.440118
487	207	303	2015-04-29 15:16:32.441977	2015-04-29 15:16:32.441977
488	208	303	2015-04-29 15:16:32.474386	2015-04-29 15:16:32.474386
489	209	303	2015-04-29 15:16:32.500004	2015-04-29 15:16:32.500004
490	210	299	2015-04-29 15:16:32.52475	2015-04-29 15:16:32.52475
491	210	301	2015-04-29 15:16:32.526683	2015-04-29 15:16:32.526683
492	211	299	2015-04-29 15:16:32.542634	2015-04-29 15:16:32.542634
493	211	303	2015-04-29 15:16:32.544208	2015-04-29 15:16:32.544208
494	211	301	2015-04-29 15:16:32.545721	2015-04-29 15:16:32.545721
495	211	302	2015-04-29 15:16:32.547443	2015-04-29 15:16:32.547443
496	212	299	2015-04-29 15:16:32.561814	2015-04-29 15:16:32.561814
497	213	299	2015-04-29 15:16:32.574409	2015-04-29 15:16:32.574409
498	214	299	2015-04-29 15:16:32.586589	2015-04-29 15:16:32.586589
499	215	299	2015-04-29 15:16:32.60209	2015-04-29 15:16:32.60209
500	215	301	2015-04-29 15:16:32.603829	2015-04-29 15:16:32.603829
501	216	299	2015-04-29 15:16:32.625467	2015-04-29 15:16:32.625467
502	216	300	2015-04-29 15:16:32.627138	2015-04-29 15:16:32.627138
503	217	299	2015-04-29 15:16:32.654811	2015-04-29 15:16:32.654811
504	217	300	2015-04-29 15:16:32.656911	2015-04-29 15:16:32.656911
505	218	299	2015-04-29 15:16:32.6836	2015-04-29 15:16:32.6836
506	218	301	2015-04-29 15:16:32.685339	2015-04-29 15:16:32.685339
507	219	299	2015-04-29 15:16:32.71623	2015-04-29 15:16:32.71623
508	219	301	2015-04-29 15:16:32.717882	2015-04-29 15:16:32.717882
509	219	303	2015-04-29 15:16:32.719424	2015-04-29 15:16:32.719424
510	220	299	2015-04-29 15:16:32.740652	2015-04-29 15:16:32.740652
511	220	301	2015-04-29 15:16:32.742224	2015-04-29 15:16:32.742224
512	221	299	2015-04-29 15:16:32.765035	2015-04-29 15:16:32.765035
513	221	301	2015-04-29 15:16:32.766711	2015-04-29 15:16:32.766711
514	221	303	2015-04-29 15:16:32.768363	2015-04-29 15:16:32.768363
515	222	299	2015-04-29 15:16:32.790988	2015-04-29 15:16:32.790988
516	222	300	2015-04-29 15:16:32.792597	2015-04-29 15:16:32.792597
517	222	303	2015-04-29 15:16:32.794108	2015-04-29 15:16:32.794108
518	223	300	2015-04-29 15:16:32.815889	2015-04-29 15:16:32.815889
519	223	303	2015-04-29 15:16:32.817449	2015-04-29 15:16:32.817449
520	224	300	2015-04-29 15:16:32.837931	2015-04-29 15:16:32.837931
521	224	303	2015-04-29 15:16:32.839662	2015-04-29 15:16:32.839662
522	225	299	2015-04-29 15:16:32.860237	2015-04-29 15:16:32.860237
523	225	303	2015-04-29 15:16:32.8619	2015-04-29 15:16:32.8619
524	226	299	2015-04-29 15:16:32.882908	2015-04-29 15:16:32.882908
525	226	301	2015-04-29 15:16:32.884469	2015-04-29 15:16:32.884469
526	227	299	2015-04-29 15:16:32.905885	2015-04-29 15:16:32.905885
527	227	300	2015-04-29 15:16:32.907704	2015-04-29 15:16:32.907704
528	228	299	2015-04-29 15:16:32.927954	2015-04-29 15:16:32.927954
529	228	300	2015-04-29 15:16:32.929643	2015-04-29 15:16:32.929643
530	228	303	2015-04-29 15:16:32.93119	2015-04-29 15:16:32.93119
531	229	299	2015-04-29 15:16:32.950326	2015-04-29 15:16:32.950326
532	229	301	2015-04-29 15:16:32.95212	2015-04-29 15:16:32.95212
533	230	299	2015-04-29 15:16:32.96815	2015-04-29 15:16:32.96815
534	230	301	2015-04-29 15:16:32.970565	2015-04-29 15:16:32.970565
535	231	299	2015-04-29 15:16:32.98635	2015-04-29 15:16:32.98635
536	231	301	2015-04-29 15:16:32.988007	2015-04-29 15:16:32.988007
537	232	299	2015-04-29 15:16:33.009252	2015-04-29 15:16:33.009252
538	232	301	2015-04-29 15:16:33.010933	2015-04-29 15:16:33.010933
539	233	299	2015-04-29 15:16:33.031433	2015-04-29 15:16:33.031433
540	233	303	2015-04-29 15:16:33.033052	2015-04-29 15:16:33.033052
541	233	301	2015-04-29 15:16:33.034547	2015-04-29 15:16:33.034547
542	234	299	2015-04-29 15:16:33.056405	2015-04-29 15:16:33.056405
543	234	301	2015-04-29 15:16:33.058138	2015-04-29 15:16:33.058138
544	235	303	2015-04-29 15:16:33.07523	2015-04-29 15:16:33.07523
545	236	299	2015-04-29 15:16:33.087402	2015-04-29 15:16:33.087402
546	237	299	2015-04-29 15:16:33.100933	2015-04-29 15:16:33.100933
547	238	299	2015-04-29 15:16:33.113728	2015-04-29 15:16:33.113728
548	239	305	2015-04-29 15:28:57.327056	2015-04-29 15:28:57.327056
549	239	306	2015-04-29 15:28:57.329199	2015-04-29 15:28:57.329199
550	240	305	2015-04-29 15:28:57.346354	2015-04-29 15:28:57.346354
551	240	306	2015-04-29 15:28:57.348345	2015-04-29 15:28:57.348345
552	241	305	2015-04-29 15:28:57.364086	2015-04-29 15:28:57.364086
553	241	306	2015-04-29 15:28:57.365657	2015-04-29 15:28:57.365657
554	243	305	2015-04-29 15:28:57.399953	2015-04-29 15:28:57.399953
555	243	307	2015-04-29 15:28:57.401587	2015-04-29 15:28:57.401587
556	244	305	2015-04-29 15:28:57.424336	2015-04-29 15:28:57.424336
557	244	306	2015-04-29 15:28:57.425912	2015-04-29 15:28:57.425912
558	244	309	2015-04-29 15:28:57.427433	2015-04-29 15:28:57.427433
559	245	305	2015-04-29 15:28:57.45153	2015-04-29 15:28:57.45153
560	245	306	2015-04-29 15:28:57.453433	2015-04-29 15:28:57.453433
561	245	309	2015-04-29 15:28:57.455213	2015-04-29 15:28:57.455213
562	246	309	2015-04-29 15:28:57.475584	2015-04-29 15:28:57.475584
563	247	309	2015-04-29 15:28:57.503649	2015-04-29 15:28:57.503649
564	248	305	2015-04-29 15:28:57.520616	2015-04-29 15:28:57.520616
565	248	307	2015-04-29 15:28:57.522458	2015-04-29 15:28:57.522458
566	249	305	2015-04-29 15:28:57.538969	2015-04-29 15:28:57.538969
567	249	309	2015-04-29 15:28:57.540612	2015-04-29 15:28:57.540612
568	249	307	2015-04-29 15:28:57.542314	2015-04-29 15:28:57.542314
569	249	308	2015-04-29 15:28:57.543813	2015-04-29 15:28:57.543813
570	250	305	2015-04-29 15:28:57.560556	2015-04-29 15:28:57.560556
571	251	305	2015-04-29 15:28:57.574865	2015-04-29 15:28:57.574865
572	252	305	2015-04-29 15:28:57.588656	2015-04-29 15:28:57.588656
573	253	305	2015-04-29 15:28:57.605981	2015-04-29 15:28:57.605981
574	253	307	2015-04-29 15:28:57.607604	2015-04-29 15:28:57.607604
575	254	305	2015-04-29 15:28:57.631443	2015-04-29 15:28:57.631443
576	254	306	2015-04-29 15:28:57.633569	2015-04-29 15:28:57.633569
577	255	305	2015-04-29 15:28:57.664149	2015-04-29 15:28:57.664149
578	255	306	2015-04-29 15:28:57.665821	2015-04-29 15:28:57.665821
579	256	305	2015-04-29 15:28:57.693465	2015-04-29 15:28:57.693465
580	256	307	2015-04-29 15:28:57.695109	2015-04-29 15:28:57.695109
581	257	305	2015-04-29 15:28:57.719979	2015-04-29 15:28:57.719979
582	257	307	2015-04-29 15:28:57.72175	2015-04-29 15:28:57.72175
583	257	309	2015-04-29 15:28:57.723528	2015-04-29 15:28:57.723528
584	258	305	2015-04-29 15:28:57.747769	2015-04-29 15:28:57.747769
585	258	307	2015-04-29 15:28:57.749936	2015-04-29 15:28:57.749936
586	259	305	2015-04-29 15:28:57.774262	2015-04-29 15:28:57.774262
587	259	307	2015-04-29 15:28:57.775794	2015-04-29 15:28:57.775794
588	259	309	2015-04-29 15:28:57.777358	2015-04-29 15:28:57.777358
589	260	305	2015-04-29 15:28:57.803475	2015-04-29 15:28:57.803475
590	260	306	2015-04-29 15:28:57.805162	2015-04-29 15:28:57.805162
591	260	309	2015-04-29 15:28:57.806626	2015-04-29 15:28:57.806626
592	261	306	2015-04-29 15:28:57.830561	2015-04-29 15:28:57.830561
593	261	309	2015-04-29 15:28:57.832436	2015-04-29 15:28:57.832436
594	262	306	2015-04-29 15:28:57.858665	2015-04-29 15:28:57.858665
595	262	309	2015-04-29 15:28:57.860353	2015-04-29 15:28:57.860353
596	263	305	2015-04-29 15:28:57.883265	2015-04-29 15:28:57.883265
597	263	309	2015-04-29 15:28:57.885219	2015-04-29 15:28:57.885219
598	264	305	2015-04-29 15:28:57.910439	2015-04-29 15:28:57.910439
599	264	307	2015-04-29 15:28:57.912351	2015-04-29 15:28:57.912351
600	265	305	2015-04-29 15:28:57.944667	2015-04-29 15:28:57.944667
601	265	306	2015-04-29 15:28:57.946399	2015-04-29 15:28:57.946399
602	266	305	2015-04-29 15:28:57.982182	2015-04-29 15:28:57.982182
603	266	306	2015-04-29 15:28:57.983848	2015-04-29 15:28:57.983848
604	266	309	2015-04-29 15:28:57.985491	2015-04-29 15:28:57.985491
605	267	305	2015-04-29 15:28:58.006575	2015-04-29 15:28:58.006575
606	267	307	2015-04-29 15:28:58.008251	2015-04-29 15:28:58.008251
607	268	305	2015-04-29 15:28:58.02486	2015-04-29 15:28:58.02486
608	268	307	2015-04-29 15:28:58.026622	2015-04-29 15:28:58.026622
609	269	305	2015-04-29 15:28:58.044623	2015-04-29 15:28:58.044623
610	269	307	2015-04-29 15:28:58.046562	2015-04-29 15:28:58.046562
611	270	305	2015-04-29 15:28:58.072318	2015-04-29 15:28:58.072318
612	270	307	2015-04-29 15:28:58.073851	2015-04-29 15:28:58.073851
613	271	305	2015-04-29 15:28:58.097833	2015-04-29 15:28:58.097833
614	271	309	2015-04-29 15:28:58.099741	2015-04-29 15:28:58.099741
615	271	307	2015-04-29 15:28:58.101379	2015-04-29 15:28:58.101379
616	272	305	2015-04-29 15:28:58.1254	2015-04-29 15:28:58.1254
617	272	307	2015-04-29 15:28:58.127198	2015-04-29 15:28:58.127198
618	273	309	2015-04-29 15:28:58.145426	2015-04-29 15:28:58.145426
619	274	305	2015-04-29 15:28:58.162404	2015-04-29 15:28:58.162404
620	275	305	2015-04-29 15:28:58.182376	2015-04-29 15:28:58.182376
621	276	305	2015-04-29 15:28:58.196693	2015-04-29 15:28:58.196693
622	277	311	2015-04-30 03:16:05.156499	2015-04-30 03:16:05.156499
623	277	312	2015-04-30 03:16:05.159496	2015-04-30 03:16:05.159496
624	278	311	2015-04-30 03:16:05.184145	2015-04-30 03:16:05.184145
625	278	312	2015-04-30 03:16:05.185783	2015-04-30 03:16:05.185783
626	279	311	2015-04-30 03:16:05.220337	2015-04-30 03:16:05.220337
627	279	312	2015-04-30 03:16:05.222503	2015-04-30 03:16:05.222503
628	281	311	2015-04-30 03:16:05.282382	2015-04-30 03:16:05.282382
629	281	313	2015-04-30 03:16:05.2842	2015-04-30 03:16:05.2842
630	282	311	2015-04-30 03:16:05.361061	2015-04-30 03:16:05.361061
631	282	312	2015-04-30 03:16:05.364237	2015-04-30 03:16:05.364237
632	282	315	2015-04-30 03:16:05.366646	2015-04-30 03:16:05.366646
633	283	311	2015-04-30 03:16:05.393154	2015-04-30 03:16:05.393154
634	283	312	2015-04-30 03:16:05.395091	2015-04-30 03:16:05.395091
635	283	315	2015-04-30 03:16:05.396647	2015-04-30 03:16:05.396647
636	284	315	2015-04-30 03:16:05.418433	2015-04-30 03:16:05.418433
637	285	315	2015-04-30 03:16:05.432933	2015-04-30 03:16:05.432933
638	286	311	2015-04-30 03:16:05.487736	2015-04-30 03:16:05.487736
639	286	313	2015-04-30 03:16:05.490343	2015-04-30 03:16:05.490343
640	287	311	2015-04-30 03:16:05.508689	2015-04-30 03:16:05.508689
641	287	315	2015-04-30 03:16:05.510354	2015-04-30 03:16:05.510354
642	287	313	2015-04-30 03:16:05.51195	2015-04-30 03:16:05.51195
643	287	314	2015-04-30 03:16:05.513792	2015-04-30 03:16:05.513792
644	288	311	2015-04-30 03:16:05.530189	2015-04-30 03:16:05.530189
645	289	311	2015-04-30 03:16:05.545291	2015-04-30 03:16:05.545291
646	290	311	2015-04-30 03:16:05.586045	2015-04-30 03:16:05.586045
647	291	311	2015-04-30 03:16:05.604974	2015-04-30 03:16:05.604974
648	291	313	2015-04-30 03:16:05.607523	2015-04-30 03:16:05.607523
649	292	311	2015-04-30 03:16:05.660202	2015-04-30 03:16:05.660202
650	292	312	2015-04-30 03:16:05.66184	2015-04-30 03:16:05.66184
651	293	311	2015-04-30 03:16:05.693225	2015-04-30 03:16:05.693225
652	293	312	2015-04-30 03:16:05.694892	2015-04-30 03:16:05.694892
653	294	311	2015-04-30 03:16:05.724139	2015-04-30 03:16:05.724139
654	294	313	2015-04-30 03:16:05.726045	2015-04-30 03:16:05.726045
655	295	311	2015-04-30 03:16:05.753248	2015-04-30 03:16:05.753248
656	295	313	2015-04-30 03:16:05.755865	2015-04-30 03:16:05.755865
657	295	315	2015-04-30 03:16:05.757936	2015-04-30 03:16:05.757936
658	296	311	2015-04-30 03:16:05.783053	2015-04-30 03:16:05.783053
659	296	313	2015-04-30 03:16:05.784918	2015-04-30 03:16:05.784918
660	297	311	2015-04-30 03:16:05.824795	2015-04-30 03:16:05.824795
661	297	313	2015-04-30 03:16:05.826785	2015-04-30 03:16:05.826785
662	297	315	2015-04-30 03:16:05.828315	2015-04-30 03:16:05.828315
663	298	311	2015-04-30 03:16:05.854752	2015-04-30 03:16:05.854752
664	298	312	2015-04-30 03:16:05.857194	2015-04-30 03:16:05.857194
665	298	315	2015-04-30 03:16:05.858918	2015-04-30 03:16:05.858918
666	299	312	2015-04-30 03:16:05.884491	2015-04-30 03:16:05.884491
667	299	315	2015-04-30 03:16:05.886246	2015-04-30 03:16:05.886246
668	300	312	2015-04-30 03:16:05.925399	2015-04-30 03:16:05.925399
669	300	315	2015-04-30 03:16:05.927273	2015-04-30 03:16:05.927273
670	301	311	2015-04-30 03:16:05.950762	2015-04-30 03:16:05.950762
671	301	315	2015-04-30 03:16:05.95251	2015-04-30 03:16:05.95251
672	302	311	2015-04-30 03:16:05.990031	2015-04-30 03:16:05.990031
673	302	313	2015-04-30 03:16:05.991845	2015-04-30 03:16:05.991845
674	303	311	2015-04-30 03:16:06.024847	2015-04-30 03:16:06.024847
675	303	312	2015-04-30 03:16:06.026588	2015-04-30 03:16:06.026588
676	304	311	2015-04-30 03:16:06.051876	2015-04-30 03:16:06.051876
677	304	312	2015-04-30 03:16:06.053992	2015-04-30 03:16:06.053992
678	304	315	2015-04-30 03:16:06.056019	2015-04-30 03:16:06.056019
679	305	311	2015-04-30 03:16:06.078561	2015-04-30 03:16:06.078561
680	305	313	2015-04-30 03:16:06.080265	2015-04-30 03:16:06.080265
681	306	311	2015-04-30 03:16:06.09769	2015-04-30 03:16:06.09769
682	306	313	2015-04-30 03:16:06.099411	2015-04-30 03:16:06.099411
683	307	311	2015-04-30 03:16:06.118663	2015-04-30 03:16:06.118663
684	307	313	2015-04-30 03:16:06.120341	2015-04-30 03:16:06.120341
685	308	311	2015-04-30 03:16:06.146596	2015-04-30 03:16:06.146596
686	308	313	2015-04-30 03:16:06.148257	2015-04-30 03:16:06.148257
687	309	311	2015-04-30 03:16:06.172213	2015-04-30 03:16:06.172213
688	309	315	2015-04-30 03:16:06.174444	2015-04-30 03:16:06.174444
689	309	313	2015-04-30 03:16:06.176182	2015-04-30 03:16:06.176182
690	310	311	2015-04-30 03:16:06.203604	2015-04-30 03:16:06.203604
691	310	313	2015-04-30 03:16:06.206001	2015-04-30 03:16:06.206001
692	311	315	2015-04-30 03:16:06.226617	2015-04-30 03:16:06.226617
693	312	311	2015-04-30 03:16:06.240871	2015-04-30 03:16:06.240871
694	313	311	2015-04-30 03:16:06.25715	2015-04-30 03:16:06.25715
695	314	311	2015-04-30 03:16:06.272631	2015-04-30 03:16:06.272631
696	315	317	2015-05-06 09:39:37.209483	2015-05-06 09:39:37.209483
697	315	318	2015-05-06 09:39:37.243729	2015-05-06 09:39:37.243729
698	316	317	2015-05-06 09:39:37.26525	2015-05-06 09:39:37.26525
699	316	318	2015-05-06 09:39:37.267788	2015-05-06 09:39:37.267788
700	317	317	2015-05-06 09:39:37.288782	2015-05-06 09:39:37.288782
701	317	318	2015-05-06 09:39:37.290568	2015-05-06 09:39:37.290568
702	319	317	2015-05-06 09:39:37.338411	2015-05-06 09:39:37.338411
703	319	319	2015-05-06 09:39:37.340197	2015-05-06 09:39:37.340197
704	320	317	2015-05-06 09:39:37.439193	2015-05-06 09:39:37.439193
705	320	318	2015-05-06 09:39:37.442437	2015-05-06 09:39:37.442437
706	320	321	2015-05-06 09:39:37.445298	2015-05-06 09:39:37.445298
707	321	317	2015-05-06 09:39:37.480718	2015-05-06 09:39:37.480718
708	321	318	2015-05-06 09:39:37.483523	2015-05-06 09:39:37.483523
709	321	321	2015-05-06 09:39:37.485568	2015-05-06 09:39:37.485568
710	322	321	2015-05-06 09:39:37.507802	2015-05-06 09:39:37.507802
711	323	321	2015-05-06 09:39:37.537883	2015-05-06 09:39:37.537883
712	324	317	2015-05-06 09:39:37.555155	2015-05-06 09:39:37.555155
713	324	319	2015-05-06 09:39:37.556997	2015-05-06 09:39:37.556997
714	325	317	2015-05-06 09:39:37.574568	2015-05-06 09:39:37.574568
715	325	321	2015-05-06 09:39:37.576347	2015-05-06 09:39:37.576347
716	325	319	2015-05-06 09:39:37.578026	2015-05-06 09:39:37.578026
717	325	320	2015-05-06 09:39:37.579677	2015-05-06 09:39:37.579677
718	326	317	2015-05-06 09:39:37.595999	2015-05-06 09:39:37.595999
719	327	317	2015-05-06 09:39:37.610624	2015-05-06 09:39:37.610624
720	328	317	2015-05-06 09:39:37.625199	2015-05-06 09:39:37.625199
721	329	317	2015-05-06 09:39:37.643743	2015-05-06 09:39:37.643743
722	329	319	2015-05-06 09:39:37.645674	2015-05-06 09:39:37.645674
723	330	317	2015-05-06 09:39:37.691344	2015-05-06 09:39:37.691344
724	330	318	2015-05-06 09:39:37.693639	2015-05-06 09:39:37.693639
725	331	317	2015-05-06 09:39:37.747657	2015-05-06 09:39:37.747657
726	331	318	2015-05-06 09:39:37.749723	2015-05-06 09:39:37.749723
727	332	317	2015-05-06 09:39:37.779654	2015-05-06 09:39:37.779654
728	332	319	2015-05-06 09:39:37.781566	2015-05-06 09:39:37.781566
729	333	317	2015-05-06 09:39:37.832317	2015-05-06 09:39:37.832317
730	333	319	2015-05-06 09:39:37.834057	2015-05-06 09:39:37.834057
731	333	321	2015-05-06 09:39:37.835652	2015-05-06 09:39:37.835652
732	334	317	2015-05-06 09:39:37.867018	2015-05-06 09:39:37.867018
733	334	319	2015-05-06 09:39:37.868722	2015-05-06 09:39:37.868722
734	335	317	2015-05-06 09:39:37.895167	2015-05-06 09:39:37.895167
735	335	319	2015-05-06 09:39:37.897059	2015-05-06 09:39:37.897059
736	335	321	2015-05-06 09:39:37.898717	2015-05-06 09:39:37.898717
737	336	317	2015-05-06 09:39:37.925727	2015-05-06 09:39:37.925727
738	336	318	2015-05-06 09:39:37.927523	2015-05-06 09:39:37.927523
739	336	321	2015-05-06 09:39:37.92915	2015-05-06 09:39:37.92915
740	337	318	2015-05-06 09:39:37.956895	2015-05-06 09:39:37.956895
741	337	321	2015-05-06 09:39:37.958691	2015-05-06 09:39:37.958691
742	338	318	2015-05-06 09:39:37.984492	2015-05-06 09:39:37.984492
743	338	321	2015-05-06 09:39:37.986282	2015-05-06 09:39:37.986282
744	339	317	2015-05-06 09:39:38.010114	2015-05-06 09:39:38.010114
745	339	321	2015-05-06 09:39:38.011924	2015-05-06 09:39:38.011924
746	340	317	2015-05-06 09:39:38.037799	2015-05-06 09:39:38.037799
747	340	319	2015-05-06 09:39:38.039601	2015-05-06 09:39:38.039601
748	341	317	2015-05-06 09:39:38.064471	2015-05-06 09:39:38.064471
749	341	318	2015-05-06 09:39:38.082161	2015-05-06 09:39:38.082161
750	342	317	2015-05-06 09:39:38.114134	2015-05-06 09:39:38.114134
751	342	318	2015-05-06 09:39:38.116393	2015-05-06 09:39:38.116393
752	342	321	2015-05-06 09:39:38.118043	2015-05-06 09:39:38.118043
753	343	317	2015-05-06 09:39:38.140653	2015-05-06 09:39:38.140653
754	343	319	2015-05-06 09:39:38.142666	2015-05-06 09:39:38.142666
755	344	317	2015-05-06 09:39:38.159754	2015-05-06 09:39:38.159754
756	344	319	2015-05-06 09:39:38.161668	2015-05-06 09:39:38.161668
757	345	317	2015-05-06 09:39:38.180886	2015-05-06 09:39:38.180886
758	345	319	2015-05-06 09:39:38.182711	2015-05-06 09:39:38.182711
759	346	317	2015-05-06 09:39:38.207204	2015-05-06 09:39:38.207204
760	346	319	2015-05-06 09:39:38.208997	2015-05-06 09:39:38.208997
761	347	317	2015-05-06 09:39:38.232745	2015-05-06 09:39:38.232745
762	347	321	2015-05-06 09:39:38.234461	2015-05-06 09:39:38.234461
763	347	319	2015-05-06 09:39:38.236132	2015-05-06 09:39:38.236132
764	348	317	2015-05-06 09:39:38.261301	2015-05-06 09:39:38.261301
765	348	319	2015-05-06 09:39:38.26298	2015-05-06 09:39:38.26298
766	349	321	2015-05-06 09:39:38.282392	2015-05-06 09:39:38.282392
767	350	317	2015-05-06 09:39:38.296901	2015-05-06 09:39:38.296901
768	351	317	2015-05-06 09:39:38.312285	2015-05-06 09:39:38.312285
769	352	317	2015-05-06 09:39:38.32771	2015-05-06 09:39:38.32771
770	353	323	2015-05-07 16:16:41.401981	2015-05-07 16:16:41.401981
771	353	324	2015-05-07 16:16:41.431015	2015-05-07 16:16:41.431015
772	354	323	2015-05-07 16:16:41.450077	2015-05-07 16:16:41.450077
773	354	324	2015-05-07 16:16:41.451831	2015-05-07 16:16:41.451831
774	355	323	2015-05-07 16:16:41.476298	2015-05-07 16:16:41.476298
775	355	324	2015-05-07 16:16:41.478366	2015-05-07 16:16:41.478366
776	357	323	2015-05-07 16:16:41.526323	2015-05-07 16:16:41.526323
777	357	325	2015-05-07 16:16:41.52793	2015-05-07 16:16:41.52793
778	358	324	2015-05-07 16:16:41.601215	2015-05-07 16:16:41.601215
779	358	327	2015-05-07 16:16:41.603006	2015-05-07 16:16:41.603006
780	359	324	2015-05-07 16:16:41.628328	2015-05-07 16:16:41.628328
781	359	327	2015-05-07 16:16:41.62987	2015-05-07 16:16:41.62987
782	360	327	2015-05-07 16:16:41.650143	2015-05-07 16:16:41.650143
783	361	327	2015-05-07 16:16:41.713829	2015-05-07 16:16:41.713829
784	362	323	2015-05-07 16:16:41.730933	2015-05-07 16:16:41.730933
785	362	325	2015-05-07 16:16:41.732632	2015-05-07 16:16:41.732632
786	363	323	2015-05-07 16:16:41.749701	2015-05-07 16:16:41.749701
787	363	327	2015-05-07 16:16:41.751293	2015-05-07 16:16:41.751293
788	363	325	2015-05-07 16:16:41.753239	2015-05-07 16:16:41.753239
789	363	326	2015-05-07 16:16:41.755015	2015-05-07 16:16:41.755015
790	364	323	2015-05-07 16:16:41.772043	2015-05-07 16:16:41.772043
791	365	323	2015-05-07 16:16:41.787018	2015-05-07 16:16:41.787018
792	366	323	2015-05-07 16:16:41.804608	2015-05-07 16:16:41.804608
793	367	323	2015-05-07 16:16:41.823255	2015-05-07 16:16:41.823255
794	367	325	2015-05-07 16:16:41.824975	2015-05-07 16:16:41.824975
795	368	323	2015-05-07 16:16:41.851584	2015-05-07 16:16:41.851584
796	368	324	2015-05-07 16:16:41.854141	2015-05-07 16:16:41.854141
797	369	323	2015-05-07 16:16:41.889166	2015-05-07 16:16:41.889166
798	369	324	2015-05-07 16:16:41.890945	2015-05-07 16:16:41.890945
799	370	323	2015-05-07 16:16:41.918881	2015-05-07 16:16:41.918881
800	370	325	2015-05-07 16:16:41.920411	2015-05-07 16:16:41.920411
801	371	323	2015-05-07 16:16:41.947422	2015-05-07 16:16:41.947422
802	371	325	2015-05-07 16:16:41.949226	2015-05-07 16:16:41.949226
803	371	327	2015-05-07 16:16:41.950843	2015-05-07 16:16:41.950843
804	372	323	2015-05-07 16:16:41.978801	2015-05-07 16:16:41.978801
805	372	325	2015-05-07 16:16:41.980531	2015-05-07 16:16:41.980531
806	373	323	2015-05-07 16:16:42.005865	2015-05-07 16:16:42.005865
807	373	325	2015-05-07 16:16:42.007541	2015-05-07 16:16:42.007541
808	373	327	2015-05-07 16:16:42.009239	2015-05-07 16:16:42.009239
809	374	324	2015-05-07 16:16:42.033564	2015-05-07 16:16:42.033564
810	374	327	2015-05-07 16:16:42.035119	2015-05-07 16:16:42.035119
811	375	324	2015-05-07 16:16:42.061328	2015-05-07 16:16:42.061328
812	375	327	2015-05-07 16:16:42.063252	2015-05-07 16:16:42.063252
813	376	324	2015-05-07 16:16:42.088182	2015-05-07 16:16:42.088182
814	376	327	2015-05-07 16:16:42.089984	2015-05-07 16:16:42.089984
815	377	323	2015-05-07 16:16:42.113441	2015-05-07 16:16:42.113441
816	377	324	2015-05-07 16:16:42.115078	2015-05-07 16:16:42.115078
817	378	323	2015-05-07 16:16:42.140237	2015-05-07 16:16:42.140237
818	378	325	2015-05-07 16:16:42.142635	2015-05-07 16:16:42.142635
819	379	323	2015-05-07 16:16:42.181272	2015-05-07 16:16:42.181272
820	379	324	2015-05-07 16:16:42.183918	2015-05-07 16:16:42.183918
821	380	324	2015-05-07 16:16:42.215372	2015-05-07 16:16:42.215372
822	380	327	2015-05-07 16:16:42.217114	2015-05-07 16:16:42.217114
823	381	323	2015-05-07 16:16:42.240082	2015-05-07 16:16:42.240082
824	381	325	2015-05-07 16:16:42.242003	2015-05-07 16:16:42.242003
825	382	323	2015-05-07 16:16:42.25904	2015-05-07 16:16:42.25904
826	382	325	2015-05-07 16:16:42.260665	2015-05-07 16:16:42.260665
827	383	323	2015-05-07 16:16:42.278785	2015-05-07 16:16:42.278785
828	383	325	2015-05-07 16:16:42.280344	2015-05-07 16:16:42.280344
829	384	323	2015-05-07 16:16:42.306191	2015-05-07 16:16:42.306191
830	384	325	2015-05-07 16:16:42.307988	2015-05-07 16:16:42.307988
831	385	323	2015-05-07 16:16:42.333126	2015-05-07 16:16:42.333126
832	385	327	2015-05-07 16:16:42.334915	2015-05-07 16:16:42.334915
833	385	325	2015-05-07 16:16:42.336747	2015-05-07 16:16:42.336747
834	386	323	2015-05-07 16:16:42.362231	2015-05-07 16:16:42.362231
835	386	325	2015-05-07 16:16:42.363953	2015-05-07 16:16:42.363953
836	387	327	2015-05-07 16:16:42.382767	2015-05-07 16:16:42.382767
837	388	323	2015-05-07 16:16:42.396895	2015-05-07 16:16:42.396895
838	389	323	2015-05-07 16:16:42.41375	2015-05-07 16:16:42.41375
839	390	323	2015-05-07 16:16:42.428186	2015-05-07 16:16:42.428186
840	391	329	2015-05-07 16:48:12.678016	2015-05-07 16:48:12.678016
841	391	330	2015-05-07 16:48:12.680378	2015-05-07 16:48:12.680378
842	392	329	2015-05-07 16:48:12.697137	2015-05-07 16:48:12.697137
843	392	330	2015-05-07 16:48:12.69883	2015-05-07 16:48:12.69883
844	393	329	2015-05-07 16:48:12.715473	2015-05-07 16:48:12.715473
845	393	330	2015-05-07 16:48:12.71715	2015-05-07 16:48:12.71715
846	395	329	2015-05-07 16:48:12.75797	2015-05-07 16:48:12.75797
847	395	331	2015-05-07 16:48:12.75979	2015-05-07 16:48:12.75979
848	396	330	2015-05-07 16:48:12.812363	2015-05-07 16:48:12.812363
849	396	333	2015-05-07 16:48:12.816096	2015-05-07 16:48:12.816096
850	397	330	2015-05-07 16:48:12.850115	2015-05-07 16:48:12.850115
851	397	333	2015-05-07 16:48:12.852781	2015-05-07 16:48:12.852781
858	401	331	2015-05-07 16:48:12.96469	2015-05-07 16:48:12.96469
860	402	329	2015-05-07 16:48:12.984197	2015-05-07 16:48:12.984197
861	403	329	2015-05-07 16:48:12.999919	2015-05-07 16:48:12.999919
862	404	329	2015-05-07 16:48:13.018206	2015-05-07 16:48:13.018206
863	405	329	2015-05-07 16:48:13.040772	2015-05-07 16:48:13.040772
864	405	331	2015-05-07 16:48:13.042484	2015-05-07 16:48:13.042484
865	406	329	2015-05-07 16:48:13.069893	2015-05-07 16:48:13.069893
866	406	330	2015-05-07 16:48:13.071782	2015-05-07 16:48:13.071782
867	407	329	2015-05-07 16:48:13.106132	2015-05-07 16:48:13.106132
868	407	330	2015-05-07 16:48:13.108621	2015-05-07 16:48:13.108621
873	409	333	2015-05-07 16:48:13.183849	2015-05-07 16:48:13.183849
878	411	333	2015-05-07 16:48:13.245581	2015-05-07 16:48:13.245581
879	412	330	2015-05-07 16:48:13.27425	2015-05-07 16:48:13.27425
880	412	333	2015-05-07 16:48:13.275915	2015-05-07 16:48:13.275915
881	413	330	2015-05-07 16:48:13.302805	2015-05-07 16:48:13.302805
883	414	330	2015-05-07 16:48:13.329119	2015-05-07 16:48:13.329119
884	414	333	2015-05-07 16:48:13.330955	2015-05-07 16:48:13.330955
885	415	329	2015-05-07 16:48:13.364559	2015-05-07 16:48:13.364559
886	415	330	2015-05-07 16:48:13.366665	2015-05-07 16:48:13.366665
887	416	329	2015-05-07 16:48:13.393608	2015-05-07 16:48:13.393608
888	416	331	2015-05-07 16:48:13.395626	2015-05-07 16:48:13.395626
889	417	329	2015-05-07 16:48:13.420687	2015-05-07 16:48:13.420687
890	417	330	2015-05-07 16:48:13.422592	2015-05-07 16:48:13.422592
891	418	330	2015-05-07 16:48:13.452316	2015-05-07 16:48:13.452316
892	418	333	2015-05-07 16:48:13.455234	2015-05-07 16:48:13.455234
895	420	329	2015-05-07 16:48:13.495633	2015-05-07 16:48:13.495633
899	422	329	2015-05-07 16:48:13.541284	2015-05-07 16:48:13.541284
900	422	331	2015-05-07 16:48:13.542887	2015-05-07 16:48:13.542887
902	423	333	2015-05-07 16:48:13.577824	2015-05-07 16:48:13.577824
904	424	329	2015-05-07 16:48:13.605776	2015-05-07 16:48:13.605776
905	424	331	2015-05-07 16:48:13.607416	2015-05-07 16:48:13.607416
915	437	334	2015-09-04 19:53:23.005449	2015-09-04 19:53:23.005449
916	450	334	2015-09-08 20:31:49.5342	2015-09-08 20:31:49.5342
917	448	334	2015-09-08 20:32:21.221267	2015-09-08 20:32:21.221267
918	449	334	2015-09-08 20:32:25.211803	2015-09-08 20:32:25.211803
919	451	334	2015-09-08 20:32:28.323306	2015-09-08 20:32:28.323306
920	452	334	2015-09-08 20:32:31.779183	2015-09-08 20:32:31.779183
921	453	334	2015-09-08 20:32:34.811732	2015-09-08 20:32:34.811732
922	454	334	2015-09-08 20:32:37.712652	2015-09-08 20:32:37.712652
923	455	334	2015-09-08 20:32:41.160924	2015-09-08 20:32:41.160924
924	439	333	2015-09-08 21:19:35.810707	2015-09-08 21:19:35.810707
925	446	331	2015-09-08 21:20:29.171366	2015-09-08 21:20:29.171366
927	440	329	2015-09-08 21:20:57.488696	2015-09-08 21:20:57.488696
928	442	329	2015-09-08 21:26:39.371445	2015-09-08 21:26:39.371445
929	441	333	2015-09-08 21:27:01.740963	2015-09-08 21:27:01.740963
930	444	329	2015-09-08 21:27:44.592374	2015-09-08 21:27:44.592374
931	456	330	2015-09-08 21:39:00.516761	2015-09-08 21:39:00.516761
932	457	330	2015-09-08 21:40:54.606897	2015-09-08 21:40:54.606897
933	458	330	2015-09-08 21:42:24.674379	2015-09-08 21:42:24.674379
934	459	330	2015-09-08 21:43:38.873954	2015-09-08 21:43:38.873954
935	460	330	2015-09-08 21:46:56.212421	2015-09-08 21:46:56.212421
936	461	330	2015-09-08 21:48:31.891064	2015-09-08 21:48:31.891064
937	408	330	2015-09-08 21:52:45.688275	2015-09-08 21:52:45.688275
938	409	330	2015-09-08 21:53:11.650819	2015-09-08 21:53:11.650819
939	410	330	2015-09-08 21:53:16.940071	2015-09-08 21:53:16.940071
940	411	330	2015-09-08 21:53:22.122371	2015-09-08 21:53:22.122371
941	421	330	2015-09-08 21:53:27.791181	2015-09-08 21:53:27.791181
942	422	330	2015-09-08 21:53:31.733634	2015-09-08 21:53:31.733634
943	423	330	2015-09-08 21:53:35.336892	2015-09-08 21:53:35.336892
944	424	330	2015-09-08 21:53:39.000626	2015-09-08 21:53:39.000626
946	447	330	2015-09-08 21:56:16.38445	2015-09-08 21:56:16.38445
948	446	330	2015-09-08 21:56:47.095642	2015-09-08 21:56:47.095642
949	438	330	2015-09-08 21:57:56.380504	2015-09-08 21:57:56.380504
950	440	330	2015-09-08 21:57:59.444964	2015-09-08 21:57:59.444964
951	439	330	2015-09-08 21:58:02.682654	2015-09-08 21:58:02.682654
952	442	330	2015-09-08 21:58:05.957817	2015-09-08 21:58:05.957817
953	441	330	2015-09-08 21:58:09.494818	2015-09-08 21:58:09.494818
954	443	330	2015-09-08 21:58:12.705759	2015-09-08 21:58:12.705759
957	441	331	2015-09-08 22:28:06.710493	2015-09-08 22:28:06.710493
958	442	331	2015-09-08 22:28:19.426784	2015-09-08 22:28:19.426784
959	446	333	2015-09-08 22:30:05.238143	2015-09-08 22:30:05.238143
961	461	329	2015-09-08 22:33:33.356733	2015-09-08 22:33:33.356733
962	461	333	2015-09-08 22:33:33.361042	2015-09-08 22:33:33.361042
963	400	330	2015-09-10 22:13:07.632063	2015-09-10 22:13:07.632063
964	438	331	2015-09-10 22:17:20.314074	2015-09-10 22:17:20.314074
965	438	333	2015-09-10 22:17:20.317095	2015-09-10 22:17:20.317095
966	439	331	2015-09-10 22:17:44.676512	2015-09-10 22:17:44.676512
967	440	331	2015-09-10 22:18:37.594636	2015-09-10 22:18:37.594636
969	444	331	2015-09-10 22:19:39.316542	2015-09-10 22:19:39.316542
970	445	329	2015-09-10 22:20:30.277382	2015-09-10 22:20:30.277382
971	445	331	2015-09-10 22:20:30.281515	2015-09-10 22:20:30.281515
972	447	333	2015-09-10 22:22:23.607557	2015-09-10 22:22:23.607557
974	408	333	2015-09-10 22:25:26.360597	2015-09-10 22:25:26.360597
975	410	333	2015-09-10 22:26:38.484315	2015-09-10 22:26:38.484315
976	421	333	2015-09-10 22:26:48.973551	2015-09-10 22:26:48.973551
977	419	329	2015-09-10 22:28:43.12715	2015-09-10 22:28:43.12715
978	419	330	2015-09-10 22:28:43.132232	2015-09-10 22:28:43.132232
979	420	330	2015-09-10 22:28:47.600785	2015-09-10 22:28:47.600785
980	400	329	2015-09-10 22:30:09.381063	2015-09-10 22:30:09.381063
981	462	333	2015-09-21 23:22:17.546035	2015-09-21 23:22:17.546035
982	427	329	2015-09-21 23:23:20.633585	2015-09-21 23:23:20.633585
983	428	329	2015-09-21 23:23:25.147226	2015-09-21 23:23:25.147226
984	425	333	2015-09-21 23:23:29.438824	2015-09-21 23:23:29.438824
985	426	329	2015-09-21 23:23:33.33515	2015-09-21 23:23:33.33515
986	398	329	2015-09-21 23:23:36.822619	2015-09-21 23:23:36.822619
987	399	329	2015-09-21 23:23:43.841428	2015-09-21 23:23:43.841428
988	463	329	2015-09-21 23:27:10.703556	2015-09-21 23:27:10.703556
989	464	329	2015-09-21 23:30:02.497524	2015-09-21 23:30:02.497524
990	465	329	2015-09-21 23:33:40.37769	2015-09-21 23:33:40.37769
991	466	329	2015-09-21 23:37:19.200515	2015-09-21 23:37:19.200515
992	467	329	2015-09-21 23:51:51.998943	2015-09-21 23:51:51.998943
993	468	329	2015-09-21 23:54:32.845043	2015-09-21 23:54:32.845043
994	469	329	2015-09-21 23:56:53.947952	2015-09-21 23:56:53.947952
995	470	329	2015-09-22 00:26:46.060436	2015-09-22 00:26:46.060436
996	471	329	2015-09-22 00:29:38.862727	2015-09-22 00:29:38.862727
997	472	333	2015-09-22 00:33:54.268412	2015-09-22 00:33:54.268412
998	473	329	2015-09-22 00:42:09.006772	2015-09-22 00:42:09.006772
999	477	329	2015-09-22 01:15:27.998005	2015-09-22 01:15:27.998005
1000	478	333	2015-09-22 01:17:42.945539	2015-09-22 01:17:42.945539
1001	479	329	2015-09-22 01:20:00.763367	2015-09-22 01:20:00.763367
1002	480	333	2015-09-22 01:21:55.915287	2015-09-22 01:21:55.915287
1003	481	329	2015-09-22 01:24:28.01317	2015-09-22 01:24:28.01317
\.


--
-- Name: product_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elmirill
--

SELECT pg_catalog.setval('product_types_id_seq', 1003, true);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: elmirill
--

COPY products (id, name, description, gallery, capacity, volume, net_volume, color, var_color_price_1, var_color_price_2, var_color_price_3, var_high_price_1, var_high_price_2, var_high_price_3, var_spec_price_1, var_spec_price_2, var_spec_price_3, featured, created_at, updated_at, keywords, articul, length, width, height, "position", campaign, weight, side, bottom, static_load, dynamic_load, rack_load, inner_length, inner_width, inner_height, cover, category_id, diameter, inner_diameter, thumbnail_file_name, thumbnail_content_type, thumbnail_file_size, thumbnail_updated_at, meta, min_price, active, meta_title, meta_description) FROM stdin;
399	Паллет TR 1208-2-2	<p>Дополнительные опции:</p>\r\n\r\n<ul>\r\n\t<li>усиленный паллет (установка 2 или 3 металлических профилей);</li>\r\n\t<li>паллет на 9 ножках;</li>\r\n\t<li>паллет без бортиков;</li>\r\n\t<li>боковые заглушки;</li>\r\n\t<li>индивидуальный цвет (при заказе партии паллет от 300 штук);</li>\r\n\t<li>нанесение логотипа (литьевой логотип);</li>\r\n</ul>\r\n	\N		\N	\N	["blue", "grey", "black"]	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2015-05-07 16:48:12.895703	2016-01-03 19:39:55.992417	паллет tr 1208-2-2 паллет tr 1208-2-2 палет	\N	1200	800	155	169	\N	17.5		перфорированное, усиленное	6000	1800	1500	\N	\N	\N	f	43	\N	\N	123.jpg	image/jpeg	38781	2015-10-23 22:44:08.706782	Палет	\N	f		
479	Контейнер 1000г с крышкой	<p>Контейнер модель 1000 глухой, с&nbsp;крышкой.</p>\r\n	\N		600	\N	["blue", "green", "yellow", "grey"]	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2015-09-22 01:20:00.757611	2016-01-06 18:21:19.191346	контейнер 1000г с крышкой контейнер 1000г с крышкой 11000000016	\N	1210	1010	744	105	\N	42			700	\N	\N	1120	920	600	t	47	\N	\N	Контейнер-Модель-1000-Сплошной-С-Крышкой.jpg	image/jpeg	36988	2015-10-23 22:57:39.800521	11000000016	\N	t		
471	Контейнер 800г с верхней дверцей	<p>Контейнер модель 800 глухой, с&nbsp;верхней дверцей.</p>\r\n	\N		500	\N	["blue", "green", "yellow", "grey"]	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2015-09-22 00:29:38.856877	2016-01-06 18:23:49.193525	контейнер 800г с верхней дверцей контейнер 800г с верхней дверцей 10000010006	\N	1200	800	740	217	\N	33			700	\N	\N	1120	720	600	f	47	\N	\N	Контейнер-Модель-800-Сплошной-С-Верхней-Дверцей.jpg	image/jpeg	30799	2015-10-23 22:54:00.386012	10000010006	\N	t		
441	Ящик №3п		\N		55	\N	["blue", "red", "green", "black"]	318	302	289	437	420	402	\N	\N	\N	f	2015-09-08 18:36:24.815989	2015-12-04 03:18:49.042088	ящик №3п ящик №3п	\N	600	400	300	1	\N	1.97999999999999998			\N	\N	\N	\N	\N	\N	t	41	\N	\N	3П(2).jpg	image/jpeg	157402	2015-10-23 21:35:54.68744		289	t	\N	\N
421	Ящик 605		\N		75	\N	["blue", "red"]	478	459	440	658	632	606	\N	\N	\N	f	2015-05-07 16:48:13.513403	2015-10-23 22:27:18.649806	ящик 605 ящик 605	\N	600	400	400	37	\N	3	глухие	глухое	\N	\N	\N	305	365	395	t	41	\N	\N	135.jpg	image/jpeg	34141	2015-10-23 22:27:18.507875		440	t	\N	\N
449	Крышка №5 ПЭ		\N		\N	\N	["blue", "red", "green", "black"]	175	168	160	314	300	287	\N	\N	\N	f	2015-09-08 19:37:11.190698	2015-10-23 23:01:58.071745	крышка №5 пэ крышка №5 пэ	\N	540	400	20	41	\N	0.939999999999999947			\N	\N	\N	\N	\N	\N	f	45	\N	\N	_DSC0070.jpg	image/jpeg	73405	2015-10-23 23:01:57.888792		160	t	\N	\N
447	Ящик №16		\N		15	\N	["blue", "red", "green", "black"]	186	178	170	243	233	223	\N	\N	\N	f	2015-09-08 19:31:36.617844	2015-10-23 21:59:07.41416	ящик №16 ящик №16	\N	505	295	180	45	\N	0.800000000000000044			\N	\N	\N	\N	\N	\N	f	41	\N	\N	16(2).jpg	image/jpeg	221385	2015-10-23 21:59:06.883184		170	t	\N	\N
391	МОТ Milano		\N		12	\N	["blue", "red"]	\N	\N	\N	132	129	124	\N	\N	\N	f	2015-05-07 16:48:12.674205	2015-10-23 22:36:30.34351	мот milano мот milano мот, милано, mot	\N	350	230	150	49	\N	0.530000000000000027	глухие	глухое	\N	\N	\N	265	206	140	f	42	\N	\N	138.jpg	image/jpeg	32608	2015-10-23 22:36:30.209948	МОТ, Милано, MOT	124	t	\N	\N
417	Ящик №6 «Полипак»	<p>Ящик пластиковый глухой для транспортировки, хранения продукции в упаковке &laquo;тетрапак&raquo;, &laquo;полипак&raquo;; сыпучих продуктов; для технических и бытовых целей.</p>\r\n\r\n<p>Ящики штабелируются друг на друга в заполненном виде в несколько ярусов, оптимизируя пространство при товародвижении. Особая конструкция дна ящика, а именно выступающий кант по всему периметру ящика, даёт возможность формировать прочный штабель, который крайне устойчив к поперечному смещению. Глухое дно позволяет, в случае разрыва упаковки с продукцией, не загрязнять транспортное средство и складское помещение.</p>\r\n\r\n<p>При транспортировки пустой тары складируются &laquo;тройками&raquo;.</p>\r\n	\N		34	\N	["blue", "red", "green", "white"]	313	299	286	496	475	455	\N	\N	\N	f	2015-05-07 16:48:13.41767	2015-10-23 21:39:53.485637	ящик №6 «полипак» ящик №6 «полипак»	\N	420	340	280	53	\N	2	глухие	глухое	\N	\N	\N	395	320	270	f	41	\N	\N	6.jpg	image/jpeg	171266	2015-10-23 21:39:53.069267		286	t	\N	\N
423	Ящик 606		\N		75	\N	["blue", "red"]	484	465	446	661	635	609	\N	\N	\N	f	2015-05-07 16:48:13.573075	2015-10-23 22:28:17.02579	ящик 606 ящик 606	\N	600	400	400	57	\N	2.89999999999999991	перфорированные	глухое	\N	\N	\N	505	365	395	t	41	\N	\N	136.jpg	image/jpeg	39426	2015-10-23 22:28:16.703396		446	t	\N	\N
394	Тележка		\N		\N	\N	["blue", "red", "green"]	1541	1511	1484	\N	\N	\N	\N	\N	\N	f	2015-05-07 16:48:12.726227	2015-12-04 03:19:29.665207	тележка тележка 508	\N	627	420	175	61	\N	5.79999999999999982			\N	\N	\N	\N	\N	\N	f	45	\N	\N	cart.jpg	image/jpeg	111073	2015-10-23 23:04:08.326784	508	1484	t	\N	\N
448	Крышка №2, 3 ПЭ		\N		\N	\N	["blue", "red", "green", "black"]	203	194	186	315	303	291	\N	\N	\N	f	2015-09-08 19:34:24.759074	2015-10-23 23:01:53.951706	крышка №2, 3 пэ крышка №2, 3 пэ	\N	600	400	20	65	\N	2.10000000000000009			\N	\N	\N	\N	\N	\N	f	45	\N	\N	_DSC0070.jpg	image/jpeg	73405	2015-10-23 23:01:53.764139		186	t	\N	\N
476	Замки и петли 3		\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2015-09-22 01:05:53.468729	2015-10-23 23:07:24.320626	замки и петли 3 замки и петли 3	\N	\N	\N	\N	73	\N	\N			\N	\N	\N	\N	\N	\N	f	45	\N	\N	03locks.jpg	image/jpeg	6180	2015-10-23 23:07:24.226436		\N	t	\N	\N
443	Ящик №4 "Tetra Pak"		\N		36	\N	["blue", "red", "green", "black"]	347	332	317	472	452	432	\N	\N	\N	f	2015-09-08 18:40:56.872529	2015-12-02 13:25:14.473376	ящик №4 "tetra pak" ящик №4 "tetra pak"	\N	420	340	310	77	\N	1.64999999999999991			\N	\N	\N	\N	\N	\N	f	41	\N	\N	4(2).jpg	image/jpeg	206715	2015-10-23 21:37:05.3797		317	t		
419	Контейнер МОТ-10	<p>Контейнеры изготавливаются из ударопрочного полистирола. Предназначен для хранения мелких комплектующих изделий.</p>\r\n\r\n<p>Универсальная конструкция ящика идеально подходит для использования его для оформления витрин торговых залов, стеллажей складских помещений и т. д.</p>\r\n	\N		1	\N	["blue", "red", "green", "white"]	95	90	85	\N	\N	\N	\N	\N	\N	f	2015-05-07 16:48:13.473851	2015-10-23 22:35:16.643683	контейнер мот-10 контейнер мот-10 мот, mot	\N	240	195	80	81	\N	0.280000000000000027	глухие	глухое	\N	\N	\N	205	155	75	f	42	\N	\N	мот-10.jpg	image/jpeg	50440	2015-10-23 22:35:15.982411	МОТ, MOT	85	t	\N	\N
406	Ящик №11	<p>Ящик пластиковый глухой для транспортировки, хранения и охлаждения пищевой продукции &ndash; мясной, рыбной продукции, кисломолочной продукции, кондитерских и хлебных изделий, сыпучих продуктов.</p>\r\n\r\n<p>Ящики штабелируются друг на друга в заполненном виде в несколько ярусов, оптимизируя пространство при товародвижении. Особая конструкция дна ящика, а именно выступающий кант по всему периметру ящика, даёт возможность формировать прочный штабель, который крайне устойчив к поперечному смещению. Ящик может комплектоваться крышкой. Конструкция крышки обеспечивает возможность формировать прочный штабель при установке ящиков на крышку в несколько ярусов.</p>\r\n	\N		35	\N	["blue", "red", "green", "white"]	315	300	288	453	434	416	\N	\N	\N	f	2015-05-07 16:48:13.066437	2015-10-23 21:43:38.192458	ящик №11 ящик №11	\N	600	400	200	21	\N	1.89999999999999991	глухие	глухое	\N	\N	\N	555	355	180	t	41	\N	\N	11.jpg	image/jpeg	113034	2015-10-23 21:43:37.492298		288	t	\N	\N
477	Контейнер 1000г	<p>Контейнер модель 1000 глухой, стандартный.</p>\r\n	\N		600	\N	["blue", "green", "yellow", "grey"]	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2015-09-22 01:15:27.989994	2016-01-06 18:20:30.714943	контейнер 1000г контейнер 1000г 1100200000	\N	1200	1000	740	69	\N	38.5			700	\N	\N	1120	920	600	f	47	\N	\N	Контейнер-Модель-1000-Сплошной-Стандартный.jpg	image/jpeg	33996	2015-10-23 22:55:12.797721	1100200000	\N	t		
397	Ящик №17-1	<p>Ящик пластиковый для транспортировки, хранения и охлаждения пищевой продукции &ndash; колбасных изделий, мясной, рыбной продукции, для транспортировки и складирования непищевой продукции.</p>\r\n\r\n<p>Ящики штабелируются друг на друга в заполненном виде в несколько ярусов, оптимизируя пространство при товародвижении. Особая конструкция дна ящика, а именно выступающий кант по всему периметру ящика, даёт возможность формировать прочный штабель, который крайне устойчив к поперечному смещению.Конструктивная особенность ящика позволяет эффективно использовать его для охлаждения продукции в морозильных камерах.</p>\r\n	\N		50	\N	["blue", "red", "green", "white"]	326	316	296	492	472	452	\N	\N	\N	f	2015-05-07 16:48:12.84511	2015-10-23 22:01:54.008814	ящик №17-1 ящик №17-1	\N	600	400	250	17	\N	2.60000000000000009	перфорированные	глухое	\N	\N	\N	565	370	240	t	41	\N	\N	52.jpg	image/jpeg	216624	2015-10-23 22:01:53.76984		296	t	\N	\N
407	Ящик №12	<p>Ящик пластиковый глухой для транспортировки, хранения и охлаждения пищевой продукции &ndash; мясной, рыбной продукции, кисломолочной продукции, кондитерских и хлебных изделий, сыпучих продуктов.</p>\r\n\r\n<p>Ящики штабелируются друг на друга в заполненном виде в несколько ярусов, оптимизируя пространство при товародвижении. Особая конструкция дна ящика, а именно выступающий кант по всему периметру ящика, даёт возможность формировать прочный штабель, который крайне устойчив к поперечному смещению.</p>\r\n\r\n<p>Ящик может комплектоваться крышкой. Конструкция крышки обеспечивает возможность формировать прочный штабель при установке ящиков на крышку в несколько ярусов.</p>\r\n	\N		45	\N	["blue", "red", "green", "white"]	390	345	340	526	486	470	\N	\N	\N	f	2015-05-07 16:48:13.102069	2015-10-23 21:44:59.410645	ящик №12 ящик №12 204, арт 204	\N	600	400	250	25	\N	2.18000000000000016	глухие	глухое	\N	\N	\N	555	355	240	t	41	\N	\N	12.jpg	image/jpeg	102354	2015-10-23 21:44:58.62973	204, Арт 204	340	t	\N	\N
453	Крышка №17 ПЭ		\N		\N	\N	["blue", "red", "green", "black"]	235	225	215	328	315	301	\N	\N	\N	f	2015-09-08 19:42:10.241548	2015-10-23 23:02:20.258349	крышка №17 пэ крышка №17 пэ	\N	600	400	20	101	\N	1.14999999999999991			\N	\N	\N	\N	\N	\N	f	45	\N	\N	_DSC0070.jpg	image/jpeg	73405	2015-10-23 23:02:20.069887		215	t	\N	\N
413	Ящик №19	<p>Ящик пластиковый для транспортировки и хранения яиц в яичной ячейке, а также для хранения и транспортировки хлебной, мясной, рыбной и другой продукции.</p>\r\n\r\n<p>Ящики устойчиво штабелируются друг на друга в заполненном виде в несколько ярусов, оптимизируя пространство при товародвижении. Особая конструкция дна ящика, а именно выступающий кант по всему периметру ящика, даёт возможность формировать прочный штабель, который крайне устойчив к поперечному смещению.</p>\r\n	\N		70	\N	["blue", "red", "green", "white"]	415	397	379	576	552	528	\N	\N	\N	f	2015-05-07 16:48:13.299472	2015-12-02 13:25:18.28478	ящик №19 ящик №19 арт 301, 301	\N	660	340	365	109	\N	1.96999999999999997	перфорированные	перфорированное	\N	\N	\N	635	310	360	f	41	\N	\N	19.jpg	image/jpeg	167166	2015-10-23 22:05:28.961249	Арт 301, 301	379	t		
392	МОТ Napoli		\N		18	\N	["blue", "red"]	\N	\N	\N	172	168	162	\N	\N	\N	f	2015-05-07 16:48:12.694343	2015-12-04 08:25:48.928847	мот napoli мот napoli мот, неаполь, mot, napoli	\N	400	230	200	9	\N	0.729999999999999982	глухие	глухое	\N	\N	\N	300	206	187	f	42	\N	\N	5004_Napoli.jpg	image/jpeg	20681	2015-10-23 22:38:09.992879	МОТ, Неаполь, MOT, Napoli	162	t		
405	Ящик №7				18	\N	["blue", "white"]	\N	\N	\N	470	422	412	\N	\N	\N	f	2015-05-07 16:48:13.037186	2015-12-04 03:20:06.738107	ящик №7 ящик №7		420	420	160	113	\N	1.80000000000000004	глухие	глухое	\N	\N	\N	375	375	150	f	41	\N	\N	7(2).jpg	image/jpeg	70004	2015-10-23 21:40:59.915965		412	t	\N	\N
469	Паллет MV 1000г	<p>Паллет&nbsp;MV-1000 глухой с 3 полозьями,&nbsp;HDPE.</p>\r\n	\N		\N	\N	["blue", "grey"]	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2015-09-21 23:56:53.943822	2015-10-23 22:50:32.822235	паллет mv 1000г паллет mv 1000г 5211001110	\N	1200	1000	150	117	\N	16.5			6000	1800	600	\N	\N	\N	f	43	\N	\N	Сплошной-MV-1000-Поддон-С-3-Полозьями--Усиленный---PP.jpg	image/jpeg	15906	2015-10-23 22:50:32.636148	5211001110	\N	t	\N	\N
393	МОТ Palermo		\N		31	\N	["blue", "red"]	\N	\N	\N	258	252	243	\N	\N	\N	f	2015-05-07 16:48:12.71235	2015-10-23 22:38:45.109039	мот palermo мот palermo мот, палермо, mot	\N	500	310	200	121	\N	1.03000000000000003	глухие	глухое	\N	\N	\N	400	285	187	f	42	\N	\N	5005_Palermo.jpg	image/jpeg	20530	2015-10-23 22:38:44.897726	МОТ, Палермо, MOT	243	t	\N	\N
454	Крышка №18 ПЭ		\N		\N	\N	["blue", "red", "green", "black"]	203	195	186	278	266	255	\N	\N	\N	f	2015-09-08 19:49:22.376143	2015-10-23 23:02:25.11548	крышка №18 пэ крышка №18 пэ	\N	600	400	20	125	\N	1.14999999999999991			\N	\N	\N	\N	\N	\N	f	45	\N	\N	_DSC0070.jpg	image/jpeg	73405	2015-10-23 23:02:24.926164		186	t	\N	\N
424	Ящик 606-1		\N		52	\N	["blue", "red"]	629	604	579	855	821	788	\N	\N	\N	f	2015-05-07 16:48:13.602444	2015-10-23 22:32:24.744129	ящик 606-1 ящик 606-1	\N	600	400	315	129	\N	3.29999999999999982	глухие	глухое	\N	\N	\N	505	365	295	t	41	\N	\N	606-1.jpg	image/jpeg	101524	2015-10-23 22:32:24.516793		579	t	\N	\N
422	Ящик 605-1		\N		75	\N	["blue", "red"]	653	627	602	887	852	817	\N	\N	\N	f	2015-05-07 16:48:13.538551	2015-10-23 22:31:45.636945	ящик 605-1 ящик 605-1	\N	600	400	415	133	\N	3.79999999999999982	глухие	глухое	\N	\N	\N	505	365	395	t	41	\N	\N	605-1.jpg	image/jpeg	96349	2015-10-23 22:31:45.399381		602	t	\N	\N
459	Ящик 604-1		\N		63	\N	["blue", "red", "green", "black"]	593	570	547	809	777	746	\N	\N	\N	f	2015-09-08 21:43:38.868515	2015-10-23 22:31:19.004324	ящик 604-1 ящик 604-1	\N	600	400	365	137	\N	2.60000000000000009			\N	\N	\N	\N	\N	\N	f	41	\N	\N	604-1.jpg	image/jpeg	101133	2015-10-23 22:31:18.797899		547	t	\N	\N
412	Ящик №18	<p>Ящик пластиковый для транспортировки, хранения и охлаждения пищевой продукции &ndash; колбасных изделий, мясной, рыбной продукции, для транспортировки и складирования пищевой и непищевой продукции.</p>\r\n\r\n<p>Ящики штабелируются друг на друга в заполненном виде в несколько ярусов, оптимизируя пространство при товародвижении. Особая конструкция дна ящика, а именно выступающий кант по всему периметру ящика, даёт возможность формировать прочный штабель, который крайне устойчив к поперечному смещению.</p>\r\n	\N		35	\N	["blue", "red", "green", "white"]	325	316	295	491	471	451	\N	\N	\N	f	2015-05-07 16:48:13.271056	2015-10-23 22:04:03.499383	ящик №18 ящик №18	\N	600	400	200	141	\N	2.5	перфорированные	глухое	\N	\N	\N	560	370	175	t	41	\N	\N	18.jpg	image/jpeg	135523	2015-10-23 22:04:02.766254		295	t	\N	\N
467	Паллет MV 1000г усиленный	<p>Паллет MV&nbsp;1000 глухой&nbsp;с&nbsp;3 полозьями, усиленный, PP.</p>\r\n	\N		\N	\N	["blue", "grey"]	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2015-09-21 23:51:51.988916	2015-10-23 22:52:30.116153	паллет mv 1000г усиленный паллет mv 1000г усиленный 5211100120	\N	1200	1000	150	153	\N	25			8000	2250	1750	\N	\N	\N	f	43	\N	\N	Сплошной-MV-1000-Поддон-С-3-Полозьями-_-HDPE.jpg	image/jpeg	31416	2015-10-23 22:52:29.969856	5211100120	\N	t	\N	\N
438	Ящик №1		\N		25	\N	["blue", "red", "green", "black"]	244	234	223	352	338	323	\N	\N	\N	f	2015-09-08 18:23:40.814214	2015-12-03 11:53:08.50675	ящик №1 ящик №1	\N	600	400	180	173	\N	1.3600000000000001			\N	\N	\N	\N	\N	\N	f	41	\N	\N	1(2).jpg	image/jpeg	194752	2015-10-23 21:29:10.105554		223	t		
425	Паллет PE 400		\N		\N	\N	["blue"]	435	407	384	\N	\N	\N	\N	\N	\N	f	2015-05-07 16:48:13.62396	2015-10-23 22:41:02.450678	паллет pe 400 паллет pe 400 палет	\N	600	400	135	177	\N	1.5		перфорированное	250	250	\N	\N	\N	\N	f	43	\N	\N	PE400new432x334.jpg	image/jpeg	20342	2015-10-23 22:41:02.309036	Палет	384	t	\N	\N
402	Мусорный бак 120л		\N		120	\N	["blue", "red", "green", "white", "grey"]	\N	\N	\N	1617	1588	1560	\N	\N	\N	f	2015-05-07 16:48:12.980742	2015-10-23 23:00:03.907739	мусорный бак 120л мусорный бак 120л	\N	560	480	960	181	\N	9.5	глухие	глухое	\N	\N	\N	\N	\N	\N	f	44	\N	\N	141.jpg	image/jpeg	37366	2015-10-23 23:00:03.661596		1560	t	\N	\N
414	Ящик №22	<p>Ящик полностью перфорированный. Эта конструктивная особенность позволяет эффективно использовать ящик для охлаждения продукции в морозильных камерах.</p>\r\n\r\n<p>Наличие необходимого количества поперечных ребер жесткости на внешних поверхностях ящика обеспечивают ему прочность.</p>\r\n\r\n<p>Ящик применяется для мясной, рыбной, овощной, кисло-молочной продукции и т.д.</p>\r\n	\N		20	\N	["blue", "red", "green", "white"]	210	201	192	310	297	284	\N	\N	\N	f	2015-05-07 16:48:13.32579	2015-10-23 22:06:20.490107	ящик №22 ящик №22	\N	540	360	135	185	\N	1.12999999999999989	перфорированные	перфорированное	\N	\N	\N	510	360	135	f	41	\N	\N	22.jpg	image/jpeg	143754	2015-10-23 22:06:20.019633		192	t	\N	\N
442	Ящик №3г		\N		55	\N	["blue", "red", "green", "black"]	320	305	290	440	420	402	\N	\N	\N	f	2015-09-08 18:38:28.13848	2015-10-23 21:36:30.273546	ящик №3г ящик №3г	\N	600	400	300	193	\N	2			\N	\N	\N	\N	\N	\N	t	41	\N	\N	3.jpg	image/jpeg	111178	2015-10-23 21:36:30.037964		290	t	\N	\N
426	Паллет PE 680		\N		\N	\N	["green", "grey", "black"]	\N	\N	\N	1292	1270	1225	\N	\N	\N	f	2015-05-07 16:48:13.638044	2015-10-23 22:42:27.255807	паллет pe 680 паллет pe 680 палет	\N	800	600	150	197	\N	6.5		глухое	1000	500	\N	\N	\N	\N	f	43	\N	\N	124.jpg	image/jpeg	27149	2015-10-23 22:42:27.133084	Палет	1225	t	\N	\N
428	Паллет TR 1208-1-1		\N		\N	\N	["blue", "grey", "black"]	\N	\N	\N	3029	2962	2894	\N	\N	\N	f	2015-05-07 16:48:13.668559	2015-10-23 22:43:45.393283	паллет tr 1208-1-1 паллет tr 1208-1-1 палет	\N	1200	800	155	201	\N	17.5		глухое	6000	1800	500	\N	\N	\N	f	43	\N	\N	TR1208-1-1.jpg	image/jpeg	21430	2015-10-23 22:43:45.263299	Палет	2894	t	\N	\N
470	Контейнер 800г	<p>Контейнер модель 800&nbsp;глухой, стандартный.</p>\r\n	\N		500	\N	["blue", "green", "yellow", "grey"]	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2015-09-22 00:26:46.052438	2016-01-06 18:22:53.594812	контейнер 800г контейнер 800г 1000200000	\N	1200	800	740	157	\N	32			700	\N	\N	1120	720	600	f	47	\N	\N	Контейнер-Модель-800-Сплошной-Стандартный.jpg	image/jpeg	30972	2015-10-23 22:52:58.476763	1000200000	\N	t		
472	Контейнер 800п	<p>Контейнер модель 800 перфорированный, стандартный.</p>\r\n	\N		500	\N	["blue"]	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2015-09-22 00:33:54.260084	2016-01-06 18:23:25.087719	контейнер 800п контейнер 800п 1010200000	\N	1200	800	740	161	\N	32			700	\N	\N	1120	720	600	f	47	\N	\N	Контейнер-Модель-800-Перфорированный-Стандартный.jpg	image/jpeg	35668	2015-10-23 22:53:32.385749	1010200000	\N	t		
481	Контейнер 1000г с верхней дверцей	<p>Контейнер модель 1000 глухой, с&nbsp;верхней дверцей.</p>\r\n	\N		600	\N	["blue", "green", "yellow", "grey"]	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2015-09-22 01:24:28.006199	2016-01-06 18:23:37.333458	контейнер 1000г с верхней дверцей контейнер 1000г с верхней дверцей 11000010006	\N	1200	1000	740	189	\N	39			695	\N	\N	1120	920	600	f	47	\N	\N	Контейнер-Модель-1000-Сплошной-С-Верхней-Дверцей.jpg	image/jpeg	35041	2015-10-23 22:56:59.916007	11000010006	\N	t		
395	Ящик №15	<p>Ящик пластиковый глухой с крышкой для транспортировки, хранения и охлаждения мясной,молочной, рыбной продукции. Выступающий кант по всему периметру крышки обеспечивает возможность формировать прочный штабель при установке ящиков в заполненном виде в несколько ярусов.</p>\r\n	\N		26	\N	["blue", "red", "green", "white", "yellow"]	328	314	300	473	453	434	\N	\N	\N	f	2015-05-07 16:48:12.753174	2015-10-23 21:58:24.420149	ящик №15 ящик №15 306, арт 306	\N	600	400	140	205	\N	1.87999999999999989	глухие	глухое	\N	\N	\N	545	350	135	t	41	\N	\N	15.jpg	image/jpeg	67087	2015-10-23 21:58:23.82365	306, Арт 306	300	t	\N	\N
474	Замки и петли 1		\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2015-09-22 01:04:51.655441	2015-10-23 23:06:24.849854	замки и петли 1 замки и петли 1	\N	\N	\N	\N	213	\N	\N			\N	\N	\N	\N	\N	\N	f	45	\N	\N	01locks.jpg	image/jpeg	8509	2015-10-23 23:06:24.712023		\N	t	\N	\N
457	Ящик 602-1		\N		52	\N	["blue", "red", "green", "black"]	568	546	523	766	736	706	\N	\N	\N	f	2015-09-08 21:40:54.596265	2015-10-23 22:30:08.275772	ящик 602-1 ящик 602-1	\N	600	400	315	225	\N	2.39999999999999991			\N	\N	\N	\N	\N	\N	t	41	\N	\N	602-1.jpg	image/jpeg	106602	2015-10-23 22:30:08.059154		523	t	\N	\N
455	Крышка на бак		\N		\N	\N	\N	88	84	80	111	106	101	\N	\N	\N	f	2015-09-08 19:51:25.644251	2015-10-23 23:03:44.874548	крышка на бак крышка на бак	\N	\N	\N	\N	229	\N	0.25			\N	\N	\N	\N	\N	\N	f	45	350	\N	cover.jpg	image/jpeg	66883	2015-10-23 23:03:44.694611		80	t	\N	\N
468	Паллет MV 1000г стандартный	<p>Паллет MV&nbsp;1000 глухой с 3 полозьями, стандартный, HDPE.</p>\r\n	\N		\N	\N	["blue", "grey"]	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2015-09-21 23:54:32.834165	2015-10-23 22:51:20.917223	паллет mv 1000г стандартный паллет mv 1000г стандартный 5211100110	\N	1200	1000	150	233	\N	16.5			6000	1800	600	\N	\N	\N	f	43	\N	\N	Сплошной-MV-1000-Поддон-С-3-Полозьями--Стандартний-_-HDPE.jpg	image/jpeg	17425	2015-10-23 22:51:20.795944	5211100110	\N	t	\N	\N
465	Паллет MV 800г с противоскольжением	<p>Паллет глухой&nbsp;MV&nbsp;800 с 3 полозьями, с&nbsp;противоскольжением.</p>\r\n	\N		\N	\N	["blue", "green", "yellow", "grey"]	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2015-09-21 23:33:40.369809	2015-10-23 22:50:06.064664	паллет mv 800г с противоскольжением паллет mv 800г с противоскольжением 5210002000	\N	1200	800	150	249	\N	12.5			6000	1800	600	\N	\N	\N	f	43	\N	\N	Сплошной-MV-800-Поддон-С-3-Полозьями--С-Противо-Скольжением.jpg	image/jpeg	19684	2015-10-23 22:50:05.911255	5210002000	\N	t	\N	\N
404	Мусорный бак 240л		\N		240	\N	["blue", "red", "green", "white", "grey"]	\N	\N	\N	2053	2017	1981	\N	\N	\N	f	2015-05-07 16:48:13.014881	2015-12-03 11:58:47.692483	мусорный бак 240л мусорный бак 240л	\N	580	730	1060	253	\N	13.5	глухие	глухое	\N	\N	\N	\N	\N	\N	f	44	\N	\N	143.jpg	image/jpeg	16053	2015-10-23 23:01:04.339785		1981	t		
415	Ящик №23	<p>Ящик пластиковый для транспортировки, хранения продукции в упаковке &laquo;тетрапак&raquo;, для технических и бытовых целях.</p>\r\n\r\n<p>Ящики штабелируются друг на друга в заполненном виде в несколько ярусов, оптимизируя пространство при товародвижении. Особая конструкция дна ящика, а именно выступающий кант по всему периметру ящика, даёт возможность формировать прочный штабель, который крайне устойчив к поперечному смещению.</p>\r\n	\N		16	\N	["blue", "red", "green", "white"]	243	233	222	313	300	287	\N	\N	\N	f	2015-05-07 16:48:13.351844	2015-10-23 22:08:27.379914	ящик №23 ящик №23	\N	360	360	170	257	\N	1.09000000000000008	глухие	глухое	\N	\N	\N	360	325	165	f	41	\N	\N	60.jpg	image/jpeg	61639	2015-10-23 22:08:26.593386		222	t	\N	\N
427	Паллет TR 1208-1	<p>Дополнительные опции:</p>\r\n\r\n<ul>\r\n\t<li>усиленный паллет (установка 2 или 3 металлических профилей);</li>\r\n\t<li>паллет на 9 ножках;</li>\r\n\t<li>паллет без бортиков;</li>\r\n\t<li>боковые заглушки;</li>\r\n\t<li>индивидуальный цвет (при заказе партии паллет от 300 штук);</li>\r\n\t<li>нанесение логотипа (литьевой логотип);</li>\r\n</ul>\r\n	\N		\N	\N	["blue", "grey", "black"]	\N	\N	\N	2164	2125	2087	\N	\N	\N	f	2015-05-07 16:48:13.653751	2015-10-23 22:42:50.940972	паллет tr 1208-1 паллет tr 1208-1 палет	\N	1200	800	155	261	\N	13.3000000000000007		глухое	6000	1800	500	\N	\N	\N	f	43	\N	\N	125.jpg	image/jpeg	38630	2015-10-23 22:42:50.758794	Палет	2087	t	\N	\N
403	Мусорный бак 140л		\N		140	\N	["blue", "red", "green", "white", "grey"]	\N	\N	\N	1841	1808	1776	\N	\N	\N	f	2015-05-07 16:48:12.996527	2015-10-23 23:00:40.103606	мусорный бак 140л мусорный бак 140л	\N	560	480	1060	273	\N	11	глухие	глухое	\N	\N	\N	\N	\N	\N	f	44	\N	\N	144.jpg	image/jpeg	31871	2015-10-23 23:00:39.754553		1776	t	\N	\N
451	Крышка №15 ПЭ		\N		\N	\N	["blue", "red", "green", "black"]	207	198	261	286	274	262	\N	\N	\N	f	2015-09-08 19:39:42.439018	2015-10-23 23:02:09.965913	крышка №15 пэ крышка №15 пэ	\N	600	400	20	277	\N	1.12000000000000011			\N	\N	\N	\N	\N	\N	f	45	\N	\N	_DSC0070.jpg	image/jpeg	73405	2015-10-23 23:02:09.787334		198	t	\N	\N
439	Ящик №2п		\N		30	\N	["blue", "red", "green", "black"]	237	207	192	320	305	290	\N	\N	\N	f	2015-09-08 18:31:36.868253	2015-10-23 21:33:10.913542	ящик №2п ящик №2п арт 102	\N	600	400	200	281	\N	1.64999999999999991			\N	\N	\N	\N	\N	\N	t	41	\N	\N	2.jpg	image/jpeg	161795	2015-10-23 21:33:10.407304	Арт 102	192	t	\N	\N
450	Крышка №11, 12 ПС		\N		\N	\N	["blue", "red", "green", "black"]	244	234	224	324	310	296	\N	\N	\N	f	2015-09-08 19:38:33.143964	2015-12-03 12:05:40.623838	крышка №11, 12 пс крышка №11, 12 пс	\N	600	400	20	237	\N	\N			\N	\N	\N	\N	\N	\N	f	45	\N	\N	_DSC0070.jpg	image/jpeg	73405	2015-10-23 23:02:04.977611		224	t		
408	Ящик 601		\N		52	\N	["blue", "red"]	422	405	389	586	563	540	\N	\N	\N	f	2015-05-07 16:48:13.137316	2015-10-23 22:21:08.504223	ящик 601 ящик 601	\N	600	400	300	241	\N	2.5	глухие	глухое	\N	\N	\N	505	365	295	t	41	\N	\N	129.jpg	image/jpeg	33346	2015-10-23 22:21:08.309654		389	t	\N	\N
444	Ящик №5 (комплект)		\N		22	\N	["blue", "red", "green", "black"]	360	335	320	591	571	551	\N	\N	\N	f	2015-09-08 19:25:21.144618	2015-10-23 21:39:01.355243	ящик №5 (комплект) ящик №5 (комплект)	\N	540	400	140	245	\N	2.60000000000000009			\N	\N	\N	\N	\N	\N	t	41	\N	\N	5.jpg	image/jpeg	96828	2015-10-23 21:39:01.156497		320	t	\N	\N
475	Замки и петли 2		\N		\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2015-09-22 01:05:29.537485	2015-10-23 23:06:58.444718	замки и петли 2 замки и петли 2	\N	\N	\N	\N	269	\N	\N			\N	\N	\N	\N	\N	\N	f	45	\N	\N	02locks.jpg	image/jpeg	8436	2015-10-23 23:06:58.340301		\N	t	\N	\N
473	Контейнер 800г с нижней дверцей	<p>Контейнер модель 800 глухой, с нижней дверцей.</p>\r\n	\N		500	\N	["blue", "green", "yellow", "grey"]	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2015-09-22 00:42:09.000422	2016-01-06 18:24:06.452408	контейнер 800г с нижней дверцей контейнер 800г с нижней дверцей 10000020006	\N	1200	800	740	221	\N	33			700	\N	\N	1120	720	600	f	47	\N	\N	Контейнер-Модель-800-Сплошной-С-Нижней-Дверцей.jpg	image/jpeg	39274	2015-10-23 22:54:43.124522	10000020006	\N	t		
480	Контейнер 1000п с крышкой	<p>Контейнер модель 1000 перфорированный, с крышкой.</p>\r\n	\N		600	\N	["blue", "green", "yellow", "grey"]	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2015-09-22 01:21:55.907559	2016-01-06 18:24:25.048488	контейнер 1000п с крышкой контейнер 1000п с крышкой 11100000016	\N	1210	1010	744	265	\N	42			700	\N	\N	1120	920	600	t	47	\N	\N	Контейнер-Модель-1000-Перфорированный-С-Крышкой.jpg	image/jpeg	41095	2015-10-23 22:58:04.962942	11100000016	\N	t		
401	Корзина сетчатая	<p>Корзина многофункциональная с глухим дном.</p>\r\n\r\n<ul>\r\n\t<li>Для хранения и транспортировки рыбной продукции, овощей, фруктов, грибов, дикоросов и т.д.;</li>\r\n\t<li>Для бытовых целей;</li>\r\n\t<li>Для питомников под посадку кустарников и деревьев.</li>\r\n</ul>\r\n	\N		30	\N	\N	159	146	139	194	181	174	\N	\N	\N	f	2015-05-07 16:48:12.957188	2015-12-02 13:25:21.420258	корзина сетчатая корзина сетчатая	\N	\N	\N	300	289	\N	0.699999999999999956	перфорированные	глухое	\N	\N	\N	\N	\N	\N	f	45	450	310	64.jpg	image/jpeg	164455	2015-10-23 23:05:23.64216		139	f		
396	Ящик №17	<p>Ящик пластиковый для транспортировки, хранения и охлаждения пищевой продукции &ndash; колбасных изделий, мясной, рыбной продукции, для транспортировки и складирования непищевой продукции.</p>\r\n\r\n<p>Ящики штабелируются друг на друга в заполненном виде в несколько ярусов, оптимизируя пространство при товародвижении. Особая конструкция дна ящика, а именно выступающий кант по всему периметру ящика, даёт возможность формировать прочный штабель, который крайне устойчив к поперечному смещению.</p>\r\n	\N		50	\N	["blue", "red", "green", "white"]	347	332	312	608	558	528	\N	\N	\N	f	2015-05-07 16:48:12.806699	2015-10-23 22:00:18.624237	ящик №17 ящик №17 арт 202, 202	\N	600	400	250	293	\N	3.20000000000000018	перфорированные	глухое	\N	\N	\N	568	368	242	t	41	\N	\N	49.jpg	image/jpeg	97753	2015-10-23 22:00:17.908939	Арт 202, 202	312	t	\N	\N
409	Ящик 602		\N		52	\N	["blue", "red"]	417	400	384	546	525	503	\N	\N	\N	f	2015-05-07 16:48:13.176674	2015-10-23 22:21:58.441717	ящик 602 ящик 602	\N	600	400	300	305	\N	2.39999999999999991	перфорированные	глухое	\N	\N	\N	505	365	295	t	41	\N	\N	130.jpg	image/jpeg	38346	2015-10-23 22:21:58.153282		384	t	\N	\N
420	Контейнер МОТ-15	<p>Контейнеры изготавливаются из ударопрочного полистирола. Предназначен для хранения мелких комплектующих изделий.</p>\r\n\r\n<p>Универсальная конструкция ящика идеально подходит для использования его для оформления витрин торговых залов, стеллажей складских помещений и т.д.</p>\r\n	\N		7	\N	["blue", "red", "green", "white"]	217	207	197	259	247	236	\N	\N	\N	f	2015-05-07 16:48:13.492442	2015-10-30 15:39:50.690309	контейнер мот-15 контейнер мот-15 мот, mot	\N	380	220	170	309	\N	0.900000000000000022	глухие	глухое	\N	\N	\N	330	160	160	f	42	\N	\N	Мот-15.jpg	image/jpeg	112200	2015-10-23 22:35:57.470069	МОТ, MOT	197	t		
462	Паллет MV 800п	<p>Паллет перфорированный&nbsp;MV&nbsp;800, с&nbsp;3 полозьями, стандартный.</p>\r\n	\N		\N	\N	["blue", "green", "yellow", "grey"]	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2015-09-21 23:22:17.530294	2015-10-23 22:47:44.197122	паллет mv 800п паллет mv 800п 5210001000	\N	1200	800	150	313	\N	12.5			6000	1800	600	\N	\N	\N	f	43	\N	\N	Перфорированний-MV-800-Поддон-С-3-Полозьями--Стандартний.jpg	image/jpeg	20210	2015-10-23 22:47:44.078293	5210001000	\N	t	\N	\N
466	Паллет MV 800г усиленный	<p>Паллет MV&nbsp;800 глухой&nbsp;с&nbsp;3 полозьями, усиленный.</p>\r\n	\N		\N	\N	["blue", "green", "yellow", "grey"]	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2015-09-21 23:37:19.193836	2015-10-23 22:49:11.657385	паллет mv 800г усиленный паллет mv 800г усиленный 5210100000	\N	1200	800	150	317	\N	17			6000	1800	1500	\N	\N	\N	f	43	\N	\N	Сплошной-MV-800-Поддон-С-3-Полозьями--Усиленный.jpg	image/jpeg	19457	2015-10-23 22:49:11.52601	5210100000	\N	t	\N	\N
463	Паллет MV 800г усиленный с 9 опорами	<p>Паллет MV&nbsp;800 глухой, усиленный, с 9 опорами.</p>\r\n	\N		\N	\N	["blue", "green", "yellow", "grey"]	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2015-09-21 23:27:10.697486	2015-10-23 22:49:40.24862	паллет mv 800г усиленный с 9 опорами паллет mv 800г усиленный с 9 опорами 5210140000	\N	1200	800	150	321	\N	15.5			5000	1500	1200	\N	\N	\N	f	43	\N	\N	Сплошной-MV-800-Усиленний-Поддон-С-9-Опорами.jpg	image/jpeg	18880	2015-10-23 22:49:39.864982	5210140000	\N	t	\N	\N
460	Ящик Е2		\N		75	\N	["blue", "red", "green", "black"]	356	347	335	450	442	434	\N	\N	\N	f	2015-09-08 21:46:56.204631	2015-10-23 22:33:02.072018	ящик е2 ящик е2	\N	600	400	135	13	\N	2			\N	\N	\N	\N	\N	\N	t	41	\N	\N	Е2.jpg	image/jpeg	21759	2015-10-23 22:33:01.921258		335	t	\N	\N
400	Бак на 30 литров	<p>Бак конической формы с дисковой крышкой и двумя козырьковыми ручками производится из полиэтилена низкого давления и предназначен для транспортировки и хранения как пищевой, так и химической продукции.</p>\r\n\r\n<p>Продукция сертифицирована: Сертификат РОСС RU.AE88.H00681.</p>\r\n\r\n<p>Широкая горловина обеспечивает удобство фасовки и выгрузки продукции. Козырьковые ручки удобны для ручного перемещения тары. Усиленные стенки и дно обеспечивают прочность бака при транспортировки и эксплуатации.</p>\r\n\r\n<p>Широко применяется для упаковки продуктов лакокрасочной, нефтеперерабатывающей и пищевой промышленности.</p>\r\n\r\n<p>Крышка бака фиксируется по внутреннему замку и по наружному пазу в горловине бака. Двойная фиксация обеспечивает герметичность бака и надежность крепежа крышки при штабелировании и транспортировки.</p>\r\n	\N		30	\N	["blue", "red", "green", "white"]	302	288	275	410	393	375	\N	\N	\N	f	2015-05-07 16:48:12.932871	2015-10-23 23:03:21.500456	бак на 30 литров бак на 30 литров	\N	\N	\N	190	85	\N	1.80000000000000004	глухие	глухое	\N	\N	\N	\N	\N	\N	t	45	370	310	_DSC0065.jpg	image/jpeg	199810	2015-10-23 23:03:20.819048		275	t	\N	\N
418	Ящик №24	<p>Ящик пластиковый для транспортировки, хранения и охлаждения пищевой продукции &ndash; колбасных изделий, мясной, рыбной продукции, для транспортировки и складирования непищевой продукции.</p>\r\n\r\n<p>Ящики штабелируются друг на друга в заполненном виде в несколько ярусов, оптимизируя пространство при товародвижении. Особая конструкция дна ящика, а именно выступающий кант по всему периметру ящика, даёт возможность формировать прочный штабель, который крайне устойчив к поперечному смещению.</p>\r\n	\N		65	\N	["blue", "red", "green", "white"]	440	430	420	593	583	573	\N	\N	\N	f	2015-05-07 16:48:13.449075	2015-12-04 03:36:37.541142	ящик №24 ящик №24	\N	600	400	300	5	\N	2.75	перфорированные	глухое	\N	\N	\N	575	380	300	t	41	\N	\N	24.jpg	image/jpeg	114851	2015-10-23 22:09:14.710667		420	t	\N	\N
478	Контейнер 1000п	<p>Контейнер модель 1000 перфорированный, стандартный.</p>\r\n	\N		600	\N	["blue"]	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2015-09-22 01:17:42.939413	2016-01-06 18:24:36.289157	контейнер 1000п контейнер 1000п 1110200000	\N	1200	1000	740	301	\N	37			700	\N	\N	1120	920	600	f	47	\N	\N	Контейнер-Модель-1000-Перфорированный---Стандартный.jpg	image/jpeg	42683	2015-10-23 22:56:23.836719	1110200000	\N	t		
440	Ящик №2г		\N		30	\N	["blue", "red", "green", "black"]	253	246	242	342	335	329	\N	\N	\N	f	2015-09-08 18:33:59.599699	2015-12-04 03:21:38.413305	ящик №2г ящик №2г арт 102	\N	600	400	200	29	\N	1.64999999999999991			\N	\N	\N	\N	\N	\N	t	41	\N	\N	2Г(2).jpg	image/jpeg	89866	2015-10-23 21:34:32.951696	Арт 102	242	t	\N	\N
411	Ящик 604		\N		53	\N	["blue", "red"]	452	435	417	609	585	561	\N	\N	\N	f	2015-05-07 16:48:13.237978	2015-10-23 22:26:19.865985	ящик 604 ящик 604	\N	600	400	350	33	\N	2.60000000000000009	перфорированные	глухое	\N	\N	\N	505	365	345	t	41	\N	\N	133.jpg	image/jpeg	39507	2015-10-23 22:26:19.559857		417	t	\N	\N
458	Ящик 603-1		\N		63	\N	["blue", "red", "green", "black"]	609	585	561	831	798	765	\N	\N	\N	f	2015-09-08 21:42:24.669337	2015-10-23 22:30:45.853552	ящик 603-1 ящик 603-1	\N	600	400	365	89	\N	2.79999999999999982			\N	\N	\N	\N	\N	\N	t	41	\N	\N	603-1.jpg	image/jpeg	93245	2015-10-23 22:30:45.624928		561	t	\N	\N
410	Ящик 603		\N		63	\N	["blue", "red"]	459	441	423	628	603	578	\N	\N	\N	f	2015-05-07 16:48:13.207691	2015-10-23 22:23:03.901932	ящик 603 ящик 603	\N	600	400	350	93	\N	2.79999999999999982	глухие	глухое	\N	\N	\N	505	365	345	t	41	\N	\N	132.jpg	image/jpeg	35405	2015-10-23 22:23:03.762607		423	t	\N	\N
452	Крышка №17 ПС		\N		\N	\N	["blue", "red", "green", "black"]	\N	\N	\N	311	288	276	\N	\N	\N	f	2015-09-08 19:40:33.682495	2015-10-23 23:02:15.373684	крышка №17 пс крышка №17 пс	\N	600	400	20	97	\N	1.35000000000000009			\N	\N	\N	\N	\N	\N	f	45	\N	\N	_DSC0070.jpg	image/jpeg	73405	2015-10-23 23:02:15.184775		276	t	\N	\N
446	Ящик-корзина №10		\N		18	\N	["blue", "red", "green", "black"]	266	254	243	368	352	337	\N	\N	\N	f	2015-09-08 19:29:15.558481	2015-10-23 21:42:24.838018	ящик-корзина №10 ящик-корзина №10 арт 113	\N	600	400	130	145	\N	1.35000000000000009			\N	\N	\N	\N	\N	\N	f	41	\N	\N	10.jpg	image/jpeg	122614	2015-10-23 21:42:24.196403	Арт 113	243	t	\N	\N
464	Паллет MV 800г	<p>Паллет MV&nbsp;800 глухой&nbsp;с&nbsp;3 полозьями, стандартный.</p>\r\n	\N		\N	\N	["blue", "green", "yellow", "grey"]	\N	\N	\N	\N	\N	\N	\N	\N	\N	f	2015-09-21 23:30:02.489842	2015-10-23 22:47:15.741674	паллет mv 800г паллет mv 800г 5210000000	\N	1200	800	150	149	\N	12.5			6000	1800	600	\N	\N	\N	f	43	\N	\N	Сплошной-MV-800-Поддон-С-3-Полозьями--Стандартний.jpg	image/jpeg	19788	2015-10-23 22:47:15.617412	5210000000	\N	t	\N	\N
456	Ящик 601-1		\N		52	\N	["blue", "red", "green", "black"]	579	557	534	786	755	725	\N	\N	\N	f	2015-09-08 21:39:00.509896	2015-10-23 22:29:40.972247	ящик 601-1 ящик 601-1	\N	600	400	315	165	\N	2.5			\N	\N	\N	\N	\N	\N	t	41	\N	\N	601-1.jpg	image/jpeg	96698	2015-10-23 22:29:40.725933		534	t	\N	\N
416	Ящик №5	<p>Ящик пластиковый глухой для транспортировки, хранения и охлаждения сырково - творожной продукции, копчёностей, кондитерских изделий.</p>\r\n	\N		22	\N	["blue", "red", "green", "white"]	216	206	191	338	328	313	\N	\N	\N	f	2015-05-07 16:48:13.389968	2015-10-23 21:38:12.411801	ящик №5 ящик №5	\N	540	400	140	209	\N	1.60000000000000009	глухие	глухое	\N	\N	\N	475	350	135	t	41	\N	\N	5.jpg	image/jpeg	96828	2015-10-23 21:38:11.770879		191	t	\N	\N
398	Паллет TR 1208-2	<p>Дополнительные опции:</p>\r\n\r\n<ul>\r\n\t<li>усиленный паллет (установка 2 или 3 металлических профилей);</li>\r\n\t<li>паллет на 9 ножках;</li>\r\n\t<li>паллет без бортиков;</li>\r\n\t<li>боковые заглушки;</li>\r\n\t<li>индивидуальный цвет (при заказе партии паллет от 300 штук);</li>\r\n\t<li>нанесение логотипа (литьевой логотип);</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n	\N		\N	\N	["blue", "grey", "black"]	\N	\N	\N	2707	2617	2550	\N	\N	\N	f	2015-05-07 16:48:12.876018	2015-10-23 22:43:10.965389	паллет tr 1208-2 паллет tr 1208-2 палет	\N	1200	800	155	285	\N	13		перфорированное	6000	1800	500	\N	\N	\N	f	43	\N	\N	122.jpg	image/jpeg	38908	2015-10-23 22:43:10.846666	Палет	2550	t	\N	\N
461	Ящик 119		\N		75	\N	["blue", "red", "green", "black"]	217	212	205	265	260	255	\N	\N	\N	f	2015-09-08 21:48:31.886179	2015-10-23 22:34:00.993463	ящик 119 ящик 119	\N	600	400	415	297	\N	1.10000000000000009			\N	\N	\N	\N	\N	\N	t	41	\N	\N	119.jpg	image/jpeg	96928	2015-10-23 22:34:00.777678		205	t	\N	\N
\.


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elmirill
--

SELECT pg_catalog.setval('products_id_seq', 484, true);


--
-- Data for Name: promo_units; Type: TABLE DATA; Schema: public; Owner: elmirill
--

COPY promo_units (id, title, subtitle, link, description, promo_id, created_at, updated_at, image_file_name, image_content_type, image_file_size, image_updated_at, active) FROM stdin;
1	Складские системы MOT	От 120 рублей за штуку!	/products?filter_category=42	Складские системы для хранения мелких или сыпучих изделий: метизов, деталей, инструментов, медикаментов, продуктов питания, полиграфии.	1	2015-08-19 02:18:21.50342	2015-10-24 17:45:28.500179	MOT.png	image/png	85948	2015-10-23 23:10:16.681008	t
3	Пластиковые паллеты	Снижение цен до 20%!	/products?filter_category=43	Пластиковые паллеты (поддоны) используются на любых предприятиях, складах, торговых площадках. Разработаны для многократной эксплуатации в агрессивных средах.	1	2015-08-19 04:05:54.53358	2015-10-24 17:45:28.503063	122.png	image/png	53932	2015-10-23 23:10:16.840501	t
4	Складские системы от 115 рублей!	Скидка до 50%!	/products?filter_category=42	Складские системы для хранения мелких или сыпучих изделий: метизы, детали, инструменты, медикаменты, продукты питания, полиграфия.	1	2015-08-19 04:17:10.179658	2015-10-24 17:45:28.504946	MOT.png	image/png	85948	2015-10-23 23:10:16.924478	t
\.


--
-- Name: promo_units_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elmirill
--

SELECT pg_catalog.setval('promo_units_id_seq', 4, true);


--
-- Data for Name: promos; Type: TABLE DATA; Schema: public; Owner: elmirill
--

COPY promos (id, name, created_at, updated_at) FROM stdin;
1	default	2015-08-18 23:54:54.905543	2015-08-18 23:56:20.484065
\.


--
-- Name: promos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elmirill
--

SELECT pg_catalog.setval('promos_id_seq', 1, true);


--
-- Data for Name: related_products; Type: TABLE DATA; Schema: public; Owner: elmirill
--

COPY related_products (id, product_id, related_product_id, created_at, updated_at) FROM stdin;
1	417	434	2015-08-31 13:32:58.936002	2015-08-31 13:32:58.936002
2	417	435	2015-08-31 13:33:18.069726	2015-08-31 13:33:18.069726
3	417	436	2015-08-31 13:41:13.842094	2015-08-31 13:41:13.842094
8	417	394	2015-09-01 07:08:32.075578	2015-09-01 07:08:32.075578
9	407	437	2015-09-01 11:05:43.761933	2015-09-01 11:05:43.761933
10	407	394	2015-09-01 11:05:43.765412	2015-09-01 11:05:43.765412
11	405	394	2015-09-01 11:31:56.1969	2015-09-01 11:31:56.1969
12	395	437	2015-09-01 11:32:48.554496	2015-09-01 11:32:48.554496
13	395	394	2015-09-01 11:32:48.560471	2015-09-01 11:32:48.560471
14	396	437	2015-09-01 11:33:18.996804	2015-09-01 11:33:18.996804
15	396	394	2015-09-01 11:33:19.000657	2015-09-01 11:33:19.000657
16	397	437	2015-09-01 11:33:32.50429	2015-09-01 11:33:32.50429
17	397	394	2015-09-01 11:33:32.508622	2015-09-01 11:33:32.508622
18	406	437	2015-09-01 11:33:45.644005	2015-09-01 11:33:45.644005
19	406	394	2015-09-01 11:33:45.647064	2015-09-01 11:33:45.647064
20	408	437	2015-09-01 11:34:05.20816	2015-09-01 11:34:05.20816
21	408	394	2015-09-01 11:34:05.215148	2015-09-01 11:34:05.215148
22	409	437	2015-09-01 11:35:17.337278	2015-09-01 11:35:17.337278
23	409	394	2015-09-01 11:35:17.341403	2015-09-01 11:35:17.341403
24	410	437	2015-09-01 11:35:49.822193	2015-09-01 11:35:49.822193
25	410	394	2015-09-01 11:35:49.82718	2015-09-01 11:35:49.82718
26	411	437	2015-09-01 11:35:57.991297	2015-09-01 11:35:57.991297
27	411	394	2015-09-01 11:35:57.997405	2015-09-01 11:35:57.997405
28	412	437	2015-09-01 11:36:07.47025	2015-09-01 11:36:07.47025
29	412	394	2015-09-01 11:36:07.474365	2015-09-01 11:36:07.474365
30	413	394	2015-09-01 11:38:30.476072	2015-09-01 11:38:30.476072
31	416	437	2015-09-01 11:38:38.280996	2015-09-01 11:38:38.280996
32	416	394	2015-09-01 11:38:38.288235	2015-09-01 11:38:38.288235
33	414	394	2015-09-01 11:38:56.432622	2015-09-01 11:38:56.432622
34	415	394	2015-09-01 11:39:02.179327	2015-09-01 11:39:02.179327
35	422	394	2015-09-01 11:39:37.543974	2015-09-01 11:39:37.543974
36	424	394	2015-09-01 11:39:50.725483	2015-09-01 11:39:50.725483
37	421	437	2015-09-01 11:39:59.29521	2015-09-01 11:39:59.29521
38	421	394	2015-09-01 11:39:59.301251	2015-09-01 11:39:59.301251
39	423	437	2015-09-01 11:40:07.611769	2015-09-01 11:40:07.611769
40	423	394	2015-09-01 11:40:07.616182	2015-09-01 11:40:07.616182
41	418	437	2015-09-01 11:40:24.140965	2015-09-01 11:40:24.140965
42	418	394	2015-09-01 11:40:24.143466	2015-09-01 11:40:24.143466
45	438	394	2015-09-08 18:23:40.862694	2015-09-08 18:23:40.862694
46	439	437	2015-09-08 18:31:36.872179	2015-09-08 18:31:36.872179
47	439	394	2015-09-08 18:31:36.874745	2015-09-08 18:31:36.874745
48	440	437	2015-09-08 18:34:16.110833	2015-09-08 18:34:16.110833
49	440	394	2015-09-08 18:34:16.113909	2015-09-08 18:34:16.113909
50	441	437	2015-09-08 18:36:24.82374	2015-09-08 18:36:24.82374
51	441	394	2015-09-08 18:36:24.833393	2015-09-08 18:36:24.833393
52	442	437	2015-09-08 18:38:28.145652	2015-09-08 18:38:28.145652
53	442	394	2015-09-08 18:38:28.150526	2015-09-08 18:38:28.150526
54	443	394	2015-09-08 18:40:56.877272	2015-09-08 18:40:56.877272
55	444	437	2015-09-08 19:25:21.148631	2015-09-08 19:25:21.148631
56	444	394	2015-09-08 19:25:21.150602	2015-09-08 19:25:21.150602
57	445	394	2015-09-08 19:27:35.463996	2015-09-08 19:27:35.463996
58	446	394	2015-09-08 19:29:15.563716	2015-09-08 19:29:15.563716
59	447	394	2015-09-08 19:31:36.62145	2015-09-08 19:31:36.62145
60	439	448	2015-09-08 21:19:35.823743	2015-09-08 21:19:35.823743
61	440	448	2015-09-08 21:20:57.50165	2015-09-08 21:20:57.50165
62	396	452	2015-09-08 21:21:41.251435	2015-09-08 21:21:41.251435
63	396	453	2015-09-08 21:21:41.255004	2015-09-08 21:21:41.255004
64	407	450	2015-09-08 21:22:20.879444	2015-09-08 21:22:20.879444
65	442	448	2015-09-08 21:26:39.384927	2015-09-08 21:26:39.384927
66	441	448	2015-09-08 21:27:01.751716	2015-09-08 21:27:01.751716
67	416	449	2015-09-08 21:27:31.744636	2015-09-08 21:27:31.744636
68	444	449	2015-09-08 21:27:44.604514	2015-09-08 21:27:44.604514
69	406	450	2015-09-08 21:28:21.128304	2015-09-08 21:28:21.128304
70	395	451	2015-09-08 21:28:54.518119	2015-09-08 21:28:54.518119
71	397	452	2015-09-08 21:30:24.059572	2015-09-08 21:30:24.059572
72	397	453	2015-09-08 21:30:24.065849	2015-09-08 21:30:24.065849
73	412	454	2015-09-08 21:30:54.179776	2015-09-08 21:30:54.179776
74	400	455	2015-09-08 21:31:16.696282	2015-09-08 21:31:16.696282
75	456	394	2015-09-08 21:39:00.521497	2015-09-08 21:39:00.521497
76	457	394	2015-09-08 21:40:54.613171	2015-09-08 21:40:54.613171
77	458	394	2015-09-08 21:42:24.677932	2015-09-08 21:42:24.677932
78	459	394	2015-09-08 21:43:38.878278	2015-09-08 21:43:38.878278
79	460	394	2015-09-08 21:46:56.219052	2015-09-08 21:46:56.219052
80	461	394	2015-09-08 21:48:31.894543	2015-09-08 21:48:31.894543
\.


--
-- Name: related_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elmirill
--

SELECT pg_catalog.setval('related_products_id_seq', 80, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: elmirill
--

COPY schema_migrations (version) FROM stdin;
20150220125041
20150219200446
20150220115758
20150221182236
20150314154645
20150314160255
20150314174708
20150315071413
20150315072131
20150315102510
20150315102917
20150315103447
20150315103919
20150315105119
20150315111428
20150315112354
20150315152251
20150316071948
20150316072200
20150412124409
20150412125454
20150412132821
20150412133624
20150413050755
20150413051141
20150413052419
20150413052756
20150415165251
20150506093346
20150805221635
20150806010236
20150806063826
20150806064935
20150806164940
20150818234012
20150818234202
20150818234301
20150819014931
20150831124735
20150906185846
20150916215951
20150916221006
20150918200638
20150919231231
20150920235216
20150921001345
20150922204644
20150922222801
20150922222902
20150923071806
20151004094122
20151004094932
20151006163136
20151007194407
20151008120502
20151014173031
20151014191059
20151016010611
20151030052500
20151030142317
20151030142506
20151031064957
20151031065014
20151031075554
20151031080101
20151031094347
20151101081808
20151204034018
20151204082951
20160106164927
20160106165327
20160106165602
\.


--
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: elmirill
--

COPY types (id, name, created_at, updated_at) FROM stdin;
329	Глухие	2015-05-07 16:48:12.411949	2015-05-07 16:48:12.411949
330	Штабелируемые	2015-05-07 16:48:12.417971	2015-05-07 16:48:12.417971
331	Вкладываемые	2015-05-07 16:48:12.420496	2015-05-07 16:48:12.420496
333	Перфорированные	2015-05-07 16:48:12.428478	2015-05-07 16:48:12.428478
334	Крышки	2015-05-07 16:48:12.431231	2015-05-07 16:48:12.431231
\.


--
-- Name: types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: elmirill
--

SELECT pg_catalog.setval('types_id_seq', 334, true);


--
-- Name: admins_pkey; Type: CONSTRAINT; Schema: public; Owner: elmirill; Tablespace: 
--

ALTER TABLE ONLY admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: applications_pkey; Type: CONSTRAINT; Schema: public; Owner: elmirill; Tablespace: 
--

ALTER TABLE ONLY applications
    ADD CONSTRAINT applications_pkey PRIMARY KEY (id);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: elmirill; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: comparison_items_pkey; Type: CONSTRAINT; Schema: public; Owner: elmirill; Tablespace: 
--

ALTER TABLE ONLY comparison_items
    ADD CONSTRAINT comparison_items_pkey PRIMARY KEY (id);


--
-- Name: comparisons_pkey; Type: CONSTRAINT; Schema: public; Owner: elmirill; Tablespace: 
--

ALTER TABLE ONLY comparisons
    ADD CONSTRAINT comparisons_pkey PRIMARY KEY (id);


--
-- Name: contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: elmirill; Tablespace: 
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: core_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: elmirill; Tablespace: 
--

ALTER TABLE ONLY core_settings
    ADD CONSTRAINT core_settings_pkey PRIMARY KEY (id);


--
-- Name: order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: elmirill; Tablespace: 
--

ALTER TABLE ONLY order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: elmirill; Tablespace: 
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: pages_pkey; Type: CONSTRAINT; Schema: public; Owner: elmirill; Tablespace: 
--

ALTER TABLE ONLY pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: price_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: elmirill; Tablespace: 
--

ALTER TABLE ONLY price_lists
    ADD CONSTRAINT price_lists_pkey PRIMARY KEY (id);


--
-- Name: product_photos_pkey; Type: CONSTRAINT; Schema: public; Owner: elmirill; Tablespace: 
--

ALTER TABLE ONLY product_photos
    ADD CONSTRAINT product_photos_pkey PRIMARY KEY (id);


--
-- Name: product_types_pkey; Type: CONSTRAINT; Schema: public; Owner: elmirill; Tablespace: 
--

ALTER TABLE ONLY product_types
    ADD CONSTRAINT product_types_pkey PRIMARY KEY (id);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: elmirill; Tablespace: 
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: promo_units_pkey; Type: CONSTRAINT; Schema: public; Owner: elmirill; Tablespace: 
--

ALTER TABLE ONLY promo_units
    ADD CONSTRAINT promo_units_pkey PRIMARY KEY (id);


--
-- Name: promos_pkey; Type: CONSTRAINT; Schema: public; Owner: elmirill; Tablespace: 
--

ALTER TABLE ONLY promos
    ADD CONSTRAINT promos_pkey PRIMARY KEY (id);


--
-- Name: related_products_pkey; Type: CONSTRAINT; Schema: public; Owner: elmirill; Tablespace: 
--

ALTER TABLE ONLY related_products
    ADD CONSTRAINT related_products_pkey PRIMARY KEY (id);


--
-- Name: types_pkey; Type: CONSTRAINT; Schema: public; Owner: elmirill; Tablespace: 
--

ALTER TABLE ONLY types
    ADD CONSTRAINT types_pkey PRIMARY KEY (id);


--
-- Name: index_admins_on_confirmation_token; Type: INDEX; Schema: public; Owner: elmirill; Tablespace: 
--

CREATE UNIQUE INDEX index_admins_on_confirmation_token ON admins USING btree (confirmation_token);


--
-- Name: index_admins_on_email; Type: INDEX; Schema: public; Owner: elmirill; Tablespace: 
--

CREATE UNIQUE INDEX index_admins_on_email ON admins USING btree (email);


--
-- Name: index_admins_on_reset_password_token; Type: INDEX; Schema: public; Owner: elmirill; Tablespace: 
--

CREATE UNIQUE INDEX index_admins_on_reset_password_token ON admins USING btree (reset_password_token);


--
-- Name: index_comparison_items_on_comparison_id; Type: INDEX; Schema: public; Owner: elmirill; Tablespace: 
--

CREATE INDEX index_comparison_items_on_comparison_id ON comparison_items USING btree (comparison_id);


--
-- Name: index_comparison_items_on_product_id; Type: INDEX; Schema: public; Owner: elmirill; Tablespace: 
--

CREATE INDEX index_comparison_items_on_product_id ON comparison_items USING btree (product_id);


--
-- Name: index_order_items_on_order_id; Type: INDEX; Schema: public; Owner: elmirill; Tablespace: 
--

CREATE INDEX index_order_items_on_order_id ON order_items USING btree (order_id);


--
-- Name: index_order_items_on_product_id; Type: INDEX; Schema: public; Owner: elmirill; Tablespace: 
--

CREATE INDEX index_order_items_on_product_id ON order_items USING btree (product_id);


--
-- Name: index_product_photos_on_product_id; Type: INDEX; Schema: public; Owner: elmirill; Tablespace: 
--

CREATE INDEX index_product_photos_on_product_id ON product_photos USING btree (product_id);


--
-- Name: index_product_types_on_product_id; Type: INDEX; Schema: public; Owner: elmirill; Tablespace: 
--

CREATE INDEX index_product_types_on_product_id ON product_types USING btree (product_id);


--
-- Name: index_product_types_on_type_id; Type: INDEX; Schema: public; Owner: elmirill; Tablespace: 
--

CREATE INDEX index_product_types_on_type_id ON product_types USING btree (type_id);


--
-- Name: index_products_on_category_id; Type: INDEX; Schema: public; Owner: elmirill; Tablespace: 
--

CREATE INDEX index_products_on_category_id ON products USING btree (category_id);


--
-- Name: index_promo_units_on_promo_id; Type: INDEX; Schema: public; Owner: elmirill; Tablespace: 
--

CREATE INDEX index_promo_units_on_promo_id ON promo_units USING btree (promo_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: elmirill; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_43745530e1; Type: FK CONSTRAINT; Schema: public; Owner: elmirill
--

ALTER TABLE ONLY promo_units
    ADD CONSTRAINT fk_rails_43745530e1 FOREIGN KEY (promo_id) REFERENCES promos(id);


--
-- Name: fk_rails_63a7da531c; Type: FK CONSTRAINT; Schema: public; Owner: elmirill
--

ALTER TABLE ONLY order_items
    ADD CONSTRAINT fk_rails_63a7da531c FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: fk_rails_6f39656019; Type: FK CONSTRAINT; Schema: public; Owner: elmirill
--

ALTER TABLE ONLY order_items
    ADD CONSTRAINT fk_rails_6f39656019 FOREIGN KEY (order_id) REFERENCES orders(id);


--
-- Name: fk_rails_c431b8799e; Type: FK CONSTRAINT; Schema: public; Owner: elmirill
--

ALTER TABLE ONLY comparison_items
    ADD CONSTRAINT fk_rails_c431b8799e FOREIGN KEY (comparison_id) REFERENCES comparisons(id);


--
-- Name: fk_rails_ce0609e35f; Type: FK CONSTRAINT; Schema: public; Owner: elmirill
--

ALTER TABLE ONLY product_photos
    ADD CONSTRAINT fk_rails_ce0609e35f FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: fk_rails_ea631306cb; Type: FK CONSTRAINT; Schema: public; Owner: elmirill
--

ALTER TABLE ONLY comparison_items
    ADD CONSTRAINT fk_rails_ea631306cb FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

