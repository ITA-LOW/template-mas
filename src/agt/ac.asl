// Agent gui in project aula10

/* Initial beliefs and rules */

temperatura_de_preferencia(jonas,33).
temperatura_hell_mode(50).

/* Initial goals */

!inicializar_AC.

+!inicializar_AC
  <- 	makeArtifact("ac_quarto","artifacts.AC",[],D);
  	   	focus(D);
  	   	!definir_temperatura.
  	   	//!!climatizar.

+alterado : temperatura_ambiente(TA) & temperatura_ac(TAC)
  <-  .drop_intention(climatizar);
  	  .print("Houve interação com o AC");
  	  .print("Temperatura Ambiente: ", TA);
 	  .print("Temperatura Desejada: ", TAC);
  	  !!climatizar.
      
+closed  <-  .print("Close event from GUIInterface").

 +!definir_temperatura: temperatura_ambiente(TA) & temperatura_ac(TAC) 
 			& temperatura_de_preferencia(P,TP) & TP \== TD & ligado(false)
 	<-  definir_temperatura(TP);
 		.print("Definindo temperatura baseado na preferencia do usurio ", P);
 		.print("Temperatura: ", TP).

 +!definir_temperatura: temperatura_hell_mode(H) & H \== TAC
 	<-  definir_temperatura(H);
 		.print("Definindo temperatura modo de segurança: ", H);
 		.print("Temperatura: ", H).

 +!definir_temperatura: temperatura_ambiente(TA) & temperatura_ac(TAC) & ligado(false)
 	<-  .print("Usando ultima temperatura");
 		.print("Temperatura: ", TAC).
 		
 		
 +!climatizar: temperatura_ambiente(TA) & temperatura_ac(TAC) & TA \== TAC & ligado(false)
 	<-   ligar;
 		.print("Ligando AC");
 		.print("Temperatura Ambiente: ", TA);
 		.print("Temperatura Desejada: ", TAC);
 		.wait(1000);
 		!!climatizar.
 		
 +!climatizar: temperatura_ambiente(TA) & temperatura_ac(TAC) & TA \== TAC & ligado(true) 
 	<-  .print("Aguardando regularizar temperatura para desligar!");
 		.print("Temperatura Ambiente: ", TA);
 		.print("Temperatura Desejada: ", TAC);
 		.wait(1000);
 		!!climatizar.
 		 	
  +!climatizar: temperatura_ambiente(TA) & temperatura_ac(TAC) & TA == TAC & ligado(true) 
 	<-   desligar;
 		.print("Desligando AC");
 		.print("Temperatura Ambiente: ", TA);
 		.print("Temperatura Desejada: ", TAC).

 +!climatizar
 	<- 	.print("Nao foram implementadas outras opcoes");
 		.print("TEMPERATURA REGULARIZADA").

+climatizar_pref(P): temperatura_ambiente(TA) & temperatura_de_preferencia(_, TP) & TA \== TP & ligado(false)
	<- ligar;
	.print(P, " está em casa, climatizando o ambiente.");
	.wait(1);
 	!!climatizar.

+!hell_mode: temperatura_ambiente(TA) & temperatura_ac(TAC) & temperatura_hell_mode(H) & TA \== H & ligado(false)
	<- 	ligar;
		!definir_temperatura;
		.print("Iniciando modo de segurança, temperatura ajustada para ", H, " graus");
		.wait(1);
		!!climatizar.




