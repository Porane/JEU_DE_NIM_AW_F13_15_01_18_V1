{ALGORITHME : JEU_DE_NIM

//BUT : Faire un jeu de nim.
//PRINCIPE : Utilier des boucles REPEAT et des conditions.
//ENTREES : Choix, player, allumettes, menu.
//SORTIES : Les soustractions d'allumettes et le joueur gagnant.

VAR

	choix : ENTIER
	player : ENTIER
	allumettes : ENTIER
	menu : ENTIER

DEBUT

	ALEATOIRE
	menu<-0
	choix<-0
	player<-1
	allumettes<-21

	ECRIRE "Bienvenue sur le jeu de Nim, veuillez appuyer sur entree pour continuer..."
	LIRE

	REPETER
		ECRIRE "Vous etes dans le menu, appuyez sur 1 pour jouer contre l'ordinateur, appuyez sur 2 pour jouer en multijoueur..." //menu pour savoir si le joueur va jouer contre un autre joueur ou un bot
		LIRE menu
	JUSQU`A (menu>=1) ET (menu<=2) 

	SI (menu=1) ALORS //mode solo
		REPETER 
			ECRIRE "C'est au tour du joueur", player, " avec ", allumettes, " allumettes restantes, veuillez entrer le nombre d`allumettes que vous souhaitez enlever entre 1 et 3."
			LIRE choix
			SI (player=1) ALORS
				SI (choix<1) OU (choix>3) ALORS //test du choix s'il est correct
					ECRIRE "Votre choix est incorrecte, veuillez rentrer un chiffre correcte."
				SINON
					ECRIRE "Vous soustrayez ", choix, " allumette(s)." //soustraction des allumettes par rapport au choix
					allumettes<-allumettes-choix
					player<-2 //passage au joueur suivant ; l'ordinateur
				FINSI
			SINON SI (player=2) ALORS
				choix<-ALEATOIRE(3)
				allumettes<-allumettes-choix
				player<-1
			FINSI
		JUSQU`A (allumettes<-1)

	SINON SI (menu=2) ALORS //mode multi
		REPETER
			ECRIRE "C'est au tour du joueur", joueur, " avec ", allumettes, " allumettes restantes, veuillez entrer le nombre d`allumettes que vous souhaitez enlever entre 1 et 3."
			LIRE choix
			SI (choix<1) OU (choix>3) ALORS //test du choix s'il est correct
				ECRIRE "Votre choix est incorrecte, veuillez rentrer un chiffre correcte."
			SINON
				ECRIRE "Vous soustrayez ", choix, " allumette(s)." //soustraction des allumettes par rapport au choix
				allumettes<-allumettes-choix
				SI (player=1) ALORS //passage au joueur suivant
					player<-2
				SINON
					player<-1
				FINSI
			FINSI
		JUSQU`A (allumettes<-1)
	FINSI

	SI (player=1) ALORS //pour determiner quel joueur a ete le dernier a jouer et donc le gagnant
		player<-2
	SINON SI (player=2) ALORS
		player<-1
	FINSI

	ECRIRE "Le joueur ", player, " a gagné !"
	LIRE

FIN}


PROGRAM JEU_DE_NIM;

USES crt;

//BUT : Faire un jeu de nim.
//PRINCIPE : Utilier des boucles REPEAT et des conditions.
//ENTREES : Choix, player, allumettes, menu.
//SORTIES : Les soustractions d'allumettes et le joueur gagnant.

VAR

	choix : INTEGER;
	player : INTEGER;
	allumettes: INTEGER;
	menu : INTEGER;

BEGIN

	clrscr;
	RANDOMIZE;
	menu:=0;
	choix:=0;
	player:=1;
	allumettes:=21;

	writeln('Bienvenue sur le jeu de Nim, veuillez appuyer sur entree pour continuer...');
	readln();

	REPEAT
		writeln('Vous etes dans le menu, appuyez sur 1 pour jouer contre l`ordinateur, appuyez sur 2 pour jouer en multijoueur...'); //menu pour savoir si le joueur va jouer contre un autre joueur ou un bot
		readln(menu);
	UNTIL ((menu>=1) AND (menu<=2));

	IF (menu=1) THEN //mode solo
	BEGIN
		REPEAT
			writeln('C`est au tour du joueur ', player, ' avec ', allumettes, ' allumettes restantes, veuillez entrer le nombre d`allumettes que vous souhaitez enlever entre 1 et 3.');
			IF (player=1) THEN
			BEGIN
				readln(choix);
				IF (choix<1) OR (choix>3) THEN //test du choix s'il est correct
				BEGIN
					writeln('Votre choix est incorrecte, veuillez rentrer un chiffre correcte. Appuyez sur entree...');
				END
				ELSE
				BEGIN
					writeln('Vous soustrayez ', choix, ' allumette(s).'); //soustraction des allumettes par rapport au choix
					allumettes:=allumettes-choix;
					player:=2 //passage au joueur suivant ; l'ordinateur
				END
			END
			ELSE IF (player=2) THEN
			BEGIN
				choix:=RANDOM(3)+1;
				allumettes:=allumettes-choix;
				player:=1;
			END
		UNTIL (allumettes<=1);
	END

	ELSE IF (menu=2) THEN //mode multi
	BEGIN
		REPEAT
			writeln('C`est au tour du joueur ', player, ' avec ', allumettes, ' allumettes restantes, veuillez entrer le nombre d`allumettes que vous souhaitez enlever entre 1 et 3.');
			readln(choix);
			IF (choix<1) OR (choix>3) THEN //test du choix s'il est correct
			BEGIN
				writeln('Votre choix est incorrecte, veuillez rentrer un chiffre correcte. Appuyez sur entree...');
				readln();
			END
			ELSE
			BEGIN
				writeln('Vous soustrayez ', choix, ' allumette(s).'); //soustraction des allumettes par rapport au choix
				allumettes:=allumettes-choix;
				IF (player=1) THEN //passage au joueur suivant
				BEGIN
					player:=2;
				END
				ELSE
				BEGIN
					player:=1;
				END
			END
		UNTIL (allumettes<=1);
	END;

	IF (player=1) THEN //pour determiner quel joueur a ete le dernier a jouer et donc le gagnant
	BEGIN
		player:=2;
	END
	ELSE IF (player=2) THEN
	BEGIN
		player:=1;
	END;

	writeln('Le joueur ', player, ' a gagne !');
	readln;

END.