# import des données BNVD
ara = read.csv("BNVD_2017/BNVD_2018_ACHAT_CP_PRODUIT_AUVERGNE-RHONE-ALPES_2017.csv", sep=";")
bfc = read.csv("BNVD_2017/BNVD_2018_ACHAT_CP_PRODUIT_BOURGOGNE-FRANCHE-COMTE_2017.csv", sep=";")
bzh = read.csv("BNVD_2017/BNVD_2018_ACHAT_CP_PRODUIT_BRETAGNE_2017.csv", sep=";")
cvl = read.csv("BNVD_2017/BNVD_2018_ACHAT_CP_PRODUIT_CENTRE-VAL DE LOIRE_2017.csv", sep=";")
corse = read.csv("BNVD_2017/BNVD_2018_ACHAT_CP_PRODUIT_CORSE_2017.csv", sep=";")
grand_est = read.csv("BNVD_2017/BNVD_2018_ACHAT_CP_PRODUIT_GRAND EST_2017.csv", sep=";")
guadeloupe = read.csv("BNVD_2017/BNVD_2018_ACHAT_CP_PRODUIT_GUADELOUPE_2017.csv", sep=";")
guyane = read.csv("BNVD_2017/BNVD_2018_ACHAT_CP_PRODUIT_GUYANE_2017.csv", sep = ";")
hdf = read.csv("BNVD_2017/BNVD_2018_ACHAT_CP_PRODUIT_HAUTS-DE-FRANCE_2017.csv", sep = ";")
idf = read.csv("BNVD_2017/BNVD_2018_ACHAT_CP_PRODUIT_ILE-DE-FRANCE_2017.csv", sep = ";")
ind = read.csv("BNVD_2017/BNVD_2018_ACHAT_CP_PRODUIT_INDETERMINE_2017.csv", sep = ";")
reu = read.csv("BNVD_2017/BNVD_2018_ACHAT_CP_PRODUIT_LA REUNION_2017.csv", sep = ";")
mar = read.csv("BNVD_2017/BNVD_2018_ACHAT_CP_PRODUIT_MARTINIQUE_2017.csv", sep = ";")
may = read.csv("BNVD_2017/BNVD_2018_ACHAT_CP_PRODUIT_MAYOTTE_2017.csv", sep = ";")
nor = read.csv("BNVD_2017/BNVD_2018_ACHAT_CP_PRODUIT_NORMANDIE_2017.csv", sep = ";")
na = read.csv("BNVD_2017/BNVD_2018_ACHAT_CP_PRODUIT_NOUVELLE-AQUITAINE_2017.csv", sep = ";")
occ = read.csv("BNVD_2017/BNVD_2018_ACHAT_CP_PRODUIT_OCCITANIE_2017.csv", sep = ";")
pdl = read.csv("BNVD_2017/BNVD_2018_ACHAT_CP_PRODUIT_PAYS DE LA LOIRE_2017.csv", sep = ";")
paca = read.csv("BNVD_2017/BNVD_2018_ACHAT_CP_PRODUIT_PROVENCE-ALPES-COTE D''AZUR_2017.csv", sep = ";")

# fusion des données 
regions = rbind(ara,bfc, bzh , corse , cvl , grand_est , guadeloupe , guyane , hdf , ind , mar , may , na , nor , occ , paca , pdl , reu)

# virer les nc et transformer les volumes en valeurs numériques parce que je ne sais pas pourquoi c'est un facteur

regions <- regions %>% filter(quantite_produit !="nc")
regions$quantite_produit <- as.numeric(as.character(regions$quantite_produit))

# groupement par code postal et somme du volume de produit
library(dplyr)

total_communes <- regions %>% 
  group_by(code_postal_acheteur) %>% 
  summarise(total = sum(quantite_produit))

head(arrange(total_communes,desc(total)), n = 50)

tibble(regions)
