PGDMP      7                 }            Atelier    17.2    17.2 %    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16387    Atelier    DATABASE     }   CREATE DATABASE "Atelier" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "Atelier";
                     postgres    false            �            1259    16417    clients    TABLE     �   CREATE TABLE public.clients (
    id integer NOT NULL,
    fio character varying(200) NOT NULL,
    phone character varying(20) NOT NULL,
    specialist_id integer NOT NULL
);
    DROP TABLE public.clients;
       public         heap r       postgres    false            �            1259    16416    clients_id_seq    SEQUENCE     �   CREATE SEQUENCE public.clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.clients_id_seq;
       public               postgres    false    222            �           0    0    clients_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;
          public               postgres    false    221            �            1259    16431    orders    TABLE     �  CREATE TABLE public.orders (
    id integer NOT NULL,
    client_id integer NOT NULL,
    specialist_id integer NOT NULL,
    start_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone,
    status character varying(50),
    CONSTRAINT orders_status_check CHECK (((status)::text = ANY ((ARRAY['in_progress'::character varying, 'completed'::character varying])::text[])))
);
    DROP TABLE public.orders;
       public         heap r       postgres    false            �            1259    16430    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public               postgres    false    224            �           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public               postgres    false    223            �            1259    16405    specialists    TABLE     �   CREATE TABLE public.specialists (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    workshop_id integer NOT NULL
);
    DROP TABLE public.specialists;
       public         heap r       postgres    false            �            1259    16404    specialists_id_seq    SEQUENCE     �   CREATE SEQUENCE public.specialists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.specialists_id_seq;
       public               postgres    false    220            �           0    0    specialists_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.specialists_id_seq OWNED BY public.specialists.id;
          public               postgres    false    219            �            1259    16398 	   workshops    TABLE     e   CREATE TABLE public.workshops (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);
    DROP TABLE public.workshops;
       public         heap r       postgres    false            �            1259    16397    workshops_id_seq    SEQUENCE     �   CREATE SEQUENCE public.workshops_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.workshops_id_seq;
       public               postgres    false    218            �           0    0    workshops_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.workshops_id_seq OWNED BY public.workshops.id;
          public               postgres    false    217            2           2604    16420 
   clients id    DEFAULT     h   ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);
 9   ALTER TABLE public.clients ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    221    222    222            3           2604    16434 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    224    223    224            1           2604    16408    specialists id    DEFAULT     p   ALTER TABLE ONLY public.specialists ALTER COLUMN id SET DEFAULT nextval('public.specialists_id_seq'::regclass);
 =   ALTER TABLE public.specialists ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    219    220    220            0           2604    16401    workshops id    DEFAULT     l   ALTER TABLE ONLY public.workshops ALTER COLUMN id SET DEFAULT nextval('public.workshops_id_seq'::regclass);
 ;   ALTER TABLE public.workshops ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    217    218    218            �          0    16417    clients 
   TABLE DATA           @   COPY public.clients (id, fio, phone, specialist_id) FROM stdin;
    public               postgres    false    222   *       �          0    16431    orders 
   TABLE DATA           \   COPY public.orders (id, client_id, specialist_id, start_date, end_date, status) FROM stdin;
    public               postgres    false    224   ,*       �          0    16405    specialists 
   TABLE DATA           <   COPY public.specialists (id, name, workshop_id) FROM stdin;
    public               postgres    false    220   I*       �          0    16398 	   workshops 
   TABLE DATA           -   COPY public.workshops (id, name) FROM stdin;
    public               postgres    false    218   �*       �           0    0    clients_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.clients_id_seq', 1, false);
          public               postgres    false    221            �           0    0    orders_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.orders_id_seq', 1, false);
          public               postgres    false    223            �           0    0    specialists_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.specialists_id_seq', 6, true);
          public               postgres    false    219            �           0    0    workshops_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.workshops_id_seq', 2, true);
          public               postgres    false    217            :           2606    16424    clients clients_phone_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_phone_key UNIQUE (phone);
 C   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_phone_key;
       public                 postgres    false    222            <           2606    16422    clients clients_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_pkey;
       public                 postgres    false    222            >           2606    16437    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public                 postgres    false    224            8           2606    16410    specialists specialists_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.specialists
    ADD CONSTRAINT specialists_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.specialists DROP CONSTRAINT specialists_pkey;
       public                 postgres    false    220            6           2606    16403    workshops workshops_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.workshops
    ADD CONSTRAINT workshops_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.workshops DROP CONSTRAINT workshops_pkey;
       public                 postgres    false    218            @           2606    16425 "   clients clients_specialist_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_specialist_id_fkey FOREIGN KEY (specialist_id) REFERENCES public.specialists(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_specialist_id_fkey;
       public               postgres    false    4664    222    220            A           2606    16438    orders orders_client_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(id);
 F   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_client_id_fkey;
       public               postgres    false    222    4668    224            B           2606    16443     orders orders_specialist_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_specialist_id_fkey FOREIGN KEY (specialist_id) REFERENCES public.specialists(id);
 J   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_specialist_id_fkey;
       public               postgres    false    220    4664    224            ?           2606    16411 (   specialists specialists_workshop_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.specialists
    ADD CONSTRAINT specialists_workshop_id_fkey FOREIGN KEY (workshop_id) REFERENCES public.workshops(id) ON DELETE RESTRICT;
 R   ALTER TABLE ONLY public.specialists DROP CONSTRAINT specialists_workshop_id_fkey;
       public               postgres    false    218    220    4662            �      x������ � �      �      x������ � �      �   }   x�M�K
�P��q��� ��c5.F�8(E7 "^t�v�ݑI�� ��Ij��ƕ�!vEcMjM\Ve���؅L�3O�?�۰�Ж5����O��t�L�����I�﫝�UsY��� ��\3      �   7   x�3估�®.콰�¦��v*\l���b+��9 ƅ}61\<F��� �� 9     