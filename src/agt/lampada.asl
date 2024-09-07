nivel_lumens_pref(600).

!inicializar_lampada.

+!inicializar_lampada
  <- 	makeArtifact("lampada_quarto","artifacts.Lampada",[],D);
  	   	focus(D).
  	   	//!ligar_lampada.
  	   	
+interuptor 
  <-  !!verificar_lampada.
      
+closed  <-  .print("Close event from GUIInterface").
   
 +!verificar_lampada: ligada(false)  
 	<-  .print("Alguém DESLIGOU a Lampada").
 	
 +!verificar_lampada: ligada(true)  
 	<-  .print("Alguém LIGOU a Lampada").
 	
 +!ligar_lampada
 	<-  ligar;
 		.print("Liguei a Lampada!").

+ajustar_iluminacao_pref(P): nivel_lumens_pref(NL) & ligada(false)
	<- 	ligar;
		!verificar_lampada;
		.print(P, " está em casa, ajustando nível de iluminação para ", NL, "lumens.").