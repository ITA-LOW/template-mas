conceder_acesso("Jonas", "frente").


!inicializar_camera.

+!inicializar_camera
  <- 	makeArtifact("camera_quarto","artifacts.Camera",[],D);
  	   	focus(D).


+movimento 
  <-  !!verificar_pessoa.

+closed  <-  .print("Close event from GUIInterface").

+!verificar_pessoa: pessoa_presente(P) & local(L)
 	<-  .print("Pessoa: ", P, " reconhecida no local ", L);
  !!conceder(P,L).

+!conceder(P,L): conceder_acesso(P, L) 
  <- .print("Acesso concedido a ", P);
  .send(fechadura, tell, destrancar_porta);
  .send(ar_condicionado, tell, climatizar_pref(P));
  .send(cortina, tell, abrir_cortina_pref(P));
  .send(lampada, tell, ajustar_iluminacao_pref(P)).

