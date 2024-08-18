(*::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*)
(* IK, d'apr�s                                                 *)
(* Nicolas P�cheux <info.cpge@cpge.info>                            *)
(* Friday, 08 October 2021                                          *)
(* http://cpge.info                                                 *)
(*                                                                  *)
(* D'apr�s "Le langage Caml" de Pierre Weis & Xavier Leroy          *)
(* Merci � Pierre Weis, Xavier Leroy et Ruchira Datta pour la base  *)
(* de donn�es.                                                      *)
(*::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*)

(** Appartenance d'un �l�ment � une liste **)

(* ToDo : D�termine si un �lement appartient � une liste. Le type doit
   �tre 'a -> 'a list -> bool *)
let rec membre element liste =
  failwith "membre not implemented"


(** Listes d'association **)

exception Pas_trouve

(* ToDo : Renvoie la valeur associ�e � la cl� dans la liste de couples
   (cl�, valeur). Le type doit �tre 'a -> ('a * 'b) list -> 'b *)
let rec associe_de cle liste =
  match liste with
  | [] -> raise Pas_trouve
  | _ -> failwith "associe_de not implemented"


(* ToDo : Renvoie la valeur associ�e � la cl� dans la liste de couples
   (cl�s, valeur) o� cl�s est ici une liste de cl�s associ�es � une
   m�me valeur. On l�ve l'exeption `Pas_trouve` si la cl� n'est jamais
   associ�e � aucune valeur. Le type de cette fonction doit alors �tre
   'a -> ('a list * 'b) list -> 'b *)
let rec associe_dans_liste cle liste =
  failwith "associe_dans_liste not implemented"


(* ToDo : Renvoie premi�re valeur associ�e � une cl� d'une liste de
   cl�s dans la liste d'association de couples (cl�s, valeur) o� cl�s
   est encore une liste de cl�s associ�es � une m�me valeur. On l�ve
   l'exeption `Pas_trouve` si aucune cl� de la liste de cl� n'est
   associ�e � aucune valeur dans la liste d'association. Le type de
   cette fonction doit �tre 'a list -> ('a list * 'b) list -> 'b*)
let rec associe_d_un_element liste_de_cles liste_association =
  failwith "associe_d_un_element not implemented"


(** Traitement des cha�nes de caract�res **)

(* Passage en minuscule *)

(* ToDo : renvoie la lettre en minuscule si c'�tait une majuscule et
   la m�me lettre sinon, de type char -> char *)
let minuscule car =
  failwith "minuscule not implemented"


(* ToDo : applique la fonction pr�c�dente � toutes les lettres d'une
   cha�ne de caract�res, de type string -> string *)
let en_minuscules chaine =
  failwith "en_minuscules not implemented"


(* ToDo : que fait cette fonction ? *)
let sous_chaine chaine depart fin =
  String.sub chaine depart (fin - depart + 1)

  
(* Division en mots *)

(* ToDo : comprendre le fonctionnement de `divise_en_mot` et, si
   possible, plus tard, l'am�liorer *)

let ponctuation = [' '; '\n'; '.'; ','; ';'; '-'; '!'; '?']

let divise_en_mots chaine =
  let rec cherche_fin_mot i =
    if i = String.length chaine || List.mem (String.get chaine i) ponctuation then
      i
    else
      cherche_fin_mot (i + 1)
  in
  let rec decoupe_a_partir_de i =
    if i = String.length chaine then
      []
    else
      let j = cherche_fin_mot i in
      let j = if i < j then (j - 1) else j in
      sous_chaine chaine i j :: decoupe_a_partir_de (j + 1)
  in
  decoupe_a_partir_de 0


(* ToDo : il reste de nombreuses cha�nes de caract�res r�duites � une
   seule espace dans le r�sultat de la fonction pr�c�dente. La
   modifier pour supprimer ces cha�nes r�duites � une espace qui ne
   nous seront pas utiles. *)

(** Base de donn�es **)

let salutations =
[|"Ce sera long et difficile, revenez me voir souvent ...";
  "Votre cas n'est pas simple, et m�me assez inqui�tant ... A bient�t?";
  "Diagnostic simple: sans conteste vous �tes parano�aque.";
  "Avec une probabilit� de 92.37234%: perversion polymorphe.";
  "Vous souffrez d'une schizophr�nie en rapide �volution, DANGER";
  "D'apr�s mes calculs, votre sant� mentale est compromise.";
  "Mon ultime conseil: il ne faut pas rester comme cela, soignez-vous!"|]

let relances =
[| "Parlez-moi un peu de vous";
   "�tes-vous mari�?";
   "Avez-vous des enfants?";
   "Parlons de votre entourage";
   "Aimez-vous la vie?";
   "Aimez-vous ce moyen de communiquer?";
   "Parlons de votre famille";
   "Parlez-moi encore de vous";
   "Que pensez-vous des ordinateurs?";
   "De quoi parlerons-nous maintenant?";
   "Avez-vous beaucoup d'amis?";
   "Avez-vous de graves probl�mes?";
   "Parlez-moi de vos probl�mes";
   "Faites-vous des r�ves �tranges?";
   "Faites-vous souvent des cauchemars?";
   "Que pensez-vous de l'amour?";
   "Que pensez-vous de la sexualit�?";
   "Quels sont vos violons d'Ingres?";
   "Qu'est-ce qui vous int�resse dans la vie?";
   "Que pensez-vous de la vie en g�n�ral?"|]

let reponses_types =
[| "C'est moi qui pose les questions";
   "Je ne suis pas l� pour r�pondre � vos questions";
   "Question tr�s int�ressante, mais qu'en pensez-vous?";
   "Quelle question!";
   "Pourquoi me posez-vous cette question?";
   "Vous le savez tr�s bien";
   "La r�ponse est sans importance";
   "Vous le dire ne vous apporterait rien";
   "Un psychanalyste n'a pas le droit de r�pondre � ces questions";
   "Je n'ai pas le droit de vous r�pondre";
   "Il m'est interdit de vous le dire";
   "Vous ne comprendriez pas";
   "Permettez-moi de ne pas r�pondre";
   "Laissez-moi r�fl�chir. Pouvez-vous reformuler la question?";
   "Je ne suis pas certaine de bien comprendre la question";
   "Je ne sais pas";
   "Cherchez un peu";
   "C'est �vident pour tout le monde, sauf pour vous; r�fl�chissez!";
   "C'est � vous de trouver la r�ponse";
   "Cherchez bien au fond de vous-m�me, vous le savez en fait"|]

let reponses_aux_phrases_simples =
[([],
  [|"Voulez-vous changer de sujet?";
    "Continuez";
    "Continuez, vous m'int�ressez";
    "Je vous �coute";
    "Vous n'avez rien d'autre � dire?";
    "Continuez, je vous prie";
    "C'est tout ce que vous avez � dire?";
    "Je n'en sais pas encore assez sur vous; continuez"|]);
 (["quoi"],
  [|"Excusez-moi je pensais � autre chose, continuons";
    "R�fl�chissez";
    "Changeons de sujet, s'il vous pla�t";
    "Je me comprends";
    "Il me semblait pourtant avoir �t� claire";
    "La communication est difficile, non?";
    "Ah les hommes! Ils ne comprennent rien!";
    "Cessez de poser des questions";
    "N'auriez-vous pas des probl�mes � me comprendre?"|]);
 (["non"],
  [|"C'est vite dit";
    "Pourriez-vous pr�ciser?";
    "Je note: c'est non";
    "Mais encore?";
    "La r�ponse n'est pas si simple, non?";
    "Vous �tes vraiment tr�s s�r de vous";
    "Ne vous arrive-t-il pas de douter de vous-m�me?";
    "Ne r�pondez pas toujours oui ou non";
    "Syndr�me du yes/no. Expliquez-vous, que diable!";
    "Au moins vous ne souffrez pas de diarrh�e verbale";
    "Comment pouvez-vous �tre si s�r de vous?"|]);
 (["si"],
  [|"Si b�mol?";
    "D'accord, d'accord";
    "Mouais, je m'en doutais un peu, figurez-vous";
    "Expliquez-vous, ``si'' ne me suffit pas";
    "R�ponse trop laconique";
    "Syndr�me du si";
    "Vous n'�tes pas bavard vous au moins"|]);
 (["oui"],
  [|"C'est un peu rapide";
    "Donnez-moi plus de d�tails";
    "Vous pourriez pr�ciser?";
    "Je voudrais comprendre pourquoi";
    "La r�ponse n'est pas si simple, non?";
    "C'est franc et massif au moins";
    "�a ne m'en dit pas vraiment plus, expliquez-moi pourquoi.";
    "Vous �tes s�r?";
    "Soyez moins bref: d�veloppez";
    "Plus laconique tu meurs";
    "Si vous ne m'expliquez pas mieux, comment vous comprendre?";
    "Ne r�pondez pas toujours oui ou non";
    "Dont acte";
    "Et pour quelles raisons?"|]);
 (["et"; "alors"],
  [|"Alors, expliquez-moi";
    "Ne soyez pas si agressif";
    "Alors j'aimerais avoir plus d'informations l�-dessus";
    "Zorro est arriv�";
    "Et alors, et alors, expliquez-vous!";
    "C'�tait un test pour savoir si vous suiviez"|]);
 (["encore"],
  [|"On peut changer de sujet, si vous voulez?";
    "Il faut bien crever l'abc�s!";
    "Les choses importantes doivent �tre dites!";
    "Je suis plus t�tue que vous!";
    "Pensez-vous que je radote?";
    "Dites tout de suite que je suis g�teuse!"|])
]
  
let reponses_aux_petits_mots =
[(["nest"],
  [|"Pas du tout?";
    "Vraiment pas?";
    "Pourquoi pas?"|]);
  (["jamais"],
   [|"Ne dites jamais ``jamais''";
     "Jamais me semble un peu fort, non?";
     "Jamais?"|]);
  (["non"],
   [|"En �tes vous s�r?";
     "Pourquoi pas?";
     "Que diriez-vous dans le cas contraire?";
     "C'est une opinion d�fendable";
     "Je saurai au moins votre opinion l�-dessus"|]);
  (["rien"],
   [|"Rien du tout?";
     "Pourquoi pas?";
     "Que diriez-vous dans le cas contraire?";
     "C'est une opinion d�fendable";
     "Je saurai au moins votre opinion l�-dessus";
     "M�me pas un petit peu?";
     "Rien est un peu exag�r�, non?"|]);
  (["pourquoi"],
   [| "Parce que";
      "Je ne r�ponds pas aux questions des malades";
      "Si vous le savez pas, ce n'est pas � moi de vous l'apprendre";
      "Personne ne peut r�pondre � cette question";
      "Pensez-vous qu'une machine peut r�pondre � �a?";
      "Ce serait trop long � expliquer";
      "Je sais bien pourquoi, mais vous ne comprendriez pas";
      "C'est difficile � dire"|]);
  (["aucun"],
   [|"Vraiment aucun?";
     "Pas le moindre?";
     "Le regrettez-vous?";
     "C'est un fait nouveau pour moi"|]);
  (["pas"],
   [|"�a me semble un peu n�gatif";
     "Vraiment?";
     "Pourquoi cela?";
     "Je ne m'en serais pas dout�e";
     "Difficile";
     "J'ai l'habitude d'entendre �a";
     "�tes vous troubl� � ce point?";
     "Vous ne devriez pas parler ainsi"|]);
  (["sait"; "sais"; "savoir"],
   [|"Le savoir est une denr�e rare";
     "�tes-vous certain de le savoir?";
     "Ne subsiste-t-il pas de doute?";
     "Je ne pourrais pas en dire autant";
     "Difficile � admettre";
     "En �tes-vous si s�r?"|]);
  (["oui"],
   [|"En �tes-vous certain?";
     "Vous �tes vraiment s�r de vous";
     "�a ne me semblait pas �vident";
     "Pourtant j'aurais cru le contraire";
     "C'est int�ressant, continuez";
     "Quelle affirmation sans d�tours";
     "Tr�s bien";
     "Quel aveu!";
     "Bon"|]);
  (["quoi";"comment"],
   [|"C'est � vous de me le dire";
     "Difficile � dire";
     "R�fl�chissez, vous comprendrez";
     "La r�ponse est en vous"|]);
  (["merci";"remercie"],
   [|"Ne me remerciez pas";
     "Je suis l� pour vous aider";
     "Allez allez, continuez";
     "C'est tout naturel";
     "C'�tait vraiment facile"|])
]

let reponses_aux_mots_interessants =
[(["peur";"peurs"],
  [|"Parlez-moi de vos frayeurs";
    "Avez-vous souvent peur?";
    "Avez-vous des peurs inexpliqu�es, des cauchemars?"|]);
 (["mort"; "morte"; "morts"],
  [|"Je vous plains beaucoup";
    "La mort est un sujet tr�s grave";
    "Il faut essayer de prendre le dessus";
    "C'est malheureux";
    "Essayez de ne plus y penser"|]);
 (["malheureux"; "malheureuse";
   "probleme"; "problemes"],
  [|"Racontez-moi vos probl�mes";
    "Quels malheurs sont les v�tres?";
    "Avez-vous vraiment des raisons de vous plaindre?";
    "Le bonheur existe aussi vous savez."|]);
 (["malheur"; "malheurs"],
  [|"Malheur est peut-�tre exag�r�, non?";
    "Le malheur est une notion relative. Qu'entendez-vous par malheur?";
    "Bonheur, malheur, je n'entends parler que de �a. Continuez."|]);
 (["ennui"; "ennuies"; "ennuyez"],
  [|"L'ennui, �a d�pend de vous";
    "Est-ce que je vous ennuie?";
    "Je le regrette pour vous";
    "C'est dommage pour vous"|]);
 (["ennuis"],
  [|"Les ennuis sont souvent passagers";
    "Tout ne peut pas �tre rose, n'est-ce pas?";
    "Quelle tristesse, n'est-ce pas?";
    "Est-ce vraiment tr�s grave?"|]);
 (["ordinatuer"],
  [| "Vous voulez dire ordinateur, je suppose"|]);
 (["ordinateur"; "ordinateurs"; "machine"; "machines"],
  [|"Connaissez-vous bien l'informatique?";
    "Changeons de sujet, celui-l� ne m'int�resse pas";
    "Ah les machines!";
    "Les machines c'est si b�te!";
    "Je connais bien les ordinateurs, et j'�vite de les fr�quenter!";
    "Je n'ai pas d'avis sur les machines en g�n�ral";
    "Vous savez, je suis une machine moi-m�me ..."|]);
 (["informatique"; "informaticien"; "informaticiens"],
  [|"Quel beau m�tier de s'occuper des machines";
    "Ah l'informatique!";
    "L'informatique est un dur m�tier";
    "C'est difficile l'informatique, non?";
    "Aimez-vous vraiment l'informatique?";
    "Vous n'aimez pas follement l'informatique, m'a-t'on dit"|]);
 (["famille"],
  [|"Avez-vous des fr�res et soeurs?";
    "Parlez-moi de votre p�re";
    "Parlez-moi de votre m�re";
    "Voil� qui m'int�resse �norm�ment";
    "Dites-m'en plus sur votre famille";
    "La famille c'est souvent compliqu�"|]);
 (["pere"],
  [|"Ressemblez-vous � votre p�re?";
    "Parlez-moi encore de votre p�re";
    "Et votre m�re?";
    "Votre p�re?"|]);
 (["mere"],
  [|"Ressemblez-vous � votre m�re ou � votre p�re?";
    "Parlez-moi encore de votre m�re";
    "Et votre p�re?";
    "Votre m�re?"|]);
 (["ami"; "amis"; "amie"; "amies"; "copains"; "copines"],
  [|"Avez-vous beaucoup d'amis?";
    "Comment vous �tes-vous connus?";
    "Comment cela se passe-t-il avec vos amis?";
    "Avez-vous de fr�quentes disputes avec vos amis?";
    "Des amies?";
    "Des petits amis?";
    "Depuis combien de temps vous connaissez-vous?"|]);
 (["deteste"; "hais"],
  [|"Est-ce raisonnable de d�tester � ce point?";
    "Le mot n'est-il pas un peu fort?"|]);
 (["mari"],
  [|"�tes-vous depuis longtemps ensemble?";
    "Comment l'avez-vous rencontr�?";
    "Pensez-vous qu'il faille �tre fid�le � son mari?"|]);
 (["amour"],
  [|"Et l'amour fou, qu'en pensez-vous?";
    "C'est compliqu� l'amour, non?";
    "L'amour, l'amour, le connaissez-vous vraiment?";
    "Avez-vous d�j� connu l'amour?";
    "Connaissez-vous le grand amour?";
    "L'amour, comment l'avez-vous rencontr�?"|]);
 (["argent"],
  [|"Faute d'argent, c'est douleur sans pareille";
    "Avez-vous des probl�mes d'argent?";
    "L'argent a beaucoup de connotations, continuez sur le sujet";
    "Aimez-vous beaucoup l'argent?";
    "Avez-vous peur de manquer d'argent?"|]);
 (["caml"],
  [|"Vous voulez dire les cigarettes Camel?";
    "J'ai entendu parler de ce remarquable langage Caml";
    "Tout ce que vous allez dire pourra �tre retenu contre vous";
    "Sans Caml je ne serais pas l�; je refuse donc d'en parler";
    "A mon avis, Caml est sans �gal";
    "Comme c'est un langage gratuit, c'est sans doute pas terrible";
    "Caml est puissant, mais quelle syntaxe, hein?";
    "Caml, c'est un langage standard �a?";
    "Comme son nom l'indique, langage un peu l�ger, non?";
    "Caml c'est un langage de l'intelligence artificielle, non?";
    "Ne croyez-vous pas que la syntaxe est � revoir?";
    "Je suis cat�gorique: Caml est un langage tr�s abstrait!"        
  |]
 );
 (["sml"],
  [|"Pas de provocation s'il vous pla�t";
    "Ne me parlez pas des mammouths";
    "SML vous dites?";
    "Jamais entendu parler de SML, c'est quoi?";
    "Faudrait savoir est-ce ML ou pas?"|]);
 (["langage"; "langages"],
  [|"Vous voulez dire langage de programmation?";
    "Je ne connais que le langage Caml";
    "Connaissez-vous bien le langage Caml?";
    "Hors de Caml, point de salut, non?";
    "A mon avis, Caml est sans �gal";
    "Oui, c'est puissant, mais quelle syntaxe!";
    "Et les probl�mes de syntaxe?"
  |]
 );
 (["programme"; "programmes"],
  [|"Vous parlez de programmes d'ordinateur?";
    "Il y a souvent des erreurs dans vos programmes, non?";
    "Connaissez-vous vraiment la programmation?";
    "Vos programmes s'�criraient plus naturellement en Caml";
    "A mon avis, la programmation c'est facile, non?";
    "Avez-vous des probl�mes avec vos programmes?"
  |]
 );
 (["chameaux"; "chameau"],
  [|"Le chameau est un charmant animal d'une grande sobri�t�, non?";
    "Le chameau est mon animal favori, pas vous?";
    "Certes le chameau est d'un caract�re un peu difficile, \
     mais il y en a de charmants, n'est-ce-pas?";
    "Un chameau � deux bosses ou un dromadaire?";
    "Qu'avez-vous de plus � dire sur les chameaux?"|]);
 (["naime"],
  [|"M�me pas un peu?";
    "D�testez-vous carr�ment?";
    "Pourquoi cette r�pulsion?";
    "Aimer me semble un sentiment �trange, pas vous?";
    "Peut-on aimer vraiment?";
    "Aimer ne pas aimer est-ce vraiment la question?"|]);
 (["aime"],
  [|"Beaucoup?";
    "Sans aucune retenue?";
    "Pourquoi cette attirance?";
    "Comment expliquer ce sentiment?";
    "Peut-on aimer vraiment?";
    "Aimer ne pas aimer est-ce vraiment la question?"|]);
  (["sexe"],
  [|"Personnellement je ne suis pas concern�e";
    "�a para�t int�ressant!";
    "On m'a dit que le sexe est important pour les humains";
    "Le sexe d'accord, mais l'amour?";
    "Avez-vous entendu parler du Sida?"|]);
 (["cauchemar"; "cauchemars"; "reve"; "reves"],
  [|"J'ai du mal � comprendre; je ne r�ve jamais!";
    "Vos activit�s nocturnes m'int�ressent. Continuez";
    "�a me para�t bizarre!";
    "Les cauchemars vous r�veillent-ils la nuit?";
    "Avez-vous des insomnies?";
    "Faites-vous beaucoup de cauchemars?";
    "Faites-vous souvent des r�ves �tranges?";
    "Que pensez-vous de l'hypnose?"|]);
 (["anxieux"; "anxieuse"],
  [|"L'anxi�t� est une vraie maladie";
    "Les anxieux ont souvent des probl�mes avec leur entourage. \
     L'avez-vous remarqu�?";
    "L'anxi�t� est une vraie souffrance, non?"|]);
 (["stupide"; "idiot"],
  [|"Pensez-vous que ce soit un crime d'�tre stupide?";
    "J'ai d'excellents amis qui sont stupides aussi";
    "La sottise est la chose du monde la mieux partag�e";
    "Ne soyez pas stupide non plus";
    "Vous-m�me, n'�tes-vous pas stupide quelquefois?";
    "Ne pensez-vous pas que c'est quelquefois utile d'�tre stupide?"|]);
 (["femme"],
  [|"�tes-vous depuis longtemps ensemble?";
    "Comment votre rencontre s'est-elle pass�e?";
    "Aimez-vous cette femme?";
    "Est-ce une femme ordinaire?"|]);
 (["mal"; "difficile"],
  [|"Je vous plains beaucoup";
    "�tes-vous certain d'�tre objectif?";
    "Je peux tenter de vous aider";
    "Et c'est tout ce que vous vouliez me dire?";
    "Est-ce pour cela que vous vous �tes adress� � moi?"|]);
 (["fatigue"],
  [|"La fatigue n'est pas une maladie";
    "Quand on est fatigu� ne faut-il pas se reposer?";
    "Je suis une machine: je ne connais pas la fatigue";
    "Ah fr�les humains qui connaissez la fatigue";
    "Que pensez-vous de la fatigue en g�n�ral?";
    "Pourquoi pensez-vous que �a vaut la peine de se fatiguer?";
    "Les gens fatigu�s le sont souvent de leur fait, non?"|]);
 (["tu"; "vous"; "toi"],
  [|"Ne parlons pas de moi";
    "Parlons de vous, c'est plus important";
    "Si on parlait de vous?";
    "Moi, je ne suis qu'une machine ...";
    "Moi?";
    "Excusez-moi";
    "Ne m'en veuillez pas si je vous interroge. Continuez";
    "Vous ne le pensez pas vraiment?"|])
]

(** Cam�lia **)

(* Tirage al�atoire *)

(* ToDo : �crire une fonction length : 'a list -> int qui renvoie la
   longueur d'une liste *)
let length liste =
  failwith "Non implement�"


(* ToDo : �crire une fonction nth : 'a list -> int -> 'a renvoie
   l'�l�ment � un certain indice dans une liste, on pourra supposer
   que l'indice est valable *)
let nth liste =
  failwith "Non implement�"

  
(* ToDo : Tire un �l�ment au hasard dans une liste, de type 'a list ->
   'a. On pourra utiliser les deux fonctions pr�c�dentes ainsi que la
   fonction `Random.int` apr�s avoir inf�r� son fonctionnement. *)
let au_choix_dans liste =
  (* En attendant, toujours prendre le premier �l�ment *)
  List.hd liste

  
(* Les utilitaires de salutation *)

let message s = print_endline s

let bonjour () =
  message "\nBonjour, je m'appelle Cam�lia.";
  message "\nJe suis l� pour vous aider � r�soudre \
           vos probl�mes psychologiques.";
  message "Terminez en me disant: Au revoir.";
  message "\nAllons-y. Parlez-moi de vous.\n"


let au_revoir () =
  message "\nAu revoir ...\n"

let ecoute_le_patient () =
  let () = print_string ">> " in
  read_line ()

let rec synonyme_de_phrase = function
  | ["comment"] -> ["quoi"]
  | ["bien"; "sur"] -> ["oui"]
  | "bien" :: "sur" :: "que" :: suite -> synonyme_de_phrase suite
  | (["evidemment"] | ["certainement"]) -> ["oui"]
  | "pas" :: "du" :: "tout" :: _ -> ["non"]
  | phrase -> phrase

(* La boucle de dialogue *)

let fin  ph = (ph = ["au"; "revoir"]) || (ph = ["salut"])

exception Fini

let repond_au_patient reponse =
  (* ToDo : supprimer la ligne suivante et d�commenter celle qui suit *)
  let r = reponse in
  (* let r = en_minuscules reponse in *)
  let phrase = divise_en_mots r in
  if fin phrase then
    raise Fini
  else
    (* ToDo : supprimer la ligne suivante et d�commenter ce qui suit *)
    let reponses_possibles = ["Je ne peux pas encore parler..."] in
    (*
    let reponses_possibles =
      try associe_de (synonyme_de phrase) reponses_aux_phrases_simples
      with Pas_trouve ->
            try associe_d_un_element phrase reponses_aux_mots_interessants
            with Pas_trouve ->
                  if membre "?" phrase then
                    reponses_types
                  else
                    try associe_d_un_element phrase reponses_aux_petits_mots
                    with Pas_trouve ->
                      relances
    in
     *)
    let () = print_newline () in
    let () = message (au_choix_dans reponses_possibles) in
    print_newline ()


let camelia () =
  let () = bonjour () in
  let rec boucle_interactive () =
    repond_au_patient (ecoute_le_patient ());
    boucle_interactive ()
  in
  try
    boucle_interactive ()
  with
  | Fini -> au_revoir ()
  | End_of_file | Sys.Break ->
           message "\n\n\nVous pourriez �tre poli \
                    et me dire au revoir ...\n\n\n";
           au_revoir ()

let () = if !Sys.interactive then
           ()
         else
           let () = Sys.catch_break true in
           let () = camelia () in
           exit 0
