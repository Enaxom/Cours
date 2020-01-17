-- PM, 7/11/2017
with Ada.Text_IO;use Ada.Text_IO;
with Ada.Command_Line;
use Ada;

procedure VU_conditions is
-- Synchronisation de l'accès à une voie unique selon la démarche 
-- par conditions d'acceptation

-- tâche arbitre
task VU is
  entry EntrerO ;
  entry EntrerE;
  entry Sortir;
end VU;

task body VU is
type Direction is (EO,OE);
dc : Direction := EO;
nbtrains : integer := 0;

begin
  loop
	select
		when ((nbtrains = 0) or  (dc = OE)) => 
				accept EntrerO; nbtrains := nbtrains + 1; dc := OE;
	or  
		when ((nbtrains = 0) or  (dc = EO)) => 
				accept EntrerE; nbtrains := nbtrains + 1; dc := EO;
	or 
		accept Sortir; nbtrains := nbtrains - 1;
	or 
		terminate;
	end select;
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
	  Text_IO.Put_Line("usage : vu_conditions nbtrains");
	  return;
	end if;

	nb_trains := Natural'Value(Ada.Command_Line.Argument(1));

	for i in 1..nb_trains loop
		--lancer une tâche Train
		aTrain := new Train;
		aTrain.Init(i);
	end loop;
end VU_conditions;