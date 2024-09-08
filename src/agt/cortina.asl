nivel_abertura_pref(50).

!inicializar_cortina.

+!inicializar_cortina
  <- 	makeArtifact("cortina_quarto","artifacts.Cortina",[],D);
  	   	focus(D).
  	   	//!abrir_cortina.
  	   	
+ajuste_cortina 
  <-  !!verificar_ajuste.
      
+closed  <-  .print("Close event from GUIInterface").
   
 +!verificar_ajuste: nivel_abertura(N) 
 	<-  .print("Nivel de abertura das cortinas ", N).
 	
 +!abrir_cortina: nivel_abertura(N) & nivel_abertura_pref(PN) & N \== PN
 	<- 	abrir;
 		+nivel_abertura(PN);
 		.print("Nivel de abertura DEPOIS ", PN).

+!abrir_cortina_pref(P): nivel_abertura_pref(PN) 
 	<-  abrir;
      	.print(P, " está em casa, ajustando cortinas para nível ", PN);
      	!abrir_cortina.

+!fechar_cortinas
	<- 	fechar;
		+nivel_abertura(0);
		.print("Fechei as cortinas.").
  