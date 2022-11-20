--
-- PostgreSQL database cluster dump
--

-- Started on 2022-11-20 10:16:55

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE evaluaciones;
ALTER ROLE evaluaciones WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:Mn78FYWxOUhCOHGDYqlXkw==$dhT5cKMLdJLBM5xLAjW6mJLLUWbUOqXkw8OSBzRLVnY=:hCP5ir7Whbr+1GINyfPuHSyLfJuBlOzhMt5EJNTbnSc=';






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2022-11-20 10:16:55

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

-- Completed on 2022-11-20 10:16:55

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2022-11-20 10:16:55

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
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 3359 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 24577)
-- Name: Usuario; Type: TABLE; Schema: public; Owner: evaluaciones
--

CREATE TABLE public."Usuario" (
    id uuid NOT NULL,
    nombre character varying(200) NOT NULL,
    apellido character varying(200),
    "correo " character varying(1000) NOT NULL,
    c_postal character varying(10),
    telefono character varying(200),
    ciudad character varying(20),
    direccion character varying(300),
    "contraseña" character varying(200)
);


ALTER TABLE public."Usuario" OWNER TO evaluaciones;

--
-- TOC entry 211 (class 1259 OID 32794)
-- Name: orden; Type: TABLE; Schema: public; Owner: evaluaciones
--

CREATE TABLE public.orden (
    id uuid NOT NULL,
    usuario_id uuid NOT NULL,
    monto character varying(200) NOT NULL,
    direccion character varying(200) NOT NULL,
    fecha date
);


ALTER TABLE public.orden OWNER TO evaluaciones;

--
-- TOC entry 212 (class 1259 OID 32804)
-- Name: orden_producto; Type: TABLE; Schema: public; Owner: evaluaciones
--

CREATE TABLE public.orden_producto (
    id uuid NOT NULL,
    orden_id uuid NOT NULL,
    productos_id uuid NOT NULL
);


ALTER TABLE public.orden_producto OWNER TO evaluaciones;

--
-- TOC entry 214 (class 1259 OID 32833)
-- Name: pcarmado; Type: TABLE; Schema: public; Owner: evaluaciones
--

CREATE TABLE public.pcarmado (
    id uuid NOT NULL,
    nombre character varying(200) NOT NULL,
    descripcion character varying(200) NOT NULL
);


ALTER TABLE public.pcarmado OWNER TO evaluaciones;

--
-- TOC entry 213 (class 1259 OID 32821)
-- Name: pcarmado_producto; Type: TABLE; Schema: public; Owner: evaluaciones
--

CREATE TABLE public.pcarmado_producto (
    id uuid NOT NULL,
    pcarmado_id uuid NOT NULL,
    productos_id uuid NOT NULL
);


ALTER TABLE public.pcarmado_producto OWNER TO evaluaciones;

--
-- TOC entry 217 (class 1259 OID 32867)
-- Name: producto; Type: TABLE; Schema: public; Owner: evaluaciones
--

CREATE TABLE public.producto (
    id uuid NOT NULL,
    nombre character varying(200) NOT NULL,
    precio integer NOT NULL,
    categoria character varying(200) NOT NULL,
    descripcion character varying(200)
);


ALTER TABLE public.producto OWNER TO evaluaciones;

--
-- TOC entry 215 (class 1259 OID 32838)
-- Name: reporte; Type: TABLE; Schema: public; Owner: evaluaciones
--

CREATE TABLE public.reporte (
    "id " uuid NOT NULL,
    usuario_id uuid NOT NULL,
    correo character varying(200) NOT NULL,
    nombre character varying(200) NOT NULL,
    telefono character varying(200) NOT NULL,
    asunto character varying(200) NOT NULL,
    descripcion character varying(200) NOT NULL
);


ALTER TABLE public.reporte OWNER TO evaluaciones;

--
-- TOC entry 216 (class 1259 OID 32850)
-- Name: reseña; Type: TABLE; Schema: public; Owner: evaluaciones
--

CREATE TABLE public."reseña" (
    id uuid NOT NULL,
    usuario_id uuid NOT NULL,
    puntaje character varying(200) NOT NULL,
    comentario character varying(200) NOT NULL,
    video character varying(200) NOT NULL,
    link character varying(200) NOT NULL,
    "tipo_reseña" character varying(200) NOT NULL
);


ALTER TABLE public."reseña" OWNER TO evaluaciones;

--
-- TOC entry 3193 (class 2606 OID 24581)
-- Name: Usuario carreras_pkey; Type: CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT carreras_pkey PRIMARY KEY (id);


--
-- TOC entry 3195 (class 2606 OID 32798)
-- Name: orden orden_pkey; Type: CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.orden
    ADD CONSTRAINT orden_pkey PRIMARY KEY (id);


--
-- TOC entry 3197 (class 2606 OID 32808)
-- Name: orden_producto orden_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.orden_producto
    ADD CONSTRAINT orden_producto_pkey PRIMARY KEY (id);


--
-- TOC entry 3201 (class 2606 OID 32837)
-- Name: pcarmado pcarmado_pkey; Type: CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.pcarmado
    ADD CONSTRAINT pcarmado_pkey PRIMARY KEY (id);


--
-- TOC entry 3199 (class 2606 OID 32825)
-- Name: pcarmado_producto pcarmado_producto_pkey; Type: CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.pcarmado_producto
    ADD CONSTRAINT pcarmado_producto_pkey PRIMARY KEY (id);


--
-- TOC entry 3207 (class 2606 OID 32871)
-- Name: producto producto_pkey; Type: CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id);


--
-- TOC entry 3203 (class 2606 OID 32844)
-- Name: reporte reporte_pkey; Type: CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.reporte
    ADD CONSTRAINT reporte_pkey PRIMARY KEY ("id ");


--
-- TOC entry 3205 (class 2606 OID 32856)
-- Name: reseña reseña_pkey; Type: CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT "reseña_pkey" PRIMARY KEY (id);


--
-- TOC entry 3209 (class 2606 OID 32809)
-- Name: orden_producto orden_producto_orden_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.orden_producto
    ADD CONSTRAINT orden_producto_orden_id_fkey FOREIGN KEY (orden_id) REFERENCES public.orden(id) NOT VALID;


--
-- TOC entry 3210 (class 2606 OID 32872)
-- Name: orden_producto orden_producto_productos_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.orden_producto
    ADD CONSTRAINT orden_producto_productos_id_fkey FOREIGN KEY (productos_id) REFERENCES public.producto(id) NOT VALID;


--
-- TOC entry 3208 (class 2606 OID 32799)
-- Name: orden orden_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.orden
    ADD CONSTRAINT orden_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public."Usuario"(id) NOT VALID;


--
-- TOC entry 3211 (class 2606 OID 32862)
-- Name: pcarmado_producto pcarmado_producto_pcarmado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.pcarmado_producto
    ADD CONSTRAINT pcarmado_producto_pcarmado_id_fkey FOREIGN KEY (pcarmado_id) REFERENCES public.pcarmado(id) NOT VALID;


--
-- TOC entry 3212 (class 2606 OID 32877)
-- Name: pcarmado_producto pcarmado_producto_productos_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.pcarmado_producto
    ADD CONSTRAINT pcarmado_producto_productos_id_fkey FOREIGN KEY (productos_id) REFERENCES public.producto(id) NOT VALID;


--
-- TOC entry 3213 (class 2606 OID 32845)
-- Name: reporte reporte_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public.reporte
    ADD CONSTRAINT reporte_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public."Usuario"(id);


--
-- TOC entry 3214 (class 2606 OID 32857)
-- Name: reseña reseña_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evaluaciones
--

ALTER TABLE ONLY public."reseña"
    ADD CONSTRAINT "reseña_usuario_id_fkey" FOREIGN KEY (usuario_id) REFERENCES public."Usuario"(id) NOT VALID;


-- Completed on 2022-11-20 10:16:56

--
-- PostgreSQL database dump complete
--

-- Completed on 2022-11-20 10:16:56

--
-- PostgreSQL database cluster dump complete
--

