-- PM, 7/11/2017
with Ada.Text_IO;use Ada.Text_IO;
with Ada.Command_Line;
use Ada;

procedure VU_automate is
-- Synchronisation de l'accès à une voie unique selon la démarche 
-- par construction d'un automate.

-- tâche arbitre
task VU is
  entry EntrerO ;
  entry EntrerE;
  entry Sortir;
end VU;

task body VU is
type EtatVoie is (Libre, OccupeeO, OccupeeE);
etat : EtatVoie := Libre;
nbtrains : integer := 0;

begin
  loop
	case etat is
		when Libre =>
			select
				accept EntrerO; nbtrains := 1; etat := OccupeeO;
			  or 
				accept EntrerE; nbtrains := 1; etat := OccupeeE;
			 end select;
		when OccupeeO =>
			  select
				accept EntrerO; nbtrains := nbtrains + 1; 
			  or 
				accept Sortir; nbtrains := nbtrains - 1; 
				if nbtrains = 0 then etat := Libre; end if;
			 end select;
		when OccupeeE =>
			  select
				accept EntrerE; nbtrains := nbtrains + 1; 
			  or 
				accept Sortir; nbtrains := nbtrains - 1; 
				if nbtrains = 0 then etat := Libre; end if;
			 end select;
	end case;
  end loop;
end VU;

--spécification des tâches train   
task type Train is
	entry Init(id : natural);
end Train;

task body Train is
idTrain : natural;

begin
	accept Init(id: natural) do idTrain:=id; end Init;
	-- à l'initialisation, le trains pairs partent vers E, les trains impairs vers O
	if (idTrain mod 2 = 0) then
		Text_IO.Put_Line("train " & natural'image(idTrain) & " attend vers E");
		VU.EntrerE;
		Text_IO.Put_Line("train " & natural'image(idTrain) & " entre vers E");
		VU.Sortir;
		Text_IO.Put_Line("train " & natural'image(idTrain) & " sort");
	end if;
	loop
		Text_IO.Put_Line("train " & natural'image(idTrain) & " attend vers O");
		VU.EntrerO;
		Text_IO.Put_Line("train " & natural'image(idTrain) & " entre vers O");
		delay 1.0;
		VU.Sortir;
		Text_IO.Put_Line("train " & natural'image(idTrain) & " sort");
		delay 1.0*idTrain;
		Text_IO.Put_Line("train " & natural'image(idTrain) & " attend vers E");
		VU.EntrerE;
		Text_IO.Put_Line("train " & natural'image(idTrain) & " entre vers E");
		delay 1.0;
		VU.Sortir;
		Text_IO.Put_Line("train " & natural'image(idTrain) & " sort");
	end loop;
end Train;

type Acces_train is access Train;

--procédure principale
nb_trains : natural;
aTrain : Acces_train;
   
begin -- tâche VU lancée ici
	if Ada.Command_Line.Argument_Count /= 1 then
	  Text_IO.Put_Line("usage : vu_automate nbtrains");
	  return;
	end if;

	nb_trains := Natural'Value(Ada.Command_Line.Argument(1));

	for i in 1..nb_trains loop
		--lancer une tâche Train
		aTrain := new Train;
		aTrain.Init(i);
	end loop;
end  VU_automate;