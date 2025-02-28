PGDMP                       }            menu    17.2    17.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16388    menu    DATABASE     {   CREATE DATABASE menu WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Argentina.utf8';
    DROP DATABASE menu;
                     postgres    false            �           0    0    menu    DATABASE PROPERTIES     4   ALTER DATABASE menu SET compute_query_id TO 'auto';
                          postgres    false            �            1259    16443    category    TABLE     Z   CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(50)
);
    DROP TABLE public.category;
       public         heap r       postgres    false            �            1259    16442    category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public               postgres    false    218            �           0    0    category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;
          public               postgres    false    217            �            1259    24593    dish    TABLE     �   CREATE TABLE public.dish (
    id integer NOT NULL,
    name character varying(100),
    description character varying(200),
    price numeric(10,2),
    category_id integer,
    image text
);
    DROP TABLE public.dish;
       public         heap r       postgres    false            �            1259    24592    dish_id_seq    SEQUENCE     �   CREATE SEQUENCE public.dish_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.dish_id_seq;
       public               postgres    false    220            �           0    0    dish_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.dish_id_seq OWNED BY public.dish.id;
          public               postgres    false    219            &           2604    16446    category id    DEFAULT     j   ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 :   ALTER TABLE public.category ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    218    217    218            '           2604    24596    dish id    DEFAULT     b   ALTER TABLE ONLY public.dish ALTER COLUMN id SET DEFAULT nextval('public.dish_id_seq'::regclass);
 6   ALTER TABLE public.dish ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    219    220    220            �          0    16443    category 
   TABLE DATA           ,   COPY public.category (id, name) FROM stdin;
    public               postgres    false    218   |       �          0    24593    dish 
   TABLE DATA           P   COPY public.dish (id, name, description, price, category_id, image) FROM stdin;
    public               postgres    false    220   �       �           0    0    category_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.category_id_seq', 3, true);
          public               postgres    false    217            �           0    0    dish_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.dish_id_seq', 1, true);
          public               postgres    false    219            )           2606    16450    category category_name_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_name_key UNIQUE (name);
 D   ALTER TABLE ONLY public.category DROP CONSTRAINT category_name_key;
       public                 postgres    false    218            +           2606    16448    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public                 postgres    false    218            -           2606    24602    dish dish_name_key 
   CONSTRAINT     M   ALTER TABLE ONLY public.dish
    ADD CONSTRAINT dish_name_key UNIQUE (name);
 <   ALTER TABLE ONLY public.dish DROP CONSTRAINT dish_name_key;
       public                 postgres    false    220            /           2606    24600    dish dish_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.dish
    ADD CONSTRAINT dish_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.dish DROP CONSTRAINT dish_pkey;
       public                 postgres    false    220            0           2606    24603    dish dish_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.dish
    ADD CONSTRAINT dish_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(id);
 D   ALTER TABLE ONLY public.dish DROP CONSTRAINT dish_category_id_fkey;
       public               postgres    false    4651    220    218            �   1   x�3�LI-.N-*�2��M��SH�/-*N�2�L,(H-ɬJ-����� ��      �   O   x���	�  �w2E����	���A�
Q��]�zz�|L� �2S��O�=��'S�&/�*�k�V� xw{� >"��S'     