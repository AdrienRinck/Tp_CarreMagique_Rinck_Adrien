Program Carre_Magique;
uses crt;

CONST
	MAX=7;
	
Type
	CarreMagique = Array [1..MAX,1..MAX] of integer;
// ------------- Procédure d'initialisation -------------                               //Procedure servant a placer le 1 
Procedure Initialisation (var T1:CarreMagique; var PosI:integer; var PosJ:integer);
Var
	i,j:integer;
Begin
	For i:=1 to MAX do					
		Begin
			For j:=1 to MAX do
                Begin
					T1[i,j]:=0;
					PosI:=(MAX DIV 2);													// Le 1 est placé au millieu dans la partie
					PosJ:=(MAX DIV 2+1);												// Superieur
					T1[PosI,PosJ]:=1;
                End;
		End;
End;
// ------------- Procédure de réinitialisation -------------							// Reinitialisation de la matrice
Procedure Reinitialisation (var T1:CarreMagique; var compteur:integer); 
Var
	i,j:integer;
Begin 	
	For i:=1 to MAX do
		Begin	
			For j:=1 to MAX do
				Begin
					T1[i,j]:= 0;
				End;
			Writeln;
		End;
End; 
// ------------- Procédure de positionnement des chiffres -------------					//Procedure permettant de definir les options
Procedure Positionnement (var T1:CarreMagique; var PosI:integer; var PosJ:integer; var compteur:integer); // De positionnement des chiffres 
Var 
	i,j:integer;
Begin 
	compteur:=1;
	While (Compteur <= MAX*MAX) do														// Le programme s'arretera au moment ou toutes
		Begin																			// les cases seront rempli 
			PosI:=PosI-1;
			PosJ:=PosJ+1;
				If (PosI<1) then
					Begin
						PosI:=MAX;
					End;
				If(PosJ > MAX) then														// Si le nombre dépasse la taille des colonnes 
					Begin																
						PosJ:=1;
					End;
			While (T1[PosI,PosJ] <> 0) do												// Placement du nombre si la case est déjà occupée
				Begin																	
					PosI:=PosI-1;
					PosJ:=PosJ-1;
					If (PosI < 1) Then													// Si le nombre dépasse la taille des lignes 
						Begin
							PosI:=MAX;
						End;
					If (PosJ < 1) then
						Begin
							PosJ:=MAX;
						End;
				End;
			T1[PosI,PosJ]:=compteur;
			Compteur:=compteur+1;
		End;
End;
// ------------- Procedure d'affichage du carre -------------             				// Comme son nom l'indique 
Procedure Affichage (var T1:CarreMagique);
var
	i,j:integer;
Begin
	For i:=1 to MAX do
	Begin
		for j:=1 to MAX do
			Begin
				write(T1[i,j]);
				Write ('  ');
			End;
		Writeln;
	End;
End;

VAR
	T2:Array [1..MAX,1..MAX] of integer;												// Les procedures s'appliqueront sur T2 
        i,j,PosI,PosJ,compteur:integer;
Begin
	Clrscr;
	Begin
		Initialisation (T2,PosI,PosJ);													// Appel de mes procédures dans mon programme
		Reinitialisation(T2,compteur);
		Positionnement (T2,PosJ,PosI,compteur);											// A Partir de "T2" 
		Affichage(T2);
	End;
Readln;
End.